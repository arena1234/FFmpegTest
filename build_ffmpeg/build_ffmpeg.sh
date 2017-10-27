#!/user/bin/bash

FF_ARCH=$1
FF_DEBUG=$2

FF_BUILD_PATH=`pwd`
FF_OUT=$FF_BUILD_PATH/../out
FF_SOURCE=$FF_BUILD_PATH/../ffmpeg
TMPDIR=$FF_OUT
NDK=$ANDROID_NDK
FF_PLATFORM=
FF_PREBUILT=
FF_BUILD_OUT=
FF_LIBS_OUT=

FF_CFLAGS="-O3 -Wall -pipe -std=c99 -ffast-math -fstrict-aliasing -Werror=strict-aliasing -Wno-psabi -Wa,--noexecstack -DANDROID -DNDEBUG"
#FF_CFLAGS="-fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -mfloat-abi=softfp -marm -march=armv7-a"
FF_COMMON_FLAGS=
FF_CONFIG=
FF_EXTRA_CFLAGS=
FF_EXTRA_LDFLAGS=
FF_CONFIG=
FF_TOOLCHAIN_NAME=
FF_CROSS_PREFIX=
FF_BUILD_NAME=
FF_PLATFORM_SUB_DIRS=
FF_GCC_32_VER=4.9
FF_GCC_64_VER=4.9
FF_GCC_VER=
FF_ANDROID_PLATFORM=android-21

if [ "$FF_ARCH" = "armv7a" ]; then
    FF_BUILD_NAME="armeabi-v7a"

    FF_CROSS_PREFIX=arm-linux-androideabi
    FF_TOOLCHAIN_NAME=${FF_CROSS_PREFIX}-${FF_GCC_32_VER}

    FF_CONFIG="$FF_CONFIG --arch=arm --cpu=cortex-a8"
    FF_CONFIG="$FF_CONFIG --enable-neon"
    FF_CONFIG="$FF_CONFIG --enable-thumb"

    FF_EXTRA_CFLAGS="$FF_CFLAGS -march=armv7-a -mcpu=cortex-a8 -mfpu=vfpv3-d16 -mfloat-abi=softfp -mthumb"
    FF_EXTRA_LDFLAGS="$FF_EXTRA_LDFLAGS -Wl,--fix-cortex-a8"

    FF_PLATFORM_SUB_DIRS="arm"
    FF_GCC_VER=$FF_GCC_32_VER
elif [ "$FF_ARCH" = "arm64" ]; then
    FF_ANDROID_PLATFORM=android-21

    FF_BUILD_NAME="arm64-v8a"

    FF_CROSS_PREFIX=aarch64-linux-android
    FF_TOOLCHAIN_NAME=${FF_CROSS_PREFIX}-${FF_GCC_64_VER}

    FF_CONFIG="$FF_CONFIG --arch=aarch64 --enable-yasm"

    FF_EXTRA_CFLAGS="$FF_EXTRA_CFLAGS"
    FF_EXTRA_LDFLAGS="$FF_EXTRA_LDFLAGS"

    FF_PLATFORM_SUB_DIRS="arm64"
    FF_GCC_VER=$FF_GCC_64_VER
elif [ "$FF_ARCH" = "armv5" ]; then
    FF_BUILD_NAME="armeabi"

    FF_CROSS_PREFIX=arm-linux-androideabi
    FF_TOOLCHAIN_NAME=${FF_CROSS_PREFIX}-${FF_GCC_32_VER}

    FF_CONFIG="$FF_CONFIG --arch=arm"

    FF_EXTRA_CFLAGS="$FF_EXTRA_CFLAGS -march=armv5te -mtune=arm9tdmi -msoft-float"
    FF_EXTRA_LDFLAGS="$FF_EXTRA_LDFLAGS"

    FF_PLATFORM_SUB_DIRS="arm"
    FF_GCC_VER=$FF_GCC_32_VER
elif [ "$FF_ARCH" = "x86" ]; then
    FF_BUILD_NAME="x86"

    FF_CROSS_PREFIX=x86
    FF_TOOLCHAIN_NAME=x86-${FF_GCC_32_VER}

    FF_CONFIG="$FF_CONFIG --arch=x86 --cpu=i686 --enable-yasm"

    FF_EXTRA_CFLAGS="$FF_EXTRA_CFLAGS -march=atom -msse3 -ffast-math -mfpmath=sse"
    FF_EXTRA_LDFLAGS="$FF_EXTRA_LDFLAGS"

    FF_PLATFORM_SUB_DIRS="x86"
    FF_GCC_VER=$FF_GCC_32_VER
elif [ "$FF_ARCH" = "x86_64" ]; then
    FF_ANDROID_PLATFORM=android-21

    FF_BUILD_NAME="x86_64"

    FF_CROSS_PREFIX=x86_64
    FF_TOOLCHAIN_NAME=${FF_CROSS_PREFIX}-${FF_GCC_64_VER}

    FF_CONFIG="$FF_CONFIG --arch=x86_64 --enable-yasm"

    FF_EXTRA_CFLAGS="$FF_EXTRA_CFLAGS"
    FF_EXTRA_LDFLAGS="$FF_EXTRA_LDFLAGS"

    FF_PLATFORM_SUB_DIRS="x86_64"
    FF_GCC_VER=$FF_GCC_64_VER
else
    echo "unknown architecture $FF_ARCH";
    exit 1
fi

FF_PLATFORM=$NDK/platforms/$FF_ANDROID_PLATFORM/arch-$FF_PLATFORM_SUB_DIRS
FF_PREBUILT=$NDK/toolchains/$FF_TOOLCHAIN_NAME/prebuilt/linux-x86_64
FF_BUILD_OUT=$FF_OUT/build/$FF_BUILD_NAME
FF_LIBS_OUT=$FF_OUT/libs/$FF_BUILD_NAME

#FF_CONFIG="$FF_CONFIG --arch=arm"
FF_CONFIG="$FF_CONFIG --target-os=android"
FF_CONFIG="$FF_CONFIG --prefix=$FF_BUILD_OUT"
FF_CONFIG="$FF_CONFIG --enable-runtime-cpudetect"
FF_CONFIG="$FF_CONFIG --disable-stripping"
FF_CONFIG="$FF_CONFIG --disable-asm"
FF_CONFIG="$FF_CONFIG --enable-cross-compile"
FF_CONFIG="$FF_CONFIG --cc=$FF_PREBUILT/bin/${FF_CROSS_PREFIX}-gcc"
FF_CONFIG="$FF_CONFIG --nm=$FF_PREBUILT/bin/${FF_CROSS_PREFIX}-nm"
FF_CONFIG="$FF_CONFIG --cross-prefix=$FF_PREBUILT/bin/${FF_CROSS_PREFIX}-"
FF_CONFIG="$FF_CONFIG --sysroot=$FF_PLATFORM"
FF_CONFIG="$FF_CONFIG --enable-static --disable-shared"
FF_CONFIG="$FF_CONFIG --enable-gpl --enable-nonfree --enable-version3"
FF_CONFIG="$FF_CONFIG --enable-small"
FF_CONFIG="$FF_CONFIG --enable-zlib"
FF_CONFIG="$FF_CONFIG --disable-debug"

. $FF_BUILD_PATH/ff_common_config.sh

echo "------------------------"
echo "[*] Define current path"
echo "[*] FF_BUILD_PATH = $FF_BUILD_PATH"
echo "[*] TMPDIR        = $TMPDIR"
echo "[*] NDK           = $NDK"
echo "[*] FF_PLATFORM   = $FF_PLATFORM"
echo "[*] FF-PREBUILT   = $FF_PREBUILT"
echo "[*] FF_BUILD_OUT  = $FF_BUILD_OUT"
echo "[*] FF_LIBS_OUT   = $FF_LIBS_OUT"
echo "[*] FF_CONFIG:"
echo "$FF_CONFIG"
echo "[*] FF_COMMON_FLAGS:"
echo "$FF_COMMON_FLAGS"
echo "[*] FF_EXTRA_CFLAGS:"
echo "$FF_EXTRA_CFLAGS"
echo "[*] FF_EXTRA_LDFLAGS:"
echo "$FF_EXTRA_LDFLAGS"
echo "------------------------"

create_folder(){
    mkdir -p $TMPDIR
    mkdir -p $FF_BUILD_OUT
    mkdir -p $FF_LIBS_OUT
}

config(){
    ./configure --target-os=android \
        --prefix=$FF_BUILD_OUT      \
        --enable-runtime-cpudetect  \
        --disable-stripping         \
        --disable-asm               \
        --arch=arm                  \
        --enable-cross-compile      \
        --cc=$FF_PREBUILT/bin/arm-linux-androideabi-gcc         \
        --cross-prefix=$FF_PREBUILT/bin/arm-linux-androideabi-  \
        --nm=$FF_PREBUILT/bin/arm-linux-androideabi-nm          \
        --sysroot=$FF_PLATFORM                                  \
        --enable-gpl --enable-static --disable-shared --enable-nonfree --enable-version3 --enable-small         \
        --enable-zlib --disable-ffprobe --disable-ffplay --disable-ffmpeg --disable-ffserver --disable-debug    \
        --extra-cflags="-fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -mfloat-abi=softfp -marm -march=armv7-a"
}

config_1(){
    ./configure $FF_CONFIG                          \
                $FF_COMMON_FLAGS                    \
                --extra-cflags="$FF_EXTRA_CFLAGS"   \
                --extra-ldflags="$FF_EXTRA_LDFLAGS"
}

build_clear(){
    rm -rf $FF_LIBS_OUT/*
    rm -rf $FF_BUILD_OUT/*
    make clean
}

build(){
    make -j4
    make install
}

compose(){
    $FF_PREBUILT/bin/${FF_CROSS_PREFIX}-ld      \
        -rpath-link=$FF_PLATFORM/usr/lib            \
        -L$FF_PLATFORM/usr/lib -L$FF_BUILD_OUT/lib  \
        -soname libffmpeg.so -shared -nostdlib -Bsymbolic --whole-archive --no-undefined -o \
        $FF_LIBS_OUT/libffmpeg.so          \
        $FF_BUILD_OUT/lib/libavcodec.a     \
        $FF_BUILD_OUT/lib/libavfilter.a    \
        $FF_BUILD_OUT/lib/libswresample.a  \
        $FF_BUILD_OUT/lib/libavformat.a    \
        $FF_BUILD_OUT/lib/libavutil.a      \
        $FF_BUILD_OUT/lib/libswscale.a     \
        $FF_BUILD_OUT/lib/libavdevice.a    \
        $FF_BUILD_OUT/lib/libpostproc.a    \
        -lc -lm -lz -ldl -llog --dynamic-linker=/system/bin/linker \
        $FF_PREBUILT/lib/gcc/${FF_CROSS_PREFIX}/${FF_GCC_VER}.x/libgcc.a
}

cd $FF_SOURCE

build_clear
create_folder
config_1
build
compose

cd $FF_BUILD_PATH

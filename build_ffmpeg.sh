#!/user/bin/bash
cd ffmpeg
rm ../libs/* -rf

export TMPDIR=../temp
export NDK=/data/env/AndroidStudio/android-ndk-r13b
export PLATFORM=$NDK/platforms/android-21/arch-arm
export PREBUILT=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
export PREFIX=../libs
config(){
    ./configure --target-os=android --prefix=$PREFIX \
        --enable-runtime-cpudetect \
        --disable-stripping \
        --disable-asm \
        --arch=arm \
        --enable-cross-compile \
        --cc=$PREBUILT/bin/arm-linux-androideabi-gcc \
        --cross-prefix=$PREBUILT/bin/arm-linux-androideabi- \
        --nm=$PREBUILT/bin/arm-linux-androideabi-nm \
        --sysroot=$PLATFORM \
        --enable-gpl --enable-static --disable-shared --enable-nonfree --enable-version3 --enable-small \
        --enable-zlib --disable-ffprobe --disable-ffplay --disable-ffmpeg --disable-ffserver --disable-debug \
        --extra-cflags="-fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -mfloat-abi=softfp -marm -march=armv7-a"
}
config

make clean
make -j4
make install

$TOOLCHAIN/bin/arm-linux-androideabi-ld \
    -rpath-link=$SYSROOT/usr/lib \
    -L$SYSROOT/usr/lib -L$PREFIX/lib \
    -soname libffmpeg.so -shared -nostdlib -Bsymbolic --whole-archive --no-undefined -o \
    $PREFIX/libffmpeg.so \
    $PREFIX/lib/libavcodec.a \
    $PREFIX/lib/libavfilter.a \
    $PREFIX/lib/libswresample.a \
    $PREFIX/lib/libavformat.a \
    $PREFIX/lib/libavutil.a \
    $PREFIX/lib/libswscale.a \
    $PREFIX/lib/libavdevice.a \
    $PREFIX/lib/libpostproc.a \
    -lc -lm -lz -ldl -llog --dynamic-linker=/system/bin/linker \
    $TOOLCHAIN/lib/gcc/arm-linux-androideabi/4.9.x/libgcc.a

cd ..

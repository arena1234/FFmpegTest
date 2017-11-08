#! /usr/bin/env bash

FF_ARCH=$1
FF_DEBUG=$2

FF_BUILD_PATH=`pwd`

FF_ACT_ARCHS_32="armv5 armv7a x86"
FF_ACT_ARCHS_ARM="armv5 armv7a arm64"
FF_ACT_ARCHS_64="armv5 armv7a arm64 x86 x86_64"
FF_ACT_ARCHS_ALL=$FF_ACT_ARCHS_64

echo_archs() {
    echo "===================="
    echo "[*] check archs"
    echo "FF_ALL_ARCHS = $FF_ACT_ARCHS_ALL"
    echo "FF_ACT_ARCHS = $*"
    echo "===================="
    echo ""
}

echo_usage() {
    echo "Usage:"
    echo "  build_ffmpeg.sh armv5|armv7a|arm64|x86|x86_64"
    echo "  build_ffmpeg.sh all32"
    echo "  build_ffmpeg.sh arm"
    echo "  build_ffmpeg.sh all"
    echo "  build_ffmpeg.sh clear"
    echo "  build_ffmpeg.sh check"
    echo ""
#    exit 1
}

echo_exit() {
    echo ""
    echo "--------------------"
    echo "[*] Finished"
    echo "--------------------"
}

#----------
case "$FF_ARCH" in
    "")
        echo_archs armv7a
        sh $FF_BUILD_PATH/do_build_ffmpeg.sh armv7a
        echo_exit
    ;;
    armv5|armv7a|arm64|x86|x86_64)
        echo_archs $FF_ARCH $FF_DEBUG
        sh $FF_BUILD_PATH/do_build_ffmpeg.sh $FF_ARCH $FF_DEBUG
        echo_exit
    ;;
    arm)
        echo_archs $FF_ACT_ARCHS_ARM
        for ARCH in $FF_ACT_ARCHS_ARM
        do
            sh $FF_BUILD_PATH/do_build_ffmpeg.sh $ARCH $FF_DEBUG
        done
        echo_exit
    ;;
    all32)
        echo_archs $FF_ACT_ARCHS_32
        for ARCH in $FF_ACT_ARCHS_32
        do
            sh $FF_BUILD_PATH/do_build_ffmpeg.sh $ARCH $FF_DEBUG
        done
        echo_exit
    ;;
    all|all64)
        echo_archs $FF_ACT_ARCHS_ALL
        for ARCH in $FF_ACT_ARCHS_ALL
        do
            sh $FF_BUILD_PATH/do_build_ffmpeg.sh $ARCH $FF_DEBUG
        done
        echo_exit
    ;;
    clear)
        echo_archs $FF_ACT_ARCHS_ALL
        echo "clear build file/folder"
        for ARCH in $FF_ACT_ARCHS_ALL
        do
            sh $FF_BUILD_PATH/do_build_ffmpeg.sh $ARCH clear
        done
        echo_exit
    ;;
    check)
        echo_archs $FF_ACT_ARCHS_ALL
    ;;
    *)
        echo_usage
    ;;
esac


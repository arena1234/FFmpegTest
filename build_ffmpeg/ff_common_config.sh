#! /usr/bin/env bash

export FF_COMMON_FLAGS=
# Program options:
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-programs"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-ffmpeg"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-ffplay"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-ffprobe"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-ffserver"
# Documentation options:
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-doc"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-htmlpages"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-manpages"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-podpages"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-txtpages"

# Component options:
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-avdevice"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-avcodec"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-avformat"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-avutil"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-swresample"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-swscale"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-postproc"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-avfilter"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-avresample"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-network"

# Hardware accelerators:
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-d3d11va"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-dxva2"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-vaapi"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-vda"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-vdpau"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-videotoolbox"

# Individual component options:
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-encoders"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-encoder=png"

# ./configure --list-decoders
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-decoders"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-decoder=aac"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-decoder=aac_latm"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-decoder=flv"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-decoder=h264"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-decoder=mp3*"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-decoder=vp6f"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-decoder=flac"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-decoder=hevc"

export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-hwaccels"

# ./configure --list-muxers
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-muxers"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-muxer=mp4"

# ./configure --list-demuxers
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-demuxers"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-demuxer=aac"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-demuxer=concat"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-demuxer=data"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-demuxer=flv"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-demuxer=hls"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-demuxer=live_flv"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-demuxer=mov"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-demuxer=mp3"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-demuxer=mpegps"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-demuxer=mpegts"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-demuxer=mpegvideo"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-demuxer=flac"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-demuxer=hevc"

# ./configure --list-parsers
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-parsers"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-parser=aac"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-parser=aac_latm"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-parser=h264"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-parser=flac"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-parser=hevc"

# ./configure --list-bsf
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-bsfs"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-bsf=chomp"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-bsf=dca_core"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-bsf=dump_extradata"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-bsf=hevc_mp4toannexb"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-bsf=imx_dump_header"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-bsf=mjpeg2jpeg"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-bsf=mjpega_dump_header"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-bsf=mov2textsub"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-bsf=mp3_header_decompress"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-bsf=mpeg4_unpack_bframes"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-bsf=noise"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-bsf=remove_extradata"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-bsf=text2movsub"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-bsf=vp9_superframe"

# ./configure --list-protocols
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-protocols"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-protocol=async"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-protocol=bluray"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-protocol=concat"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-protocol=crypto"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-protocol=ffrtmpcrypt"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-protocol=ffrtmphttp"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-protocol=gopher"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-protocol=icecast"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-protocol=librtmp*"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-protocol=libssh"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-protocol=md5"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-protocol=mmsh"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-protocol=mmst"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-protocol=rtmp*"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-protocol=rtmp"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --enable-protocol=rtmpt"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-protocol=rtp"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-protocol=sctp"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-protocol=srtp"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-protocol=subfile"
export FF_COMMON_FLAGS="$FF_COMMON_FLAGS --disable-protocol=unix"

LOCAL_PATH := $(call my-dir)

# FFmpeg library
include $(CLEAR_VARS)

LOCAL_MODULE := ffmpeg

LOCAL_SRC_FILES := $(LOCAL_PATH)/ffmpeg_libs/armeabi-v7a/libffmpeg.so
ifeq ($(TARGET_ARCH_ABI), armeabi-v7a)
  LOCAL_SRC_FILES := $(LOCAL_PATH)/ffmpeg_libs/armeabi-v7a/libffmpeg.so
endif
ifeq ($(TARGET_ARCH_ABI), arm64-v8a)
  LOCAL_SRC_FILES := $(LOCAL_PATH)/ffmpeg_libs/arm64-v8a/libffmpeg.so
endif
NDK_APP_DST_DIR := $(LOCAL_PATH)/../jniLibs/$(TARGET_ARCH_ABI)

include $(PREBUILT_SHARED_LIBRARY)


# Program
include $(CLEAR_VARS)
LOCAL_MODULE := jni_ffmpeg

LOCAL_SRC_FILES :=  native.cpp    \
                    player.cpp

LOCAL_C_INCLUDES += $(LOCAL_PATH)/include

LOCAL_LDLIBS := -llog -lz -ljnigraphics

LOCAL_SHARED_LIBRARIES := ffmpeg
NDK_APP_DST_DIR := $(LOCAL_PATH)/../jniLibs/$(TARGET_ARCH_ABI)

include $(BUILD_SHARED_LIBRARY)
#ifndef _H_NATIVE_LOG_H_
#define _H_NATIVE_LOG_H_

#include <stdarg.h>
#include <android/log.h>
#include <jni.h>

#define LOGD(...) __android_log_print(ANDROID_LOG_DEBUG, "FFMPEG_JNI", __VA_ARGS__);
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, "FFMPEG_JNI", __VA_ARGS__);
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, "FFMPEG_JNI", __VA_ARGS__);

#endif

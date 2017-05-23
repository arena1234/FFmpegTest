#ifndef __NATIVE_H
#define __NATIVE_H

#include <jni.h>
#include <pthread.h>
#include <android/bitmap.h>
#include "player.h"
#include "native_log.h"

#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM *vm, void *reserved);
JNIEXPORT void JNICALL JNI_OnUnload(JavaVM *vm, void *reserved);

#ifdef __cplusplus
}
#endif

#endif //__NATIVE_H

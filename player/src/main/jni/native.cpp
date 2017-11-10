#include "native.h"

jobject mObj;
jmethodID mUpdateFrameId;
jmethodID mPreparedId;
pthread_t mThread;
jboolean bAttachThread = JNI_FALSE;
jboolean bPlayOver = JNI_FALSE;
JavaVM *mVm;
Player *pPlayer;

JNIEnv *getJNIEnv() {
    JNIEnv *env = NULL;
    if (mVm->GetEnv((void **) &env, JNI_VERSION_1_6) != JNI_OK) {
        int status = mVm->AttachCurrentThread(&env, 0);
        if (status < 0) {
            return NULL;
        }
        bAttachThread = JNI_TRUE;
    }
    return env;
}

void initCallBack(JNIEnv *env, jobject thiz) {
    jclass mClass = env->GetObjectClass(thiz);
    mObj = env->NewGlobalRef(thiz);
    mUpdateFrameId = env->GetMethodID(mClass, "onUpdateFrame", "(Landroid/graphics/Bitmap;)V");
    mPreparedId = env->GetMethodID(mClass, "prepared", "()V");
}

void updateFrame(jobject bmp) {
    JNIEnv *env = getJNIEnv();
    env->CallVoidMethod(mObj, mUpdateFrameId, bmp);
}

// 单位毫秒
pthread_cond_t cond;
pthread_mutex_t mutex;
struct timeval now;
struct timespec outtime;

void sleepMs(int nHm) {
    gettimeofday(&now, NULL);
    now.tv_usec += 1000 * nHm;
    if (now.tv_usec > 1000000) {
        now.tv_sec += now.tv_usec / 1000000;
        now.tv_usec %= 1000000;
    }

    outtime.tv_sec = now.tv_sec;
    outtime.tv_nsec = now.tv_usec * 1000;

    pthread_cond_timedwait(&cond, &mutex, &outtime);
}

void *thread_run(void *arg) {
    JNIEnv *env = getJNIEnv();
    while (!bPlayOver) {
        updateFrame(NULL);
        jthrowable exception = env->ExceptionOccurred();
        if (exception) {
            env->ExceptionDescribe();
        }
        sleepMs(500);
    }
    pthread_detach(mThread);
    pthread_exit(0);
    LOGD("release thread");
    return NULL;
}

void prepared() {
    JNIEnv *env = getJNIEnv();
    env->CallVoidMethod(mObj, mPreparedId);
    bPlayOver = JNI_FALSE;
    pthread_create(&mThread, NULL, thread_run, NULL);
}

void setVideoSource(JNIEnv *env, jobject thiz, jstring path) {
    initCallBack(env, thiz);

    pPlayer->setVideoSource(path);
    prepared();
}

void play(JNIEnv *env, jobject thiz) {
    pPlayer->play();
}

void pause(JNIEnv *env, jobject thiz) {
    pPlayer->pause();
}

void stop(JNIEnv *env, jobject thiz) {
    pPlayer->stop();
    bPlayOver = JNI_TRUE;
}

jboolean isPlaying(JNIEnv *env, jobject thiz) {
    return pPlayer->isPlaying();
}

void seekTo(JNIEnv *env, jobject thiz, jint timeMs) {
    pPlayer->seekTo(timeMs);
}

jint getTotalTime(JNIEnv *env, jobject thiz) {
    return pPlayer->getTotalTime();
}

jint getCurrentTime(JNIEnv *env, jobject thiz) {
    return pPlayer->getCurrentTime();
}

JNINativeMethod gMethods[] = {
        {"nativeSetVideoSource", "(Ljava/lang/String;)V", (void *) setVideoSource},
        {"nativePlay",           "()V",                   (void *) play},
        {"nativePause",          "()V",                   (void *) pause},
        {"nativeStop",           "()V",                   (void *) stop},
        {"nativeIsPlaying",      "()Z",                   (void *) isPlaying},
        {"nativeSeekTo",         "(I)V",                  (void *) seekTo},
        {"nativeGetTotalTime",   "()I",                   (void *) getTotalTime},
        {"nativeGetCurrentTime", "()I",                   (void *) getCurrentTime}
};

int JNICALL JNI_OnLoad(JavaVM *vm, void *reserved) {
    JNIEnv *env;
    mVm = vm;
    if (vm->GetEnv((void **) &env, JNI_VERSION_1_6) != JNI_OK) {
        return JNI_ERR;
    }
    jclass javaClass = env->FindClass("com/wq/player/Native/FFmpegApi");
    if (javaClass == NULL) {
        return JNI_ERR;
    }
    if (env->RegisterNatives(javaClass, gMethods, sizeof(gMethods) / sizeof(gMethods[0])) < 0) {
        return JNI_ERR;
    }
    pPlayer = new Player();
    return JNI_VERSION_1_6;
}

void JNICALL JNI_OnUnload(JavaVM *vm, void *reserved) {
    delete pPlayer;
    if (bAttachThread) {
        bAttachThread = JNI_FALSE;
        vm->DetachCurrentThread();
    }
}
#ifndef COM_WQ_PLAYER_PLAYER_H
#define COM_WQ_PLAYER_PLAYER_H

#include <jni.h>
#include "native_log.h"

#ifdef __cplusplus
extern "C" {
#endif
#include "libavcodec/avcodec.h"
#include "libavfilter/avfilter.h"

JNIEnv *getJNIEnv();
class Player {
public:
    Player();

    ~Player();

    void setVideoSource(jstring path);

    void play();

    void pause();

    void stop();

    jboolean isPlaying();

    void seekTo(int timeMs);

    jint getTotalTime();

    jint getCurrentTime();

private :
    jint mTotalTime;
    jint mCurrentTime;
    jboolean mIsPlaying;
};

#ifdef __cplusplus
}
#endif

#endif //COM_WQ_PLAYER_PLAYER_H

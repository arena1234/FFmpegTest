#include "player.h"

Player::Player() {
    mTotalTime = 0;
    mCurrentTime = 0;
    mIsPlaying = JNI_FALSE;

    LOGD("avfilter_version=%d", avfilter_version());
    LOGD("av_version_info=%s", av_version_info());
}

Player::~Player() {

}

void Player::setVideoSource(jstring path) {
    JNIEnv *env = getJNIEnv();
    const char *cPath = env->GetStringUTFChars(path, 0);
    LOGD("setVideoSource %s", cPath);
}

void Player::play() {
    LOGD("play");
}

void Player::pause() {
    LOGD("pause");
}

void Player::stop() {
    LOGD("stop");
}

jboolean Player::isPlaying() {
    LOGD("isPlaying %d", mIsPlaying);
    return mIsPlaying;
}

void Player::seekTo(int timeMs) {
    LOGD("seekTo %d", timeMs);
    mCurrentTime = timeMs;
}

jint Player::getTotalTime() {
    LOGD("getTotalTime %d", mTotalTime);
    return mTotalTime;
}

jint Player::getCurrentTime() {
    LOGD("getCurrentTime %d", mCurrentTime);
    return mCurrentTime;
}
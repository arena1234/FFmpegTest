package com.wq.player.Native;

import android.graphics.Bitmap;
import android.util.Log;

/**
 * Created by arena on 2017/2/19.
 */

public class FFmpegApi {
    public void setVideoSource(String path){
        nativeSetVideoSource(path);
    }

    public void play(){
        nativePlay();
    }

    public void pause(){
        nativePause();
    }

    public void stop(){
        nativeStop();
    }

    public boolean isPlaying(){
        return nativeIsPlaying();
    }

    public void seekTo(int timeMs){
        nativeSeekTo(timeMs);
    }

    public int getTotalTime(){
        return nativeGetTotalTime();
    }

    public int getCurrentTime(){
        return nativeGetCurrentTime();
    }

    private void onUpdateFrame(Bitmap bmp){
        Log.d("qqqq", "onUpdateFrame");
    }

    private void prepared(){
        Log.d("qqqq", "prepared");
    }

    private native void nativeSetVideoSource(String path);
    private native void nativePlay();
    private native void nativePause();
    private native void nativeStop();
    private native void nativeSeekTo(int timeMs);
    private native boolean nativeIsPlaying();
    private native int nativeGetTotalTime();
    private native int nativeGetCurrentTime();
    static{
        System.loadLibrary("jni_ffmpeg");
    }
}

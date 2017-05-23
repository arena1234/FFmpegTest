package com.wq.ffmpegtest;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;

import com.wq.player.Native.FFmpegApi;

public class MainActivity extends AppCompatActivity implements View.OnClickListener{
    FFmpegApi mFFmpegApi = new FFmpegApi();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        findViewById(R.id.btn_source).setOnClickListener(this);
        findViewById(R.id.btn_play).setOnClickListener(this);
        findViewById(R.id.btn_pause).setOnClickListener(this);
        findViewById(R.id.btn_stop).setOnClickListener(this);
        findViewById(R.id.btn_is_playing).setOnClickListener(this);
        findViewById(R.id.btn_seek_to).setOnClickListener(this);
        findViewById(R.id.btn_total_time).setOnClickListener(this);
        findViewById(R.id.btn_current_time).setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.btn_source:
                mFFmpegApi.setVideoSource("I am path.");
                break;
            case R.id.btn_play:
                mFFmpegApi.play();
                break;
            case R.id.btn_pause:
                mFFmpegApi.pause();
                break;
            case R.id.btn_stop:
                mFFmpegApi.stop();
                break;
            case R.id.btn_seek_to:
                mFFmpegApi.seekTo(0);
                break;
            case R.id.btn_is_playing:
                mFFmpegApi.isPlaying();
                break;
            case R.id.btn_current_time:
                mFFmpegApi.getCurrentTime();
                break;
            case R.id.btn_total_time:
                mFFmpegApi.getTotalTime();
                break;
        }
    }
}

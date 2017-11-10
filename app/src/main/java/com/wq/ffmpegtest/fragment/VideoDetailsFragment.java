package com.wq.ffmpegtest.fragment;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import com.wq.ffmpegtest.R;

/**
 * Created by qiangwang on 11/10/17.
 */

public class VideoDetailsFragment extends BaseFragment {
    private Button mBtnVideoDetails;
    private TextView mTextVideoDetails;
    private View.OnClickListener mListener;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_video_details, container, false);
        mTextVideoDetails = (TextView) view.findViewById(R.id.text_video_details);
        mBtnVideoDetails = (Button) view.findViewById(R.id.btn_video_details);
        mBtnVideoDetails.setText("Get /sdcard/DCIM/Camera/VID_20170106_114434.3gp details");
        mBtnVideoDetails.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(mListener != null) mListener.onClick(view);
            }
        });
        return view;
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    public void setOnClickListener(View.OnClickListener listener) {
        mListener = listener;
    }

    public void setDetails(String details) {
        mTextVideoDetails.setText(details);
    }
}

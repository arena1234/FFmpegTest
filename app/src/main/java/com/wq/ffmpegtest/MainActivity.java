package com.wq.ffmpegtest;

import android.os.Bundle;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.FrameLayout;

import com.wq.ffmpegtest.adapter.Item;
import com.wq.ffmpegtest.fragment.MenuFragment;
import com.wq.ffmpegtest.fragment.VideoDetailsFragment;
import com.wq.ffmpegtest.widget.CustomDrawerLayout;
import com.wq.player.Native.FFmpegApi;

public class MainActivity extends BaseActivity implements MenuFragment.OnItemClickListener, View.OnClickListener{
    private ActionBarDrawerToggle mDrawerToggle;
    private CustomDrawerLayout mDrawerLayout;
    private Toolbar mToolbar;
    private FrameLayout mContentLayout;
    private FrameLayout mMenuLayout;
    private FFmpegApi mFFmpeg;

    private MenuFragment mMenuFragment;
    private VideoDetailsFragment mVideoDetailsFragment;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mDrawerLayout = (CustomDrawerLayout) findViewById(R.id.main_drawer_layout);
        mToolbar = (Toolbar) findViewById(R.id.main_toolbar);
        mContentLayout = (FrameLayout) findViewById(R.id.layout_content);
        mMenuLayout = (FrameLayout) findViewById(R.id.layout_menu);

        initMenu();

        mMenuFragment = new MenuFragment();
        mVideoDetailsFragment = new VideoDetailsFragment();
        mFFmpeg = new FFmpegApi();

        getSupportFragmentManager().
                beginTransaction().
                replace(R.id.layout_menu, mMenuFragment).
                commit();
    }

    @Override
    protected void onResume() {
        super.onResume();
        mMenuFragment.setOnItemClickListener(this);
        mVideoDetailsFragment.setOnClickListener(this);
    }

    @Override
    protected void onPause() {
        super.onPause();
        mMenuFragment.setOnItemClickListener(null);
        mVideoDetailsFragment.setOnClickListener(null);
    }

    private void initMenu() {
        mToolbar.setTitle(R.string.toolbar_title);                  // 设置Toolbar标题
        mToolbar.setTitleTextColor(getResources().getColor(R.color.colorTitle));   // 设置标题颜色
        setSupportActionBar(mToolbar);
        getSupportActionBar().setHomeButtonEnabled(true);           // 设置返回键可用
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        // 创建返回键，并实现打开关/闭监听
        mDrawerToggle = new ActionBarDrawerToggle(this,
                mDrawerLayout,
                mToolbar,
                R.string.drawer_open,
                R.string.drawer_close);
        mDrawerToggle.syncState();
        mDrawerLayout.setCustomDrawerListener(mDrawerToggle);
    }

    @Override
    public void onItemClick(Item item) {
        switch (item.getId()){
            case 0:
                getSupportFragmentManager().
                        beginTransaction().
                        replace(R.id.layout_content, mVideoDetailsFragment).
                        commit();
                break;
            case 1:

                break;
        }
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()){
            case R.id.btn_video_details:
                mFFmpeg.setVideoSource("/sdcard/DCIM/Camera/VID_20170106_114434.3gp");
                mVideoDetailsFragment.setDetails(mFFmpeg.getVideoInfo());
                break;
        }
    }
}

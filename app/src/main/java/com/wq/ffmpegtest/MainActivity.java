package com.wq.ffmpegtest;

import android.os.Bundle;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.widget.Toolbar;
import android.widget.FrameLayout;

import com.wq.ffmpegtest.fragment.MenuFragment;
import com.wq.ffmpegtest.widget.CustomDrawerLayout;

public class MainActivity extends BaseActivity {
    private ActionBarDrawerToggle mDrawerToggle;
    private CustomDrawerLayout mDrawerLayout;
    private Toolbar mToolbar;
    private FrameLayout mContentLayout;
    private FrameLayout mMenuLayout;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mDrawerLayout = (CustomDrawerLayout) findViewById(R.id.main_drawer_layout);
        mToolbar = (Toolbar) findViewById(R.id.main_toolbar);
        mContentLayout = (FrameLayout) findViewById(R.id.layout_content);
        mMenuLayout = (FrameLayout) findViewById(R.id.layout_menu);

        initMenu();


        getSupportFragmentManager().
                beginTransaction().
                replace(R.id.layout_menu, new MenuFragment()).
                commit();
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
}

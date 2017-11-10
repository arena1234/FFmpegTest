package com.wq.ffmpegtest.fragment;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.chad.library.adapter.base.BaseQuickAdapter;
import com.wq.ffmpegtest.R;
import com.wq.ffmpegtest.adapter.DividerDecoration;
import com.wq.ffmpegtest.adapter.Item;
import com.wq.ffmpegtest.adapter.ListAdapter;

/**
 * Created by qiangwang on 11/10/17.
 */

public class MenuFragment extends BaseFragment implements BaseQuickAdapter.OnItemChildClickListener {
    private RecyclerView mRecyclerView;
    private ListAdapter mAdapter;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        mAdapter = new ListAdapter(getContext());
        mAdapter.openLoadAnimation(BaseQuickAdapter.SLIDEIN_LEFT);
        mAdapter.isFirstOnly(true);
        mAdapter.setOnItemChildClickListener(this);

        mRecyclerView = new RecyclerView(getContext());
        mRecyclerView.setHasFixedSize(true);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        mRecyclerView.addItemDecoration(new DividerDecoration(getContext()));
        mRecyclerView.setAdapter(mAdapter);
        return mRecyclerView;
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        mAdapter.setOnItemChildClickListener(null);
        mAdapter = null;
        mRecyclerView = null;
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public void onItemChildClick(BaseQuickAdapter adapter, View view, int position) {
        Item item = (Item) adapter.getItem(position);
    }
}

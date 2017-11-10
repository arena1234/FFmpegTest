package com.wq.ffmpegtest.adapter;

import android.content.Context;

import com.chad.library.adapter.base.BaseQuickAdapter;
import com.chad.library.adapter.base.BaseViewHolder;
import com.wq.ffmpegtest.R;

public class ListAdapter extends BaseQuickAdapter<Item, BaseViewHolder> {
    private Context mContext;
    public ListAdapter(Context context) {
        super(R.layout.item_list, DataServer.getSampleData());
        mContext = context;
    }

    @Override
    protected void convert(BaseViewHolder helper, Item item) {
        helper.addOnClickListener(R.id.item_parent);
        helper.setText(R.id.text, item.getName());
    }
}

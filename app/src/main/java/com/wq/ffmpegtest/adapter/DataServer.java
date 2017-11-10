package com.wq.ffmpegtest.adapter;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by qiangwang on 7/25/17.
 */

public class DataServer {

    public static List<Item> getSampleData() {
        List<Item> list = new ArrayList<>();
        for (int i = 0; i < NAME.length; i++) {
            Item item = new Item();
            item.setName(NAME[i]);
            item.setId(i);
            list.add(item);
        }
        return list;
    }
    private static final String NAME[] = {
            "获取视频信息",
            "摄像头采集"
    };
}

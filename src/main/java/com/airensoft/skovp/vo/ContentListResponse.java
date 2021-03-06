package com.airensoft.skovp.vo;

import java.util.List;

/**
 * Created by burt on 2014. 5. 20..
 */
public class ContentListResponse extends OVPResponse {

    static class Result {
        public List<CategoryPageVO> content;
        public int total_count;
    }

    public Result result;


    public List<CategoryPageVO> getContentList() {
        if(result == null)
            return null;

        return result.content;
    }

    public long getTotalCount() {
        if(result == null)
            return 0;
        return result.total_count;
    }
}

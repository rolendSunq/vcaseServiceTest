package com.airensoft.skovp.vo;

/**
 * Created by burt on 2014. 5. 20..
 */
public class PublishDownloadContentResponse extends OVPResponse {
    static class Result {
        public String content_id;
        public String url;
    }

    public Result result;

    public String getContentId() {
        if(result == null)
            return null;
        return result.content_id;
    }

    public String getUrl() {
        if(result == null)
            return null;
        return result.url;
    }
}

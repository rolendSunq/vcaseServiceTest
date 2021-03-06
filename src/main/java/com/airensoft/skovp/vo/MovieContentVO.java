package com.airensoft.skovp.vo;

import java.util.List;

import com.airensoft.skovp.utils.common.UnitUtils;
import com.airensoft.skovp.utils.time.DateHelper;
import com.airensoft.skovp.utils.time.DateUtils;

public class MovieContentVO {
	private List<ThumbUrlVO> staticThumb;
	private List<DownloadFileVO> downloadFile;
	private TagInfoVO tag;
	private String content_id;
	private String custom_id;
	private String upper_content_id;
	private String title;
	private String description;
	private String content_type;
	private String media_type;
	private String file_type;
	private String file_name;
	private String file_size;
	private String duration;
	private String state;
	private int progress;
	private String container;
	private String video_codec;
	private String audio_codec;
	private int video_bitrate;
	private int audio_bitrate;
	private String video_framerate;
	private String audio_samplerate;
	private String audio_channel;
	private String width;
	private String height;
	private boolean is_drm;
	private String reg_date;
	private String mod_date;
	private boolean active;
	private String thumb_url;
	private String view_count;
	private String streaming_url;
	private String download_url;
	
	public String getContent_id() {
		return content_id;
	}
	public void setContent_id(String content_id) {
		this.content_id = content_id;
	}
	public String getCustom_id() {
		return custom_id;
	}
	public void setCustom_id(String custom_id) {
		this.custom_id = custom_id;
	}
	public String getUpper_content_id() {
		return upper_content_id;
	}
	public void setUpper_content_id(String upper_content_id) {
		this.upper_content_id = upper_content_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent_type() {
		return content_type;
	}
	public void setContent_type(String content_type) {
		this.content_type = content_type;
	}
	public String getMedia_type() {
		return media_type;
	}
	public void setMedia_type(String media_type) {
		this.media_type = media_type;
	}
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_size() {
		long convertFileSize = Long.parseLong(file_size);
		return UnitUtils.humanReadableByteCount(convertFileSize, false);
	}
	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}
	public String getDuration() {
		duration = (duration == null) ? "0" : duration;
		long convertDuration = Long.parseLong(duration);
		return DateHelper.getHourString(convertDuration) + ":" + DateHelper.getMinuteString(convertDuration) + ":" + DateHelper.getSecondString(convertDuration);
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	public String getContainer() {
		return container;
	}
	public void setContainer(String container) {
		this.container = container;
	}
	public String getVideo_codec() {
		return video_codec;
	}
	public void setVideo_codec(String video_codec) {
		this.video_codec = video_codec;
	}
	public String getAudio_codec() {
		return audio_codec;
	}
	public void setAudio_codec(String audio_codec) {
		this.audio_codec = audio_codec;
	}
	public int getVideo_bitrate() {
		return video_bitrate;
	}
	public void setVideo_bitrate(int video_bitrate) {
		this.video_bitrate = video_bitrate;
	}
	public int getAudio_bitrate() {
		return audio_bitrate;
	}
	public void setAudio_bitrate(int audio_bitrate) {
		this.audio_bitrate = audio_bitrate;
	}
	public String getVideo_framerate() {
		return video_framerate;
	}
	public void setVideo_framerate(String video_framerate) {
		this.video_framerate = video_framerate;
	}
	public String getAudio_samplerate() {
		return audio_samplerate;
	}
	public void setAudio_samplerate(String audio_samplerate) {
		this.audio_samplerate = audio_samplerate;
	}
	public String getAudio_channel() {
		return audio_channel;
	}
	public void setAudio_channel(String audio_channel) {
		this.audio_channel = audio_channel;
	}
	public String getWidth() {
		return width;
	}
	public void setWidth(String width) {
		this.width = width;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public boolean isIs_drm() {
		return is_drm;
	}
	public void setIs_drm(boolean is_drm) {
		this.is_drm = is_drm;
	}
	public String getReg_date() {
		reg_date = (reg_date == null) ? "0"	: reg_date;
		int convertRegDate = Integer.parseInt(reg_date);
		return DateUtils.TimestamptToString(convertRegDate);
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getMod_date() {
		int convertSetModDate = Integer.parseInt(mod_date);
		return DateUtils.TimestamptToString(convertSetModDate);
	}
	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public String getThumb_url() {
		return thumb_url;
	}
	public void setThumb_url(String thumb_url) {
		this.thumb_url = thumb_url;
	}
	public String getView_count() {
		return view_count;
	}
	public void setView_count(String view_count) {
		this.view_count = view_count;
	}
	public String getStreaming_url() {
		return streaming_url;
	}
	public void setStreaming_url(String streaming_url) {
		this.streaming_url = streaming_url;
	}
	public String getDownload_url() {
		return download_url;
	}
	public void setDownload_url(String download_url) {
		this.download_url = download_url;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<ThumbUrlVO> getStaticThumb() {
		return staticThumb;
	}
	public void setStaticThumb(List<ThumbUrlVO> staticThumb) {
		this.staticThumb = staticThumb;
	}
	public List<DownloadFileVO> getDownloadFile() {
		return downloadFile;
	}
	public void setDownloadFile(List<DownloadFileVO> downloadFile) {
		this.downloadFile = downloadFile;
	}
	public TagInfoVO getTag() {
		return tag;
	}
	public void setTag(TagInfoVO tags) {
		this.tag = tags;
	}
	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("content_id: " + getContent_id() + "\r\n");
		sb.append("upper_content_id: " + getUpper_content_id() + "\r\n");
		sb.append("title: " + getTitle() + "\r\n");
		sb.append("description: " + getDescription() + "\r\n");
		sb.append("content_type: " + getContent_type() + "\r\n");
		sb.append("media_type: " + getMedia_type() + "\r\n");
		sb.append("file_type: " + getFile_type() + "\r\n");
		sb.append("file_name: " + getFile_name() + "\r\n");
		sb.append("file_size: " + getFile_size() + "\r\n");
		sb.append("duration: " + getDuration() + "\r\n");
		sb.append("state: " + getState() + "\r\n");
		sb.append("progress: " + getProgress() + "\r\n");
		sb.append("container: " + getContainer() + "\r\n");
		sb.append("video_codec: " + getVideo_codec() + "\r\n");
		sb.append("audio_codec: " + getAudio_codec() + "\r\n");
		sb.append("video_bitrate: " + getVideo_bitrate() + "\r\n");
		sb.append("audio_bitrate: " + getAudio_bitrate() + "\r\n");
		sb.append("video_framerate: " + getVideo_framerate() + "\r\n");
		sb.append("audio_samplerate: " + getAudio_samplerate() + "\r\n");
		sb.append("audio_channel: " + getAudio_channel() + "\r\n");
		sb.append("width: " + getWidth() + "\r\n");
		sb.append("height: " + getHeight() + "\r\n");
		sb.append("is_drm: " + isIs_drm() + "\r\n");
		sb.append("reg_date: " + getReg_date() + "\r\n");
		sb.append("mod_date: " + getMod_date() + "\r\n");
		sb.append("active: " + isActive() + "\r\n");
		sb.append("thumb_url: " + getThumb_url() + "\r\n");
		sb.append("view_count: " + getView_count() + "\r\n");
		sb.append("streaming_url: " + getStreaming_url() + "\r\n");
		sb.append("download_url: " + getDownload_url() + "\r\n");
		return sb.toString();
	}
}

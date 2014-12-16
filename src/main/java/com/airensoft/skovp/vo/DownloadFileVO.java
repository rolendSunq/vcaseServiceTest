package com.airensoft.skovp.vo;

import com.airensoft.skovp.utils.common.UnitUtils;
import com.airensoft.skovp.utils.time.DateUtils;

public class DownloadFileVO {
	private String content_id;
	private String content_type;
	private String title;
	private String media_type;
	private String file_type;
	private String file_name;
	private String file_size;
	private String container;
	private String video_codec;
	private String audio_codec;
	private String video_bitrate;
	private String audio_bitrate;
	private String video_framerate;
	private String audio_samplerate;
	private String audio_channel;
	private String width;
	private String height;
	private String reg_date;
	private String mod_date;
	private String download_url;
	private String streaming_url;
	public String getContent_id() {
		return content_id;
	}
	public void setContent_id(String content_id) {
		this.content_id = content_id;
	}
	public String getContent_type() {
		return content_type;
	}
	public void setContent_type(String content_type) {
		this.content_type = content_type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getVideo_bitrate() {
		return video_bitrate;
	}
	public void setVideo_bitrate(String video_bitrate) {
		this.video_bitrate = video_bitrate;
	}
	public String getAudio_bitrate() {
		return audio_bitrate;
	}
	public void setAudio_bitrate(String audio_bitrate) {
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
	public String getReg_date() {
		reg_date = (reg_date == null) ? "0"	: reg_date;
		int convertRegDate = Integer.parseInt(reg_date);
		return DateUtils.TimestamptToString(convertRegDate);
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getMod_date() {
		mod_date = (mod_date == null) ? "0" : mod_date;
		int convertSetModDate = Integer.parseInt(mod_date);
		return DateUtils.TimestamptToString(convertSetModDate);
	}
	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}
	public String getDownload_url() {
		return download_url;
	}
	public void setDownload_url(String download_url) {
		this.download_url = download_url;
	}
	public String getStreaming_url() {
		return streaming_url;
	}
	public void setStreaming_url(String streaming_url) {
		this.streaming_url = streaming_url;
	}
	
}

package com.airensoft.skovp.vo;

public class ViewCountStatisticsVO {
	private String country;		
	private String device;		
	private String deviceos;
	private String player_code;
	private String play_time_grade;
	private String view_count;
	private String content_id;
	private String content_title;
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getDevice() {
		return device;
	}
	public void setDevice(String device) {
		this.device = device;
	}
	public String getDeviceos() {
		return deviceos;
	}
	public void setDeviceos(String deviceos) {
		this.deviceos = deviceos;
	}
	public String getPlayer_code() {
		return player_code;
	}
	public void setPlayer_code(String player_code) {
		this.player_code = player_code;
	}
	public String getPlay_time_grade() {
		return play_time_grade;
	}
	public void setPlay_time_grade(String play_time_grade) {
		this.play_time_grade = play_time_grade;
	}
	public String getView_count() {
		return view_count;
	}
	public void setView_count(String view_count) {
		this.view_count = view_count;
	}
	public String getContent_id() {
		return content_id;
	}
	public void setContent_id(String content_id) {
		this.content_id = content_id;
	}
	public String getContent_title() {
		return content_title;
	}
	public void setContent_title(String content_title) {
		this.content_title = content_title;
	}
	
	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("country: " + country + "\r\n");
		sb.append("device: " + device + "\r\n");
		sb.append("deviceos: " + deviceos + "\r\n");
		sb.append("player_code: " + player_code + "\r\n");
		sb.append("play_time_grade: " + play_time_grade + "\r\n");
		sb.append("view_count: " + view_count + "\r\n");
		sb.append("content_id: " + content_id + "\r\n");
		sb.append("content_title: " + content_title + "\r\n");
		return sb.toString();
	}
}

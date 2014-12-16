package com.airensoft.skovp.vo;

public class PlayListCountVO {
	private String playlist_id;
	private String name;
	private String count;
	
	public String getPlaylist_id() {
		return playlist_id;
	}
	public void setPlaylist_id(String playlist_id) {
		this.playlist_id = playlist_id;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("playlist_id: " + playlist_id + "\r\n");
		sb.append("name: " + name + "\r\n");
		sb.append("count: " + count + "\r\n");
		return sb.toString();
	}
}

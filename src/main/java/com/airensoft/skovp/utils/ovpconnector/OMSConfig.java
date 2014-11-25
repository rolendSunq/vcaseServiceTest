package com.airensoft.skovp.utils.ovpconnector;

import com.airensoft.skovp.utils.domain.GlobalObject;

public class OMSConfig {
	// CONTENT
	public static final String OVP_CONTENT_LIST = "/content";

	// PUBLISH
	public static final String OVP_PUBLISH_DOWNLOAD_CONTENT = "/publish/download/content";
	public static final String OVP_PUBLISH_STREAMING_CONTENT = "/publish/streaming/content";

	// PLAYLIST
	public static final String OVP_PLAYLIST = "/playlist";
	public static final String OVP_PLAYLIST_INNER_CONTENT_BINDING = OVP_PLAYLIST + "/content";
	
	// PLAYER 광고
	public static final String OVP_PLAYER_AD = "/player/%s/ad";

	public static String getAccessToken() {
		return GlobalObject.getInstance().getProperty("skovp.access_token", "");
	}

	public static String getHost() {
		return GlobalObject.getInstance().getProperty("skovp.domain", "");
	}

	public static int getPlayerId() {
		return Integer.parseInt(GlobalObject.getInstance().getProperty("skovp.playerid", ""));
	}

	public static int getJobProfileId() {
		return Integer.parseInt(GlobalObject.getInstance().getProperty("skovp.jobprofileid", ""));
	}
}

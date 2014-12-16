package com.airensoft.skovp.utils.ovpconnector;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;

import org.apache.http.client.ClientProtocolException;

import com.airensoft.skovp.utils.http.HttpConnectable;
import com.airensoft.skovp.utils.parser.JsonParser;

public class OMSConnector extends HttpConnectable {
	private JsonParser jsonParser;
	private String accessToken;
	private String protocol;
	HashMap<String, Object> paramData;

	public OMSConnector() {
		this(OMSConfig.getHost());
	}

	public OMSConnector(String host) {
		super(null);

		setHost(host);
		setResult(new OMSConnectorResponse());

		setAccessToken(OMSConfig.getAccessToken());

		this.protocol = "http";
		this.paramData = new HashMap<String, Object>();

		this.jsonParser = new JsonParser();
	}

	/**
	 * 컨텐츠 목록 조회
	 */
	public OMSConnectorResponse RequestContentList(String media_type, String file_type, String state, String search_type, String search, Integer search_start_date, Integer search_end_date,
			Integer page, Integer page_size, String sort, String order, boolean with_extra, boolean with_static_url) {
		clear();
		setProtocol("http");
		setMethod("GET");
		addURIParam(OMSConfig.OVP_CONTENT_LIST);

		addParam("media_type", media_type);
		addParam("file_type", file_type);
		addParam("state", state);
		addParam("search_type", search_type);
		addParam("search", search);
		addParam("search_start_date", search_start_date);
		addParam("search_end_date", search_end_date);
		addParam("page", page);
		addParam("page_size", page_size);
		addParam("sort", sort);
		addParam("order", order);
		addParam("with_extra", with_extra);
		addParam("with_static_url", with_static_url);

		return requestAPI();
	}

	/**
	 * 컨텐츠 다운로드 URL 발급
	 */
	public OMSConnectorResponse RequestPulbishDownloadContent(Integer content_id) {
		setProtocol("http");
		setMethod("GET");
		addURIParam(OMSConfig.OVP_PUBLISH_DOWNLOAD_CONTENT + "/" + content_id);

		return requestAPI();
	}

	/**
	 * 컨텐츠 스트리밍 URL 발급
	 */
	public OMSConnectorResponse RequestPulbishStreamingContent(String content_id, Integer allow_count, Integer allow_start_Date, Integer allow_end_date, String protocol, boolean encryption) {
		setProtocol("http");
		setMethod("GET");
		addURIParam(OMSConfig.OVP_PUBLISH_STREAMING_CONTENT + "/" + content_id);

		addParam("allow_count", allow_count);
		addParam("allow_start_Date", allow_start_Date);
		addParam("allow_end_date", allow_end_date);
		addParam("protocol", protocol);
		addParam("encryption", encryption);

		return requestAPI();
	}

	/**
	 * 광고 조회
	 */
	public OMSConnectorResponse RequestPlayerAd(String player_id) {
		setProtocol("http");
		setMethod("GET");
		addURIParam(String.format(OMSConfig.OVP_PLAYER_AD, player_id));

		return requestAPI();
	}
	
	// 단일 컨텐츠 정보 조회
	public OMSConnectorResponse requestPlayerInfo(String contentId, boolean withExtra, boolean withStaticUrl) {
		clear();
		setProtocol("http");
		setMethod("GET");
		addURIParam(OMSConfig.OVP_CONTENT_LIST + "/" + contentId);
		addParam("with_extra", withExtra);
		addParam("with_static_url", withStaticUrl);
		return requestAPI();
	}
	
	// 메타 태그 정보 수정 (ovp manual 3.1)
	public OMSConnectorResponse requestMetaInfoEdit(String contentId, List<String> tags, String custom_id, String titie, String description, String related_link, String related_descripttion, String related_object, String related_type, String rev) {
		clear();
		setProtocol("http");
		setMethod("POST");
		addURIParam(OMSConfig.OVP_CONTENT_LIST + "/" + contentId);
		paramData.put("tags", tags);
		paramData.put("custom_id", custom_id);
		paramData.put("title", titie);
		paramData.put("description", description);
		paramData.put("related_link", related_link);
		paramData.put("related_description", related_descripttion);
		paramData.put("related_object", related_object);
		paramData.put("related_type", related_type);
		paramData.put("rev", rev);
		return requestAPI();
	}
	
	// 인기 콘텐트 목록 조회
	public OMSConnectorResponse requestPopularContentList(int startDate, int endDate, int pageNumber, int pageSize, boolean withExtra, boolean withStaticUrl) {
		clear();
		setProtocol("http");
		setMethod("GET");
		addURIParam(OMSConfig.OVP_CONTENT_LIST + "/popular");
		addParam("search_start_date", startDate);
		addParam("search_end_date", endDate);
		addParam("page", pageNumber);
		addParam("page_size", pageSize);
		addParam("with_extra", withExtra);
		addParam("with_static_url", withStaticUrl);
		
		return requestAPI();
	}
	
	// 콘텐트 파일 업로드
	public OMSConnectorResponse requestFileUpload(File file, String fileName, String fileDescription, String title, String playListIds, String tagList) {
		clear();
		setHost("http://upload.vcase.myskcdn.com/v1");
		setProtocol("http");
		setMethod("POST");
		setUploadFile(file, fileName, fileDescription);
		addURIParam(OMSConfig.OVP_CONTENT_LIST + "/upload");
		addParam("title", title);
		addParam("description", fileDescription);
		addParam("playlist_ids", playListIds);
		addParam("tags", tagList);
		addParam("access_token", getAccessToken());
		return requestAPI(false);
	}
	
	// 플레이리스트(콘텐트 그룹) 생성 (ovp manual 4.1)
	public OMSConnectorResponse requestSetPlayList(String custom_id, String name, String desription, boolean active) {
		clear();
		setProtocol("http");
		setMethod("POST");
		addURIParam(OMSConfig.OVP_PLAYLIST);
		addParam("custom_id", custom_id);
		addParam("name", name);
		addParam("description", desription);
		addParam("active", active);
		
		//paramData.put("key", value);
		
		return requestAPI();
	}
	
	// 플레이리스트별 콘텐트 개수 조회
	public OMSConnectorResponse requestContentForPlayList() {
		clear();
		setProtocol("http");
		setMethod("GET");
		addURIParam(OMSConfig.OVP_PLAYLIST_PER_CONTENT);
		return requestAPI();
	}
	
	// 플레이리스트 목록 조회 ovp menual 4.6
	public OMSConnectorResponse requestSearchPlaylistLIST(String search_Type, String search, String search_start_date, String search_end_date, Integer page, Integer page_size, String sort, String order) {
		clear();
		setProtocol("http");
		setMethod("GET");
		addURIParam(OMSConfig.OVP_PLAYLIST);
		addParam("search_Type", search_Type);
		addParam("search", search);
		addParam("search_start_date", search_start_date);
		addParam("search_end_date", search_end_date);
		addParam("page", page);
		addParam("page_size", page_size);
		addParam("sort", sort);
		addParam("order", order);
		return requestAPI();
	}
	
	// 개별 플레이리스트의 콘텐츠 목록을 가져온다.(플레이리스트 내 콘텐츠 목록 조회 ovp maual 4.8)
	public OMSConnectorResponse requestGetPlayListToContent(String playlist_id, String mediaType, String state, String searchType, String search, Integer searchStartDate, Integer searchEndDate, Integer pageNum, Integer pageSize, String sort, String order, boolean withExtra, boolean withStatic) {
		clear();
		setProtocol("http");
		setMethod("GET");
		addURIParam(OMSConfig.OVP_PLAYLIST + "/" + playlist_id + "/content");
		addParam("mediaType", mediaType);
		addParam("state", state);
		addParam("search_type", searchType);
		addParam("search", search);
		addParam("search_start_date", searchStartDate);
		addParam("search_end_date", searchEndDate);
		addParam("page", pageNum);
		addParam("page_size", pageSize);
		addParam("sort", sort);
		addParam("order", order);
		addParam("with_extra", withExtra);
		addParam("with_static_url", withStatic);
		return requestAPI();
	}
	
	// 플레이리스트(컨텐트 그룹)에 해당 콘텐트 바인딩
	public OMSConnectorResponse requestPlaylistContentBinding(List<String> content_ids, String playlist_id) {
		clear();
		setProtocol("http");
		setMethod("POST");
		addURIParam(OMSConfig.OVP_PLAYLIST + "/" + playlist_id + "/content");
		paramData.put("content_ids", content_ids);
		return requestAPI();
	}
	
	// view_count 통계
	public OMSConnectorResponse getOvpViewCountStatistics(String country, String device, String devicesOS, String playerCode, String playTimeGrade, Integer searchStartDate, Integer searchEndDate, Integer page){
		clear();
		setProtocol("http");
		setMethod("GET");
		addURIParam(OMSConfig.OVP_STATISTICS_VIEWCOUNT);
		addParam("country", country);
		addParam("device", device);
		addParam("device_os", devicesOS);
		addParam("player_code", playerCode);
		addParam("play_time_grade", playTimeGrade);
		addParam("search_start_date", searchStartDate);
		addParam("search_end_date", searchEndDate);
		addParam("page", page);
		addParam("page_size", 20);
		addParam("view_count", "view_count");
		addParam("order", "desc");
		return requestAPI();
	}
	
	// content를 삭제한다.
	public OMSConnectorResponse requestDeleteContentList(String deleteList) {
		 clear();
		 setProtocol("http");
		 setMethod("DELETE");
		 addURIParam("/content");
		 addParam("content_ids", deleteList);
		 addParam("custom_ids", "");
		 return requestAPI();
	}
	
	// 플레이리스트의 아이디를 찾는다 (ovp manual 4.6)
	public OMSConnectorResponse requestPlaylistId(String playlistName) {
		clear();
		setProtocol("http");
		setMethod("GET");
		addURIParam("/playlist");
		addParam("search_Type", "name");
		addParam("search", playlistName);
		addParam("search_start_date", 0);
		addParam("search_end_date", 0);
		addParam("page", 0);
		addParam("page_size", 1);
		addParam("sort", "playlist_id");
		addParam("order", "desc");
		return requestAPI();
	}
	@Override
	public void clear() {
		super.clear();

		setHost(OMSConfig.getHost());
		setResult(new OMSConnectorResponse());
		setAccessToken(OMSConfig.getAccessToken());

		this.protocol = "http";
		this.paramData = new HashMap<String, Object>();
	}

	@Override
	public void setHost(String host) {
		// ?�래???�식?�로 맞춘??
		// http://dev.airensoft.com:8080
		int beginIndex;
		String protocol;

		if (host != null) {
			if (this.protocol != null) {
				protocol = this.protocol;
			} else {
				protocol = "http";
			}

			if (!host.startsWith(protocol)) {
				beginIndex = host.indexOf("://");

				if (beginIndex != -1) {
					host = host.substring(beginIndex + 3);
				}

				host = protocol.concat("://").concat(host);
			}
		}

		super.setHost(host);
	}

	private OMSConnectorResponse requestAPI() {
		return requestAPI(true);
	}

	private OMSConnectorResponse requestAPI(boolean prepare) {
		OMSConnectorResponse response = null;

		try {
			if (prepare) {
				prepareRequest();
			}

			response = (OMSConnectorResponse) request();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return response;
	}

	private void prepareRequest() {
		if (getMethod().equals("GET") || getMethod().equals("DELETE")) {
			addParam("access_token", getAccessToken());
		} else {
			HashMap<String, Object> bodyData = new HashMap<String, Object>();

			this.paramData.put("access_token", getAccessToken());

			bodyData.put("params", this.paramData);

			setRequestBody(jsonParser.encode(bodyData));
		}
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public String getProtocol() {
		return protocol;
	}

	public void setProtocol(String protocol) {
		this.protocol = protocol;
		setHost(getHost());
	}

}

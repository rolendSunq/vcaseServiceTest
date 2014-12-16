package com.hankooktire.videobox.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.airensoft.skovp.utils.common.UnitUtils;
import com.airensoft.skovp.utils.ovpconnector.OMSConfig;
import com.airensoft.skovp.utils.ovpconnector.OMSConnector;
import com.airensoft.skovp.utils.ovpconnector.OMSConnectorResponse;
import com.airensoft.skovp.utils.page.Paging;
import com.airensoft.skovp.utils.time.DateHelper;
import com.airensoft.skovp.utils.time.DateUtils;
import com.airensoft.skovp.vo.CategoryPageVO;
import com.airensoft.skovp.vo.FileVO;
import com.airensoft.skovp.vo.MovieContentVO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.hankooktire.videobox.service.OvpService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {

	@Autowired
	OMSConnectorResponse omsResponder;
	@Autowired
	OMSConnector omsConnector;
	@Autowired
	OvpService ovpService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/")
	public String videoBoxHome(Model model) {
		// main의 update movie 를 보여 주기 위한 컨텐츠를 가져온다. 내부에서 모델 등록
		ovpService.getAllContentList(model);
		// main의 popular Movie를 보여주기 위한 컨텐츠를 가져온다.
		List<MovieContentVO> popularList = ovpService.popularList(5);
		// 카테고리 메뉴별 컨텐츠를 보여주기 위한 컨텐츠를 가져온다.
		List<MovieContentVO> categoryList = ovpService.getPlayListForContent("1300000253", null, null, null, null, model);
		CategoryPageVO ctgVO = new CategoryPageVO();
		ctgVO.setPlaylist_id("1300000253");
		ctgVO.setPlaylist_name("Company");
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("categoryInfo", ctgVO);
		model.addAttribute("popularList", popularList);
		return "main";
	}

	@RequestMapping(value = "/getTabMenu")
	@ResponseBody
	public String getPlaylistForTabMenu(HttpServletRequest request) {
		String playlist_id = request.getParameter("playlist_id");
		List<MovieContentVO> list = ovpService.serviceGetPlaylistContents(playlist_id);
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value = "/categoryPlaylist")
	public String goPlaylist(HttpServletRequest request, CategoryPageVO ctgVO, Model model) {
		String myHistory = request.getParameter("historyList");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		List<MovieContentVO> list = ovpService.goPlaylistContentList(ctgVO);
		Paging paging = new Paging(ctgVO.getPageNum(), ctgVO.getTotalCount());
		model.addAttribute("history", history);
		model.addAttribute("paging", paging);
		model.addAttribute("pageInfo", ctgVO);
		model.addAttribute("list", list);
		return "list";
	}
	
	@RequestMapping(value = "content/player/{content_id}")
	@ResponseBody
	public String getContentStringUrl(@PathVariable("content_id") String content_id) {
		return getStreamPlayUrl(content_id, "streaming_url");
	}
	
	// download Url을 얻어온다.
	@RequestMapping(value = "contentInfo")
	@ResponseBody
	public String getFileInfo(HttpServletResponse response, @RequestParam("contentId") String contentId) {
		response.setContentType("text/html; charset=utf-8");
		JsonObject result = getInfo(contentId);
		Map<String, String> map = getPlayContentInfo(result, true);
		return new Gson().toJson(map);
	}
	
	// history List를 가져온다.
	@RequestMapping(value = "mamsHistoryList")
	@ResponseBody
	public String getHistoryList(HttpServletRequest request) {
		String myhistory = request.getParameter("historyList");
		String[] historyList = new Gson().fromJson(myhistory, String[].class);
		List<MovieContentVO> list = ovpService.getHistoryList(historyList);
		return new Gson().toJson(list);
	}
	
	// detail 페이지 이동
	@RequestMapping(value = "detail") 
	public String moveDetailView(HttpServletRequest request, Model model) {
		String myHistory = request.getParameter("historyList");
		String playlistName = request.getParameter("playlist_name");
		String contentId	= request.getParameter("content_id");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		String playlistId = ovpService.servicePlaylistFindName(playlistName);
		CategoryPageVO ctgVO = new CategoryPageVO();
		ctgVO.setPlaylist_id(playlistId);
		ctgVO.setPlaylist_name(playlistName);
		ctgVO.setContent_id(contentId);
		System.out.println("requestPlaylistName:::" + playlistName);
		System.out.println("playlistName:::" + ctgVO.getPlaylist_name());
		ovpService.serviceDetailPageToListPage(ctgVO, model);
		ovpService.serviceViewCountASC(model);
		model.addAttribute("pageInfo", ctgVO);
		model.addAttribute("history", history);
		model.addAttribute("player_id", OMSConfig.getPlayerId());
		return "detail";
	}
	
	// detail popular page 이동
	@RequestMapping(value = "detailPopular")
	public String goDetailPopular(HttpServletRequest request, CategoryPageVO ctgVO, Model model) {
		String myHistory = request.getParameter("historyList");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		MovieContentVO movieContentVO = ovpService.serviceDetailPopular(ctgVO.getContent_id());
		ovpService.serviceViewCountASC(model);
		List<MovieContentVO> popularList = ovpService.popularList(20);
		model.addAttribute("history", history);
		model.addAttribute("oneStreamPlay", movieContentVO);
		model.addAttribute("popularList", popularList);
		return "detail_popular";
	}
	
	// bookmark 페이지 이동
	@RequestMapping(value = "moveMyBookmark")
	public String moveBookmarkView(@RequestParam("bookmarkInfo") String bookmarkInfo, @RequestParam("historyList") String historyList, Model model) {
		String[] myHistory = new Gson().fromJson(historyList, String[].class);
		String[] bookmarkList = new Gson().fromJson(bookmarkInfo, String[].class);
		List<String> orignalIds = getOrignList(bookmarkList);
		List<String> orignalHis = getOrignList(myHistory);
		List<Object> resultList = getList(orignalIds);
		List<Object> resultHis = getList(orignalHis);
		model.addAttribute("item", resultList);
		model.addAttribute("history", resultHis);
		return "list_my_bookmark";
	}
	
	// list_my_download.jsp 페이지 이동
	@RequestMapping(value = "mamsDownload")
	public String moveDownloadView(@RequestParam("historyList") String historyList, @RequestParam("downloadList") String downloadList, Model model) {
		String[] download = new Gson().fromJson(historyList, String[].class);
		String[] myHistory= new Gson().fromJson(downloadList, String[].class);
		List<String> orignHisList = getOrignList(download);
		List<String> orignDownList = getOrignList(myHistory);
		List<Object> hisList = getList(orignHisList);
		List<Object> list = getList(orignDownList);
		model.addAttribute("history", hisList);
		model.addAttribute("list", list);
		return "list_my_download";
	}

	// playlist (list page) 페이지 이동
	@RequestMapping(value = "playlist")
	public String moveListDetailView(HttpServletRequest request, CategoryPageVO ctgVO, Model model)  {
		String myHistory = request.getParameter("historyList");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		List<MovieContentVO> list = ovpService.getSortSearchPlayListForContent(ctgVO);
		Paging paging = new Paging(ctgVO.getPageNum(), ctgVO.getTotalCount());
		model.addAttribute("categoryPageVO", ctgVO);
		model.addAttribute("paging", paging);
		model.addAttribute("history", history);
		model.addAttribute("list", list);
		return "list";
	}
	
	// list 페이지 이동
	@RequestMapping(value = "listDetail")
	public String goListOfPlaylist(HttpServletRequest request, CategoryPageVO ctgVO, Model model)  {
		String myHistory = request.getParameter("historyList");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> list = ovpService.serviceAllContent(ctgVO);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		Paging paging = new Paging(ctgVO.getPageNum(), ctgVO.getTotalCount());
		model.addAttribute("categoryPageVO", ctgVO);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("history", history);
		return "list_popular";
	}
	
	
	
	// list page에서 detail page 이동
	@RequestMapping(value = "playlistDetail")
	public String detailPlaylist(CategoryPageVO ctgVO, HttpServletRequest request, Model model) {
		String myHistory = request.getParameter("historyList");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		ovpService.serviceDetailPageToListPage(ctgVO, model);
		model.addAttribute("history", history);
		model.addAttribute("pageInfo", ctgVO);
		return "detail";
	}
	
	// list_result 페이지 이동
	@RequestMapping(value = "listResult")
	public String moveListResultView(Model model) {
		return "list_result";
	}
	
	// File을 업로드 한다.
	@RequestMapping(value = "/video/fileUpload")
	@ResponseBody
	public String uploadFileToDefault(FileVO fileVO, HttpServletResponse response, Model model) throws IllegalStateException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String message = ovpService.contentFileUpload(fileVO);
		return new Gson().toJson(URLEncoder.encode(message, "UTF-8"));
	}
	
	// download File List를 가져온다.
	@RequestMapping(value = "getDownload")
	@ResponseBody
	public String getDownloadFileList(HttpServletRequest request) {
		String content_id = request.getParameter("content_id");
		return ovpService.serviceDownloadFile(content_id);
	}
	
	// Content Group 생성
	@RequestMapping("/setGroup")
	public String setGroupController (String groupName) {
		ovpService.setContentGroup(groupName);
		return "redirect:/";
	}
	
	// main page category List 카테고리 컨텐트 리스트 가져옴
	@RequestMapping("/categoryList")
	public String getMainCategoryList(HttpServletRequest request, Model model) {
		String myHistory = request.getParameter("historyList");
		String playlistId = request.getParameter("playlist_id");
		String playlistNm = request.getParameter("playlist_Nm");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		CategoryPageVO ctgVO = new CategoryPageVO();
		ctgVO.setPlaylist_id(playlistId);
		ctgVO.setPlaylist_name(playlistNm);
		ovpService.getAllContentList(model);
		List<MovieContentVO> categoryList = ovpService.getPlayListForContent(playlistId, null, null, null, null, model);
		model.addAttribute("history", history);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("categoryInfo", ctgVO);
		return "main";
	}
	
	private String getStreamPlayUrl(String contentId, String variableUrlName) {
		omsConnector.clear();
		Map<String, String> map = new HashMap<String, String>();
		// 재생할 미디어 정보를 가져온다.
		omsResponder = omsConnector.RequestPulbishStreamingContent(contentId, 0, null, null, "rtmp", false);
		String playStreamingUrl = omsResponder.getRootDataElement().getAsJsonObject().get("url").getAsString();
		map.put(variableUrlName, playStreamingUrl);
		
		return new Gson().toJson(map);
	}
	
	// 스트리밍할 컨텐츠의 url을 가져온다.
	private String getStreamPlayUrl(String content_id) {
		omsConnector.clear();
		// 재생할 미디어 정보를 가져온다.
		omsResponder = omsConnector.RequestPulbishStreamingContent(content_id, 0, null, null, "rtmp", false);
		String playStreamingUrl = omsResponder.getRootDataElement().getAsJsonObject().get("url").getAsString();
		return playStreamingUrl;
	}
	
	// 컨텐츠 단일 목록 조회
	private JsonObject getInfo(String contentId) {
		omsConnector.clear();
		omsResponder = omsConnector.requestPlayerInfo(contentId, true, true);
		JsonElement resultElement = omsResponder.getRootDataElement();
		JsonObject object = resultElement.getAsJsonObject().get("content").getAsJsonObject();
		return object;
	}
	
	// 컨텐츠 정보 추출
	private Map<String, String> getPlayContentInfo(JsonObject object, boolean isAjaxCall) {
		JsonObject result = object;
		Map<String, String> map = new HashMap<String, String>();
		StringBuffer sb = new StringBuffer();
		// getInfo()를 통해 단일 컨텐츠의 정보(json)를 가져온다. 
		// staticUrl은 다운로드 경로를 가지고 있다. content Object의 staticUrl Object로 묶여있다.
		JsonObject staticUrl = result.getAsJsonObject().get("static_url").getAsJsonObject();
		String contentId = result.get("content_id").getAsString();
		// content의 미디어 정보 video/audio 형식을 가져온다.
		String mediaType = result.get("media_type").getAsString();
		long fileSize = result.get("file_size").getAsLong();
		String convertFileSize = UnitUtils.humanReadableByteCount(fileSize, false);
		String container = result.get("container").getAsString();
		String width = result.get("width").getAsString();
		String height = result.get("height").getAsString();
		// video의 일반 화면 크기 + file size를 출력하려 묶었다.
		sb.append(width + "x" + height);
		sb.append("  " + convertFileSize);
		String title = result.get("title").getAsString();
		int regDate = result.get("reg_date").getAsInt();
		long duration = result.get("duration").getAsLong();
		String videoFormat = result.get("container").getAsString();
		String videoCodec = result.get("video_codec").getAsString();
		long videoBitrate = result.get("video_bitrate").getAsLong();
		String videoBps = UnitUtils.humanReadableByteCount(videoBitrate, false);
		String videoFps = result.get("video_framerate").getAsString();
		String audioBps = result.get("audio_bitrate").getAsString();
		String audioCodec = result.get("audio_codec").getAsString();
		String audioChannel = result.get("audio_channel").getAsString();
		String audioHz = result.get("audio_samplerate").getAsString();
		String fileName = result.get("file_name").getAsString();
		String encodeFileName = null;
		//한글로 된 파일 이름은 정상적으로 출력되지 않아서 인코딩을 한다.
		if (isAjaxCall == true) {
			try {
				encodeFileName = URLEncoder.encode(fileName, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		String downloadUrl = staticUrl.get("download_url").getAsString();
		map.put("content_id", contentId);
		map.put("title", title);
		map.put("reg_date", DateUtils.TimestamptToString(regDate));
		map.put("duration", DateHelper.getHourString(duration) + ":" + DateHelper.getMinuteString(duration) + ":" + DateHelper.getSecondString(duration));
		map.put("container", container);
		map.put("size", sb.toString());
		map.put("mediaType", mediaType);
		map.put("videoFormat", videoFormat);
		map.put("videoCodec", videoCodec);
		map.put("videoBps", videoBps);
		map.put("videoFps", videoFps);
		map.put("audioBps", audioBps);
		map.put("audioCodec", audioCodec);
		map.put("audioChannel", audioChannel);
		map.put("audioHz", audioHz);
		map.put("fileName", (isAjaxCall == true) ? encodeFileName : fileName);
		map.put("downloadUrl", downloadUrl);
		return map;
	}
	
	// 검색 페이지 리스트 항목 추출 옵션으로 다양한 검색을 할 수 있다.
	private List<Object> getList(List<String> trscdList) {
		List<Object> content = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer();
		for (int i = trscdList.size() - 1; -1 < i; i--) {
			Map<String, Object> map = new HashMap<String, Object>();
			omsConnector.clear();
			// RequestContentList args: String media_type, String file_type, String state, String search_type, String search, Integer search_start_date, Integer search_end_date, Integer page, Integer page_size, String sort, String order, boolean with_extra	
			omsResponder = omsConnector.RequestContentList("video", "orign", null, "content_id", trscdList.get(i), null, null, null, null, "reg_date", null, true, true);
			JsonElement resultElement = omsResponder.getRootDataElement();
			JsonArray contentJsonArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
			for (int j = 0; j < contentJsonArray.getAsJsonArray().size(); j++) {
				JsonObject jsonElement = contentJsonArray.get(j).getAsJsonObject();
				String content_id = jsonElement.getAsJsonObject().get("content_id").getAsString();
				String title = jsonElement.getAsJsonObject().get("title").getAsString();
				int reg_date = jsonElement.getAsJsonObject().get("reg_date").getAsInt();
				long duration = jsonElement.getAsJsonObject().get("duration").getAsLong();
				long file_size = jsonElement.getAsJsonObject().get("file_size").getAsLong();
				int thumbnailMediaId = jsonElement.getAsJsonObject().get("extra").getAsJsonObject().getAsJsonObject().get("thumbnails").getAsJsonArray().get(1).getAsJsonObject().get("content_id").getAsInt();
				omsConnector.clear();
				omsResponder = omsConnector.RequestPulbishDownloadContent(thumbnailMediaId);
				String thumb_url = omsResponder.getRootDataElement().getAsJsonObject().get("url").getAsString();
				String media_type = jsonElement.getAsJsonObject().get("media_type").getAsString();
				String convertFileSize = UnitUtils.humanReadableByteCount(file_size, false);
				String width = jsonElement.getAsJsonObject().get("width").getAsString();
				String height = jsonElement.getAsJsonObject().get("height").getAsString();
				sb.append(width + "x" + height);
				sb.append("  " + convertFileSize);
				String container = jsonElement.getAsJsonObject().get("container").getAsString();
				String videoFormat = jsonElement.getAsJsonObject().get("container").getAsString();
				String videoCodec = jsonElement.getAsJsonObject().get("video_codec").getAsString();
				long videoBitrate = jsonElement.getAsJsonObject().get("video_bitrate").getAsLong();
				String videoBps = UnitUtils.humanReadableByteCount(videoBitrate, false);
				String videoFps = jsonElement.getAsJsonObject().get("video_framerate").getAsString();
				String audioBps = jsonElement.getAsJsonObject().get("audio_bitrate").getAsString();
				String audioCodec = jsonElement.getAsJsonObject().get("audio_codec").getAsString();
				String audioChannel = jsonElement.getAsJsonObject().get("audio_channel").getAsString();
				String audioHz = jsonElement.getAsJsonObject().get("audio_samplerate").getAsString();
				String fileName = jsonElement.getAsJsonObject().get("file_name").getAsString();
				JsonObject staticObject = jsonElement.getAsJsonObject().get("static_url").getAsJsonObject();
				String downloadUrl = staticObject.getAsJsonObject().get("download_url").getAsString();
				String streamingUrl = getStreamPlayUrl(content_id);
				map.put("content_id", content_id);
				map.put("title", title);
				map.put("reg_date", DateUtils.TimestamptToString(reg_date));
				map.put("thumb_url", thumb_url);
				map.put("duration", DateHelper.getHourString(duration) + ":" + DateHelper.getMinuteString(duration) + ":" + DateHelper.getSecondString(duration));
				map.put("size", sb.toString());
				map.put("container", container);
				map.put("mediaType", media_type);
				map.put("videoFormat", videoFormat);
				map.put("videoCodec", videoCodec);
				map.put("videoBps", videoBps);
				map.put("videoFps", videoFps);
				map.put("audioBps", audioBps);
				map.put("audioCodec", audioCodec);
				map.put("audioChannel", audioChannel);
				map.put("audioHz", audioHz);
				map.put("fileName", fileName);
				map.put("downloadUrl", downloadUrl);
				map.put("streamingUrl", streamingUrl);
			}
			content.add(map);
		}
		return content;
	}
	
	private List<String> getOrignList(String[] trscdList){
		List<String> result = new ArrayList<String>();
		if (trscdList != null) {
			for (int i = 0; i < trscdList.length; i++) {
				omsConnector.clear();
				// RequestContentList args: String media_type, String file_type, String state, String search_type, String search, Integer search_start_date, Integer search_end_date, Integer page, Integer page_size, String sort, String order, boolean with_extra	
				omsResponder = omsConnector.RequestContentList("video", "trscd", null, "content_id", trscdList[i], null, null, null, null, "reg_date", null, false, false);
				JsonElement resultElement = omsResponder.getRootDataElement();
				JsonArray contentJsonArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
				System.out.println("resultElement: " + resultElement.toString());
				for (JsonElement jsonElement : contentJsonArray) {
					String upper_content_id = jsonElement.getAsJsonObject().get("upper_content_id").getAsString();
					result.add(upper_content_id);
				}
			}
		}
		return result;
	}
	
}

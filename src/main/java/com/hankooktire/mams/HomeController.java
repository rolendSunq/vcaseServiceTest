package com.hankooktire.mams;

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
import com.airensoft.skovp.utils.time.DateHelper;
import com.airensoft.skovp.utils.time.DateUtils;
import com.airensoft.skovp.vo.FileVO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.hankooktire.service.OvpService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

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
	public String mamHome(Model model) {
		List<Object> result = new ArrayList<Object>();
		Map<String, Object> oneStreamPlay = new HashMap<String, Object>();
		int objectCount = 0;
		
		// RequestContentList args: String media_type, String file_type, String state, String search_type, String search, Integer search_start_date, Integer search_end_date, Integer page, Integer page_size, String sort, String order, boolean with_extra	
		omsResponder = omsConnector.RequestContentList("video", null, null, null, null, null, null, null, null, "reg_date", null, true, true);
		JsonElement resultElement = omsResponder.getRootDataElement();
		JsonArray contentJsonArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
		for (int i = 0; i < contentJsonArray.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			JsonElement element = contentJsonArray.get(i);

			// 업로드 완료된 미디어 : cmplt = complete
			String state = element.getAsJsonObject().get("state").getAsString();
			
			// job 프로파일과 맞은 트랜스코딩 미디어 파일을 찾는다. 없는경우 원본사용
			if (state.equals("cmplt")) {   
				
				map.put("title", element.getAsJsonObject().get("title").getAsString());

				// 업로드가 완료된 미디어만 View에 출력하도록 한다.
				JsonArray trscdJsonArray = element.getAsJsonObject().get("extra").getAsJsonObject().get("transcodes").getAsJsonArray();
				for (int j = 0; j < trscdJsonArray.size(); j++) {
					JsonElement trscdElement = trscdJsonArray.get(j);
					
					// 업로드가 완료된 미디어만 View에 출력하도록 한다.
					String trscdState = trscdElement.getAsJsonObject().get("state").getAsString();
					
					if (trscdState.equals("cmplt")) {
						Integer jobProfileId = trscdElement.getAsJsonObject().get("job_profile_id").getAsInt();
						
						if (jobProfileId.equals(OMSConfig.getJobProfileId())) {

							//재생시간
							long duration = trscdElement.getAsJsonObject().get("duration").getAsLong();
							map.put("duration", DateHelper.getHourString(duration) + ":" + DateHelper.getMinuteString(duration) + ":" + DateHelper.getSecondString(duration));

							// 컨텐츠 파일사이즈차례
							long file_size = trscdElement.getAsJsonObject().get("file_size").getAsLong();
							map.put("file_size", UnitUtils.humanReadableByteCount(file_size, false));

							// 미디어 등록 일자
							int reg_date = trscdElement.getAsJsonObject().get("reg_date").getAsInt();
							map.put("reg_date", DateUtils.TimestamptToString(reg_date));

							// 미디어 ID
							int content_id = trscdElement.getAsJsonObject().get("content_id").getAsInt();
							map.put("content_id", content_id);
							
							JsonObject staticObject = trscdElement.getAsJsonObject().get("static_url").getAsJsonObject();
							String downloadUrl = staticObject.getAsJsonObject().get("download_url").getAsString();
							map.put("downloadUrl", downloadUrl);
							// 섬네일 ID
							int thumbnailMediaId = element.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray().get(1).getAsJsonObject().get("content_id").getAsInt();
							omsConnector.clear();
							omsResponder = omsConnector.RequestPulbishDownloadContent(thumbnailMediaId);
							String thumb_url = omsResponder.getRootDataElement().getAsJsonObject().get("url").getAsString();
							map.put("thumb_url", thumb_url);

							// streaming Url : streaming_url에 사용됨 (with_static_url) 인자에 true값을 넣어야 데이터가 생성
							JsonObject staticUrlObject = trscdElement.getAsJsonObject().get("static_url").getAsJsonObject();
							JsonArray streamingArray = staticUrlObject.getAsJsonObject().get("streaming").getAsJsonArray();
							String streamingUrl = streamingArray.get(0).getAsJsonObject().get("url").getAsString();
							map.put("streamingUrl", streamingUrl);
							result.add(map);
							
							if (objectCount == 0) {
								oneStreamPlay.putAll(map);
							}
							
							objectCount++;
							
							break;
						}
					}
				}
			}
		}
		ovpService.popularList(model);
		String streamingUrl = getStreamPlayUrl((Integer)oneStreamPlay.get("content_id"));
		
		model.addAttribute("list", result);
		model.addAttribute("streamingUrl", streamingUrl);
		model.addAttribute("oneStreamPlay", oneStreamPlay);
		model.addAttribute("player_id", OMSConfig.getPlayerId());

		return "main";
	}

	@RequestMapping(value = "content/player/{content_id}")
	@ResponseBody
	public String getContentStringUrl(@PathVariable("content_id") int content_id) {
		return getStreamPlayUrl(content_id, "streaming_url");
	}
	
	// download Url을 얻어온다.
	@RequestMapping(value = "contentInfo")
	@ResponseBody
	public String getFileInfo(HttpServletResponse response, @RequestParam("contentId") int contentId) {
		response.setContentType("text/html; charset=utf-8");
		JsonObject result = getInfo(contentId);
		Map<String, String> map = getPlayContentInfo(result, true);
		return new Gson().toJson(map);
	}
	
	//
	@RequestMapping(value = "viewsCount")
	@ResponseBody
	public String setTagCount(@RequestParam("content_Id") int content_Id) {
		omsConnector.clear();
		String[] count = {"count-1"};
		String countTag = new Gson().toJson(count);
		omsResponder = omsConnector.requestMetaInfoEdit(content_Id, countTag);
		return omsResponder.toString();
	}
	
	// history List를 가져온다.
	@RequestMapping(value = "mamsHistoryList")
	@ResponseBody
	public String getHistoryList(@RequestParam("contentIdList") String contentIdList) {
		String[] historyList = new Gson().fromJson(contentIdList, String[].class);
		List<String> orignList = getOrignList(historyList);
		List<Object> myHistory = getList(orignList, true);
		return new Gson().toJson(myHistory);
	}
	
	// detail 페이지 이동
	@RequestMapping(value = "detail") 
	public String moveDetailView(HttpServletRequest request, @RequestParam("content_id") int content_id, @RequestParam("thumbUrl") String thumbUrl, Model model) {
		String historyList = (String)request.getParameter("historyList");
		JsonObject result = getInfo(content_id);
		// auto Streaming Play Info
		Map<String, String> map = getPlayContentInfo(result, false);
		// 좌측 컨텐츠 thumb nail 컨텐츠 리스트
		List<Object> list = getThumbNailList();
		
		String[] trscdlst = new Gson().fromJson(historyList, String[].class);
		// history list
		List<String> historylst = getOrignList(trscdlst);
		List<Object> history = getList(historylst);
		String streamingUrl = getStreamPlayUrl(content_id);
		model.addAttribute("history", history);
		model.addAttribute("oneStreamPlay", map);
		model.addAttribute("streamingUrl", streamingUrl);
		model.addAttribute("thumbUrl", thumbUrl);
		model.addAttribute("player_id", OMSConfig.getPlayerId());
		model.addAttribute("list", list);
		model.addAttribute("totalCount", getThumbNailListCount());
		return "detail";
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
	

	// list 페이지 이동
	@RequestMapping(value = "listDetail")
	public String moveListDetailView(@RequestParam("historyList") String historyList, Model model, HttpServletRequest request ) {
		String[] trscdlst = new Gson().fromJson(historyList, String[].class);
		List<String> historylst = getOrignList(trscdlst);
		List<Object> history = getList(historylst);
		List<Object> thumbNailList = getThumbNailList();
		
		//########################## 페이징 처리 추가부분 [start] ########################## 
//		int pageSize = 10; //한페이지에 표시할 글의 수 
//		String number = request.getParameter("number");; //현재페이지에 표시할 레코드수
	    
	    
//	    if (number == null) { //현재페이지에 표시할 레코드수
//	    	number = "20"; //현재페이지에 표시할 레코드수 초기 값 : 20개로 설정
//	    }   
	    
//	    int currentPage = Integer.parseInt(pageNum); //pageNum변수값을 숫자로 파싱
	   
//		model.addAttribute("pageSize", pageSize); //한페이지에 표시할 글의 수
		
		String pageNum = request.getParameter("pageNum");//화면에 표시할 페이지번호
		
		if (pageNum == null) {//페이지번호가 없으면
			pageNum = "1";//1페이지의 내용이 화면에 표시
		}
		
		System.out.println("########## pageNum #########"+pageNum);
		
		int pageCount = thumbNailList.size(); //전체 글 수
		model.addAttribute("pageNum", pageNum); //화면에 표시할 페이지번호
		model.addAttribute("pageCount", pageCount); //전체 글 수
//		model.addAttribute("number", number); //현재페이지에 표시할 레코드수 <-- 변경
//		model.addAttribute("currentPage", currentPage); //pageNum변수값을 숫자로 파싱
		//########################## 페이징 처리 추가부분 [end] ########################## 
		
		model.addAttribute("cnt", thumbNailList.size()); //카운트 갯수
		model.addAttribute("list", thumbNailList);
		model.addAttribute("history", history);
		
		return "list";
	}
	
	// list_result 페이지 이동
	@RequestMapping(value = "listResult")
	public String moveListResultView(Model model) {
		return "list_result";
	}
	
	// File을 업로드 한다.
	@RequestMapping(value = "/video/fileUpload")
	public String uploadFileToDefault(FileVO fileVO) throws IllegalStateException, IOException {
		System.out.println(fileVO);
		ovpService.contentFileUpload(fileVO);
		/*
		MultipartFile file = fileVO.getFile();
		 if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(file.getOriginalFilename() + "-uploaded")));
                stream.write(bytes);
                stream.close();
                return "[업로드 성공]: " + file.getOriginalFilename() + " into " + file.getOriginalFilename() + "-uploaded 성공!";
            } catch (Exception e) {
                return "[업로드 실패]: " + file.getOriginalFilename() + " => " + e.getMessage();
            }
        } else {
            return "[업로드 실패]: " + file.getOriginalFilename() + " 파일에 대한 오류가 있습니다.";
        }
        */
		return null;
	}
	private String getStreamPlayUrl(int contentId, String variableUrlName) {
		omsConnector.clear();
		Map<String, String> map = new HashMap<String, String>();
		// 재생할 미디어 정보를 가져온다.
		omsResponder = omsConnector.RequestPulbishStreamingContent(contentId, 0, null, null, "rtmp", false);
		String playStreamingUrl = omsResponder.getRootDataElement().getAsJsonObject().get("url").getAsString();
		map.put(variableUrlName, playStreamingUrl);
		
		return new Gson().toJson(map);
	}
	
	// 스트리밍할 컨텐츠의 url을 가져온다.
	private String getStreamPlayUrl(int contentId) {
		omsConnector.clear();
		// 재생할 미디어 정보를 가져온다.
		omsResponder = omsConnector.RequestPulbishStreamingContent(contentId, 0, null, null, "rtmp", false);
		String playStreamingUrl = omsResponder.getRootDataElement().getAsJsonObject().get("url").getAsString();
		return playStreamingUrl;
	}
	
	// 컨텐츠 단일 목록 조회
	private JsonObject getInfo(int contentId) {
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
	// thumb nail 과 정보 추출
	private List<Object> getThumbNailList() {
		omsConnector.clear();
		List<Object> result = new ArrayList<Object>();
		
		// RequestContentList args: String media_type, String file_type, String state, String search_type, String search, Integer search_start_date, Integer search_end_date, Integer page, Integer page_size, String sort, String order, boolean with_extra	
		omsResponder = omsConnector.RequestContentList("video", null, null, null, null, null, null, null, null, "reg_date", null, true, false);
		JsonElement resultElement = omsResponder.getRootDataElement();
		JsonArray contentJsonArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
		
		for (int i = 0; i < contentJsonArray.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			JsonElement element = contentJsonArray.get(i);
			
			// 업로드 완료된 미디어 : cmplt = complete
			String state = element.getAsJsonObject().get("state").getAsString();
			
			if (state.equals("cmplt")) {
				
				// job 프로파일과 맞은 트랜스코딩 미디어 파일을 찾는다. 없는경우 원본사용
				map.put("title", element.getAsJsonObject().get("title").getAsString());

				// 업로드가 완료된 미디어만 View에 출력하도록 한다.
				JsonArray trscdJsonArray = element.getAsJsonObject().get("extra").getAsJsonObject().get("transcodes").getAsJsonArray();
				for (int j = 0; j < trscdJsonArray.size(); j++) {
					JsonElement trscdElement = trscdJsonArray.get(j);
					
					// 업로드가 완료된 미디어만 View에 출력하도록 한다.
					String trscdState = trscdElement.getAsJsonObject().get("state").getAsString();
					
					if (trscdState.equals("cmplt")) {
						Integer jobProfileId = trscdElement.getAsJsonObject().get("job_profile_id").getAsInt();
						
						if (jobProfileId.equals(OMSConfig.getJobProfileId())) {

							//재생시간
							long duration = trscdElement.getAsJsonObject().get("duration").getAsLong();
							map.put("duration", DateHelper.getHourString(duration) + ":" + DateHelper.getMinuteString(duration) + ":" + DateHelper.getSecondString(duration));

							// 컨텐츠 파일사이즈차례
							long file_size = trscdElement.getAsJsonObject().get("file_size").getAsLong();
							map.put("file_size", UnitUtils.humanReadableByteCount(file_size, false));

							// 미디어 등록 일자
							int reg_date = trscdElement.getAsJsonObject().get("reg_date").getAsInt();
							map.put("reg_date", DateUtils.TimestamptToString(reg_date));

							// 미디어 ID
							int content_id = trscdElement.getAsJsonObject().get("content_id").getAsInt();
							map.put("content_id", content_id);

							// 섬네일 ID
							int thumbnailMediaId = element.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray().get(1).getAsJsonObject().get("content_id").getAsInt();
							omsConnector.clear();
							omsResponder = omsConnector.RequestPulbishDownloadContent(thumbnailMediaId);
							String thumb_url = omsResponder.getRootDataElement().getAsJsonObject().get("url").getAsString();
							map.put("thumb_url", thumb_url);
							result.add(map);
							break;
						}
					}
				}
			}
		}
		return result;
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
				int content_id = jsonElement.getAsJsonObject().get("content_id").getAsInt();
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
	
	// 검색 페이지 리스트 항목 추출 옵션으로 다양한 검색을 할 수 있다.
	private List<Object> getList(List<String> trscdList, boolean isAjaxCall) {
		List<Object> content = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < trscdList.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			omsConnector.clear();
			// RequestContentList args: String media_type, String file_type, String state, String search_type, String search, Integer search_start_date, Integer search_end_date, Integer page, Integer page_size, String sort, String order, boolean with_extra	
			omsResponder = omsConnector.RequestContentList("video", "orign", null, "content_id", trscdList.get(i), null, null, null, null, "reg_date", null, true, true);
			JsonElement resultElement = omsResponder.getRootDataElement();
			JsonArray contentJsonArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
			for (int j = 0; j < contentJsonArray.getAsJsonArray().size(); j++) {
				JsonObject jsonElement = contentJsonArray.get(j).getAsJsonObject();
				int content_id = jsonElement.getAsJsonObject().get("content_id").getAsInt();
				String title = jsonElement.getAsJsonObject().get("title").getAsString();
				String encodeTitleName = null;
				//한글로 된 파일 이름은 정상적으로 출력되지 않아서 인코딩을 한다.
				if (isAjaxCall == true) {
					try {
						encodeTitleName = URLEncoder.encode(title, "UTF-8");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
				}
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
				map.put("title", encodeTitleName);
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
				for (JsonElement jsonElement : contentJsonArray) {
					String upper_content_id = jsonElement.getAsJsonObject().get("upper_content_id").getAsString();
					result.add(upper_content_id);
				}
			}
		}
		return result;
	}
	
	private int getThumbNailListCount() {
		omsConnector.clear();
		omsResponder = omsConnector.RequestContentList("video", null, null, null, null, null, null, null, null, "reg_date", null, true, false);
		JsonElement resultElement = omsResponder.getRootDataElement();
		return resultElement.getAsJsonObject().get("total_count").getAsInt();
	}
}

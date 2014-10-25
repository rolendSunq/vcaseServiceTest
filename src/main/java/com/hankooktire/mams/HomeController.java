package com.hankooktire.mams;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.airensoft.skovp.utils.common.UnitUtils;
import com.airensoft.skovp.utils.ovpconnector.OMSConfig;
import com.airensoft.skovp.utils.ovpconnector.OMSConnector;
import com.airensoft.skovp.utils.ovpconnector.OMSConnectorResponse;
import com.airensoft.skovp.utils.time.DateHelper;
import com.airensoft.skovp.utils.time.DateUtils;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	OMSConnectorResponse omsResponder;
	@Autowired
	OMSConnector omsConnector;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mamHome(Model model) {
		List<Object> result = new ArrayList<Object>();
		Map<String, Object> oneStreamPlay = new HashMap<String, Object>();
		int objectCount = 0;
		
		// RequestContentList args: String media_type, String file_type, String state, String search_type, String search, Integer search_start_date, Integer search_end_date, Integer page, Integer page_size, String sort, String order, boolean with_extra	
		omsResponder = omsConnector.RequestContentList("video", null, null, null, null, null, null, null, null, "reg_date", null, true);
		JsonElement resultElement = omsResponder.getRootDataElement();
		JsonArray contentJsonArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
		for (int i = 0; i < contentJsonArray.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			JsonElement element = contentJsonArray.get(i);

			// 업로드 완료된 미디어
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
							map.put("mod_date", DateUtils.TimestamptToString(reg_date));

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
		String streamingUrl = getStreamPlayUrl((Integer)oneStreamPlay.get("content_id"), "nothing", false);
		
		model.addAttribute("list", result);
		model.addAttribute("streamingUrl", streamingUrl);
		model.addAttribute("oneStreamPlay", oneStreamPlay);
		model.addAttribute("player_id", OMSConfig.getPlayerId());

		return "main";
	}

	@RequestMapping(value = "content/player/{content_id}")
	@ResponseBody
	public String getContentStringUrl(@PathVariable("content_id") int content_id) {
		return getStreamPlayUrl(content_id, "streaming_url", true);
	}
	
	@RequestMapping(value = "contentInfo")
	//@ResponseBody
	public void getFileInfo(@RequestParam("contentId") int contentId) {
		System.out.println(getInfo(contentId));
	}
	
	private String getStreamPlayUrl(int contentId, String variableUrlName, boolean isToJson) {
		omsConnector.clear();
		Map<String, String> map = new HashMap<String, String>();
		// 재생할 미디어 정보를 가져온다.
		omsResponder = omsConnector.RequestPulbishStreamingContent(contentId, 5, null, null, "rtmp", false);
		String playStreamingUrl = omsResponder.getRootDataElement().getAsJsonObject().get("url").getAsString();
		map.put(variableUrlName, playStreamingUrl);
		
		return (isToJson == true ) ? new Gson().toJson(map) : playStreamingUrl;
	}
	
	private String getInfo(int contentId) {
		omsConnector.clear();
		omsResponder = omsConnector.requestPlayerInfo(contentId, false, true);
		Gson gson = new Gson();
		gson.toJson(omsResponder);
		
		return gson.toString();
	}
	
}

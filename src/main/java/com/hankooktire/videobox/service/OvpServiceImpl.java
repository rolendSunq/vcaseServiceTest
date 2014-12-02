package com.hankooktire.videobox.service;

import java.io.File;
import java.io.IOException;
import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.airensoft.skovp.utils.ovpconnector.OMSConnector;
import com.airensoft.skovp.utils.ovpconnector.OMSConnectorResponse;
import com.airensoft.skovp.utils.time.DateUtils;
import com.airensoft.skovp.vo.FileVO;
import com.airensoft.skovp.vo.MovieContentVO;
import com.airensoft.skovp.vo.PlayListCountVO;
import com.airensoft.skovp.vo.ViewCountStatisticsVO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

@Service("ovpV2Service")
public class OvpServiceImpl implements OvpService {
	
	@Autowired
	OMSConnectorResponse omsResponder;
	@Autowired
	OMSConnector omsConnector;
	
	@Override
	public void popularList(Model model, int displayCount) {
		omsResponder = omsConnector.requestPopularContentList(0, 0, 0, displayCount, true, true);
		List<MovieContentVO> popularList = mappingContentData(omsResponder);
		model.addAttribute("popularList", popularList);
	}

	@Override
	public String getThumbNailUrl(int contentId) {
		omsConnector.clear();
		omsResponder = omsConnector.RequestPulbishDownloadContent(contentId);
		return omsResponder.getRootDataElement().getAsJsonObject().get("url").getAsString();
	}

	@Override
	public int searchMovie(String searchWord, Model model, String sort) {
		omsConnector.clear();
		omsResponder = omsConnector.RequestContentList("video", "origin", "cmplit", "title", searchWord, 0, 0, 0, 20, sort, "asc", true, true);
		int count = omsResponder.getRootDataElement().getAsJsonObject().get("total_count").getAsInt();
		List<MovieContentVO> searchResult = mappingContentData(omsResponder); 
		model.addAttribute("totalCnt", count);
		model.addAttribute("searchResult", searchResult);
		
		return count;
	}
	

	@Override
	public List<String> getOriginList(String[] trscdList) {
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

	@Override
	public List<MovieContentVO> getHistoryList(List<String> orginList) {
		List<MovieContentVO> content = new ArrayList<MovieContentVO>();
		for (int i = orginList.size() - 1; -1 < i; i--) {
			omsConnector.clear();
			// RequestContentList args: String media_type, String file_type, String state, String search_type, String search, Integer search_start_date, Integer search_end_date, Integer page, Integer page_size, String sort, String order, boolean with_extra	
			omsResponder = omsConnector.RequestContentList("video", "orign", null, "content_id", orginList.get(i), null, null, null, null, "reg_date", null, true, true);
			JsonElement resultElement = omsResponder.getRootDataElement();
			JsonArray contentJsonArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
			for (JsonElement jsonElement : contentJsonArray) {
				MovieContentVO movieContentVO = new Gson().fromJson(jsonElement, MovieContentVO.class);
				int thumbnailMediaId = jsonElement.getAsJsonObject().get("extra").getAsJsonObject().getAsJsonObject().get("thumbnails").getAsJsonArray().get(1).getAsJsonObject().get("content_id").getAsInt();
				omsConnector.clear();
				omsResponder = omsConnector.RequestPulbishDownloadContent(thumbnailMediaId);
				movieContentVO.setThumb_url(omsResponder.getRootDataElement().getAsJsonObject().get("url").getAsString());
				JsonObject staticObject = jsonElement.getAsJsonObject().get("static_url").getAsJsonObject();
				movieContentVO.setDownload_url(staticObject.getAsJsonObject().get("download_url").getAsString());
				omsConnector.clear();
				omsResponder = omsConnector.RequestPulbishStreamingContent(movieContentVO.getContent_id(), 0, 0, 0, "rtmp", false);
				movieContentVO.setStreaming_url(omsResponder.getRootDataElement().getAsJsonObject().get("url").getAsString());
				content.add(movieContentVO);
			}
		}
		return content;
	}

	@Override
	public String contentFileUpload(FileVO fileVO) throws IllegalStateException, IOException {
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		sb.append("catagory:" + fileVO.getCategory() + ",");
		sb.append("year:" + fileVO.getYear() + ",");
		sb.append("type:" + fileVO.getType() + ",");
		sb.append("region:" + fileVO.getRegion() + ",");
		sb.append("official:" + fileVO.getOfficial());
		sb.append("]");
		omsResponder = omsConnector.requestFileUpload(multipartToFile(fileVO.getFile()), 
				null, fileVO.getDescription(), fileVO.getTitle(), "1300000203", sb.toString());
		return omsResponder.toString();
	}
	
	@Override
	public void setContentGroup(String name) {
		omsResponder = omsConnector.requestSetPlayList(null, name, null, true);
		System.out.println(omsResponder.toString());
	}
	
	@Override
	public void getAllContentList(Model model) {
		omsResponder = omsConnector.RequestContentList("video", null, null, null, null, null, null, null, null, "reg_date", null, true, true);
		JsonElement resultElement = omsResponder.getRootDataElement();
		JsonArray contentJsonArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
		for (JsonElement jsonElement : contentJsonArray) {
			// 업로드가 완료된 미디어만 View에 출력하도록 한다.
			String state = jsonElement.getAsJsonObject().get("state").getAsString();
			if (state.equals("cmplt")) {
				MovieContentVO movieContentVO = new Gson().fromJson(jsonElement, MovieContentVO.class);
				JsonObject staticObject = jsonElement.getAsJsonObject().get("static_url").getAsJsonObject();
				movieContentVO.setDownload_url(staticObject.getAsJsonObject().get("download_url").getAsString());
				// 섬네일 ID
				/*
				int thumbnailMediaId = element.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray().get(1).getAsJsonObject().get("content_id").getAsInt();
				omsConnector.clear();
				omsResponder = omsConnector.RequestPulbishDownloadContent(thumbnailMediaId);
				String thumb_url = omsResponder.getRootDataElement().getAsJsonObject().get("url").getAsString();
				map.put("thumb_url", thumb_url);

				// streaming Url : streaming_url에 사용됨 (with_static_url) 인자에 true값을 넣어야 데이터가 생성
				JsonObject staticUrlObject = jsonElement.getAsJsonObject().get("static_url").getAsJsonObject();
				JsonArray streamingArray = staticUrlObject.getAsJsonObject().get("streaming").getAsJsonArray();
				String streamingUrl = streamingArray.get(0).getAsJsonObject().get("url").getAsString();
				map.put("streamingUrl", streamingUrl);
				result.add(map);
				
				if (objectCount == 0) {
					oneStreamPlay.putAll(map);
				}
				
				objectCount++;
				
				break;
				ovpService.popularList(model);
				String streamingUrl = getStreamPlayUrl((Integer)oneStreamPlay.get("content_id"));
				
				model.addAttribute("list", result);
				model.addAttribute("streamingUrl", streamingUrl);
				model.addAttribute("oneStreamPlay", oneStreamPlay);
				model.addAttribute("player_id", OMSConfig.getPlayerId());
		*/
			}
		}
	}
	
	// 콘텐트 재생 횟수 통계
	@Override
	public List<ViewCountStatisticsVO> getViewCountContent(int page) {
		List<ViewCountStatisticsVO> resultList = new ArrayList<ViewCountStatisticsVO>();
		omsResponder = omsConnector.getOvpViewCountStatistics(null, "all", "windowsnt", "ovfp", "all", DateUtils.getMonthAgoDate(), DateUtils.getMonthDate(), page);
		JsonElement resultElement = omsResponder.getRootDataElement();
		JsonArray contentJsonArray = resultElement.getAsJsonObject().get("view").getAsJsonArray();
		for (JsonElement jsonElement : contentJsonArray) {
			ViewCountStatisticsVO viewCountStatisticsVO = new Gson().fromJson(jsonElement, ViewCountStatisticsVO.class);
			JsonObject content_infoElement = jsonElement.getAsJsonObject().get("content_info").getAsJsonObject();
			viewCountStatisticsVO.setContent_title(content_infoElement.get("content_title").getAsString());
			viewCountStatisticsVO.setContent_id(content_infoElement.get("content_id").getAsString());
			System.out.println(viewCountStatisticsVO);
			resultList.add(viewCountStatisticsVO);
		}
		return resultList;
	}
	
	// playlist 내의 콘텐트 수 조회
	@Override
	public List<PlayListCountVO> getCountPlayListForContent() {
		List<PlayListCountVO> list = new ArrayList<PlayListCountVO>();
		omsResponder = omsConnector.requestContentForPlayList();
		JsonElement resultElement = omsResponder.getRootDataElement();
		JsonArray jsonArray = resultElement.getAsJsonObject().get("content_count").getAsJsonArray();
		for (JsonElement jsonElement : jsonArray) {
			PlayListCountVO playListCountVO = new Gson().fromJson(jsonElement, PlayListCountVO.class);
			System.out.println(playListCountVO);
			list.add(playListCountVO);
		}
		return list;
	}
	
	// 개별 플레이리스트 목록에 컨텐트를 가져온다.
	@Override
	public List<MovieContentVO> getPlayListForContent(String playlist_id, String searchType, String search, Integer pageNum, Model model) {
		List<MovieContentVO> playlistContentList = new ArrayList<MovieContentVO>();
		omsResponder = omsConnector.requestGetPlayListToContent(playlist_id, "video", "cmplt", searchType, search, null, null, pageNum, 20, "reg_date", "desc", true, true);
		JsonElement jsonElement = omsResponder.getRootDataElement();
		if (jsonElement != null) {
			JsonArray contentJsonArray = jsonElement.getAsJsonObject().get("content").getAsJsonArray();
			int totalCnt = jsonElement.getAsJsonObject().get("total_count").getAsInt();
			for (JsonElement contentElement : contentJsonArray) {
				MovieContentVO movieContentVO = new Gson().fromJson(contentElement, MovieContentVO.class);
				JsonArray thumbNailArray = contentElement.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
				for (JsonElement thumbElement : thumbNailArray) {
					boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
					if (isStill) {
						JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
						movieContentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
					}
				}
				System.out.println(movieContentVO);
				playlistContentList.add(movieContentVO);
			}
			System.out.println("total_count: " + totalCnt);
			model.addAttribute("totalCnt", totalCnt);
		}
		return playlistContentList;
	}
	
	// 해당 카데코리 리스트로 이동한다.
	@Override
	public void goCategoryList(String[] historyList, String playlist_id, int pageNum, String sort, Model model) {
		List<MovieContentVO> hisList = new ArrayList<MovieContentVO>();
		for(int i = historyList.length; i < historyList.length; i--) {
			omsResponder = omsConnector.RequestContentList("video", "orign", "cmplt", "content_id", historyList[i], null, null, pageNum, 20, sort, "desc", true, true);
			JsonElement jsonElement = omsResponder.getRootDataElement();
			JsonArray jsonHistoryArray = jsonElement.getAsJsonObject().get("content").getAsJsonArray();
			for (JsonElement resultContent : jsonHistoryArray) {
				MovieContentVO movieContentVO = new Gson().fromJson(resultContent, MovieContentVO.class);
				JsonArray thumbNailArray = resultContent.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
				for (JsonElement thumbElement : thumbNailArray) {
					boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
					if (isStill) {
						JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
						movieContentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
					}
				}
				hisList.add(movieContentVO);
			}
		}
		model.addAttribute("historyList", hisList);
		
	}
	
	// multipart file을 file type 으로 변환
	private File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException {
        File convFile = new File(multipart.getOriginalFilename());
        multipart.transferTo(convFile);
        return convFile;
	}

	private List<MovieContentVO> mappingContentData(OMSConnectorResponse omsResp) {
		List<MovieContentVO> contentList = new ArrayList<MovieContentVO>();
		JsonElement resultElement = omsResp.getRootDataElement();
		JsonArray contentArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
		for (JsonElement contentObject : contentArray) {
			MovieContentVO contentVO = new Gson().fromJson(contentObject, MovieContentVO.class);
			JsonArray thumbNailArray = contentObject.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
			for (JsonElement jsonElement : thumbNailArray) {
				boolean isStill = jsonElement.getAsJsonObject().get("is_still").getAsBoolean();
				if (isStill) {
					JsonObject staticUrl = jsonElement.getAsJsonObject().get("static_url").getAsJsonObject();
					contentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
				}
			}
			contentList.add(contentVO);
		}
		return contentList;
	}



}

package com.hankooktire.videobox.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.airensoft.skovp.utils.ovpconnector.OMSConfig;
import com.airensoft.skovp.utils.ovpconnector.OMSConnector;
import com.airensoft.skovp.utils.ovpconnector.OMSConnectorResponse;
import com.airensoft.skovp.utils.time.DateUtils;
import com.airensoft.skovp.vo.CategoryPageVO;
import com.airensoft.skovp.vo.DownloadFileVO;
import com.airensoft.skovp.vo.FileVO;
import com.airensoft.skovp.vo.MovieContentVO;
import com.airensoft.skovp.vo.PlayListCountVO;
import com.airensoft.skovp.vo.TagInfoVO;
import com.airensoft.skovp.vo.ThumbUrlVO;
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
	public List<MovieContentVO> popularList(int displayCount) {
		List<MovieContentVO> contentList = new ArrayList<MovieContentVO>();
		omsResponder = omsConnector.requestPopularContentList(0, 0, 0, displayCount, true, true);
		JsonElement resultElement = omsResponder.getRootDataElement();
		JsonArray contentArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
		for (JsonElement contentObject : contentArray) {
			JsonArray playlistIDSArray = contentObject.getAsJsonObject().get("playlist_ids").getAsJsonArray();
			if (playlistIDSArray.size() == 1) {
				continue;
			}
			MovieContentVO movieContentVO = new Gson().fromJson(contentObject, MovieContentVO.class);
			JsonArray tagsArray = contentObject.getAsJsonObject().get("tags").getAsJsonArray();
			String[] tagsArr = new Gson().fromJson(tagsArray, String[].class);
			TagInfoVO tags = new TagInfoVO();
			for (int i = 0; i < tagsArr.length; i++) {
				if (i == 0)	tags.setCategory(tagsArr[i].replace("[", ""));
				if (i == 1)	tags.setYear(tagsArr[i]);
				if (i == 2)	tags.setType(tagsArr[i]);
				if (i == 3)	tags.setRegion(tagsArr[i]);
				if (i == 4)	tags.setOfficial(tagsArr[i].replace("]", ""));
			}
			movieContentVO.setTag(tags);
			JsonArray thumbNailArray = contentObject.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
			for (JsonElement jsonElement : thumbNailArray) {
				boolean isStill = jsonElement.getAsJsonObject().get("is_still").getAsBoolean();
				if (isStill) {
					JsonObject staticUrl = jsonElement.getAsJsonObject().get("static_url").getAsJsonObject();
					movieContentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
				}
			}
			contentList.add(movieContentVO);
		}
		return contentList;
	}

	@Override
	public String getThumbNailUrl(int contentId) {
		omsConnector.clear();
		omsResponder = omsConnector.RequestPulbishDownloadContent(contentId);
		return omsResponder.getRootDataElement().getAsJsonObject().get("url").getAsString();
	}

	// 검색
	@Override
	public List<MovieContentVO> search(CategoryPageVO ctgVO) {
		List<MovieContentVO> contentList = new ArrayList<MovieContentVO>();
		omsResponder = omsConnector.RequestContentList("video", "origin", "cmplt", "title", ctgVO.getSearch(), 0, 0, ctgVO.getPageNum(), 20, ctgVO.getSort(), "desc", true, true);
		JsonElement resultElement = omsResponder.getRootDataElement();
		int count = omsResponder.getRootDataElement().getAsJsonObject().get("total_count").getAsInt();
		ctgVO.setTotalCount(count);
		JsonArray contentArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
		for (JsonElement contentObject : contentArray) {
			JsonArray playlistIdsArray = contentObject.getAsJsonObject().get("playlist_ids").getAsJsonArray();
			if (playlistIdsArray.size() == 1) {
				continue;
			}
			MovieContentVO movieContentVO = new Gson().fromJson(contentObject, MovieContentVO.class);
			JsonArray tagsArray = contentObject.getAsJsonObject().get("tags").getAsJsonArray();
			String[] tagsArr = new Gson().fromJson(tagsArray, String[].class);
			TagInfoVO tags = new TagInfoVO();
			for (int i = 0; i < tagsArr.length; i++) {
				if (i == 0)	tags.setCategory(tagsArr[i].replace("[", ""));
				if (i == 1)	tags.setYear(tagsArr[i]);
				if (i == 2)	tags.setType(tagsArr[i]);
				if (i == 3)	tags.setRegion(tagsArr[i]);
				if (i == 4)	tags.setOfficial(tagsArr[i].replace("]", ""));
			}
			movieContentVO.setTag(tags);
			JsonArray thumbNailArray = contentObject.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
			for (JsonElement jsonElement : thumbNailArray) {
				boolean isStill = jsonElement.getAsJsonObject().get("is_still").getAsBoolean();
				if (isStill) {
					JsonObject staticUrl = jsonElement.getAsJsonObject().get("static_url").getAsJsonObject();
					movieContentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
				}
			}
			contentList.add(movieContentVO);
		}
		return contentList;
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

	// 히스토리의 컨텐트 정보를 가져온다.
	@Override
	public List<MovieContentVO> getHistoryList(String[] historyList) {
		if (historyList == null) {
			MovieContentVO movieContentVO = new MovieContentVO();
			List<MovieContentVO> list = new ArrayList<MovieContentVO>();
			list.add(movieContentVO);
			return list;
		}
		List<MovieContentVO> list = new ArrayList<MovieContentVO>();
		for (int i = historyList.length - 1; -1 < i; i--) {
			MovieContentVO movieContentVO = null;
			omsResponder = omsConnector.RequestContentList("video", "orign", "cmplt", "content_id", historyList[i], null, null, 0, 1, "content_id", "desc", true, true);
			JsonElement resultElement = omsResponder.getRootDataElement();
			JsonArray contentJsonArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
			for (JsonElement jsonElement : contentJsonArray) {
				JsonArray playlistIdsArray = jsonElement.getAsJsonObject().get("playlist_ids").getAsJsonArray();
				if (playlistIdsArray.size() == 1) {
					continue;
				}
				movieContentVO = new Gson().fromJson(jsonElement, MovieContentVO.class);
				JsonArray tagsArray = jsonElement.getAsJsonObject().get("tags").getAsJsonArray();
				String[] tagsArr = new Gson().fromJson(tagsArray, String[].class);
				TagInfoVO tags = new TagInfoVO();
				for (int j = 0; j < tagsArr.length; j++) {
					if (j == 0)	tags.setCategory(tagsArr[j].replace("[", ""));
					if (j == 1)	tags.setYear(tagsArr[j]);
					if (j == 2)	tags.setType(tagsArr[j]);
					if (j == 3)	tags.setRegion(tagsArr[j]);
					if (j == 4)	tags.setOfficial(tagsArr[j].replace("]", ""));
				}
				movieContentVO.setTag(tags);
				JsonObject staticObject = jsonElement.getAsJsonObject().get("static_url").getAsJsonObject();
				movieContentVO.setDownload_url(staticObject.getAsJsonObject().get("download_url").getAsString());
				JsonArray streamingArray = staticObject.getAsJsonObject().get("streaming").getAsJsonArray();
				for (JsonElement streamingElement : streamingArray) {
					String protocol = streamingElement.getAsJsonObject().get("protocol").getAsString();
					if (protocol.equals("rtmp")) {
						String streamingUrl = streamingElement.getAsJsonObject().get("url").getAsString();
						movieContentVO.setStreaming_url(streamingUrl);
					}
				}
				JsonArray thumbNailArray = jsonElement.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
				for (JsonElement thumbElement : thumbNailArray) {
					boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
					if (isStill) {
						JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
						movieContentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
					}
				}
				list.add(movieContentVO);
			}
		}
		return list;
	}

	// Admin playlist(contentGroup)에 파일을 업로드 한다.
	@Override
	public String contentFileUpload(FileVO fileVO) throws IllegalStateException, IOException {
		StringBuffer sb = new StringBuffer();
		sb.append(fileVO.getCustom_id() + DateUtils.getMontDateTime());
		fileVO.setCustom_id(sb.toString());
		omsResponder = omsConnector.requestFileUpload(multipartToFile(fileVO.getFile()), 
				null, fileVO.getDescription(), fileVO.getTitle(), "1300000203", sb.toString());
		String message = omsResponder.getRootObject().getAsJsonObject().get("message").getAsString();
		System.out.println("result+++++++++> " + message);
		String content_id = omsResponder.getRootDataElement().getAsJsonObject().get("content_id").getAsString();
		System.out.println("content_id+++++++++> " + content_id);
		fileVO.setContent_id(content_id);
		if (message.equals("성공")) {
			List<String> tags = new ArrayList<String>();
			tags.add(fileVO.getCategory());
			tags.add(fileVO.getYear());
			tags.add(fileVO.getType());
			tags.add(fileVO.getRegion());
			tags.add(fileVO.getOfficial());
			omsResponder = omsConnector.requestMetaInfoEdit(content_id, tags, fileVO.getCustom_id(), null, null, null, null, null, null, null);
			String uploadMessage = omsResponder.getRootObject().getAsJsonObject().get("message").getAsString();
			return uploadMessage;
		} 
		return message;
	}
	
	@Override
	public void setContentGroup(String name) {
		omsResponder = omsConnector.requestSetPlayList(null, name, null, true);
	}
	
	@Override
	public void getAllContentList(Model model) {
		List<MovieContentVO> list = new ArrayList<MovieContentVO>();
		omsResponder = omsConnector.RequestContentList("video", "origin", "cmplit", null, null, null, null, null, null, "reg_date", null, true, true);
		JsonElement resultElement = omsResponder.getRootDataElement();
		JsonArray contentJsonArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
		for (JsonElement jsonElement : contentJsonArray) {
			JsonArray playlistIDSArray = jsonElement.getAsJsonObject().get("playlist_ids").getAsJsonArray();
			if (playlistIDSArray.size() == 1) {
				continue;
			}
			MovieContentVO movieContentVO = new Gson().fromJson(jsonElement, MovieContentVO.class);
			JsonObject staticObject = jsonElement.getAsJsonObject().get("static_url").getAsJsonObject();
			movieContentVO.setDownload_url(staticObject.getAsJsonObject().get("download_url").getAsString());
			JsonArray tagsArray = jsonElement.getAsJsonObject().get("tags").getAsJsonArray();
			String[] tagsArr = new Gson().fromJson(tagsArray, String[].class);
			TagInfoVO tags = new TagInfoVO();
			for (int i = 0; i < tagsArr.length; i++) {
				if (i == 0)	tags.setCategory(tagsArr[i].replace("[", ""));
				if (i == 1)	tags.setYear(tagsArr[i]);
				if (i == 2)	tags.setType(tagsArr[i]);
				if (i == 3)	tags.setRegion(tagsArr[i]);
				if (i == 4)	tags.setOfficial(tagsArr[i].replace("]", ""));
			}
			movieContentVO.setTag(tags);
			JsonArray streamingArray = staticObject.getAsJsonObject().get("streaming").getAsJsonArray();
			for (JsonElement streamingElement : streamingArray) {
				String protocol = streamingElement.getAsJsonObject().get("protocol").getAsString();
				if (protocol.equals("rtmp")) {
					String streamingUrl = streamingElement.getAsJsonObject().get("url").getAsString();
					movieContentVO.setStreaming_url(streamingUrl);
				}
			}
			JsonArray thumbNailArray = jsonElement.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
			for (JsonElement thumbElement : thumbNailArray) {
				boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
				if (isStill) {
					JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
					movieContentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
				}
			}
			
			list.add(movieContentVO);
		}
		model.addAttribute("list", list);
		model.addAttribute("player_id", OMSConfig.getPlayerId());
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
			list.add(playListCountVO);
		}
		return list;
	}
	
	// 개별 플레이리스트 목록에 컨텐트들을 가져온다.
	@Override
	public List<MovieContentVO> getPlayListForContent(String playlist_id, String searchType, String search, String sort, Integer pageNum, Model model) {
		List<MovieContentVO> playlistContentList = new ArrayList<MovieContentVO>();
		List<DownloadFileVO> downsFileList = new ArrayList<DownloadFileVO>();
		omsResponder = omsConnector.requestGetPlayListToContent(playlist_id, "video", "cmplt", searchType, search, null, null, pageNum, 20, sort, "desc", true, true);
		JsonElement jsonElement = omsResponder.getRootDataElement();
		if (jsonElement != null) {
			JsonArray contentJsonArray = jsonElement.getAsJsonObject().get("content").getAsJsonArray();
			int totalCnt = jsonElement.getAsJsonObject().get("total_count").getAsInt();
			for (JsonElement contentElement : contentJsonArray) {
				List<ThumbUrlVO> thumbUrl = new ArrayList<ThumbUrlVO>();
				MovieContentVO movieContentVO = new Gson().fromJson(contentElement, MovieContentVO.class);
				JsonArray tagsArray = contentElement.getAsJsonObject().get("tags").getAsJsonArray();
				String[] tagsArr = new Gson().fromJson(tagsArray, String[].class);
				TagInfoVO tags = new TagInfoVO();
				for (int i = 0; i < tagsArr.length; i++) {
					if (i == 0)	tags.setCategory(tagsArr[i].replace("[", ""));
					if (i == 1)	tags.setYear(tagsArr[i]);
					if (i == 2)	tags.setType(tagsArr[i]);
					if (i == 3)	tags.setRegion(tagsArr[i]);
					if (i == 4)	tags.setOfficial(tagsArr[i].replace("]", ""));
				}
				movieContentVO.setTag(tags);
				JsonElement staticElement = contentElement.getAsJsonObject().get("static_url").getAsJsonObject();
				String downloadUrl = staticElement.getAsJsonObject().get("download_url").getAsString();
				movieContentVO.setDownload_url(downloadUrl);
				JsonArray streamingArray = staticElement.getAsJsonObject().get("streaming").getAsJsonArray();
				for (JsonElement streamingElement : streamingArray) {
					String protocol = streamingElement.getAsJsonObject().get("protocol").getAsString();
					if (protocol.equals("rtmp")) {
						String streamingUrl = streamingElement.getAsJsonObject().get("url").getAsString();
						movieContentVO.setStreaming_url(streamingUrl);
					}
				}
				
				JsonArray transcodesListArray = contentElement.getAsJsonObject().get("extra").getAsJsonObject().get("transcodes").getAsJsonArray();
				for (JsonElement transcodesElement : transcodesListArray) {
					DownloadFileVO downloadFileVO = new Gson().fromJson(transcodesElement, DownloadFileVO.class);
					JsonElement downStaticElement = transcodesElement.getAsJsonObject().get("static_url").getAsJsonObject();
					String transDownloadUrl = downStaticElement.getAsJsonObject().get("download_url").getAsString();
					if (transDownloadUrl != null) {
						downloadFileVO.setDownload_url(transDownloadUrl);
						downsFileList.add(downloadFileVO);
					}
				}
				movieContentVO.setDownloadFile(downsFileList);
				
				
				JsonArray thumbNailArray = contentElement.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
				for (JsonElement thumbElement : thumbNailArray) {
					boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
					if (isStill) {
						JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
						movieContentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
					} else {
						JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
						String thumbUrlValue = staticUrl.getAsJsonObject().get("download_url").getAsString();
						ThumbUrlVO thumbUrlVO = new ThumbUrlVO();
						thumbUrlVO.setDownload_url(thumbUrlValue);
						thumbUrl.add(thumbUrlVO);
					}
				}
				movieContentVO.setStaticThumb(thumbUrl);
				playlistContentList.add(movieContentVO);
			}
			
			model.addAttribute("totalCnt", totalCnt);
		} 
		return playlistContentList;
	}
	
	// 해당 카데코리 리스트로 이동한다.
	@Override
	public void goCategoryList(String content_id, int pageNum, String sort, Model model) {
		List<MovieContentVO> list = new ArrayList<MovieContentVO>();
			omsResponder = omsConnector.RequestContentList("video", "orign", "cmplt", "content_id", content_id, null, null, pageNum, 20, sort, "desc", true, true);
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
				list.add(movieContentVO);
			}
		model.addAttribute("list", list);
		
	}
	
	// playlist(content group) 콘텐트 목록으로 콘텐트를 삭제한다.
	@Override
	public String deleteContentList(String list) {
		omsResponder = omsConnector.requestDeleteContentList(list);
		JsonElement resultElement = omsResponder.getRootObject();
		return (resultElement == null) ? "삭제 실패!" : "삭제 성공";
	}
	
	// playlist에 콘텐트를 바인딩 한다.
	@Override
	public String contentBinding(String content_id, String category) {
		String[] playlistIdList = new String[] {"1300000253","1300000252","1300000251",
				"1300000245","1300000244","1300000243","1300000242","1300000241","1300000240",
				"1300000239","1300000238","1300000237","1300000236","1300000235","1300000234",
				"1300000233","1300000232","1300000231","1300000230","1300000229","1300000228",
				"1300000227","1300000226","1300000225","1300000224","1300000223","1300000222",
				"1300000221","1300000220","1300000219"};
		String[] playlistNameList = new String[] {"Company","Company (RAW)","Culture","Culture (RAW)",
				"TV Footages","TV Footages (RAW)","TVC","TVC (RAW)","Campaign","Campaign (RAW)",
				"Sports Marketing","Sports Marketing (RAW)","Hankook Tire","Hankook Tire (RAW)",
				"Other Brand","Other Brand (RAW)","Technology","Technology (RAW)","Europe",
				"Europe (RAW)","Other Motorsports","Other Motorsports (RAW)","Exhibition","Exhibition (RAW)",
				"Promotion","Promotion (RAW)","Other Event","Other Event (RAW)","Other","Other (RAW)"};
		Map<String, String> playList = new HashMap<String, String>();
		List<String> contentIDS = new ArrayList<String>();
		contentIDS.add(content_id);
		for (int i = 0; i < playlistIdList.length; i++) {
			playList.put(playlistNameList[i], playlistIdList[i]);
		}
		String destinationPlaylist = playList.get(category);
		omsResponder = omsConnector.requestPlaylistContentBinding(contentIDS, destinationPlaylist);
		return omsResponder.toString();
	}
	
	// playlist 검색
	@Override
	public void searchPlaylistLIST(List<PlayListCountVO> playlist) {
		for (int i = 0; i < playlist.size(); i++) {
			PlayListCountVO pvo = playlist.get(i);
			omsResponder = omsConnector.requestSearchPlaylistLIST("playlist_id", pvo.getPlaylist_id(), null, null, 0, playlist.size()+1, null, null);
			JsonElement jsonElement = omsResponder.getRootDataElement();
			System.out.println(":::playlist List:::" + jsonElement.toString());
		}
	}
	
	// 해당 playlist의 컨텐트를 가져온다.
	@Override
	public List<MovieContentVO> goPlaylistContentList(CategoryPageVO ctgVO) {
		List<MovieContentVO> playlistContentList = new ArrayList<MovieContentVO>();
		omsResponder = omsConnector.requestGetPlayListToContent(ctgVO.getPlaylist_id(), "video", "cmplt", "title", ctgVO.getSearch(), null, null, ctgVO.getPageNum(), 20, ctgVO.getSort(), "desc", true, true);
		JsonElement jsonElement = omsResponder.getRootDataElement();
		if (jsonElement != null) {
			JsonArray contentJsonArray = jsonElement.getAsJsonObject().get("content").getAsJsonArray();
			int totalCnt = jsonElement.getAsJsonObject().get("total_count").getAsInt();
			ctgVO.setTotalCount(totalCnt);
			for (JsonElement contentElement : contentJsonArray) {
				MovieContentVO movieContentVO = new Gson().fromJson(contentElement, MovieContentVO.class);
				JsonElement staticElement = contentElement.getAsJsonObject().get("static_url").getAsJsonObject();
				String downloadUrl = staticElement.getAsJsonObject().get("download_url").getAsString();
				movieContentVO.setDownload_url(downloadUrl);
				JsonArray tagsArray = contentElement.getAsJsonObject().get("tags").getAsJsonArray();
				String[] tagsArr = new Gson().fromJson(tagsArray, String[].class);
				TagInfoVO tags = new TagInfoVO();
				for (int i = 0; i < tagsArr.length; i++) {
					if (i == 0)	tags.setCategory(tagsArr[i].replace("[", ""));
					if (i == 1)	tags.setYear(tagsArr[i]);
					if (i == 2)	tags.setType(tagsArr[i]);
					if (i == 3)	tags.setRegion(tagsArr[i]);
					if (i == 4)	tags.setOfficial(tagsArr[i].replace("]", ""));
				}
				movieContentVO.setTag(tags);
				JsonArray streamingArray = staticElement.getAsJsonObject().get("streaming").getAsJsonArray();
				for (JsonElement streamingElement : streamingArray) {
					String protocol = streamingElement.getAsJsonObject().get("protocol").getAsString();
					if (protocol.equals("rtmp")) {
						String streamingUrl = streamingElement.getAsJsonObject().get("url").getAsString();
						movieContentVO.setStreaming_url(streamingUrl);
					}
				}
				JsonArray thumbNailArray = contentElement.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
				for (JsonElement thumbElement : thumbNailArray) {
					boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
					if (isStill) {
						JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
						movieContentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
					}
				}
				playlistContentList.add(movieContentVO);
			}
		}
		return playlistContentList;
	}
	
	// detail page에서 사용되는 컨텐츠 로딩과 동시에 플레이되는 컨텐트를 찾고
	// 슬라이드에 표시될 리스트를 얻는다.
	// playlist에 등록된 컨텐츠들을 얻는다.
	@Override
	public void serviceDetailPageToListPage(CategoryPageVO ctgVO, Model model) {
		List<DownloadFileVO> downloadFileList = new ArrayList<DownloadFileVO>();
		List<MovieContentVO> list = new ArrayList<MovieContentVO>();
		omsResponder = omsConnector.requestGetPlayListToContent(ctgVO.getPlaylist_id(), "video", "cmplt", "content_id", ctgVO.getContent_id(), null, null, 0, 1, "reg_date", "desc", true, true);
		JsonElement rootElement= omsResponder.getRootDataElement();
		JsonElement contentElement = rootElement.getAsJsonObject().get("content").getAsJsonArray().get(0);
		MovieContentVO movieContentVO = new Gson().fromJson(contentElement, MovieContentVO.class);
		JsonArray tagsArray = contentElement.getAsJsonObject().get("tags").getAsJsonArray();
		String[] tagsArr = new Gson().fromJson(tagsArray, String[].class);
		TagInfoVO tags = new TagInfoVO();
		for (int i = 0; i < tagsArr.length; i++) {
			if (i == 0)	tags.setCategory(tagsArr[i].replace("[", ""));
			if (i == 1)	tags.setYear(tagsArr[i]);
			if (i == 2)	tags.setType(tagsArr[i]);
			if (i == 3)	tags.setRegion(tagsArr[i]);
			if (i == 4)	tags.setOfficial(tagsArr[i].replace("]", ""));
		}
		movieContentVO.setTag(tags);
		JsonElement staticElement = contentElement.getAsJsonObject().get("static_url").getAsJsonObject();
		String downloadUrl = staticElement.getAsJsonObject().get("download_url").getAsString();
		movieContentVO.setDownload_url(downloadUrl);
		JsonArray streamingArray = staticElement.getAsJsonObject().get("streaming").getAsJsonArray();
		for (JsonElement streamingElement : streamingArray) {
			String protocol = streamingElement.getAsJsonObject().get("protocol").getAsString();
			if (protocol.equals("rtmp")) {
				String streamingUrl = streamingElement.getAsJsonObject().get("url").getAsString();
				movieContentVO.setStreaming_url(streamingUrl);
			}
		}
		JsonArray thumbNailArray = contentElement.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
		for (JsonElement thumbElement : thumbNailArray) {
			boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
			if (isStill) {
				JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
				movieContentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
			}
		}
		JsonArray transcodesArray = contentElement.getAsJsonObject().get("extra").getAsJsonObject().get("transcodes").getAsJsonArray();
		for (JsonElement transcodesElement : transcodesArray) {
			DownloadFileVO downloadFileVO = new Gson().fromJson(transcodesElement, DownloadFileVO.class);
			JsonElement downStaticElement = transcodesElement.getAsJsonObject().get("static_url").getAsJsonObject();
			String transDownloadUrl = downStaticElement.getAsJsonObject().get("download_url").getAsString();
			downloadFileVO.setDownload_url(transDownloadUrl);
			downloadFileList.add(downloadFileVO);
		}
		movieContentVO.setDownloadFile(downloadFileList);
		// 페이지 로딩 후 플레이될 컨텐츠 생산
		model.addAttribute("oneStreamPlay", movieContentVO);
		//////////////////////////////////////////////////////////////////////////////////////////////////
		omsResponder = omsConnector.requestGetPlayListToContent(ctgVO.getPlaylist_id(), "video", "cmplt", "title", null, null, null, 0, 20, "reg_date", "desc", true, true);
		JsonElement rootListElement= omsResponder.getRootDataElement();
		if (rootListElement != null) {
			JsonArray contentJsonArray = rootListElement.getAsJsonObject().get("content").getAsJsonArray();
			int totalCnt = rootListElement.getAsJsonObject().get("total_count").getAsInt();
			ctgVO.setTotalCount(totalCnt);
			for (JsonElement contentListElement : contentJsonArray) {
				MovieContentVO movieVO = new Gson().fromJson(contentListElement, MovieContentVO.class);
				JsonArray tagArray = contentElement.getAsJsonObject().get("tags").getAsJsonArray();
				String[] tagArr = new Gson().fromJson(tagArray, String[].class);
				TagInfoVO tagInfoVO = new TagInfoVO();
				for (int i = 0; i < tagArr.length; i++) {
					if (i == 0)	tagInfoVO.setCategory(tagArr[i].replace("[", ""));
					if (i == 1)	tagInfoVO.setYear(tagArr[i]);
					if (i == 2)	tagInfoVO.setType(tagArr[i]);
					if (i == 3)	tagInfoVO.setRegion(tagArr[i]);
					if (i == 4)	tagInfoVO.setOfficial(tagArr[i].replace("]", ""));
				}
				movieVO.setTag(tagInfoVO);
				JsonElement staticURLElement = contentListElement.getAsJsonObject().get("static_url").getAsJsonObject();
				String down_loadUrl = staticURLElement.getAsJsonObject().get("download_url").getAsString();
				movieVO.setDownload_url(down_loadUrl);
				JsonArray streamingsArray = staticURLElement.getAsJsonObject().get("streaming").getAsJsonArray();
				for (JsonElement streamingElement : streamingsArray) {
					String protocol = streamingElement.getAsJsonObject().get("protocol").getAsString();
					if (protocol.equals("rtmp")) {
						String streamingUrl = streamingElement.getAsJsonObject().get("url").getAsString();
						movieVO.setStreaming_url(streamingUrl);
					}
				}
				JsonArray thumbNailsArray = contentListElement.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
				for (JsonElement thumbElement : thumbNailsArray) {
					boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
					if (isStill) {
						JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
						movieVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
					} 
				}
				list.add(movieVO);
			}
			// 우측 겔러리 바 리스트 정보 
			model.addAttribute("list", list);
		}
	}
	
	// 조회수가 높은 컨텐츠 얻어온다.
	@Override
	public void servicePopularListPage(CategoryPageVO categoryPageVO, Model model) {
		List<DownloadFileVO> downloadFileList = new ArrayList<DownloadFileVO>();
		List<MovieContentVO> list = new ArrayList<MovieContentVO>();
		serviceViewCountASC(model);
		//List<DownloadFileVO> downsFileList = new ArrayList<DownloadFileVO>();
		omsResponder = omsConnector.RequestContentList("video", "orign", "cmplt", null, null, null, null, 0, 20, "view_count", "desc", true, true);
		JsonElement rootElement = omsResponder.getRootDataElement();
		JsonElement contentElement = rootElement.getAsJsonObject().get("content").getAsJsonArray().get(0);
		MovieContentVO movieContentVO = new Gson().fromJson(contentElement, MovieContentVO.class);
		JsonArray tagsArray = contentElement.getAsJsonObject().get("tags").getAsJsonArray();
		String[] tagsArr = new Gson().fromJson(tagsArray, String[].class);
		TagInfoVO tags = new TagInfoVO();
		for (int i = 0; i < tagsArr.length; i++) {
			if (i == 0)	tags.setCategory(tagsArr[i].replace("[", ""));
			if (i == 1)	tags.setYear(tagsArr[i]);
			if (i == 2)	tags.setType(tagsArr[i]);
			if (i == 3)	tags.setRegion(tagsArr[i]);
			if (i == 4)	tags.setOfficial(tagsArr[i].replace("]", ""));
		}
		movieContentVO.setTag(tags);
		JsonElement staticElement = contentElement.getAsJsonObject().get("static_url").getAsJsonObject();
		String downloadUrl = staticElement.getAsJsonObject().get("download_url").getAsString();
		movieContentVO.setDownload_url(downloadUrl);
		JsonArray streamingArray = staticElement.getAsJsonObject().get("streaming").getAsJsonArray();
		for (JsonElement streamingElement : streamingArray) {
			String protocol = streamingElement.getAsJsonObject().get("protocol").getAsString();
			if (protocol.equals("rtmp")) {
				String streamingUrl = streamingElement.getAsJsonObject().get("url").getAsString();
				movieContentVO.setStreaming_url(streamingUrl);
			}
		}
		JsonArray thumbNailArray = contentElement.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
		for (JsonElement thumbElement : thumbNailArray) {
			boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
			if (isStill) {
				JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
				movieContentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
			}
		}
		JsonArray transcodesArray = contentElement.getAsJsonObject().get("extra").getAsJsonObject().get("transcodes").getAsJsonArray();
		for (JsonElement transcodesElement : transcodesArray) {
			DownloadFileVO downloadFileVO = new Gson().fromJson(transcodesElement, DownloadFileVO.class);
			JsonElement downStaticElement = transcodesElement.getAsJsonObject().get("static_url").getAsJsonObject();
			String transDownloadUrl = downStaticElement.getAsJsonObject().get("download_url").getAsString();
			downloadFileVO.setDownload_url(transDownloadUrl);
			downloadFileList.add(downloadFileVO);
		}
		movieContentVO.setDownloadFile(downloadFileList);
		model.addAttribute("oneStreamPlay", movieContentVO);
		//////////////////////////////////////////////////////////////////////////////////////////////////
		omsResponder = omsConnector.requestGetPlayListToContent(categoryPageVO.getPlaylist_id(), "video", "cmplt", "title", null, null, null, 0, 1, "content_id", "desc", true, true);
		JsonElement rootListElement= omsResponder.getRootDataElement();
		if (rootListElement != null) {
			JsonArray contentJsonArray = rootListElement.getAsJsonObject().get("content").getAsJsonArray();
			int totalCnt = rootListElement.getAsJsonObject().get("total_count").getAsInt();
			categoryPageVO.setTotalCount(totalCnt);
			for (JsonElement contentListElement : contentJsonArray) {
				MovieContentVO movieVO = new Gson().fromJson(contentListElement, MovieContentVO.class);
				JsonElement staticURLElement = contentListElement.getAsJsonObject().get("static_url").getAsJsonObject();
				String down_loadUrl = staticURLElement.getAsJsonObject().get("download_url").getAsString();
				movieVO.setDownload_url(down_loadUrl);
				JsonArray streamingsArray = staticURLElement.getAsJsonObject().get("streaming").getAsJsonArray();
				for (JsonElement streamingElement : streamingsArray) {
					String protocol = streamingElement.getAsJsonObject().get("protocol").getAsString();
					if (protocol.equals("rtmp")) {
						String streamingUrl = streamingElement.getAsJsonObject().get("url").getAsString();
						movieVO.setStreaming_url(streamingUrl);
					}
				}
				JsonArray thumbNailsArray = contentListElement.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
				for (JsonElement thumbElement : thumbNailsArray) {
					boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
					if (isStill) {
						JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
						movieVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
					} 
				}
				list.add(movieVO);
			}
			model.addAttribute("pageInfo", categoryPageVO);
			model.addAttribute("list", list);
		}
	}
	
	// detail page에서 popular content를 보여준다.
	// 자동 플레이될 컨텐트를 가져온다.
	@Override
	public MovieContentVO serviceDetailPopular(String content_id) {
		MovieContentVO movieContentVO = null;
		List<DownloadFileVO> downsFileList = new ArrayList<DownloadFileVO>();
		omsResponder = omsConnector.RequestContentList("video", "origin", "cmplt", "content_id", content_id, null, null, 0, 1, "content_id", "desc", true, true);
		JsonElement resultElement = omsResponder.getRootDataElement();
		JsonArray contentJsonArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
		for (JsonElement jsonElement : contentJsonArray) {
			movieContentVO = new Gson().fromJson(jsonElement, MovieContentVO.class);
			JsonArray tagsArray = jsonElement.getAsJsonObject().get("tags").getAsJsonArray();
			String[] tagsArr = new Gson().fromJson(tagsArray, String[].class);
			TagInfoVO tags = new TagInfoVO();
			for (int i = 0; i < tagsArr.length; i++) {
				if (i == 0)	tags.setCategory(tagsArr[i].replace("[", ""));
				if (i == 1)	tags.setYear(tagsArr[i]);
				if (i == 2)	tags.setType(tagsArr[i]);
				if (i == 3)	tags.setRegion(tagsArr[i]);
				if (i == 4)	tags.setOfficial(tagsArr[i].replace("]", ""));
			}
			movieContentVO.setTag(tags);
			JsonObject staticObject = jsonElement.getAsJsonObject().get("static_url").getAsJsonObject();
			movieContentVO.setDownload_url(staticObject.getAsJsonObject().get("download_url").getAsString());
			JsonArray streamingArray = staticObject.getAsJsonObject().get("streaming").getAsJsonArray();
			for (JsonElement streamingElement : streamingArray) {
				String protocol = streamingElement.getAsJsonObject().get("protocol").getAsString();
				if (protocol.equals("rtmp")) {
					String streamingUrl = streamingElement.getAsJsonObject().get("url").getAsString();
					movieContentVO.setStreaming_url(streamingUrl);
				}
			}
			JsonArray thumbNailArray = jsonElement.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
			for (JsonElement thumbElement : thumbNailArray) {
				boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
				if (isStill) {
					JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
					movieContentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
				}
			}
			JsonArray transcodesArray = jsonElement.getAsJsonObject().get("extra").getAsJsonObject().get("transcodes").getAsJsonArray();
			for (JsonElement transcodesElement : transcodesArray) {
				DownloadFileVO downloadFileVO = new Gson().fromJson(transcodesElement, DownloadFileVO.class);
				JsonElement downStaticElement = transcodesElement.getAsJsonObject().get("static_url").getAsJsonObject();
				String transDownloadUrl = downStaticElement.getAsJsonObject().get("download_url").getAsString();
				downloadFileVO.setDownload_url(transDownloadUrl);
				downsFileList.add(downloadFileVO);
			}
			movieContentVO.setDownloadFile(downsFileList);
		}
		return movieContentVO;
	}
	
	// view_count ASC
	@Override
	public void serviceViewCountASC(Model model) {
		List<MovieContentVO> list 		= new ArrayList<MovieContentVO>();
		MovieContentVO movieContentVO 	= null;
		omsResponder = omsConnector.RequestContentList("video", "orign", "cmplt", null, null, null, null, 0, 5, "view_count", "asc", true, true);
		JsonElement resultElement = omsResponder.getRootDataElement();
		JsonArray contentJsonArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
		for (JsonElement jsonElement : contentJsonArray) {
			JsonArray playlistIDSArray = jsonElement.getAsJsonObject().get("playlist_ids").getAsJsonArray();
			if (playlistIDSArray.size() == 1) {
				continue;
			}
			movieContentVO = new Gson().fromJson(jsonElement, MovieContentVO.class);
			JsonObject staticObject = jsonElement.getAsJsonObject().get("static_url").getAsJsonObject();
			movieContentVO.setDownload_url(staticObject.getAsJsonObject().get("download_url").getAsString());
			JsonArray streamingArray = staticObject.getAsJsonObject().get("streaming").getAsJsonArray();
			for (JsonElement streamingElement : streamingArray) {
				String protocol = streamingElement.getAsJsonObject().get("protocol").getAsString();
				if (protocol.equals("rtmp")) {
					String streamingUrl = streamingElement.getAsJsonObject().get("url").getAsString();
					movieContentVO.setStreaming_url(streamingUrl);
				}
			}
			JsonArray thumbNailArray = jsonElement.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
			for (JsonElement thumbElement : thumbNailArray) {
				boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
				if (isStill) {
					JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
					movieContentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
				} 
			}
		
			list.add(movieContentVO);
		}
		model.addAttribute("viewCountASC", list);
	}
	
	// main page category list를 뽑는다.
	@Override
	public void serviceCatalog(Model model) {
		String[] playlistIdList = new String[] {"1300000253","1300000252","1300000251",
				"1300000245","1300000244","1300000243","1300000242","1300000241","1300000240",
				"1300000239","1300000238","1300000237","1300000236","1300000235","1300000234",
				"1300000233","1300000232","1300000231","1300000230","1300000229","1300000228",
				"1300000227","1300000226","1300000225","1300000224","1300000223","1300000222",
				"1300000221","1300000220","1300000219"};
		List<MovieContentVO> ctgList = new ArrayList<MovieContentVO>();
		MovieContentVO movieVO = null;
		for (int i = 0; i < playlistIdList.length; i++) {
			int innerCnt = 0;
			int ctgCount = 0;
			omsResponder = omsConnector.requestGetPlayListToContent(playlistIdList[i], "video", "cmplt", "title", null, null, null, 0, 5, "reg_date", "desc", true, true);
			JsonElement rootListElement= omsResponder.getRootDataElement();
			if (rootListElement != null) {
				JsonArray contentJsonArray = rootListElement.getAsJsonObject().get("content").getAsJsonArray();
				ctgCount++;
				for (JsonElement contentListElement : contentJsonArray) {
					//List<ThumbUrlVO> thumbUrl = new ArrayList<ThumbUrlVO>();
					movieVO = new Gson().fromJson(contentListElement, MovieContentVO.class);
					JsonElement staticURLElement = contentListElement.getAsJsonObject().get("static_url").getAsJsonObject();
					String down_loadUrl = staticURLElement.getAsJsonObject().get("download_url").getAsString();
					movieVO.setDownload_url(down_loadUrl);
					JsonArray streamingsArray = staticURLElement.getAsJsonObject().get("streaming").getAsJsonArray();
					for (JsonElement streamingElement : streamingsArray) {
						String protocol = streamingElement.getAsJsonObject().get("protocol").getAsString();
						if (protocol.equals("rtmp")) {
							String streamingUrl = streamingElement.getAsJsonObject().get("url").getAsString();
							movieVO.setStreaming_url(streamingUrl);
						}
					}
					JsonArray thumbNailsArray = contentListElement.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
					for (JsonElement thumbElement : thumbNailsArray) {
						boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
						if (isStill) {
							JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
							movieVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
						} 
					}
					/*JsonArray transcodesListArray = contentElement.getAsJsonObject().get("extra").getAsJsonObject().get("transcodes").getAsJsonArray();
					for (JsonElement transcodesElement : transcodesListArray) {
						DownloadFileVO downloadFileVO = new Gson().fromJson(transcodesElement, DownloadFileVO.class);
						JsonElement downStaticElement = transcodesElement.getAsJsonObject().get("static_url").getAsJsonObject();
						String transDownloadUrl = downStaticElement.getAsJsonObject().get("download_url").getAsString();
						downloadFileVO.setDownload_url(transDownloadUrl);
						downsFileList.add(downloadFileVO);
					}*/
					//movieVO.setDownloadFile(downsFileList);
					ctgList.add(movieVO);
					innerCnt++;
				}
				if (innerCnt != 5) {
					for (int k = 0; k < innerCnt + 1; k++) {
						movieVO = new MovieContentVO();
						ctgList.add(movieVO);
					}
				}
			} 
			if (ctgCount == 0) {
				for (int j = 0; j < 5; j++) {
					movieVO = new MovieContentVO();
					ctgList.add(movieVO);
				}
			}
		}
		model.addAttribute("categoryList", ctgList);
		
	}
	
	// download url 추출
	@Override
	public String serviceDownloadFile(String content_id) {
		List<DownloadFileVO> dwnlst = new ArrayList<DownloadFileVO>();
		omsResponder = omsConnector.RequestContentList("all", "orign", "cmplt", "content_id", content_id, null, null, 0, 1, "reg_date", "desc", true, true);
		JsonElement resultElement = omsResponder.getRootDataElement();
		JsonArray contentJsonArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
		for (JsonElement jsonElement : contentJsonArray) {
			JsonArray transcodesArray = jsonElement.getAsJsonObject().get("extra").getAsJsonObject().get("transcodes").getAsJsonArray();
			for (JsonElement transcodesElement : transcodesArray) {
				DownloadFileVO downloadFileVO = new Gson().fromJson(transcodesElement, DownloadFileVO.class);
				String title = null;
				try {
					title = URLEncoder.encode( downloadFileVO.getTitle(), "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				downloadFileVO.setTitle(title);
				JsonElement downStaticElement = transcodesElement.getAsJsonObject().get("static_url").getAsJsonObject();
				String transDownloadUrl = downStaticElement.getAsJsonObject().get("download_url").getAsString();
				downloadFileVO.setDownload_url(transDownloadUrl);
				dwnlst.add(downloadFileVO);
			}
		}
		String gsonResult = new Gson().toJson(dwnlst);
		return gsonResult;
	}
	
	// 메타 정보를 수정한다. (ovp manual 3.1)
	@Override
	public String serviceEditMetaInfo(CategoryPageVO ctgpVO) {
		List<String> tags = new ArrayList<String>();
		tags.add(ctgpVO.getTag().getCategory());
		tags.add(ctgpVO.getTag().getYear());
		tags.add(ctgpVO.getTag().getType());
		tags.add(ctgpVO.getTag().getRegion());
		tags.add(ctgpVO.getTag().getOfficial());
		omsResponder = omsConnector.requestMetaInfoEdit(ctgpVO.getContent_id(), tags, null, ctgpVO.getTitle(), ctgpVO.getDescription(), null, null, null, null, null);
		String message = omsResponder.getRootObject().getAsJsonObject().get("message").getAsString();
		return message;
	}
	
	// 모든 인기 컨텐츠를 가져온다.
	@Override
	public List<MovieContentVO> serviceAllContent(CategoryPageVO ctgVO) {
		List<MovieContentVO> list 		= new ArrayList<MovieContentVO>();
		MovieContentVO movieContentVO 	= null;
		omsResponder = omsConnector.RequestContentList("video", "orign", "cmplt", "title", ctgVO.getSearch(), null, null, ctgVO.getPageNum(), 20, ctgVO.getSort(), "desc", true, true);
		JsonElement resultElement = omsResponder.getRootDataElement();
		int totalCnt = resultElement.getAsJsonObject().get("total_count").getAsInt();
		ctgVO.setTotalCount(totalCnt);
		JsonArray contentJsonArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
		for (JsonElement jsonElement : contentJsonArray) {
			JsonArray playlist_idsArray = jsonElement.getAsJsonObject().get("playlist_ids").getAsJsonArray();
			if (playlist_idsArray.size() == 1) {
				continue;
			}
			movieContentVO = new Gson().fromJson(jsonElement, MovieContentVO.class);
			JsonArray tagsArray = jsonElement.getAsJsonObject().get("tags").getAsJsonArray();
			String[] tagsArr = new Gson().fromJson(tagsArray, String[].class);
			TagInfoVO tags = new TagInfoVO();
			for (int i = 0; i < tagsArr.length; i++) {
				if (i == 0)	tags.setCategory(tagsArr[i].replace("[", ""));
				if (i == 1)	tags.setYear(tagsArr[i]);
				if (i == 2)	tags.setType(tagsArr[i]);
				if (i == 3)	tags.setRegion(tagsArr[i]);
				if (i == 4)	tags.setOfficial(tagsArr[i].replace("]", ""));
			}
			movieContentVO.setTag(tags);
			JsonObject staticObject = jsonElement.getAsJsonObject().get("static_url").getAsJsonObject();
			movieContentVO.setDownload_url(staticObject.getAsJsonObject().get("download_url").getAsString());
			JsonArray streamingArray = staticObject.getAsJsonObject().get("streaming").getAsJsonArray();
			for (JsonElement streamingElement : streamingArray) {
				String protocol = streamingElement.getAsJsonObject().get("protocol").getAsString();
				if (protocol.equals("rtmp")) {
					String streamingUrl = streamingElement.getAsJsonObject().get("url").getAsString();
					movieContentVO.setStreaming_url(streamingUrl);
				}
			}
			JsonArray thumbNailArray = jsonElement.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
			for (JsonElement thumbElement : thumbNailArray) {
				boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
				if (isStill) {
					JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
					movieContentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
				} 
			}
			if (ctgVO.getRegion() == null) {
				list.add(movieContentVO);
			} else if (tags.getRegion().equals(ctgVO.getRegion())) {
				list.add(movieContentVO);
			}
		}
		return list;
	}
	
	// 플레이리스트의 이름으로 플레이리스트 아이디를 찾는다.(ovp manual 4.6)
	@Override
	public String servicePlaylistFindName(String name) {
		omsResponder = omsConnector.requestPlaylistId(name);
		JsonElement rootElement = omsResponder.getRootDataElement();
		JsonElement playlistElement = rootElement.getAsJsonObject().get("playlist").getAsJsonArray().get(0);
		String playlist_id = playlistElement.getAsJsonObject().get("playlist_id").getAsString();
		return playlist_id;
	}
	
	// tab menu 선택시 해당 playlist의 컨텐트 20개를 가져온다.
	// tab menu에 thumb nail image만 보여주므로 streaming url은 가져오지 않는다.
	// 또한 트랜스코드된 download url 주소는 ajax로 가져오기 때문에 정보를 받지 않는다.
	@Override
	public List<MovieContentVO> serviceGetPlaylistContents(String playlist_id) {
		List<MovieContentVO> playlistContentList = new ArrayList<MovieContentVO>();
		omsResponder = omsConnector.requestGetPlayListToContent(playlist_id, "video", "cmplt", null, null, null, null, 0, 20, "reg_date", "desc", true, true);
		JsonElement jsonElement = omsResponder.getRootDataElement();
		if (jsonElement != null) {
			JsonArray contentJsonArray = jsonElement.getAsJsonObject().get("content").getAsJsonArray();
			for (JsonElement contentElement : contentJsonArray) {
				// thumb_url 4 cut 사용.
				//List<ThumbUrlVO> thumbUrl = new ArrayList<ThumbUrlVO>();
				MovieContentVO movieContentVO = new Gson().fromJson(contentElement, MovieContentVO.class);
				JsonArray tagsArray = contentElement.getAsJsonObject().get("tags").getAsJsonArray();
				String[] tagsArr = new Gson().fromJson(tagsArray, String[].class);
				TagInfoVO tags = new TagInfoVO();
				for (int i = 0; i < tagsArr.length; i++) {
					if (i == 0)	tags.setCategory(tagsArr[i].replace("[", ""));
					if (i == 1)	tags.setYear(tagsArr[i]);
					if (i == 2)	tags.setType(tagsArr[i]);
					if (i == 3)	tags.setRegion(tagsArr[i]);
					if (i == 4)	tags.setOfficial(tagsArr[i].replace("]", ""));
				}
				movieContentVO.setTag(tags);
				JsonArray thumbNailArray = contentElement.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
				for (JsonElement thumbElement : thumbNailArray) {
					boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
					if (isStill) {
						JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
						movieContentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
					} /*else {
						JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
						String thumbUrlValue = staticUrl.getAsJsonObject().get("download_url").getAsString();
						ThumbUrlVO thumbUrlVO = new ThumbUrlVO();
						thumbUrlVO.setDownload_url(thumbUrlValue);
						thumbUrl.add(thumbUrlVO);
					}*/
				}
				// thumb_url 4 cut 저장
				//movieContentVO.setStaticThumb(thumbUrl);
				playlistContentList.add(movieContentVO);
			}
		} 
		return playlistContentList;
	}
	
	// 해당 플레이리스트 목록에서 정렬을 선택시 사용된다. searchController에서 사용됨
	@Override
	public List<MovieContentVO> servicePlaylistSort(CategoryPageVO ctgVO) {
		List<MovieContentVO> playlistContentList = new ArrayList<MovieContentVO>();
		omsResponder = omsConnector.requestGetPlayListToContent(ctgVO.getPlaylist_id(), "video", "cmplt", null, null, null, null, ctgVO.getPageNum(), 20, ctgVO.getSort(), "desc", true, true);
		JsonElement jsonElement = omsResponder.getRootDataElement();
		int totalCnt = jsonElement.getAsJsonObject().get("total_count").getAsInt();
		ctgVO.setTotalCount(totalCnt);
		if (jsonElement != null) {
			JsonArray contentJsonArray = jsonElement.getAsJsonObject().get("content").getAsJsonArray();
			for (JsonElement contentElement : contentJsonArray) {
				MovieContentVO movieContentVO = new Gson().fromJson(contentElement, MovieContentVO.class);
				JsonArray tagsArray = contentElement.getAsJsonObject().get("tags").getAsJsonArray();
				String[] tagsArr = new Gson().fromJson(tagsArray, String[].class);
				TagInfoVO tags = new TagInfoVO();
				for (int i = 0; i < tagsArr.length; i++) {
					if (i == 0)	tags.setCategory(tagsArr[i].replace("[", ""));
					if (i == 1)	tags.setYear(tagsArr[i]);
					if (i == 2)	tags.setType(tagsArr[i]);
					if (i == 3)	tags.setRegion(tagsArr[i]);
					if (i == 4)	tags.setOfficial(tagsArr[i].replace("]", ""));
				}
				movieContentVO.setTag(tags);
				JsonArray thumbNailArray = contentElement.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
				for (JsonElement thumbElement : thumbNailArray) {
					boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
					if (isStill) {
						JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
						movieContentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
					}
				}
				playlistContentList.add(movieContentVO);
			}
		} 
		return playlistContentList;
	}

	// reigon 검색으로 추출한다.
	@Override
	public List<MovieContentVO> serviceRegionSort(CategoryPageVO ctgVO) {
		List<MovieContentVO> playlistContentList = new ArrayList<MovieContentVO>();
		omsResponder = omsConnector.requestGetPlayListToContent(ctgVO.getPlaylist_id(), "video", "cmplt", null, null, null, null, ctgVO.getPageNum(), 20, ctgVO.getSort(), "desc", true, true);
		JsonElement jsonElement = omsResponder.getRootDataElement();
		int totalCnt = jsonElement.getAsJsonObject().get("total_count").getAsInt();
		ctgVO.setTotalCount(totalCnt);
		if (jsonElement != null) {
			JsonArray contentJsonArray = jsonElement.getAsJsonObject().get("content").getAsJsonArray();
			for (JsonElement contentElement : contentJsonArray) {
				MovieContentVO movieContentVO = new Gson().fromJson(contentElement, MovieContentVO.class);
				JsonArray tagsArray = contentElement.getAsJsonObject().get("tags").getAsJsonArray();
				String[] tagsArr = new Gson().fromJson(tagsArray, String[].class);
				TagInfoVO tags = new TagInfoVO();
				for (int i = 0; i < tagsArr.length; i++) {
					if (i == 0)	tags.setCategory(tagsArr[i].replace("[", ""));
					if (i == 1)	tags.setYear(tagsArr[i]);
					if (i == 2)	tags.setType(tagsArr[i]);
					if (i == 3)	tags.setRegion(tagsArr[i]);
					if (i == 4)	tags.setOfficial(tagsArr[i].replace("]", ""));
				}
				movieContentVO.setTag(tags);
				JsonArray thumbNailArray = contentElement.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
				for (JsonElement thumbElement : thumbNailArray) {
					boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
					if (isStill) {
						JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
						movieContentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
					}
				}
				if (tags.getRegion().equals(ctgVO.getRegion())) {
					playlistContentList.add(movieContentVO);
				}
			}
		}
		return playlistContentList;	
	}
	
	// playlist에 대한 제약 없이 region 검색
	@Override
	public List<MovieContentVO> serviceRegionFullSearch(CategoryPageVO ctgVO) {
		List<MovieContentVO> regionSelectList = new ArrayList<MovieContentVO>();
		MovieContentVO movieContentVO = null;
		omsResponder = omsConnector.RequestContentList("video", "origin", "cmplt", "title", ctgVO.getSearch(), null, null, ctgVO.getPageNum(), 20, ctgVO.getSort(), "desc", true, true);
		JsonElement resultElement = omsResponder.getRootDataElement();
		int totalCnt = resultElement.getAsJsonObject().get("total_count").getAsInt();
		ctgVO.setTotalCount(totalCnt);
		JsonArray contentJsonArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
		for (JsonElement jsonElement : contentJsonArray) {
			JsonArray playlist_idsArray = jsonElement.getAsJsonObject().get("playlist_ids").getAsJsonArray();
			if (playlist_idsArray.size() == 1) {
				continue;
			}
			movieContentVO = new Gson().fromJson(jsonElement, MovieContentVO.class);
			JsonArray tagsArray = jsonElement.getAsJsonObject().get("tags").getAsJsonArray();
			String[] tagsArr = new Gson().fromJson(tagsArray, String[].class);
			TagInfoVO tags = new TagInfoVO();
			for (int i = 0; i < tagsArr.length; i++) {
				if (i == 0)	tags.setCategory(tagsArr[i].replace("[", ""));
				if (i == 1)	tags.setYear(tagsArr[i]);
				if (i == 2)	tags.setType(tagsArr[i]);
				if (i == 3)	tags.setRegion(tagsArr[i]);
				if (i == 4)	tags.setOfficial(tagsArr[i].replace("]", ""));
			}
			movieContentVO.setTag(tags);
			JsonObject staticObject = jsonElement.getAsJsonObject().get("static_url").getAsJsonObject();
			movieContentVO.setDownload_url(staticObject.getAsJsonObject().get("download_url").getAsString());
			JsonArray streamingArray = staticObject.getAsJsonObject().get("streaming").getAsJsonArray();
			for (JsonElement streamingElement : streamingArray) {
				String protocol = streamingElement.getAsJsonObject().get("protocol").getAsString();
				if (protocol.equals("rtmp")) {
					String streamingUrl = streamingElement.getAsJsonObject().get("url").getAsString();
					movieContentVO.setStreaming_url(streamingUrl);
				}
			}
			JsonArray thumbNailArray = jsonElement.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
			for (JsonElement thumbElement : thumbNailArray) {
				boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
				if (isStill) {
					JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
					movieContentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
				}
			}
			if (tags.getRegion().equals(ctgVO.getRegion())) {
				regionSelectList.add(movieContentVO);
			}
		}
		return regionSelectList;
	}
	
	// file format info를 가져온다.
	@Override
	public List<DownloadFileVO> serviceFileFormat(String playlist_id, String content_id) {
		List<DownloadFileVO> fileList = new ArrayList<DownloadFileVO>();
		omsResponder = omsConnector.requestGetPlayListToContent(playlist_id, "video", "cmplt", "content_id", content_id, null, null, 0, 1, "reg_date", "desc", true, true);
		JsonElement rootElement = omsResponder.getRootDataElement();
		JsonArray contentArray = rootElement.getAsJsonObject().get("content").getAsJsonArray();
		for (JsonElement contentElement: contentArray) {
			JsonArray transcodesListArray = contentElement.getAsJsonObject().get("extra").getAsJsonObject().get("transcodes").getAsJsonArray();
			for (JsonElement transcodesElement : transcodesListArray) {
				String state = transcodesElement.getAsJsonObject().get("state").getAsString();
				if (!state.equals("cmplt")) {
					continue;
				}
				DownloadFileVO downloadFileVO = new Gson().fromJson(transcodesElement, DownloadFileVO.class);
				downloadFileVO.setReg_date(downloadFileVO.getReg_date());
				downloadFileVO.setMod_date(downloadFileVO.getMod_date());
				JsonElement downStaticElement = transcodesElement.getAsJsonObject().get("static_url").getAsJsonObject();
				String transDownloadUrl = downStaticElement.getAsJsonObject().get("download_url").getAsString();
				if (transDownloadUrl != null) {
					downloadFileVO.setDownload_url(transDownloadUrl);
				}
				JsonArray streamingArr = downStaticElement.getAsJsonObject().get("streaming").getAsJsonArray();
				for (JsonElement streamElement : streamingArr) {
					String protocol = streamElement.getAsJsonObject().get("protocol").getAsString();
					if (protocol.equals("rtmp")) {
						String streamingUrl = streamElement.getAsJsonObject().get("url").getAsString();
						downloadFileVO.setStreaming_url(streamingUrl);
					}
				}
				fileList.add(downloadFileVO);
			}
		}
		return fileList;
	}
	
	// admin document page의 정렬과 검색을 위한 서비스 
	@Override
	public List<MovieContentVO> getSortSearchPlayListForContent(CategoryPageVO ctgVO) {
		List<MovieContentVO> playlistContentList = new ArrayList<MovieContentVO>();
		List<DownloadFileVO> downsFileList = new ArrayList<DownloadFileVO>();
		omsResponder = omsConnector.requestGetPlayListToContent(ctgVO.getPlaylist_id(), "video", "cmplt", ctgVO.getSearch_type(), ctgVO.getSearch(), null, null, ctgVO.getPageNum(), 20, ctgVO.getSort(), "desc", true, true);
		JsonElement jsonElement = omsResponder.getRootDataElement();
		if (jsonElement != null) {
			JsonArray contentJsonArray = jsonElement.getAsJsonObject().get("content").getAsJsonArray();
			int totalCnt = jsonElement.getAsJsonObject().get("total_count").getAsInt();
			ctgVO.setTotalCount(totalCnt);
			for (JsonElement contentElement : contentJsonArray) {
				List<ThumbUrlVO> thumbUrl = new ArrayList<ThumbUrlVO>();
				MovieContentVO movieContentVO = new Gson().fromJson(contentElement, MovieContentVO.class);
				JsonArray tagsArray = contentElement.getAsJsonObject().get("tags").getAsJsonArray();
				String[] tagsArr = new Gson().fromJson(tagsArray, String[].class);
				TagInfoVO tags = new TagInfoVO();
				for (int i = 0; i < tagsArr.length; i++) {
					if (i == 0)	tags.setCategory(tagsArr[i].replace("[", ""));
					if (i == 1)	tags.setYear(tagsArr[i]);
					if (i == 2)	tags.setType(tagsArr[i]);
					if (i == 3)	tags.setRegion(tagsArr[i]);
					if (i == 4)	tags.setOfficial(tagsArr[i].replace("]", ""));
				}
				movieContentVO.setTag(tags);
				JsonElement staticElement = contentElement.getAsJsonObject().get("static_url").getAsJsonObject();
				String downloadUrl = staticElement.getAsJsonObject().get("download_url").getAsString();
				movieContentVO.setDownload_url(downloadUrl);
				JsonArray streamingArray = staticElement.getAsJsonObject().get("streaming").getAsJsonArray();
				for (JsonElement streamingElement : streamingArray) {
					String protocol = streamingElement.getAsJsonObject().get("protocol").getAsString();
					if (protocol.equals("rtmp")) {
						String streamingUrl = streamingElement.getAsJsonObject().get("url").getAsString();
						movieContentVO.setStreaming_url(streamingUrl);
					}
				}
				
				JsonArray transcodesListArray = contentElement.getAsJsonObject().get("extra").getAsJsonObject().get("transcodes").getAsJsonArray();
				for (JsonElement transcodesElement : transcodesListArray) {
					String state = transcodesElement.getAsJsonObject().get("state").getAsString();
					if (!state.equals("cmplt")) {
						continue;
					}
					DownloadFileVO downloadFileVO = new Gson().fromJson(transcodesElement, DownloadFileVO.class);
					JsonElement downStaticElement = transcodesElement.getAsJsonObject().get("static_url").getAsJsonObject();
					String transDownloadUrl = downStaticElement.getAsJsonObject().get("download_url").getAsString();
					if (transDownloadUrl != null) {
						downloadFileVO.setDownload_url(transDownloadUrl);
					}
					JsonArray streamingArr = downStaticElement.getAsJsonObject().get("streaming").getAsJsonArray();
					for (JsonElement streamElement : streamingArr) {
						String protocol = streamElement.getAsJsonObject().get("protocol").getAsString();
						if (protocol.equals("rtmp")) {
							String streamingUrl = streamElement.getAsJsonObject().get("url").getAsString();
							downloadFileVO.setStreaming_url(streamingUrl);
						}
					}
					downsFileList.add(downloadFileVO);
				}
				movieContentVO.setDownloadFile(downsFileList);
				
				JsonArray thumbNailArray = contentElement.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
				for (JsonElement thumbElement : thumbNailArray) {
					boolean isStill = thumbElement.getAsJsonObject().get("is_still").getAsBoolean();
					if (isStill) {
						JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
						movieContentVO.setThumb_url(staticUrl.getAsJsonObject().get("download_url").getAsString());
					} else {
						JsonObject staticUrl = thumbElement.getAsJsonObject().get("static_url").getAsJsonObject();
						String thumbUrlValue = staticUrl.getAsJsonObject().get("download_url").getAsString();
						ThumbUrlVO thumbUrlVO = new ThumbUrlVO();
						thumbUrlVO.setDownload_url(thumbUrlValue);
						thumbUrl.add(thumbUrlVO);
					}
				}
				movieContentVO.setStaticThumb(thumbUrl);
				playlistContentList.add(movieContentVO);
			}
		} 
		return playlistContentList;
	}
	
	// multipart file을 file type 으로 변환
	private File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException {
		
		System.out.println("file info");
		System.out.println(multipart.getOriginalFilename());
		System.out.println(multipart.getSize());
        File convFile = new File(multipart.getOriginalFilename());
        System.out.println("convFile info");
		System.out.println(convFile.getAbsolutePath());
		System.out.println(convFile.getCanonicalPath());
		System.out.println(convFile.getName());
		System.out.println(convFile.getAbsoluteFile());
        multipart.transferTo(convFile);
        System.out.println("convFile info");
		System.out.println(convFile.getAbsolutePath());
		System.out.println(convFile.getCanonicalPath());
		System.out.println(convFile.getName());
		System.out.println(convFile.getAbsoluteFile());
        return convFile;
	}

}

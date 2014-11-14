package com.hankooktire.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.airensoft.skovp.utils.ovpconnector.OMSConnector;
import com.airensoft.skovp.utils.ovpconnector.OMSConnectorResponse;
import com.airensoft.skovp.vo.PopularContentVO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;

@Service("ovpV2Service")
public class OvpServiceImpl implements OvpService {
	
	@Autowired
	OMSConnectorResponse omsResponder;
	@Autowired
	OMSConnector omsConnector;
	
	@Override
	public void popularList(Model model) {
		List<PopularContentVO> popularList = new ArrayList<PopularContentVO>();
		omsConnector.clear();
		omsResponder = omsConnector.requestPopularContentList(0, 0, 0, 5, true, false);
		JsonElement resultElement = omsResponder.getRootDataElement();
		JsonArray contentArray = resultElement.getAsJsonObject().get("content").getAsJsonArray();
		for (JsonElement contentObject : contentArray) {
			PopularContentVO popularContentVO = new Gson().fromJson(contentObject, PopularContentVO.class);
			JsonArray thumbNailArray = contentObject.getAsJsonObject().get("extra").getAsJsonObject().get("thumbnails").getAsJsonArray();
			for (JsonElement jsonElement : thumbNailArray) {
				boolean isStill = jsonElement.getAsJsonObject().get("is_still").getAsBoolean();
				int thumbId = 0;
				if (isStill) {
					thumbId = jsonElement.getAsJsonObject().get("content_id").getAsInt();
					popularContentVO.setThumb_url(getThumbNailUrl(thumbId));
				}
			}
			popularList.add(popularContentVO);
		}
		model.addAttribute("popularList", popularList);
	}

	@Override
	public String getThumbNailUrl(int contentId) {
		omsConnector.clear();
		omsResponder = omsConnector.RequestPulbishDownloadContent(contentId);
		return omsResponder.getRootDataElement().getAsJsonObject().get("url").getAsString();
	}

	@Override
	public void searchMovie(String searchWord) {
		omsConnector.clear();
		//omsResponder = omsConnector.RequestContentList(media_type, file_type, state, search_type, search, search_start_date, search_end_date, page, page_size, sort, order, with_extra, with_static_url)
		
	}

}

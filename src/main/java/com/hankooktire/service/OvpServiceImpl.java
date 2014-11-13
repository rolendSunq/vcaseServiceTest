package com.hankooktire.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airensoft.skovp.utils.ovpconnector.OMSConnector;
import com.airensoft.skovp.utils.ovpconnector.OMSConnectorResponse;
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
	public void popularList() {
		omsConnector.clear();
		omsResponder = omsConnector.requestPopularContentList(0, 0, 0, 5, false, false);
		JsonElement resultElement = omsResponder.getRootDataElement();
		JsonObject contentObject = resultElement.getAsJsonObject().get("content").getAsJsonArray().get(0).getAsJsonObject();
		System.out.println(contentObject);
	}

}

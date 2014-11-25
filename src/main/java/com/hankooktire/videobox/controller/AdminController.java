package com.hankooktire.videobox.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hankooktire.videobox.service.OvpService;

@Controller
public class AdminController {

	@Autowired
	OvpService ovpService;
	
	@RequestMapping("/admin/setGroup")
	public String setGroupController (@RequestParam("GroupName") String groupName) {
		ovpService.setContentGroup(groupName);
		return null;
	}
}

package com.hankooktire.videobox.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hankooktire.videobox.service.OvpService;

@Controller
public class AdminController {

	@Autowired
	OvpService ovpService;
	
	@RequestMapping("/adminUploaders")
	public String goUploaderPage( ) {
		return "admin_uploader";
	}
	
	@RequestMapping("/adminDoc")
	public String goAdminPage() {
		return "admin_document";
	}
	
	@RequestMapping("/adminLog")
	public String goLogPage() {
		return "admin_log";
	}
}

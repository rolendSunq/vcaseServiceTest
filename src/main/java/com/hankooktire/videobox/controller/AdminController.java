package com.hankooktire.videobox.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.airensoft.skovp.vo.MovieContentVO;
import com.airensoft.skovp.vo.PlayListCountVO;
import com.airensoft.skovp.vo.ViewCountStatisticsVO;
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
	public String goAdminPage(Model model) {
		List<PlayListCountVO> playlistCount = ovpService.getCountPlayListForContent();
		model.addAttribute("listCount", playlistCount);
		return "admin_document";
	}
	
	@RequestMapping("/adminLog")
	public String goLogPage(HttpServletRequest request, HttpServletResponse response, Model model) {
		ovpService.popularList(model, 5);
		response.setContentType("text/html; charset=UTF-8");
		String page = request.getParameter("page");
		int pageNum = (page == null) ? 0 : Integer.parseInt(page);
		List<ViewCountStatisticsVO> result = ovpService.getViewCountContent(pageNum);
		model.addAttribute("result", result);
		return "admin_log";
	}
	
	@RequestMapping("/adminPlaylist")
	public String getContentFromPlayList(Model model, HttpServletRequest request) {
		String playlist_id = request.getParameter("playlist_id");
		String searchType = request.getParameter("searchType");
		String search = request.getParameter("search");
		String pageNumber = request.getParameter("pageNum");
		int pageNum = (pageNumber == null) ? 0 : Integer.parseInt(pageNumber);
		List<PlayListCountVO> playlistCount = ovpService.getCountPlayListForContent();
		List<MovieContentVO> contentList = ovpService.getPlayListForContent(playlist_id, searchType, search, pageNum, model);
		model.addAttribute("listCount",playlistCount);
		model.addAttribute("contentList", contentList);
		model.addAttribute("pageNum", pageNum);
		return "admin_document";
	}
}

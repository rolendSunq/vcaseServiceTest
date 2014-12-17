package com.hankooktire.videobox.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.airensoft.skovp.utils.ovpconnector.OMSConfig;
import com.airensoft.skovp.utils.page.Paging;
import com.airensoft.skovp.utils.time.DateUtils;
import com.airensoft.skovp.vo.CategoryPageVO;
import com.airensoft.skovp.vo.MovieContentVO;
import com.airensoft.skovp.vo.PlayListCountVO;
import com.airensoft.skovp.vo.TagInfoVO;
import com.airensoft.skovp.vo.ViewCountStatisticsVO;
import com.google.gson.Gson;
import com.hankooktire.videobox.service.OvpService;

@Controller
public class AdminController {

	@Autowired
	OvpService ovpService;
	
	// uploader 관리자 사이트 이동
	@RequestMapping("/adminUploaders")
	public String goUploaderPage(HttpServletRequest request, Model model) {
		String myHistory = request.getParameter("historyList");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		model.addAttribute("history", history);
		return "admin_uploader";
	}
	
	// 슈퍼관리자 사이트 이동
	@RequestMapping("/adminDoc")
	public String goAdminPage(HttpServletRequest request, CategoryPageVO ctgVO, Model model) {
		// default playlist는 Admin 이다.
		ctgVO.setPlaylist_id("1300000203");
		String myHistory = request.getParameter("historyList");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		// playlist 각 각의 컨텐트 갯수를 가져온다.
		List<PlayListCountVO> playlistCount = ovpService.getCountPlayListForContent();
		// 정렬에 의한 admin playlist의 컨텐츠를 가져온다.
		List<MovieContentVO> contentList = ovpService.getSortSearchPlayListForContent(ctgVO);
		// paging
		Paging paging = new Paging(ctgVO.getPageNum(), ctgVO.getTotalCount());
		System.out.println("+++paging+++" + paging);
		// sort type 지정
		ctgVO.setSort("reg_date");
		model.addAttribute("listCount", playlistCount);
		model.addAttribute("contentList", contentList);
		model.addAttribute("history", history);
		model.addAttribute("paging", paging);
		model.addAttribute("categoryPageVO", ctgVO);
		model.addAttribute("playlist_id", "1300000203");
		model.addAttribute("player_id", OMSConfig.getPlayerId());
		return "admin_document";
	}
	
	// 슈퍼 관리자 사이트 정렬, 검색
	@RequestMapping("/adminDocSort")
	public String getSortAdminPage(HttpServletRequest request, CategoryPageVO ctgVO, Model model) {
		String myHistory = request.getParameter("historyList");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		// playlist 각 각의 컨텐트 갯수를 가져온다.
		List<PlayListCountVO> playlistCount = ovpService.getCountPlayListForContent();
		// admin playlist의 컨텐츠를 가져온다.
		List<MovieContentVO> contentList = ovpService.getSortSearchPlayListForContent(ctgVO);
		// paging
		Paging paging = new Paging(ctgVO.getPageNum(), ctgVO.getTotalCount());
		model.addAttribute("history", history);
		model.addAttribute("listCount", playlistCount);
		model.addAttribute("contentList", contentList);
		model.addAttribute("categoryPageVO", ctgVO);
		model.addAttribute("paging", paging);
		model.addAttribute("player_id", OMSConfig.getPlayerId());
		return "admin_document";
	}
	
	// 통계 사이트 이동
	@RequestMapping("/adminLog")
	public String goLogPage(HttpServletRequest request, HttpServletResponse response, Model model) {
		response.setContentType("text/html; charset=UTF-8");
		String myHistory = request.getParameter("historyList");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		List<MovieContentVO> popularList = ovpService.popularList(5);
		String page = request.getParameter("page");
		int pageNum = (page == null) ? 0 : Integer.parseInt(page);
		List<ViewCountStatisticsVO> result = ovpService.getViewCountContent(pageNum);
		model.addAttribute("result", result);
		model.addAttribute("history", history);
		model.addAttribute("popularList", popularList);
		return "admin_log";
	}
	
	// 슈퍼 관리자 페이지에서 playlist 들의 해당 category의 컨텐트를 보여줌
	@RequestMapping("/adminPlaylist")
	public String getContentFromPlayList(HttpServletRequest request, CategoryPageVO ctgVO, Model model) {
		String myHistory = request.getParameter("historyList");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		List<PlayListCountVO> playlistCount = ovpService.getCountPlayListForContent();
		List<MovieContentVO> contentList = ovpService.getSortSearchPlayListForContent(ctgVO);
		Paging paging = new Paging(ctgVO.getPageNum(), ctgVO.getTotalCount());
		model.addAttribute("listCount", playlistCount);
		model.addAttribute("contentList", contentList);
		model.addAttribute("history", history);
		model.addAttribute("paging", paging);
		model.addAttribute("categoryPageVO", ctgVO);
		model.addAttribute("player_id", OMSConfig.getPlayerId());
		return "admin_document";
	}
	
	// 슈퍼 관리자 사이트에서 선택된 콘텐트를 삭제
	@RequestMapping("/adminSuperDelete")
	@ResponseBody
	public String deleteContent(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("text/html;charset=UTF-8");
		String deleteList = request.getParameter("deleteList");
		System.out.println("deleteList: " + deleteList);
		String message = ovpService.deleteContentList(deleteList);
		try {
			message = URLEncoder.encode(message, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new Gson().toJson(message);
	}
	
	// 슈퍼 관리자가 해당 카테고리에 콘텐트를 바인딩한다.
	@RequestMapping("/adminConBind")
	public String setContentByPlaylist(HttpServletRequest request, CategoryPageVO ctgVO, TagInfoVO tag, Model model) {
		ctgVO.setTag(tag);
		ctgVO.setCustom_id(ctgVO.getCustom_id() + DateUtils.getMontDateTime());
		ovpService.serviceEditMetaInfo(ctgVO);
		ovpService.contentBinding(ctgVO.getContent_id(), ctgVO.getCategory());
		List<MovieContentVO> contentList = ovpService.getSortSearchPlayListForContent(ctgVO);
		List<PlayListCountVO> playlistCount = ovpService.getCountPlayListForContent();
		Paging paging = new Paging(ctgVO.getPageNum(), ctgVO.getTotalCount());
		model.addAttribute("listCount",playlistCount);
		model.addAttribute("contentList", contentList);
		model.addAttribute("paging", paging);
		model.addAttribute("categoryPageVO", ctgVO);
		model.addAttribute("player_id", OMSConfig.getPlayerId());
		return "admin_document";
	}
}

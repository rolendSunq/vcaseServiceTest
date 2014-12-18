package com.hankooktire.videobox.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.airensoft.skovp.utils.ovpconnector.OMSConfig;
import com.airensoft.skovp.utils.page.Paging;
import com.airensoft.skovp.vo.CategoryPageVO;
import com.airensoft.skovp.vo.FileVO;
import com.airensoft.skovp.vo.MovieContentVO;
import com.google.gson.Gson;
import com.hankooktire.videobox.service.OvpService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {

	@Autowired
	OvpService ovpService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/")
	public String videoBoxHome(Model model) {
		// main의 update movie 를 보여 주기 위한 컨텐츠를 가져온다. 내부에서 모델 등록
		ovpService.getAllContentList(model);
		// main의 popular Movie를 보여주기 위한 컨텐츠를 가져온다.
		List<MovieContentVO> popularList = ovpService.popularList(5);
		// 카테고리 메뉴별 컨텐츠를 보여주기 위한 컨텐츠를 가져온다.
		List<MovieContentVO> categoryList = ovpService.getPlayListForContent("1300000253", null, null, null, null, model);
		CategoryPageVO ctgVO = new CategoryPageVO();
		ctgVO.setPlaylist_id("1300000253");
		ctgVO.setPlaylist_name("Company");
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("categoryInfo", ctgVO);
		model.addAttribute("popularList", popularList);
		return "main";
	}

	@RequestMapping(value = "/getTabMenu")
	@ResponseBody
	public String getPlaylistForTabMenu(HttpServletRequest request) {
		String playlist_id = request.getParameter("playlist_id");
		List<MovieContentVO> list = ovpService.serviceGetPlaylistContents(playlist_id);
		return new Gson().toJson(list);
	}
	
	// gnb 메뉴의 개별 항목(playlist)의 콘텐츠 목록을 보여준다.
	@RequestMapping(value = "/categoryPlaylist")
	public String goPlaylist(HttpServletRequest request, CategoryPageVO ctgVO, Model model) {
		String myHistory = request.getParameter("historyList");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		List<MovieContentVO> list = ovpService.goPlaylistContentList(ctgVO);
		Paging paging = new Paging(ctgVO.getPageNum(), ctgVO.getTotalCount());
		model.addAttribute("history", history);
		model.addAttribute("paging", paging);
		model.addAttribute("pageInfo", ctgVO);
		model.addAttribute("list", list);
		return "list";
	}
	
	// history List를 가져온다.
	@RequestMapping(value = "mamsHistoryList")
	@ResponseBody
	public String getHistoryList(HttpServletRequest request) {
		String myhistory = request.getParameter("historyList");
		String[] historyList = new Gson().fromJson(myhistory, String[].class);
		List<MovieContentVO> list = ovpService.getHistoryList(historyList);
		return new Gson().toJson(list);
	}
	
	// detail 페이지 이동
	@RequestMapping(value = "detail") 
	public String moveDetailView(HttpServletRequest request, Model model) {
		String myHistory = request.getParameter("historyList");
		String playlistName = request.getParameter("playlist_name");
		String contentId	= request.getParameter("content_id");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		String playlistId = ovpService.servicePlaylistFindName(playlistName);
		CategoryPageVO ctgVO = new CategoryPageVO();
		ctgVO.setPlaylist_id(playlistId);
		ctgVO.setPlaylist_name(playlistName);
		ctgVO.setContent_id(contentId);
		ovpService.serviceDetailPageToListPage(ctgVO, model);
		ovpService.serviceViewCountASC(model);
		model.addAttribute("pageInfo", ctgVO);
		model.addAttribute("history", history);
		model.addAttribute("player_id", OMSConfig.getPlayerId());
		return "detail";
	}
	
	// detail popular page 이동
	@RequestMapping(value = "detailPopular")
	public String goDetailPopular(HttpServletRequest request, CategoryPageVO ctgVO, Model model) {
		String myHistory = request.getParameter("historyList");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		MovieContentVO movieContentVO = ovpService.serviceDetailPopular(ctgVO.getContent_id());
		ovpService.serviceViewCountASC(model);
		List<MovieContentVO> popularList = ovpService.popularList(20);
		model.addAttribute("history", history);
		model.addAttribute("oneStreamPlay", movieContentVO);
		model.addAttribute("popularList", popularList);
		return "detail_popular";
	}
	
	// bookmark 페이지 이동
	@RequestMapping(value = "moveMyBookmark")
	public String moveBookmarkView(@RequestParam("bookmarkInfo") String bookmarkInfo, @RequestParam("historyList") String historyList, Model model) {
		String[] myHistory = new Gson().fromJson(historyList, String[].class);
		String[] myBookmark = new Gson().fromJson(bookmarkInfo, String[].class);
		List<MovieContentVO> history = ovpService.getHistoryList(myHistory);
		List<MovieContentVO> bookmark = ovpService.getHistoryList(myBookmark);
		model.addAttribute("item", bookmark);
		model.addAttribute("history", history);
		return "list_my_bookmark";
	}
	
	// list_my_download.jsp 페이지 이동
	@RequestMapping(value = "mamsDownload")
	public String moveDownloadView(HttpServletRequest request, Model model) {
		String historyList = request.getParameter("historyList");
		String downloadList = request.getParameter("downloadList");
		String[] myHistory = new Gson().fromJson(historyList, String[].class);
		String[] myDownload= new Gson().fromJson(downloadList, String[].class);
		List<MovieContentVO> download = ovpService.getHistoryList(myDownload);
		List<MovieContentVO> history  = ovpService.getHistoryList(myHistory);
		model.addAttribute("history", history);
		model.addAttribute("list", download);
		return "list_my_download";
	}

	// playlist (list page) 페이지 이동
	@RequestMapping(value = "playlist")
	public String moveListDetailView(HttpServletRequest request, CategoryPageVO ctgVO, Model model)  {
		String myHistory = request.getParameter("historyList");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		List<MovieContentVO> list = ovpService.getSortSearchPlayListForContent(ctgVO);
		Paging paging = new Paging(ctgVO.getPageNum(), ctgVO.getTotalCount());
		model.addAttribute("categoryPageVO", ctgVO);
		model.addAttribute("paging", paging);
		model.addAttribute("history", history);
		model.addAttribute("list", list);
		return "list";
	}
	
	// list 페이지 이동
	@RequestMapping(value = "listDetail")
	public String goListOfPlaylist(HttpServletRequest request, CategoryPageVO ctgVO, Model model)  {
		String myHistory = request.getParameter("historyList");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> list = ovpService.serviceAllContent(ctgVO);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		Paging paging = new Paging(ctgVO.getPageNum(), ctgVO.getTotalCount());
		model.addAttribute("categoryPageVO", ctgVO);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("history", history);
		return "list_popular";
	}
	
	// list page에서 detail page 이동
	@RequestMapping(value = "playlistDetail")
	public String detailPlaylist(CategoryPageVO ctgVO, HttpServletRequest request, Model model) {
		String myHistory = request.getParameter("historyList");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		ovpService.serviceDetailPageToListPage(ctgVO, model);
		model.addAttribute("history", history);
		model.addAttribute("pageInfo", ctgVO);
		return "detail";
	}
	
	// list_result 페이지 이동
	@RequestMapping(value = "listResult")
	public String moveListResultView(Model model) {
		return "list_result";
	}
	
	// File을 업로드 한다.
	@RequestMapping(value = "/video/fileUpload")
	@ResponseBody
	public String uploadFileToDefault(FileVO fileVO, HttpServletResponse response, Model model) throws IllegalStateException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String message = ovpService.contentFileUpload(fileVO);
		return new Gson().toJson(URLEncoder.encode(message, "UTF-8"));
	}
	
	// download File List를 가져온다.
	@RequestMapping(value = "getDownload")
	@ResponseBody
	public String getDownloadFileList(HttpServletRequest request) {
		String content_id = request.getParameter("content_id");
		return ovpService.serviceDownloadFile(content_id);
	}
	
	// Content Group 생성
	@RequestMapping("/setGroup")
	public String setGroupController (String groupName) {
		ovpService.setContentGroup(groupName);
		return "redirect:/";
	}
	
	// main page category List 카테고리 컨텐트 리스트 가져옴
	@RequestMapping("/categoryList")
	public String getMainCategoryList(HttpServletRequest request, Model model) {
		String myHistory = request.getParameter("historyList");
		String playlistId = request.getParameter("playlist_id");
		String playlistNm = request.getParameter("playlist_Nm");
		String[] historyList = new Gson().fromJson(myHistory, String[].class);
		List<MovieContentVO> history = ovpService.getHistoryList(historyList);
		CategoryPageVO ctgVO = new CategoryPageVO();
		ctgVO.setPlaylist_id(playlistId);
		ctgVO.setPlaylist_name(playlistNm);
		ovpService.getAllContentList(model);
		List<MovieContentVO> categoryList = ovpService.getPlayListForContent(playlistId, null, null, null, null, model);
		model.addAttribute("history", history);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("categoryInfo", ctgVO);
		return "main";
	}
}

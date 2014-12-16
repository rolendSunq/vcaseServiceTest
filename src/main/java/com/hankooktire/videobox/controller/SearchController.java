package com.hankooktire.videobox.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.airensoft.skovp.utils.page.Paging;
import com.airensoft.skovp.vo.CategoryPageVO;
import com.airensoft.skovp.vo.MovieContentVO;
import com.google.gson.Gson;
import com.hankooktire.videobox.service.OvpService;

@Controller
public class SearchController {
	@Autowired
	OvpService ovpService;
	
	@RequestMapping("search")
	public String searchContent(HttpServletRequest request, CategoryPageVO ctgVO, Model model) {
		String history = request.getParameter("historyList");
		String[] myHistory= new Gson().fromJson(history, String[].class);
		List<MovieContentVO> historyList = ovpService.getHistoryList(myHistory);
		List<MovieContentVO> list = ovpService.search(ctgVO);
		Paging paging = new Paging(0, ctgVO.getTotalCount());
		model.addAttribute("history", historyList);
		model.addAttribute("list", list);
		model.addAttribute("categoryPageVO", ctgVO);
		model.addAttribute("paging", paging);
		return "list_result";
	}
	
	@RequestMapping(value = "sortPlaylist")
	public String sortPlaylist(HttpServletRequest request, CategoryPageVO ctgVO, Model model) {
		String hislst	= request.getParameter("historyList");
		String[] myHistory = new Gson().fromJson(hislst, String[].class);
		List<MovieContentVO> historyList = ovpService.getHistoryList(myHistory);
		List<MovieContentVO> list = ovpService.servicePlaylistSort(ctgVO);
		Paging paging = new Paging(ctgVO.getPageNum(), ctgVO.getTotalCount());
		model.addAttribute("paging", paging);
		model.addAttribute("categoryPageVO", ctgVO);
		model.addAttribute("list", list);
		model.addAttribute("history", historyList);
		return "list";
	}
	
	@RequestMapping(value = "regionPlaylist")
	public String selectRegionPlaylist(HttpServletRequest request, CategoryPageVO ctgVO, Model model) {
		String hislst	= request.getParameter("historyList");
		String[] myHistory = new Gson().fromJson(hislst, String[].class);
		List<MovieContentVO> list = ovpService.serviceRegionSort(ctgVO);
		List<MovieContentVO> historyList = ovpService.getHistoryList(myHistory);
		Paging paging = new Paging(ctgVO.getPageNum(), ctgVO.getTotalCount());
		model.addAttribute("paging", paging);
		model.addAttribute("categoryPageVO", ctgVO);
		model.addAttribute("list", list);
		model.addAttribute("history", historyList);
		return "list";
	}
	
	@RequestMapping(value = "regionSearch")
	public String selectRegionSearch(HttpServletRequest request, CategoryPageVO ctgVO, Model model) {
		System.out.println("ctgVO::" + ctgVO.getRegion());
		String hislst	= request.getParameter("historyList");
		String[] myHistory = new Gson().fromJson(hislst, String[].class);
		List<MovieContentVO> list = ovpService.serviceRegionFullSearch(ctgVO);
		List<MovieContentVO> historyList = ovpService.getHistoryList(myHistory);
		Paging paging = new Paging(ctgVO.getPageNum(), ctgVO.getTotalCount());
		model.addAttribute("paging", paging);
		model.addAttribute("categoryPageVO", ctgVO);
		model.addAttribute("list", list);
		model.addAttribute("history", historyList);
		return "list_result";
	}
}

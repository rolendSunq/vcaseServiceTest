package com.hankooktire.videobox.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.airensoft.skovp.vo.MovieContentVO;
import com.google.gson.Gson;
import com.hankooktire.videobox.service.OvpService;

@Controller
public class SearchController {
	@Autowired
	OvpService ovpService;
	
	@RequestMapping(value = "search")
	public String searchContent(Model model, @RequestParam("searchTitle") String searchTitle, @RequestParam("historyList") String historyList, HttpServletRequest request) {
		if (historyList.length() != 0) {
			String[] myHistory= new Gson().fromJson(historyList, String[].class);
			//########################## 페이징 처리 추가부분 [start] ########################## 
			String pageNum = request.getParameter("pageNum");//화면에 표시할 페이지번호
			if (pageNum == null) {//페이지번호가 없으면
				pageNum = "1";//1페이지의 내용이 화면에 표시
			}
			//########################## 페이징 처리 추가부분 [end] ########################## 
			List<String> originHistoryList = ovpService.getOriginList(myHistory);
			List<MovieContentVO> hisList = ovpService.getHistoryList(originHistoryList);
			model.addAttribute("pageNum", pageNum); //화면에 표시할 페이지번호
			model.addAttribute("history", hisList);
		}
		
		String sort = request.getParameter("sort"); //정렬을 위한 변수[Upload date, View count]
		if ( sort == null ) {
			sort = "title";
		}
		int totalCnt = ovpService.searchMovie(searchTitle, model, sort); //통합검색 
		model.addAttribute("totalCount", totalCnt); //총 갯수
		model.addAttribute("searchValue", searchTitle);
		return "list_result";
	}
	
}

package com.hankooktire.mams;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.airensoft.skovp.vo.MovieContentVO;
import com.google.gson.Gson;
import com.hankooktire.service.OvpService;

@Controller
public class SearchController {
	@Autowired
	OvpService ovpService;
	
	@RequestMapping(value = "search")
	public String searchContent(Model model, @RequestParam("searchTitle") String searchTitle, @RequestParam("historyList") String historyList) {
		if (historyList.length() != 0) {
			String[] myHistory= new Gson().fromJson(historyList, String[].class);
			List<String> originHistoryList = ovpService.getOriginList(myHistory);
			List<MovieContentVO> hisList = ovpService.getHistoryList(originHistoryList);
			model.addAttribute("history", hisList);
		}
		ovpService.searchMovie(searchTitle, model);
		model.addAttribute("searchValue", searchTitle);
		return "list_result";
	}
}

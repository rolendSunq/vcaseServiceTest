package com.hankooktire.service;

import java.util.List;

import org.springframework.ui.Model;

import com.airensoft.skovp.vo.MovieContentVO;

public interface OvpService {
	public void popularList(Model model);
	public String getThumbNailUrl(int contentId);
	public void searchMovie(String searchWord, Model model);
	public List<String> getOriginList(String[] trscdList);
	public List<MovieContentVO> getHistoryList(List<String> orginList);
}

package com.hankooktire.service;

import java.io.IOException;
import java.util.List;

import org.springframework.ui.Model;

import com.airensoft.skovp.vo.FileVO;
import com.airensoft.skovp.vo.MovieContentVO;

public interface OvpService {
	public void popularList(Model model);
	public String getThumbNailUrl(int contentId);
	public void searchMovie(String searchWord, Model model);
	public List<String> getOriginList(String[] trscdList);
	public List<MovieContentVO> getHistoryList(List<String> orginList);
	public void contentFileUpload(FileVO fileVO) throws IllegalStateException, IOException;
}

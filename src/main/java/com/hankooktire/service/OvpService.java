package com.hankooktire.service;

import org.springframework.ui.Model;

public interface OvpService {
	public void popularList(Model model);
	public String getThumbNailUrl(int contentId);
	public void searchMovie(String searchWord);
}

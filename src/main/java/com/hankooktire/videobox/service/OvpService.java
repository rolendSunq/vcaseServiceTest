package com.hankooktire.videobox.service;

import java.io.IOException;
import java.util.List;

import org.springframework.ui.Model;

import com.airensoft.skovp.vo.CategoryPageVO;
import com.airensoft.skovp.vo.FileVO;
import com.airensoft.skovp.vo.MovieContentVO;
import com.airensoft.skovp.vo.PlayListCountVO;
import com.airensoft.skovp.vo.ViewCountStatisticsVO;

public interface OvpService {
	public List<MovieContentVO> popularList(int displayCount);
	public String getThumbNailUrl(int contentId);
	public List<MovieContentVO> search(CategoryPageVO ctgVO);
	public List<String> getOriginList(String[] trscdList);
	public List<MovieContentVO> getHistoryList(String[] historyList);
	public String contentFileUpload(FileVO fileVO) throws IllegalStateException, IOException;
	public void setContentGroup(String name);
	public void getAllContentList(Model model);
	public List<ViewCountStatisticsVO> getViewCountContent(int page);
	public List<PlayListCountVO> getCountPlayListForContent();
	public List<MovieContentVO> getPlayListForContent(String playlist_id, String searchType, String search, String sort, Integer pageNum, Model model);
	public void goCategoryList(String playlist_id, int pageNum, String sort, Model model);
	public String deleteContentList(String list);
	public String contentBinding(String content_id, String category);
	public void searchPlaylistLIST(List<PlayListCountVO> playlist);
	public List<MovieContentVO> goPlaylistContentList(CategoryPageVO ctgVO);
	public void serviceDetailPageToListPage(CategoryPageVO ctgVO, Model model);
	public MovieContentVO serviceDetailPopular(String content_id);
	public void serviceViewCountASC(Model model);
	public void serviceCatalog(Model model);
	public String serviceDownloadFile(String content_id);
	public String serviceEditMetaInfo(CategoryPageVO ctgpVO);
	public List<MovieContentVO> serviceAllContent(CategoryPageVO ctgVO);
	public void servicePopularListPage(CategoryPageVO categoryPageVO, Model model);
	public String servicePlaylistFindName(String name);
	public List<MovieContentVO> serviceGetPlaylistContents(String playlist_id);
	public List<MovieContentVO> servicePlaylistSort(CategoryPageVO ctgVO);
	public List<MovieContentVO> serviceRegionSort(CategoryPageVO ctgVO);
	public List<MovieContentVO> serviceRegionFullSearch(CategoryPageVO ctgVO);
	public List<MovieContentVO> getSortSearchPlayListForContent(CategoryPageVO ctgVO);
}
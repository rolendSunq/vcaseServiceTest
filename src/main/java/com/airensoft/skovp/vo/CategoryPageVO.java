package com.airensoft.skovp.vo;
/**
 * list page VO
 */
public class CategoryPageVO  {
	private String region;
	private String sort;
	private String search;
	private String search_type;
	private int pageNum;
	private int totalCount;
	private String playlist_id;
	private String playlist_name;
	private String content_id;
	private String custom_id;
	private String category;
	private String title;
	private String description;
	private TagInfoVO tag;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public TagInfoVO getTag() {
		return tag;
	}
	public void setTag(TagInfoVO tag) {
		this.tag = tag;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getSort() {
		return sort = (sort == null || sort.equals("")) ? "reg_date" : sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getSearch_type() {
		return search_type;
	}
	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public String getPlaylist_id() {
		return playlist_id;
	}
	public void setPlaylist_id(String playlist_id) {
		this.playlist_id = playlist_id;
	}
	public String getPlaylist_name() {
		return playlist_name;
	}
	public void setPlaylist_name(String palylist_name) {
		this.playlist_name = palylist_name;
	}
	public String getContent_id() {
		return content_id;
	}
	public void setContent_id(String content_id) {
		this.content_id = content_id;
	}
	public String getCustom_id() {
		return custom_id;
	}
	public void setCustom_id(String custom_id) {
		this.custom_id = custom_id;
	}
	public String getCategory() {
		if (getPlaylist_id().equals("1300000253") || getPlaylist_id().equals("1300000252") || getPlaylist_id().equals("1300000251") || getPlaylist_id().equals("1300000245") || getPlaylist_id().equals("1300000244") || getPlaylist_id().equals("1300000243")) {
			return "Corporation";
		}
		if (getPlaylist_id().equals("1300000242") || getPlaylist_id().equals("1300000241") || getPlaylist_id().equals("1300000240") || getPlaylist_id().equals("1300000239") || getPlaylist_id().equals("1300000238") || getPlaylist_id().equals("1300000237")) {
			return "Advertisements";
		}
		if (getPlaylist_id().equals("1300000236") || getPlaylist_id().equals("1300000235") || getPlaylist_id().equals("1300000234") || getPlaylist_id().equals("1300000233") || getPlaylist_id().equals("1300000232") || getPlaylist_id().equals("1300000231")) {
			return "Products";
		}
		if (getPlaylist_id().equals("1300000230") || getPlaylist_id().equals("1300000229") || getPlaylist_id().equals("1300000228") || getPlaylist_id().equals("1300000227")) {
			return "Motosports";
		}
		if (getPlaylist_id().equals("1300000226") || getPlaylist_id().equals("1300000225") || getPlaylist_id().equals("1300000224") || getPlaylist_id().equals("1300000223") || getPlaylist_id().equals("1300000222") || getPlaylist_id().equals("1300000221")) {
			return "Events";
		}
		if (getPlaylist_id().equals("1300000220") || getPlaylist_id().equals("1300000219")) {
			return "Others";
		}
		return this.category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}

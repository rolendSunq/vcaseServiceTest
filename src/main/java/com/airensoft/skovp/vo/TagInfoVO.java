package com.airensoft.skovp.vo;

public class TagInfoVO {
	private String category;
	private String year;
	private String type;
	private String region;
	private String official;
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getOfficial() {
		return official;
	}
	public void setOfficial(String official) {
		this.official = official;
	}
	
	@Override
	public String toString() {
		StringBuffer stb = new StringBuffer();
		stb.append("catetory: " + getCategory() + "\r\n");
		stb.append("year: " + getYear() + "\r\n");
		stb.append("type: " + getType() + "\r\n");
		stb.append("region: " + getRegion() + "\r\n");
		stb.append("official: " + getOfficial() + "\r\n");
		return stb.toString();
	}
}

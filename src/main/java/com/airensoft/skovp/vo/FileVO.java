package com.airensoft.skovp.vo;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
	private String name, category, title, year, fileName, type, region, official, description, content_id, custom_id;
	private MultipartFile file;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
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
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("file name: " + getFileName() + "\r\n");
		sb.append("category: " + getCategory() + "\r\n");
		sb.append("title: " + getTitle() + "\r\n");
		sb.append("year: " + getYear() + "\r\n");
		sb.append("type: " + getType() + "\r\n");
		sb.append("region: " + getRegion() + "\r\n");
		sb.append("official: " + getOfficial() + "\r\n");
		sb.append("description: " + getDescription() + "\r\n");
		sb.append("content_id: " + getContent_id() + "\r\n");
		sb.append("customId: " + getCustom_id() + "\r\n");
		return sb.toString();
	}
}

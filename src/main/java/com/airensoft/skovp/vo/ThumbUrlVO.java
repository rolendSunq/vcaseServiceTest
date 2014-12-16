package com.airensoft.skovp.vo;
/**
 * 동영상의 특정 시간대의 영상을 이미지로 만든 것을 저장하는 객체
 * URL 주소를 저장한다.
 * @author DFLUX C&C
 * 
 */
public class ThumbUrlVO {
	private String download_url;

	public String getDownload_url() {
		return download_url;
	}
	
	
	public void setDownload_url(String download_url) {
		this.download_url = download_url;
	}
	
	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("thumb_url: " + getDownload_url());
		return sb.toString();
	}


}

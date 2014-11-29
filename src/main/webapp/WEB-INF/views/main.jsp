<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<meta http-equiv="Expires" content="0" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
		<title>한국타이어</title>
		<link rel="Stylesheet" type="text/css" href="./resources/common/css/common.css" />
	</head>
	<body>
		<div class="wrapper">
			<!--Upload 팝업-->
		    <div class="upload_popup_wrap">
		        <div class="upload_popup_con">
		            <div class="popup_title">Upload <span><a id="uploadClose"><img src="./resources/images/common/popup_close_btn.png" alt="닫기"/></a></span></div>
		            <form id="uploadForm" method="post" action="video/fileUpload" enctype="multipart/form-data">
		                <div class="popup_form">
		                    <ul>
		                        <li class="form_file mb45">
		                            <p class="mb10 title">File</p>
		                            <!--<p><input type="file" name="" id="" src="./resources/images/common/file_search_btn.png"/></p>-->
		                            <div>
		                                <input type="text" class="file_input_txtbox value_control" readonly="readonly" id="videoFile" name="fileName" value="">
		                                <div class="file_input_div">
		                                    <img src="./resources/images/common/file_search_btn.png" alt="파일찾기">
		                                    <input type="file" class="file_input_hidden" name="file" id="hidVideoFile" value="" onchange="javascript: document.getElementById('videoFile').value=this.value">
		                                </div>
		                            </div>
		                        </li>
		                        <li class="mb10">
		                            <p class="mb10">Title</p>
		                            <p><input type="text" name="title" id="videoTitle"/></p>
		                        </li>
		                        <li class="mb25">
		                            <p class="mb10">Category</p>
		                            <p>
		                                <select name="category" id="category">
		                                	<optgroup label="Corporation">
		                                    	<option value="Company">Company</option>
		                                    	<option value="Company (RAW)">Company (RAW)</option>
		                                    	<option value="Culture">Culture</option>
		                                    	<option value="Culture (RAW)">Culture (RAW)</option>
		                                    	<option value="TV Footages">TV Footages</option>
		                                    	<option value="TV Footages (RAW)">TV Footages (RAW)</option>
		                                	</optgroup>
		                                	<optgroup label="Advertisements">
		                                    	<option value="TVC">TVC</option>
		                                    	<option value="TVC (RAW)">TVC (RAW)</option>
		                                    	<option value="Campaign">Campaign</option>
		                                    	<option value="Campaign (RAW)">Campaign (RAW)</option>
		                                    	<option value="Sports Marketing">Sports Marketing</option>
		                                    	<option value="Sports Marketing (RAW)">Sports Marketing (RAW)</option>
		                                	</optgroup>
		                                	<optgroup label="Products">
		                                    	<option value="HanKook Tire">HanKook Tire</option>
		                                    	<option value="HanKook Tire (RAW)">HanKook Tire (RAW)</option>
		                                    	<option value="Other Brand">Other Brand</option>
		                                    	<option value="Other Brand (RAW)">Other Brand (RAW)</option>
		                                    	<option value="Technoloagy">Technoloagy</option>
		                                    	<option value="Technoloagy (RAW)">Technoloagy (RAW)</option>
		                                	</optgroup>
		                                	<optgroup label="Motosports">
		                                    	<option value="Europe">Europe</option>
		                                    	<option value="Europe (RAW)">Europe (RAW)</option>
		                                    	<option value="Other Motosports">Other Motosports</option>
		                                    	<option value="Other Motosports (RAW)">Other Motosports (RAW)</option>
		                                	</optgroup>
		                                	<optgroup label="Events">
		                                    	<option value="Exhibition">Exhibition</option>
		                                    	<option value="Exhibition (RAW)">Exhibition (RAW)</option>
		                                    	<option value="Promotion">Promotion</option>
		                                    	<option value="Promotion (RAW)">Promotion (RAW)</option>
		                                    	<option value="Other Event">Other Event</option>
		                                    	<option value="Other Event (RAW)">Other Event (RAW)</option>
		                                	</optgroup>
		                                	<optgroup label="Others">
		                                    	<option value="Other">Other</option>
		                                    	<option value="Other (RAW)">Other (RAW)</option>
		                                	</optgroup>
		                                </select>
		                            </p>
		                        </li>
		                        <li class="width202">
		                            <span>Year</span>
		                            <select name="year" id="year">
		                                <option value="2014">2014</option>
		                                <option value="2013">2013</option>
		                                <option value="2012">2012</option>
		                                <option value="2011">2011</option>
		                                <option value="2010 before">2010 before</option>
		                            </select>
		                        </li>
		                        <li class="width202 ml20 right">
		                            <span>Type</span>
		                            <select name="type" id="type">
		                                <option value="Hankook Tire Official">Hankook Tire Official</option>
		                                <option value="Unofficial">Unofficial</option>
		                            </select>
		                        </li>
		                        <li class="width202 mb25">
		                            <span>Region</span>
		                            <select name="region" id="region">
		                                <option value="Europe">Europe</option>
										<option value="America">America</option>
										<option value="Middle East & Africa">Middle East & Africa</option>
										<option value="Asia-Pacific">Asia-Pacific</option>
										<option value="China">China</option>
										<option value="Korea">Korea</option>
		                            </select>
		                        </li>
		                        <li class="width202 radio right">
		                            <label for="video">Finalized Video</label> <input type="radio" name="official" value="Finalized Video"/>
		                            <label for="data">Raw Data</label> <input type="radio" name="official" value="Raw Data"/>
		                        </li>
		                        <li class="form_info">
		                            <p class="mb10">Info</p>
		                            <p>
		                                <textarea name="description" id="info" cols="30" rows="10"></textarea>
		                            </p>
		                        </li>
		                    </ul>
		                    <p class="up_btn_con"><a id="pushTheUpload"><img src="./resources/images/common/upload_btn.png" alt="upload"/></a></p>
		                </div>
		            </form>
		        </div>
		    </div>
		    <!--//Upload 팝업-->
		    <!-- Download 팝업 -->
		    <div class="download_popup_wrap">
		        <div class="download_popup_con">
		            <div class="popup_title">
		                <div class="mb20">
		                    <p class="mb10">RA33_Dynapro HP2_Motion Graphic Graphic Graphic Graphic</p>
		                    <p><span>ID :</span> 2014cvrw001800000255 </p>
		                </div>
		                <span><a><img src="./resources/images/common/popup_close_btn.png" alt="닫기"/></a></span>
		            </div>
		            <div class="download_con">
		                <p><img src="./resources/images/common/down_title.png" alt="download"/></p>
		                <ul>
		                    <li><a><img src="./resources/images/common/down_mp4.png" alt="mp4"/></a></li>
		                    <li><a><img src="./resources/images/common/down_avi.png" alt="avi"/></a></li>
		                    <li><a><img src="./resources/images/common/down_mov.png" alt="mov"/></a></li>
		                    <li><a><img src="./resources/images/common/down_flv.png" alt="flv"/></a></li>
		                    <li><a><img src="./resources/images/common/down_mpeg.png" alt="mpeg"/></a></li>
		                    <li><a><img src="./resources/images/common/down_wmv.png" alt="wmv"/></a></li>
		                </ul>
		            </div>
		            <div class="detail_con">
		                <p><img src="./resources/images/common/detail_title.png" alt="detail"/></p>
		                <ul>
		                    <li>
		                        <p>Size : 1280x720 HD 408MB</p>
		                        <p>Video Format : MP4</p>
		                        <p>Video Codec : h264</p>
		                        <p>Video bps : 256478</p>
		                        <p>Video fps :29</p>
		                    </li>
		                    <li>
		                        <p>Audio Codec :aac</p>
		                        <p>Audio bps :235478</p>
		                        <p>Audio channel : 2</p>
		                        <p>Audio Hz : 44100</p>
		                    </li>
		                </ul>
		            </div>
		        </div>
		    </div>
		    <!--// Download 팝업 -->
	        <!-- my movie -->
	        <div class="my_movie">
	        	<div class="my_movie_off">
	            	<a id="myMovies">my movie 페이지 열기m</a>
	            </div>
	        	<div class="my_movie_on">
	            	<div class="my_movie_bg">
	                	<div class="my_movie_con">
	                    	<div class="my_movie_close">
	                    		<a>close</a>
	                        </div>
	                        <div class="my_movie_user">
	                        	<span>Hi! jihong Min</span>
	                        </div>
	                        <div class="my_movie_wh">
	                        	<dl id="hislst">
		                        	<dt>Watch History</dt>
	                        	</dl>
	                        </div>
	                        <div class="my_movie_db">
	                        	<a class="dow" id="mamsDownload">DOWNLOAD<span id="downloadCnt">0</span></a>
	                            <a class="book" id="mamsBookmark">BOOKMARK<span id="bookmarkCnt">0</span></a>
	                        </div>
	                    </div>
	                	<div class="mm_footer">Copyright 2014 Hankook Tire Co., Ltd.  All rights Reserved. HANKOOK</div>
	                </div>
	            </div>
	        </div>
	        <!-- //my movie -->
			<!-- header_wrap -->
			<div class="header_wrap">
				<!-- header -->
				<div id="header">
					<!-- header_top -->
					<div class="header_top"> 
						<h1>
							<a>
								<img id="hankookHome" src="./resources/images/common/img_logo.png" alt="Hankook - driving emotion" />
								<img id="mamsHome" src="./resources/images/common/img_logo2.png" alt="Digital Library MAMs" />
							</a>
						</h1>
						<div class="util_navi">
							<ul>
								<li class="util1"><a>동영상</a></li>
								<li class="util2"><a>홈</a></li>
							</ul>
						</div>
						<p>This is operated by hankook tire in the digital library movie </p>
						
					</div>
					<!-- //header_top end -->
					<!-- header_bottom -->
					<div class="header_bottom">
						<div class="header_search">
	                    	<form class="search_form" method="post" action="search">
	                    		<label for="search" class="hide">아이디</label>
								<input type="text" id="search" name="searchTitle" class="search_go" />
	                            <button class="search_btn">search</button>
	                        </form>
	                    </div>
						<div class="personal_menu">
							<ul>
								<li class="p_menu1"><a id="admin">설정</a></li>
								<li class="p_menu2"><a id="upload">업로드</a></li>
								<li class="p_menu3"><a id="logout">로그아웃</a></li>
							</ul>
						</div>
					</div>
					<!-- //header_bottom end -->
					<!-- gnb -->
					<div id="gnb">
						<ul>
							<li class="first menu menu1">
	                        	<a class="pad0">Corporation</a>
	                        	<div>
		                        	<div>
		                        		<ul class="depth2">
		                        			<li><a>Company</a></li>
		                        			<li><a>Company (RAW)</a></li>
		                        			<li><a>Culture</a></li>
		                        			<li><a>Culture (RAW)</a></li>
		                        			<li><a>TV Footages</a></li>
		                        			<li><a>TV Footages (RAW)</a></li>
		                        		</ul>
		                        	</div>
	                        	</div>
	                        </li>
							<li class="menu menu2">
	                        	<a class="pad1">Advertisements</a>
	                        	<div>
		                        	<div>
		                        		<ul class="depth2">
		                        			<li><a>TVC</a></li>
		                        			<li><a>TVC (RAW)</a></li>
		                        			<li><a>Campaign</a></li>
		                        			<li><a>Campaign (RAW)</a></li>
		                        			<li><a>Sports Marketing</a></li>
		                        			<li><a>Sports Marketing (RAW)</a></li>
		                        		</ul>
		                        	</div>
	                        	</div>
	                        </li>
							<li class="menu menu3">
	                        	<a class="pad2">Products</a>
	                        	<div>
		                        	<div>
		                        		<ul class="depth2">
		                        			<li><a>HanKook Tire</a></li>
		                        			<li><a>HanKook Tire (RAW)</a></li>
		                        			<li><a>Other Brand</a></li>
		                        			<li><a>Other Brand (RAW)</a></li>
		                        			<li><a>Technoloagy</a></li>
		                        			<li><a>Technoloagy (RAW)</a></li>
		                        		</ul>
		                        	</div>
	                        	</div>
	                        </li>
							<li class="menu menu4">
	                        	<a class="pad3">Motorsports</a>
	                        	<div>
		                        	<div>
		                        		<ul class="depth2">
		                        			<li><a>Europe</a></li>
		                        			<li><a>Europe (RAW)</a></li>
		                        			<li><a>Other Motosports</a></li>
		                        			<li><a>Other Motosports (RAW)</a></li>
		                        		</ul>
		                        	</div>
	                        	</div>
	                        </li>
							<li class="menu menu5">
	                        	<a class="pad4">Events</a>
	                        	<div>
		                        	<div>
		                        		<ul class="depth2">
		                        			<li><a>Exhibition</a></li>
		                        			<li><a>Exhibition (RAW)</a></li>
		                        			<li><a>Promotion</a></li>
		                        			<li><a>Promotion (RAW)</a></li>
		                        			<li><a>Other Event</a></li>
		                        			<li><a>Other Event (RAW)</a></li>
		                        		</ul>
		                        	</div>
	                        	</div>
	                        </li>
							<li class="last menu menu6">
	                        	<a class="pad5">Others</a>
	                        	<div>
		                        	<div>
		                        		<ul class="depth2">
		                        			<li><a>Other</a></li>
		                        			<li><a>Other (RAW)</a></li>
		                        		</ul>
		                        	</div>
	                        	</div>
	                        </li>
						</ul>
					</div>
					<!-- //gnb -->
				</div>
				<!-- //header end -->
			</div>
			<!-- //header_wrap end -->
			<!-- content_wrap -->
			<div class="content_wrap">
				<div id="content">
	            	<!-- Updated Movie -->
	            	<div class="latest mlr56">
	            		<h2>Updated Movie</h2>
	                	<div class="latest_movie" id="latestMovie" style="position:relative; z-index:1;"></div>
	                    <div class="latest_info">
	                        <h3 id="playTitle">${oneStreamPlay.title }</h3>
	                        <p id="playTimeDate">${oneStreamPlay.duration }  /  ${oneStreamPlay.reg_date}</p>
	                        <ul class="latest_info_con">
		                        <li><span>Category&nbsp;&gt;&nbsp;</span>Product Movie</li>
	                            <li><span>ID&nbsp;:&nbsp;</span><span id="playContentId">${oneStreamPlay.content_id }</span></li>
	                            <li id="playNation"><span>Region&nbsp;:&nbsp;</span>U.S.A</li>
	                            <li id="playTag"><span>Tag&nbsp;:&nbsp;</span>Tire,  Dynapro HP2, RA33</li>
	                            <li id="playVideoUrl"><span>Copy Video URL&nbsp;:&nbsp;</span>DO NOT SURPPORTED</li>
	                        </ul>
	                        <hr />
	                        
	                        <ul class="latest_thumbnail">
	                        	<!-- thumb loop -->
	                        	<c:forEach var="object" items="${list }" end="2" varStatus="status">
	                        		<c:choose>
	                        		<c:when test="${status.count != 3 }">
	                        	<li class="mr22">
	                            	<a id="latestMov" data-contentId="${object.content_id}" data-streamingUrl="${object.streamingUrl}" data-thumbUrl="${object.thumb_url}" data-title="${object.title}" data-dateNReg="${object.duration} / ${object.reg_date }" data-category="" data-region="" data-tag="" data-copyUrl="">
	                                	<span>
	                                		<img width="153px" height="85" src="${object.thumb_url}" alt="" />
	                                    	<span class="video-time">${object.duration}</span>
	                                    	<c:choose>
	                                    	<c:when test="${status.count == 1 }">
	                                    	<span class="on"></span> 
	                                    	</c:when>
	                                    	<c:otherwise>
	                                    	<span class="off"></span> 
	                                    	</c:otherwise>
	                                    	</c:choose>
	                                    	
	                                    </span>
	                                </a>
	                                <c:choose>
									<c:when test="${fn:length(object.title) > 12}">
									<h3 class="thumbTitle">${fn:substring(object.title, 0, 12)}...</h3>
									</c:when>
									<c:otherwise>
									<h3 class="thumbTitle">${object.title}</h3>
									</c:otherwise>
									</c:choose>
	                            </li>
	                        		</c:when>
	                        		<c:otherwise>
	                            <li id="content_item">
	                            	<a id="latestMov" data-contentId="${object.content_id}" data-streamingUrl="${object.streamingUrl}" data-thumbUrl="${object.thumb_url}" data-title="${object.title}" data-dateNReg="${object.duration} / ${object.reg_date }" data-category="" data-region="" data-tag="" data-copyUrl="">
	                                	<span>
	                                    	<img width="153px" height="85" src="${object.thumb_url}" alt="" />
	                                        <span class="video-time">${object.duration}</span>
	                                        <span class="off"></span> 
	                                    </span>
	                                </a>
	                                <c:choose>
									<c:when test="${fn:length(object.title) > 12}">
									<h3 class="thumbTitle">${fn:substring(object.title, 0, 12)}...</h3>
									</c:when>
									<c:otherwise>
									<h3 class="thumbTitle">${object.title}</h3>
									</c:otherwise>
									</c:choose>
	                            </li>
	                        		</c:otherwise>
	                        		</c:choose>
	                            </c:forEach>
	                            <!-- thumb loop end -->
	                        </ul>
	                	</div>
	                </div>
	                <!-- //Updated Movie -->
	                
	                <!-- popular movie -->
	                <div class="popular_movie">
	                	<h2>Popular Movie<span>Popular on Hankookrire movie</span></h2>
	                    <ul class="thumbnail">
	                    	<c:forEach var="popularObject" items="${popularList }" end="4" varStatus="status">
	                    	<c:choose>
	                    		<c:when test="${status.count < 4}">
	                    	<li class="mr24">
	                        	<a id="popularMov" data-contentId="${popularObject.getContent_id() }" data-thumbUrl="${popularObject.getThumb_url() }">
	                            	<span>
	                                	<img width="196px" height="110px" src="${popularObject.getThumb_url() }" alt="" />
	                                    <span class="video-time">${popularObject.getDuration() }</span>
	                                    <span class="admin_icon"><img src="./resources/images/common/icon_admin.png" alt="admin" /></span>
	                                </span>
	                            </a>
	                            <span>Corporation</span>
	                            <c:choose>
								<c:when test="${fn:length(popularObject.getTitle()) > 37}">
								<h3><a>${fn:substring(popularObject.getTitle(), 0, 37)}...</a></h3>
								</c:when>
								<c:otherwise>
								<h3><a>${popularObject.getTitle()}</a></h3>
								</c:otherwise>
								</c:choose>
	                            <span>${popularObject.getView_count() } views</span>
	                            <span class="f_left">${popularObject.getReg_date() }</span>
	                            <span class="f_right mr5"><a class="download_btn" data-contentId="${popularObject.getContent_id() }"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
	                        </li>
	                    		</c:when>
	                    		<c:when test="${status.count == 4 }">
	                        <li class="mr23">
	                        	<a id="popularMov" data-contentId="${popularObject.getContent_id() }" data-thumbUrl="${popularObject.getThumb_url() }">
	                            	<span>
	                                	<img width="196px" height="110px" src="${popularObject.getThumb_url() }" alt="" />
	                                    <span class="video-time">${popularObject.getDuration() }</span>
	                                </span>
	                            </a>
	                            <span>Corporation</span>
	                            <c:choose>
								<c:when test="${fn:length(popularObject.getTitle()) > 37}">
								<h3><a>${fn:substring(popularObject.getTitle(), 0, 37)}...</a></h3>
								</c:when>
								<c:otherwise>
								<h3><a>${popularObject.getTitle()}</a></h3>
								</c:otherwise>
								</c:choose>
	                            <span>${popularObject.getView_count() } views</span>
	                            <span class="f_left">${popularObject.getReg_date() }</span>
	                            <span class="f_right mr5"><a class="download_btn" data-contentId="${popularObject.getContent_id() }"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
	                        </li>
	                    		</c:when>
	                    		<c:otherwise>
	                    	<li>
	                        	<a id="popularMov" data-contentId="${popularObject.getContent_id() }" data-thumbUrl="${popularObject.getThumb_url() }">
	                            	<span>
	                                	<img width="196px" height="110px" src="${popularObject.getThumb_url() }" alt="" />
	                                    <span class="video-time">${popularObject.getDuration() }</span>
	                                </span>
	                            </a>
	                            <span>Corporation</span>
	                            <c:choose>
								<c:when test="${fn:length(popularObject.getTitle()) > 37}">
								<h3><a>${fn:substring(popularObject.getTitle(), 0, 37)}...</a></h3>
								</c:when>
								<c:otherwise>
								<h3><a>${popularObject.getTitle()}</a></h3>
								</c:otherwise>
								</c:choose>
	                            <span>${popularObject.getView_count() } views</span>
	                            <span class="f_left">${popularObject.getReg_date() }</span>
	                            <span class="f_right mr5"><a class="download_btn" data-contentId="${popularObject.getContent_id() }"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
	                        </li>
	                    		</c:otherwise>
	                    	</c:choose>
	                        </c:forEach>
	                    </ul>
	                </div>
	                <!-- //popular movie -->
	                <!-- category -->
	                <div class="category">
	                    <!-- 탭메뉴_대분류 -->
	                    <ul class="tab01" id="">
	                        <li class="mr116"><a><img src="./resources/images/common/bottom_tap00_on.png" alt="Corporation"/></a></li>
	                        <li class="mr111"><a><img src="./resources/images/common/bottom_tap01_off.png" alt="Advertisement"/></a></li>
	                        <li class="mr116"><a><img src="./resources/images/common/bottom_tap02_off.png" alt="Products"/></a></li>
	                        <li class="mr112"><a><img src="./resources/images/common/bottom_tap03_off.png" alt="Motorsports"/></a></li>
	                        <li class="mr115"><a><img src="./resources/images/common/bottom_tap04_off.png" alt="Events"/></a></li>
	                        <li><a><img src="./resources/images/common/bottom_tap05_off.png" alt="Others"/></a></li>
	                    </ul>
	                    <!-- //탭메뉴_대분류 End -->
	                    <!-- 탭메뉴_소분류 -->
	                    <ul class="tab02 on">
	                        <li class="on"><a>Company</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Company (RAW)</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Culture</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Culture (RAW)</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>TV Footages</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>TV Footages (RAW)</a></li>
                    	</ul>
                    	<ul class="tab02">
	                        <li class="on"><a>TVC</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>TVC (RAW)</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Campaign</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Campaign (RAW)</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Sports Marketing</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Sports Marketing (RAW)</a></li>
                    	</ul>
	                    <ul class="tab02">
	                        <li class="on"><a>HanKook Tire</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>HanKook Tire (RAW)</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Other Brand</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Other Brand (RAW)</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Technoloagy</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Technoloagy (RAW)</a></li>
	                    </ul>
	                    <ul class="tab02">
	                        <li class="on"><a>Europe</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Europe (RAW)</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Other Motosports</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Other Motosports (RAW)</a></li>
	                    </ul>
	                    <ul class="tab02">
	                        <li class="on"><a>Exhibition</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Exhibition (RAW)</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Promotion</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Promotion (RAW)</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Other Event</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Other Event (RAW)</a></li>
	                    </ul>
	                    <ul class="tab02">
	                        <li class="on"><a>Other</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a>Other (RAW)</a></li>
	                    </ul>
                    	<!-- //탭메뉴_소분류 End -->
	                    <ul class="category_slide">
	                    	<c:forEach var="corporation" items="${list }" end="10" varStatus="status">
	                        <li class="slide">
	                            <a id="corpMov" data-contentId="${corporation.content_id }" data-thumbUrl="${corporation.thumb_url }">
	                            	<span>
	                                	<img width="196px" height="110px" src="${corporation.thumb_url }" alt="" />
	                                    <span class="video-time">${corporation.duration }</span>
	                                </span>
	                            </a>
	                            <span>Corporation</span>
	                            <c:choose>
								<c:when test="${fn:length(corporation.title) > 37}">
								<h3><a>${fn:substring(corporation.title, 0, 37)}...</a></h3>
								</c:when>
								<c:otherwise>
								<h3><a>${corporation.title}</a></h3>
								</c:otherwise>
								</c:choose>
	                            <span class="f_left">${corporation.reg_date }</span>
	                            <span class="f_right mr5"><a class="download_btn" data-contentId="${corporation.content_id }"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
	                        </li>
	                        </c:forEach>
	                    </ul>
	                </div>
	                <!-- //category -->
				</div>
			</div>
			<!-- //content_wrap end -->
			<!-- footer_wrap -->
			<div class="footer_wrap">
	
				<!-- footer -->
				<div id="footer">
					<h2><img src="./resources/images/common/img_logo_bottom.gif" alt="Hankook - driving emotion" /></h2>
					<div class="footer_navi">
						<ul>
							<li><a>Digital library</a></li>
							<li><a>Digital library lite</a></li>
							<li><a>Hankooktire Global Site</a></li>
						</ul>
						<p class="copyright">
							Copyright ⓒ Hankook Tire. All Rights Reserved.
						</p>
					</div>
				</div>
				<!-- //footer end -->
	
			</div>
			<!-- //footer_wrap end -->
	        
	        <!-- download layer -->
	    	<div class="dow_layer">
	        	<div class="dow_layer_con">
	            	<ul>
	                	<li class="mb5">ID : </li>
	                    <li>region : korea</li>
	                </ul>
	                <hr />
	                <dl class="download">
	                	<dt id="downloadUrl">DOWNLOAD</dt>
	                	<!-- 
	                    <dd>
	                    	<a>
	                    		<img src="./resources/images/common/icon_mov.png" alt="download" />RA33_Dynapro HP2_Motion Graphic(ENG).mov
	                    	</a>
	                    </dd>
	                    <dd><a><img src="./resources/images/common/icon_wmv.png" alt="download" />RA33_Dynapro HP2_Motion Graphic(ENG).wmv</a></dd>
	                    <dd><a><img src="./resources/images/common/icon_mp4.png" alt="download" />RA33_Dynapro HP2_Motion Graphic(ENG).mp4</a></dd>
	                    <dd><a><img src="./resources/images/common/icon_mpeg.png" alt="download" />RA33_Dynapro HP2_Motion Graphic(ENG).mpeg</a></dd>
	                    <dd><a><img src="./resources/images/common/icon_avi.png" alt="download" />RA33_Dynapro HP2_Motion Graphic(ENG).avi</a></dd>
	                    <dd><a><img src="./resources/images/common/icon_flv.png" alt="download" />RA33_Dynapro HP2_Motion Graphic(ENG).flv</a></dd>
	                	 -->
	                </dl>
	                <hr />
	                <dl class="file_info">
	                	<dt>fILE INFO</dt>
	                    <dd id="contentType">Contents Type : Video</dd>
	                    <dd>Scale : the base rate</dd>
	                    <dd id="size">Size : 1280x720 HD 408MB</dd>
	                    <dd id="videoFormat">Video Format : MP4</dd>
	                    <dd id="videoCodec">Video Codec : h264</dd>
	                    <dd id="videoBps">Video bps : 256478</dd>
	                    <dd id="videoFps">Video fps : 29</dd>
	                    <dd id="audioCodec">Audio Codec : aac</dd>
	                    <dd id="audioBps">Audio bps : 235478</dd>
	                    <dd id="channel">Audio channel : 2</dd>
	                    <dd id="hz">Audio Hz : 44100</dd>
	                </dl>
	                <a class="dow_layer_close">close</a>
	            </div>
	        </div>
	        <!-- //download layer -->
	        <!-- ####TEST#### -->
			<div id="uploader" class="content_wrap">
				<div class="content">
					<!-- playlist Add -->
					<input type="text" name="groupName" id="groupName">
					<button id="plstAdder">콘텐트그룹추가</button>
				</div>
			</div>
	        <!-- ####TEST#### -->
		</div>
		<script type="text/javascript" src="./resources/common/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="./resources/common/js/jquery.ui.all.js"></script>
	    <script type="text/javascript" src="./resources/common/js/jquery.bxslider.min.js"></script>
	    <script type="text/javascript" src="./resources/common/js/jquery.cookies.2.2.0.min.js"></script>
	    <script type="text/javascript" src="./resources/common/js/common.js"></script>
	    <script type="text/javascript">
	    	$(document).ready(function(){
	    		// 수정된 sub menu 
	    		var tabList = $('.tab01 li');
	    	    var smallTabList = $('.tab02 li');
	    	    var tabMenuList = $('.tab02');
	    	    var tabIndex = 0;
	    	    var smallTabIndex = 0;
	    	    var prevTabIndex = 0;
	    	    var tabImagePath = "./resources/images/common/bottom_tap0";

	    	    tabList.on('click', function() {
	    	        tabIndex = tabList.index(this);
	    	        indexControl();
	    	    });

	    	    smallTabList.on("click", function(){
	    	        smallTabIndex = smallTabList.index(this);
	    	        smallTabList.removeClass("on");
	    	        $(smallTabList[smallTabIndex]).addClass("on");
	    	    });
	    	    
	    	    function indexControl() {
	    	        $(tabList[prevTabIndex]).find('img').attr('src', tabImagePath + prevTabIndex + "_off.png");
	    	        tabMenuList.removeClass('on');
	    	        $(tabList[tabIndex]).find('img').attr('src', tabImagePath + tabIndex + "_on.png");
	    	        $(tabMenuList[tabIndex]).addClass('on');
	    	        $(tabMenuList[tabIndex]).find("li").removeClass("on");
	    	        $(tabMenuList[tabIndex]).find("li:first-child").addClass("on");
	    	        prevTabIndex = tabIndex;
	    	    }
	    	    
	    		if ($.cookies.get('mamsCookie') != null || $.cookies.get('mamsCookie') != 'undefined') {
	    			var i 			= 0;
	    			var contentId 	= null;
	    			var title 		= null;
	    			var thumbUrl 	= null;
	    			var streamingUrl= null;
	    			var aEle		= null;
	    			var ddEle		= null;
	    			var mamsCook 	= $.cookies.get('mamsCookie');
	    			var contentIdList = JSON.stringify(mamsCook.myHistory);
		    		$.getJSON('mamsHistoryList', {'contentIdList':contentIdList}, function(data) {
		    			for (i; i < data.length; i = i + 1) {
		    				contentId 	= data[i].content_id;
		    				title 		= decodeURI(data[i].title);
		    				title 		= title.replace(/\+/gi, ' ');
		    				thumbUrl 	= data[i].thumb_url;
		    				streamingUrl= data[i].streamingUrl;
		    				if (title.length > 23) {
		    					title = title.substring(0, 20) + '...';
		    				}
			    			aEle = $('<a id="hisAtag" data-contentId=' + contentId + ' data-thumbUrl=' + thumbUrl + ' data-streamingUrl=' + streamingUrl + '></a>').append('<img width="25px" height="14px" src=' + thumbUrl + '>' + title);
							ddEle = $('<dd></dd>').append(aEle);
							$('#hislst').append(ddEle);
		    			}
		    		});
	    		}
	    		$("#latestMovie").empty();
				$("#latestMovie").append(
					"<object data=\"http://vcase.myskcdn.com/static/ovp/ovp.swf\" name=\"ovp\" id=\"ovp\" type=\"application/x-shockwave-flash\" align=\"middle\" width=\"520\" height=\"292\" >" +
						"<param value=\"high\" name=\"quality\">" + 
						"<param value=\"#000000\" name=\"bgcolor\">" +
						"<param value=\"always\" name=\"allowscriptaccess\">" +
						"<param value=\"true\" name=\"allowfullscreen\">" +
						"<param value=\"transparent\" name=\"wmode\">" +
						"<param value=\"apiUrl=http://api.vcase.myskcdn.com" + 
									"&mediaUrl=" + encodeURIComponent("${oneStreamPlay.streamingUrl}") +
									"&title=${oneStreamPlay.title}" +
									"&thumbUrl=" + encodeURIComponent("${oneStreamPlay.thumb_url}") +
									"&pid=${player_id}" +
									"&autoPlay=true\" name=\"flashvars\">"+
					"</object>"
				);

				$('.thumbTitle').css({'font-size':'12px','font-weight':'bold','line-height':'16px','color':'#513e1f'});

				// Update Movie thumb nail click
				$('a[id="latestMov"]').click(function() {
					var mamCook		= null;
					var title 		= null;
					var contentId	= null;
					var streamingUrl= null;
					var thumbUrl	= null;
					var dateNReg 	= null;
					var category 	= null;
					var region		= null;
					var tag			= null;
					var clickRound	= null;
					title 		= $(this).attr('data-title');
					dateNReg 	= $(this).attr('data-dateNReg');
					streamingUrl= $(this).attr('data-streamingUrl');
					thumbUrl	= $(this).attr('data-thumbUrl');
					dateNReg	= $(this).attr('data-dateNReg');
					contentId	= $(this).attr('data-contentId');
					mamCook = $.cookies.get('mamsCookie');
					if (!validCookieContent.isExistContentId(mamCook.myHistory, contentId)) {
						mamCook.myHistory.push(contentId);
						$.cookies.set('mamsCookie', JSON.stringify(mamCook));
					}
					$('span[class="on"]').prop('class', 'off');
					clickRound = $(this).find('.off');
					clickRound.prop('class', 'on');
					$('#playTitle').text(title);
					$('#playTimeDate').text(dateNReg);
					$('#playContentId').text(contentId);
					$("#latestMovie").empty();
					$("#latestMovie").append(
						"<object data=\"http://vcase.myskcdn.com/static/ovp/ovp.swf\" name=\"ovp\" id=\"ovp\" type=\"application/x-shockwave-flash\" align=\"middle\" width=\"520\" height=\"292\" >" +
							"<param value=\"high\" name=\"quality\">" + 
							"<param value=\"#000000\" name=\"bgcolor\">" +
							"<param value=\"always\" name=\"allowscriptaccess\">" +
							"<param value=\"true\" name=\"allowfullscreen\">" +
							"<param value=\"transparent\" name=\"wmode\">" +
							"<param value=\"apiUrl=http://api.vcase.myskcdn.com" + 
										"&mediaUrl=" + encodeURIComponent(streamingUrl) +
										'&title=${oneStreamPlay.title}' +
										"&thumbUrl=" + encodeURIComponent(thumbUrl) +
										"&pid=${player_id}" +
										"&wmode=transparent" +
										"&autoPlay=true\" name=\"flashvars\">"+
						"</object>"
					);
				});

				// popular Movie, corperation Moview thumb nail 클릭하면 detail page로 이동한다.
				$('a[id="corpMov"], a[id="popularMov"]').click(function() {
					var mamCook		= null;
					var hiddenCon	= null;
					var hiddenTmb	= null;
					var hiddenHis	= null;
					var contentId 	= $(this).attr('data-contentId');
					var thumbUrl 	= $(this).attr('data-thumbUrl');
					mamCook = $.cookies.get('mamsCookie');
					if (!validCookieContent.isExistContentId(mamCook.myHistory, contentId)) {
						mamCook.myHistory.push(contentId);
						$.cookies.set('mamsCookie', JSON.stringify(mamCook));
					}
					hiddenCon 	= $('<input>').attr({'type':'hidden','name':'content_id','value':contentId});
					hiddenTmb 	= $('<input>').attr({'type':'hidden','name':'thumbUrl','value':thumbUrl});
					hiddenHis	= $('<input>').attr({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
					$('<form></form>').attr({'method':'POST','action':'detail'}).append(hiddenCon).append(hiddenTmb).append(hiddenHis).appendTo('body').submit();
				});
				
				// history 목록중 하나를 선택하면 detail.jsp 페이지로 이동한다.
				$(document).on('click', '#hisAtag', function() {
					var mamCook		= null;
					var contentId 	= $(this).attr('data-contentId');
					var thumbUrl 	= $(this).attr('data-thumbUrl');
					mamCook = $.cookies.get('mamsCookie');
					var formEle 	= $('<form></form>').attr({'method':'post','action':'detail'});
					var hiddenCon 	= $('<input>').attr({'type':'hidden','name':'content_id','value':contentId});
					var hiddenTum 	= $('<input>').attr({'type':'hidden','name':'thumbUrl','value':thumbUrl});
					var hiddenHis 	= $('<input>').attr({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
					$(formEle).append(hiddenCon).append(hiddenTum).append(hiddenHis).appendTo('body').submit();
				});
				
				$(document).on("mouseover", "#hisAtag", function(e) {
				    $(this).css('cursor', 'pointer');
				});

				$(document).on("mouseleave", "#hisAtag", function(e) {
				    $(this).css('cursor', 'default');
				});

				// Test Content Group 추가
				$('#plstAdder').click(function() {
					var groupName 	= null;
					var inputTag	= null;
					var formTag		= null;
					groupName = $('#groupName').val();
					inputTag = $('<input>').prop({'name':'groupName','value':groupName});
					formTag = $('<form></form>').prop({'method':'post','action':'/videoBox/setGroup'});
					formTag.append(inputTag).appendTo('body').submit();
				});
	    	});
	    </script>
	</body>
</html>
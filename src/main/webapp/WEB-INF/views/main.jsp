<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />
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
		                                    	<option value="Hankook Tire">Hankook Tire</option>
		                                    	<option value="Hankook Tire (RAW)">Hankook Tire (RAW)</option>
		                                    	<option value="Other Brand">Other Brand</option>
		                                    	<option value="Other Brand (RAW)">Other Brand (RAW)</option>
		                                    	<option value="Technology">Technology</option>
		                                    	<option value="Technology (RAW)">Technology (RAW)</option>
		                                	</optgroup>
		                                	<optgroup label="Motorsports">
		                                    	<option value="Europe">Europe</option>
		                                    	<option value="Europe (RAW)">Europe (RAW)</option>
		                                    	<option value="Other Motorsports">Other Motorsports</option>
		                                    	<option value="Other Motorsports (RAW)">Other Motorsports (RAW)</option>
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
										<option value="Middle East & Africa">Middle East &amp; Africa</option>
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
		                <input type="hidden" id="customIdValue" name="custom_id">
		            </form>
		        </div>
		        <div id="uploading">
					<img src="./resources/images/common/uploading.gif">
				</div>
		    </div>
		    <!--//Upload 팝업-->
		    <!-- Download 팝업 -->
		    <div class="download_popup_wrap" id="downloadPop">
		        <div class="download_popup_con">
		            <div class="popup_title">
		                <div class="mb20">
		                    <p class="mb10" id="dTitle">RA33_Dynapro HP2_Motion Graphic Graphic Graphic Graphic</p>
		                    <p><span>ID :</span> <label id="contentID">2014cvrw001800000255</label> </p>
		                </div>
		                <span><a id="downClose"><img src="./resources/images/common/popup_close_btn.png" alt="닫기"/></a></span>
		            </div>
		            <div class="download_con">
		                <p><img src="./resources/images/common/down_title.png" alt="download"/></p>
		                <ul>
		                  	<li><a id="mp4dl"><img src="./resources/images/common/ndown_mp4.png" alt="mp4"/></a></li>
							<li><a id="avidl"><img src="./resources/images/common/ndown_avi.png" alt="avi"/></a></li>
							<li><a id="movdl"><img src="./resources/images/common/ndown_mov.png" alt="mov"/></a></li>
							<li><a id="wmvdl"><img src="./resources/images/common/ndown_wmv.png" alt="wmv"/></a></li>
		                </ul>
		            </div>
		            <div class="detail_con">
		                <p><img src="./resources/images/common/detail_title.png" alt="detail"/></p>
		                <ul>
		                    <li>
		                        <p>Size : <label id="fwidth"></label>x<label id="fheight"></label> HD <label id="fsize"></label></p>
		                        <p>Video Format : <label id="container"></label></p>
		                        <p>Video Codec : <label id="vCodec"></label></p>
		                        <p>Video bps : <label id="vbps"></label></p>
		                        <p>Video fps :<label id="vfps"></label></p>
		                    </li>
		                    <li>
		                        <p>Audio Codec :<label id="aCodec">aac</label></p>
		                        <p>Audio bps :<label id="aBps">235478</label></p>
		                        <p>Audio channel : <label id="aChannel">2</label></p>
		                        <p>Audio Hz : <label id="aSampleRate">44100</label></p>
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
								<img id="vbHome" src="./resources/images/common/img_logo2.png" alt="Video Box" />
							</a>
						</h1>
						<!-- 
						<div class="util_navi">
							<ul>
								<li class="util1"><a>동영상</a></li>
								<li class="util2"><a>홈</a></li>
							</ul>
						</div>
						 -->
						<p>This is operated by hankook tire in the digital library movie </p>
						
					</div>
					<!-- //header_top end -->
					<!-- header_bottom -->
					<div class="header_bottom">
						<div class="header_search">
	                    	<form id="searchFrm" class="search_form">
	                    		<label for="search" class="hide">아이디</label>
								<input type="text" id="search" name="search" class="search_go" />
	                            <button id="searchBtn" class="search_btn">search</button>
	                        </form>
	                    </div>
						<div class="personal_menu">
							<ul>
								<li class="p_menu1"><a id="admin">설정</a></li>
								<li class="p_menu2"><a id="upload">업로드</a></li>
							</ul>
						</div>
					</div>
					<!-- //header_bottom end -->
					<!-- gnb -->
					<div id="gnb">
						<div class="gnb_bg1">
	                        <div class="gnb_bg2"></div>
                    	</div>
						<ul>
							<li class="first menu menu1">
	                        	<a class="pad0">Corporation</a>
	                        	<div>
		                        	<div>
		                        		<ul class="depth2">
		                        			<li><a id="pls1300000253">Company</a></li>
		                        			<li><a id="pls1300000252">Company (RAW)</a></li>
		                        			<li><a id="pls1300000251">Culture</a></li>
		                        			<li><a id="pls1300000245">Culture (RAW)</a></li>
		                        			<li><a id="pls1300000244">TV Footages</a></li>
		                        			<li><a id="pls1300000243">TV Footages (RAW)</a></li>
		                        		</ul>
		                        	</div>
	                        	</div>
	                        </li>
							<li class="menu menu2">
	                        	<a class="pad1">Advertisements</a>
	                        	<div>
		                        	<div>
		                        		<ul class="depth2">
		                        			<li><a id="pls1300000242">TVC</a></li>
		                        			<li><a id="pls1300000241">TVC (RAW)</a></li>
		                        			<li><a id="pls1300000240">Campaign</a></li>
		                        			<li><a id="pls1300000239">Campaign (RAW)</a></li>
		                        			<li><a id="pls1300000238">Sports Marketing</a></li>
		                        			<li><a id="pls1300000237">Sports Marketing (RAW)</a></li>
		                        		</ul>
		                        	</div>
	                        	</div>
	                        </li>
							<li class="menu menu3">
	                        	<a class="pad2">Products</a>
	                        	<div>
		                        	<div>
		                        		<ul class="depth2">
		                        			<li><a id="pls1300000236">Hankook Tire</a></li>
		                        			<li><a id="pls1300000235">Hankook Tire (RAW)</a></li>
		                        			<li><a id="pls1300000234">Other Brand</a></li>
		                        			<li><a id="pls1300000233">Other Brand (RAW)</a></li>
		                        			<li><a id="pls1300000232">Technology</a></li>
		                        			<li><a id="pls1300000231">Technology (RAW)</a></li>
		                        		</ul>
		                        	</div>
	                        	</div>
	                        </li>
							<li class="menu menu4">
	                        	<a class="pad3">Motorsports</a>
	                        	<div>
		                        	<div>
		                        		<ul class="depth2">
		                        			<li><a id="pls1300000230">Europe</a></li>
		                        			<li><a id="pls1300000229">Europe (RAW)</a></li>
		                        			<li><a id="pls1300000228">Other Motorsports</a></li>
		                        			<li><a id="pls1300000227">Other Motorsports (RAW)</a></li>
		                        		</ul>
		                        	</div>
	                        	</div>
	                        </li>
							<li class="menu menu5">
	                        	<a class="pad4">Events</a>
	                        	<div>
		                        	<div>
		                        		<ul class="depth2">
		                        			<li><a id="pls1300000226">Exhibition</a></li>
		                        			<li><a id="pls1300000225">Exhibition (RAW)</a></li>
		                        			<li><a id="pls1300000224">Promotion</a></li>
		                        			<li><a id="pls1300000223">Promotion (RAW)</a></li>
		                        			<li><a id="pls1300000222">Other Event</a></li>
		                        			<li><a id="pls1300000221">Other Event (RAW)</a></li>
		                        		</ul>
		                        	</div>
	                        	</div>
	                        </li>
							<li class="last menu menu6">
	                        	<a class="pad5">Others</a>
	                        	<div>
		                        	<div>
		                        		<ul class="depth2">
		                        			<li><a id="pls1300000220">Other</a></li>
		                        			<li><a id="pls1300000219">Other (RAW)</a></li>
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
	                        <h3 id="playTitle"><c:out value="${list.get(0).getTitle()}"/></h3>
	                        <p id="playTimeDate"><c:out value="${list.get(0).getDuration()}"/></p>
	                        <ul class="latest_info_con">
		                        <li><span>Category&nbsp;&gt;&nbsp;</span>${list.get(0).tag.getCategory()}</li>
	                            <li><span>ID&nbsp;:&nbsp;</span><span id="playContentId"><c:out value="${list.get(0).getCustom_id()}"/></span></li>
	                            <li id="playNation"><span>Region&nbsp;:&nbsp;</span><label>${list.get(0).tag.getRegion()}</label></li>
	                            <li id="playTag"><span>Tag&nbsp;:&nbsp;</span><label>${list.get(0).tag.getYear()}, ${list.get(0).tag.getType()}, ${list.get(0).tag.getOfficial()}</label></li>
	                        	<li>&nbsp;</li>
	                        </ul>
	                        <hr />
	                        <ul class="latest_thumbnail">
	                        	<!-- thumb loop -->
	                        	<c:forEach var="object" items="${list}" end="2" varStatus="status">
	                        		<c:choose>
	                        		<c:when test="${status.count != 3 }">
	                        	<li class="mr22">
	                            	<a id="latestMov" data-contentId="${object.getContent_id()}" data-streamingUrl="${object.getStreaming_url()}" data-thumbUrl="${object.getThumb_url()}" data-title="${object.getTitle()}" data-dateNReg="${object.getDuration()}" data-category="" data-region="" data-tag="" data-copyUrl="">
	                                	<span>
	                                		<img width="153px" height="85" src="${object.getThumb_url()}" alt="" />
	                                    	<span class="video-time">${object.getDuration()}</span>
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
									<c:when test="${fn:length(object.getTitle()) > 12}">
									<h3 class="thumbTitle">${fn:substring(object.getTitle(), 0, 12)}...</h3>
									</c:when>
									<c:otherwise>
									<h3 class="thumbTitle">${object.getTitle()}</h3>
									</c:otherwise>
									</c:choose>
	                            </li>
	                        		</c:when>
	                        		<c:otherwise>
	                            <li id="content_item">
	                            	<a id="latestMov" data-contentId="${object.getContent_id()}" data-streamingUrl="${object.getStreaming_url()}" data-thumbUrl="${object.getThumb_url()}" data-title="${object.getTitle()}" data-dateNReg="${object.getDuration()}" data-category="" data-region="" data-tag="" data-copyUrl="">
	                                	<span>
	                                    	<img width="153px" height="85" src="${object.getThumb_url()}" alt="" />
	                                        <span class="video-time">${object.getDuration()}</span>
	                                        <span class="off"></span> 
	                                    </span>
	                                </a>
	                                <c:choose>
									<c:when test="${fn:length(object.getTitle()) > 12}">
									<h3 class="thumbTitle">${fn:substring(object.getTitle(), 0, 12)}...</h3>
									</c:when>
									<c:otherwise>
									<h3 class="thumbTitle">${object.getTitle()}</h3>
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
	                	<h2><label id="popTitle">Popular Movie</label><span>Popular on Hankookrire movie</span></h2>
	                    <ul class="thumbnail">
	                    	<c:forEach var="popularObject" items="${popularList}" end="4" varStatus="status">
	                    	<c:choose>
	                    		<c:when test="${status.count < 4}">
	                    	<li class="mr24">
	                        	<a id="popularMov" data-contentId="${popularObject.getContent_id()}">
	                            	<span>
	                                	<img width="196px" height="110px" src="${popularObject.getThumb_url()}" alt="" />
	                                    <span class="video-time">${popularObject.getDuration()}</span>
	                                </span>
	                            </a>
	                            <span>${popularObject.getTag().getCategory() }</span>
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
	                            <span><c:out value="${popularObject.getTag().getCategory()}"/></span>
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
	                            <span><c:out value="${popularObject.getTag().getCategory()}"/></span>
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
	                            <span class="f_right mr5"><a class="download_btn" data-contentId="${popularObject.getContent_id()}"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
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
	                        <li class="on" id="tabCategory"><a id="ctg1300000253">Company</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000252">Company (RAW)</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000251">Culture</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000245">Culture (RAW)</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000244">TV Footages</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000243">TV Footages (RAW)</a></li>
                    	</ul>
                    	<ul class="tab02">
	                        <li><a id="ctg1300000242">TVC</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000241">TVC (RAW)</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000240">Campaign</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000239">Campaign (RAW)</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000238">Sports Marketing</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000237">Sports Marketing (RAW)</a></li>
                    	</ul>
	                    <ul class="tab02">
	                        <li><a id="ctg1300000236">Hankook Tire</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000235">Hankook Tire (RAW)</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000234">Other Brand</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000233">Other Brand (RAW)</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000232">Technology</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000231">Technology (RAW)</a></li>
	                    </ul>
	                    <ul class="tab02">
	                        <li><a id="ctg1300000230">Europe</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000229">Europe (RAW)</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000228">Other Motorsports</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000227">Other Motorsports (RAW)</a></li>
	                    </ul>
	                    <ul class="tab02">
	                        <li><a id="ctg1300000226">Exhibition</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000225">Exhibition (RAW)</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000224">Promotion</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000223">Promotion (RAW)</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000222">Other Event</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000221">Other Event (RAW)</a></li>
	                    </ul>
	                    <ul class="tab02">
	                        <li><a id="ctg1300000220">Other</a></li>
	                        <li class="line ml15 mr15">|</li>
	                        <li><a id="ctg1300000219">Other (RAW)</a></li>
	                    </ul>
                    	<!-- //탭메뉴_소분류 End -->
                    	<ul class="category_slide" id="categorySlide">
						  
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
						<p class="copyright">
							Copyright ⓒ Hankook Tire. All Rights Reserved.
						</p>
					</div>
				</div>
				<!-- //footer end -->
	
			</div>
			<!-- //footer_wrap end -->
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
	    	        //$(tabMenuList[tabIndex]).find("li:first-child").addClass("on");
	    	        prevTabIndex = tabIndex;
	    	    }
	    	    
	    		if ($.cookies.get('mamsCookie') != null || $.cookies.get('mamsCookie') != 'undefined') {
	    			var i 			= 0;
	    			var contentId 	= null;
	    			var title 		= null;
	    			var aEle		= null;
	    			var ddEle		= null;
	    			var mamCook 	= $.cookies.get('mamsCookie');
	    			var contentIdList = JSON.stringify(mamCook.myHistory);
		    		$.getJSON('mamsHistoryList', {'historyList':contentIdList}, function(data) {
		    			for (i; i < data.length; i = i + 1) {
		    				contentId 	= data[i].content_id;
		    				title 		= decodeURI(data[i].title);
		    				title 		= title.replace(/\+/gi, ' ');
		    				thumbUrl 	= data[i].thumb_url;
		    				streamingUrl= data[i].streamingUrl;
		    				if (title.length > 23) {
		    					title = title.substring(0, 20) + '...';
		    				}
			    			aEle = $('<a id="hisAtag" data-contentId="' + contentId + '" data-playlistName="' + data[i].tag.category + '"></a>').append('<img width="25px" height="14px" src=' + thumbUrl + '>' + title);
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
									"&mediaUrl=" + encodeURIComponent("${list.get(0).getStreaming_url()}") +
									"&title=${list.get(0).getTitle()}" +
									"&thumbUrl=" + encodeURIComponent("${list.get(0).getThumb_url()}") +
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
										'&title=' + title +
										"&thumbUrl=" + encodeURIComponent(thumbUrl) +
										"&pid=${player_id}" +
										"&wmode=transparent" +
										"&autoPlay=true\" name=\"flashvars\">"+
						"</object>"
					);
				});

				// popular Movie의 thumb nail를 클릭하면 detail page로 이동한다.
				$('a[id="popularMov"]').click(function() {
					var idVal		= null;
					var mamCook		= null;
					var hiddenCon	= null;
					var hiddenCtg	= null;
					var hiddenHis	= null;
					idVal			= $(this).attr('id');
					var contentId = $(this).attr('data-contentId');
					mamCook = $.cookies.get('mamsCookie');
					if (!validCookieContent.isExistContentId(mamCook.myHistory, contentId)) {
						mamCook.myHistory.push(contentId);
						$.cookies.set('mamsCookie', JSON.stringify(mamCook));
					}
					hiddenCon 	= $('<input>').attr({'type':'hidden','name':'content_id','value':contentId});
					//hiddenCtg 	= $('<input>').attr({'type':'hidden','name':'categoryName','value':contentTitle});
					hiddenHis	= $('<input>').attr({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
					$('<form></form>').attr({'method':'POST','action':'detailPopular'}).append(hiddenCon,hiddenCtg,hiddenHis).appendTo('body').submit();
				});
				
				$('a[id="corpMov"]').click(function() {
					var playlistName= null;
					var mamCook		= null;
					var hiddenCon	= null;
					var hiddenPln	= null;
					var hiddenHis	= null;
					playlistName	= $(this).attr('data-playlistName');
					playlistName = playlistName.toLowerCase();
					var contentId = $(this).attr('data-contentId');
					mamCook = $.cookies.get('mamsCookie');
					if (!validCookieContent.isExistContentId(mamCook.myHistory, contentId)) {
						mamCook.myHistory.push(contentId);
						$.cookies.set('mamsCookie', JSON.stringify(mamCook));
					}
					hiddenCon 	= $('<input>').attr({'type':'hidden','name':'content_id','value':contentId});
					hiddenPln 	= $('<input>').attr({'type':'hidden','name':'playlist_name','value':playlistName});
					hiddenHis	= $('<input>').attr({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
					$('<form></form>').attr({'method':'POST','action':'detail'}).append(hiddenCon,hiddenPln,hiddenHis).appendTo('body').submit();
				});
				
				// history 목록중 하나를 선택하면 detail.jsp 페이지로 이동한다.
				$(document).on('click', '#hisAtag', function() {
					var mamCook		= null;
					var contentId 	= $(this).attr('data-contentId');
					var playlistNm 	= $(this).attr('data-playlistName');
					var formElement	= null;
					var hiddenCon	= null;
					var hiddenPln	= null;
					var hiddenHis	= null;
					
					mamCook = $.cookies.get('mamsCookie');
					formElement = $('<form></form>').attr({'method':'post','action':'detail'});
					hiddenCon 	= $('<input>').attr({'type':'hidden','name':'content_id','value':contentId});
					hiddenPln 	= $('<input>').attr({'type':'hidden','name':'playlist_name','value':playlistNm});
					hiddenHis 	= $('<input>').attr({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
					formElement.append(hiddenCon, hiddenPln, hiddenHis).appendTo('body').submit();
				});
				
				$(document).on("mouseover", "#hisAtag", function(e) {
				    $(this).css('cursor', 'pointer');
				});

				$(document).on("mouseleave", "#hisAtag", function(e) {
				    $(this).css('cursor', 'default');
				});

				
				// 하단의 메뉴 텝을 누르면 해당 playlist의 컨텐트를 가져온다. ajax
				$('a[id*=ctg]').click(function() {
					var i = 0;
					var playlistId 	= null;
					playlistId = $(this).attr('id');
					playlistId = playlistId.substring(3, playlistId.length);
					$.getJSON('getTabMenu', {'playlist_id':playlistId}, function(data) {
						$('#categorySlide').empty();
						for (i; i < data.length; i = i + 1) {
							$('#categorySlide').append(
									'<li>' +
									'<a id="corpMov" data-contentId="' + data[i].content_i + '" data-playlistName="' + data[i].tag.category + '">' +
									'<span>' +
									'<img width="196px" height="110px" src="' + data[i].thumb_url + '" alt="" />' +
									'<span class="video-time">' + (data[i].duration/1000 * 60) % 60 + ':' + (data[i].duration/1000) % 60 + '</span>' +
									'</span>' +
									'</a>' +
									'<span>' + data[i].tag.category + '</span>' +
									'<h3><a>' + data[i].title + '</a></h3>' +
									'<h3><a>' + data[i].view_count + '</a></h3>' +
									'<span class="f_left">' + data[i].reg_date + '</span>' +
									'<span class="f_right mr5">' +
									'<a class="download_btn" data-contentId="#content_id">' +
									'<img src="./resources/images/common/dow_icon.png" alt="download" />' +
									'</a>' +
									'</span>' +
									'</li>'	
							);
							 
						}
					});
				});

	    	});
	    </script>
	</body>
</html>

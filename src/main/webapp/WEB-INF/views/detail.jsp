<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
                        	<dl>
                            	<dt>Watch History</dt>
                            	<c:forEach var="his" items="${history }" varStatus="status">
                            	<c:choose>
								<c:when test="${fn:length(his.title) > 21}">
								<dd>
									<a id="his" data-contentId="${his.content_id }" data-streamingUrl="${his.streamingUrl }" data-thumbUrl="${his.thumb_url }">
										<img width="25px" height="14px" src="${his.thumb_url }" alt="" />${fn:substring(his.title, 0, 21)}...
									</a>
								</dd>
								</c:when>
								<c:otherwise>
                                <dd>
                                	<a id="his" data-contentId="${his.content_id }" data-streamingUrl="${his.streamingUrl }" data-thumbUrl="${his.thumb_url }">
                                		<img width="25px" height="14px" src="${his.thumb_url }" alt="" />${his.title }
                                	</a>
                                </dd>
								</c:otherwise>
								</c:choose>
                            	</c:forEach>
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
            	<div class="detail mlr56">
                	<div class="detail_left">
                    	<h2>Corporation<a class="f_right" id= "goList"><img src="./resources/images/common/detai_list.png" alt="List" /></a></h2>
                        <div class="detail_movie">
                        </div>
                        <div class="datail_title">
                        	<h3>${oneStreamPlay["title"] }</h3>
                            <p>${oneStreamPlay["duration"] }  / ${oneStreamPlay["reg_date"] } </p>
                            <span class="admin_icon"><img src="./resources/images/common/icon_admin.png" alt="admin" /></span>
                        </div>
                        <div class="datail_info">
                        	<ul>
                                <li><span>Category&nbsp;&gt;&nbsp;</span>Product Movie</li>
                                <li><span>ID&nbsp;:&nbsp;</span>${oneStreamPlay["content_id"] }</li>
                                <li><span>Region&nbsp;:&nbsp;</span>Is being implemented.</li>
                                <li><span>Tag&nbsp;:&nbsp;</span>Is being implemented.</li>
                                <li><span>Copy Video URL&nbsp;:&nbsp;</span>Do not support</li>
                                <hr/>
                                <p>Is being implemented.</p>
                            </ul>
                        </div>
                        <div class="detail_link">
                        	<a class="d_link01" id="downloadBtn">DOWNLOAD</a>
                            <a class="d_link02">SHARE</a>
                            <a class="d_link03" id="bookCook">BOOKMARK</a>
                            <div class="bookmark_layer">
                            	<p>Added to Mypage_Bookmark</p>
                                <a class="bookmark_my" id="mamsBookmark">GO TO MYPAGE</a>
                                <a class="bookmark_close">close</a>
                            </div>
                        </div>
                        <div class="d_download" id="d_download">
                        	<ul class="download_movie">
                        		<c:set var="fileName" value="${oneStreamPlay['fileName']}" />
                        		<c:set var="splitArr" value="${fn:split(fileName, '.') }" />
                        		<c:if test="${splitArr[1] == 'mov' }">
                            	<li><a id="getTheFile"><img src="./resources/images/common/icon_mov.png" alt="download" />${oneStreamPlay['fileName']}</a></li>
                        		</c:if>
                        		<c:if test="${splitArr[1] == 'wmv' }">
                                <li><a id="getTheFile"><img src="./resources/images/common/icon_wmv.png" alt="download" />${oneStreamPlay['fileName']}</a></li>
                        		</c:if>
                                <c:if test="${splitArr[1] == 'mp4' }">
                                <li><a id="getTheFile"><img id="mp4Img" src="./resources/images/common/icon_mp4.png" alt="download" />${oneStreamPlay['fileName']}</a></li>
                        		</c:if>
                                <c:if test="${splitArr[1] == 'mpeg' }">
                                <li><a id="getTheFile"><img src="./resources/images/common/icon_mpeg.png" alt="download" />${oneStreamPlay['fileName']}</a></li>
                        		</c:if>
                                <c:if test="${splitArr[1] == 'avi' }">
                                <li><a id="getTheFile"><img src="./resources/images/common/icon_avi.png" alt="download" />${oneStreamPlay['fileName']}</a></li>
                        		</c:if>
                                <c:if test="${splitArr[1] == 'flv' }">
                                <li><a id="getTheFile"><img src="./resources/images/common/icon_flv.png" alt="download" />${oneStreamPlay['fileName']}</a></li>
                        		</c:if>
                            </ul>
                            <hr />
                            <span class="download_info_title">File info</span>
                            <ul class="download_info">
                            	<li>
                                	<ul>
                                    	<li><span>Contents Type&nbsp;:&nbsp;</span><label id="mediaType">Video</label></li>
                                        <li><span>Scale&nbsp;:&nbsp;</span><label id="contentScale">the base rate</label></li>
                                        <li><span>Size&nbsp;:&nbsp;</span><label id="contentSize"></label></li>
                                    </ul>
                                </li>
                                <li class="border">
                                	<ul>
                                    	<li><span>Video Format&nbsp;:&nbsp;</span><label id="videoFormat"></label></li>
                                        <li><span>Video Codec&nbsp;:&nbsp;</span><label id="videoCodec"></label></li>
                                        <li><span>Video bps&nbsp;:&nbsp;</span><label id="videoBps"></label></li>
                                        <li><span>Video fps&nbsp;:&nbsp;</span><label id="videoFps"></label></li>
                                    </ul>
                                </li>
                                <li class="border">
                                	<ul>
                                    	<li><span>Audio Codec&nbsp;:&nbsp;</span><label id="audioCodec"></label></li>
                                        <li><span>Audio bps&nbsp;:&nbsp;</span><label id="audioBps"></label></li>
                                        <li><span>Audio channel&nbsp;:&nbsp;</span><label id="audioChannel"></label></li>
                                        <li><span>Audio Hz&nbsp;:&nbsp;</span><label id="audioHz"></label></li>
                                    </ul>
                                </li>
                            </ul>
                            <a class="btn_folding">FOLDING</a>
                        </div>
                        <div class="d_share">
                        	<ul>
                            	<li class="share_menu01"><a>facebook</a></li>
                                <li class="share_menu02"><a>youtube</a></li>
                                <li class="share_menu03"><a>twitter</a></li>
                                <li class="share_menu04"><a>google+</a></li>
                                <li class="share_menu05 eng"><a>pinterest</a></li>
                            </ul>
                        </div>
                        <a class="btn_list" id="goList">List</a>
                    </div>
                    <div class="detail_right">
                    	<div class="dr_title"><p>Corporation</p><span id="moreVideoMark">more ${totalCount - 1 } videos</span></div>
                        <ul class="detail_slide">
                        	<c:set var="nowPlayContent_id" value="${oneStreamPlay['content_id'] }"/>
                        	<c:forEach  var="detailSlide" items="${list }" varStatus="">
                        	<c:choose>
                        	<c:when test="${detailSlide.content_id == nowPlayContent_id }">
                            <li class="slide">
                                <a id="corpSlide"  data-contentId="${detailSlide.content_id }" data-thumbUrl="${detailSlide.thumb_url }">
                                    <div class="d_slide_img">
                                        <img src="${detailSlide.thumb_url }" alt="" />
                                        <span class="on"></span>
                                    </div> 
                                    <div class="d_slide_info">
                                    	<c:choose>
                                    	<c:when test="${fn:length(detailSlide.title) > 23 }">
                                    	 <h3 class="on">${fn:substring(detailSlide.title, 0, 23)}...</h3>
                                    	</c:when>
                                    	<c:otherwise>
                                    	 <h3 class="on">${detailSlide.title }</h3>
                                    	</c:otherwise>
                                    	</c:choose>
                                        <span>${detailSlide.reg_date }</span>
                                    </div>
                                </a>
                            </li>
                        	</c:when>
                        	<c:otherwise>
                            <li class="slide">
                                <a id="corpSlide" data-contentId="${detailSlide.content_id }" data-thumbUrl="${detailSlide.thumb_url }">
                                    <div class="d_slide_img">
                                        <img src="${detailSlide.thumb_url }" alt="" />
                                    </div>
                                    <div class="d_slide_info">
                                       <c:choose>
                                    	<c:when test="${fn:length(detailSlide.title) > 23 }">
                                    	 <h3 class="on">${fn:substring(detailSlide.title, 0, 23)}...</h3>
                                    	</c:when>
                                    	<c:otherwise>
                                    	 <h3 class="on">${detailSlide.title }</h3>
                                    	</c:otherwise>
                                    	</c:choose>
                                        <span>${detailSlide.reg_date }</span>
                                    </div>
                                </a>
                            </li>
                        	</c:otherwise>
                        	</c:choose>
                        	</c:forEach>
                        </ul>
                        <div class="rm_title"><p>Related  Movie</p></div>
                        <div class="related_movie_list">
                        	<ul>
                            	<li>
                                    <a>
                                       <div class="rm_img">
                                           <img src="./resources/images/common/thumbnail.jpg" alt="" />
                                       </div>
                                       <div class="rm_info">
                                           <h3>RA33 Dynapro HP2 Motion Graphic (ENG)...</h3>
                                           <span>2014-07-01</span>
                                       </div>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                       <div class="rm_img">
                                           <img src="./resources/images/common/thumbnail.jpg" alt="" />
                                       </div>
                                       <div class="rm_info">
                                           <h3>RA33 Dynapro HP2 Motion Graphic (ENG)...</h3>
                                           <span>2014-07-01</span>
                                       </div>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <div class="rm_img">
                                            <img src="./resources/images/common/thumbnail.jpg" alt="" />
                                        </div>
                                        <div class="rm_info">
                                            <h3>RA33 Dynapro HP2 Motion Graphic (ENG)...</h3>
                                            <span>2014-07-01</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <div class="rm_img">
                                            <img src="./resources/images/common/thumbnail.jpg" alt="" />
                                        </div>
                                        <div class="rm_info">
                                            <h3>RA33 Dynapro HP2 Motion Graphic (ENG)...</h3>
                                            <span>2014-07-01</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <div class="rm_img">
                                            <img src="./resources/images/common/thumbnail.jpg" alt="" />
                                        </div>
                                        <div class="rm_info">
                                            <h3>RA33 Dynapro HP2 Motion Graphic (ENG)...</h3>
                                            <span>2014-07-01</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                       <div class="rm_img">
                                           <img src="./resources/images/common/thumbnail.jpg" alt="" />
                                       </div>
                                       <div class="rm_info">
                                           <h3>RA33 Dynapro HP2 Motion Graphic (ENG)...</h3>
                                           <span>2014-07-01</span>
                                       </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
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
                	<li class="mb5">ID : 2014cvrw001800000255</li>
                    <li>region : korea</li>
                </ul>
                <hr />
                <dl class="download">
                	<dt>DOWNLOAD</dt>
                    <dd><a><img src="./resources/images/common/icon_mov.png" alt="download" />RA33_Dynapro HP2_Motion Graphic(ENG).mov</a></dd>
                    <dd><a><img src="./resources/images/common/icon_wmv.png" alt="download" />RA33_Dynapro HP2_Motion Graphic(ENG).wmv</a></dd>
                    <dd><a><img src="./resources/images/common/icon_mp4.png" alt="download" />RA33_Dynapro HP2_Motion Graphic(ENG).mp4</a></dd>
                    <dd><a><img src="./resources/images/common/icon_mpeg.png" alt="download" />RA33_Dynapro HP2_Motion Graphic(ENG).mpeg</a></dd>
                    <dd><a><img src="./resources/images/common/icon_avi.png" alt="download" />RA33_Dynapro HP2_Motion Graphic(ENG).avi</a></dd>
                    <dd><a><img src="./resources/images/common/icon_flv.png" alt="download" />RA33_Dynapro HP2_Motion Graphic(ENG).flv</a></dd>
                </dl>
                <hr />
                <dl class="file_info">
                	<dt>fILE INFO</dt>
                    <dd>Contents Type : Video</dd>
                    <dd>Scale : the base rate</dd>
                    <dd>Size : 1280x720 HD 408MB</dd>
                    <dd>Video Format : MP4</dd>
                    <dd>Video Codec : h264</dd>
                    <dd>Video bps : 256478</dd>
                    <dd>Video fps : 29</dd>
                    <dd>Audio Codec : aac</dd>
                    <dd>Audio bps :235478</dd>
                    <dd>Audio channel : 2</dd>
                    <dd>Audio Hz : 44100</dd>
                </dl>
                <a class="dow_layer_close">close</a>
            </div>
        </div>
        <!-- //download layer -->
	</div>
	<script type="text/javascript" src="./resources/common/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="./resources/common/js/jquery.ui.all.js"></script>
    <script type="text/javascript" src="./resources/common/js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="./resources/common/js/jquery.cookies.2.2.0.min.js"></script>
    <script type="text/javascript" src="./resources/common/js/common.js"></script>
    <script type="text/javascript">
    	$(document).ready(function() {
    		$(".detail_movie").empty();
			$(".detail_movie").append(
				"<object data=\"http://vcase.myskcdn.com/static/ovp/ovp.swf\" name=\"ovp\" id=\"ovp\" type=\"application/x-shockwave-flash\" align=\"middle\" width=\"800\" height=\"480\" >" +
				"<param value=\"high\" name=\"quality\">" + 
				"<param value=\"#000000\" name=\"bgcolor\">" +
				"<param value=\"always\" name=\"allowscriptaccess\">" +
				"<param value=\"transparent\" name=\"wmode\">" +
				"<param value=\"true\" name=\"allowfullscreen\">" +
				"<param value=\"apiUrl=http://api.vcase.myskcdn.com" + 
						"&mediaUrl=" + encodeURIComponent("${streamingUrl}") +
						"&title=${oneStreamPlay['title']}" +
						"&thumbUrl=" + encodeURIComponent("${thumbUrl}") +
						"&pid=${player_id}" +
						"&autoPlay=true\" name=\"flashvars\">"+
				"</object>"
			);
			
			$('#downloadBtn').click(function() {
				$('#getTheFile').attr({'href':'${oneStreamPlay["downloadUrl"]}'});
				$('#mediaType').text('${oneStreamPlay["mediaType"]}');
				$('#contentSize').text('${oneStreamPlay["size"]}');
				$('#videoFormat').text('${oneStreamPlay["videoFormat"]}');
				$('#videoCodec').text('${oneStreamPlay["videoCodec"]}');
				$('#videoBps').text('${oneStreamPlay["videoBps"]}');
				$('#videoFps').text('${oneStreamPlay["videoFps"]}');
				$('#audioCodec').text('${oneStreamPlay["audioCodec"]}');
				$('#audioBps').text('${oneStreamPlay["audioBps"]}');
				$('#audioChannel').text('${oneStreamPlay["audioChannel"]}');
				$('#audioHz').text('${oneStreamPlay["audioHz"]}');
			});
			
			// 우측 사이드 thumb nail 을 클릭하면 해당 컨텐츠 실행
			$('a[id="corpSlide"]').click(function() {
				var contentId 	= null;
				var thumbUrl 	= null;
				var mamCook		= null;
				var hiddenCon 	= null;
				var hiddenThumb = null;
				mamCook 	= $.cookies.get('mamsCookie');
				contentId 	= $(this).attr('data-contentId');
				thumbUrl 	= $(this).attr('data-thumbUrl');
				if (!validCookieContent.isExistContentId(mamCook.myHistory, contentId)) {
					mamCook.myHistory.push(contentId);
					$.cookies.set('mamsCookie', JSON.stringify(mamCook));
				}
				hiddenCon = $('<input>').attr({'type':'hidden', 'name':'content_id', 'value':contentId});
				hiddenThumb = $('<input>').attr({'type':'hidden', 'name':'thumbUrl', 'value':thumbUrl});
				hiddenHisli = $('<input>').attr({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
				$('<form></form>').attr({'method':'POST', 'action':'detail'}).append(hiddenCon).append(hiddenThumb).append(hiddenHisli).submit();
			});
			
			// 북마크 추가
			$('#bookCook').click(function() {
				 var mamCook 	= null;
				 var contentId 	= null;
				 mamCook = $.cookies.get('mamsCookie');
				 contentId = '${oneStreamPlay["content_id"]}';
				 if (!validCookieContent.isExistContentId(mamCook.myBookmark, contentId)) {
					 mamCook.myBookmark.push(contentId);
					 $.cookies.set('mamsCookie', JSON.stringify(mamCook));
				 }
				 $('#bookmarkCnt').text(mamCook.myBookmark.length);
			});
			
			// list.jsp 페이지 이동
			$('a[id="goList"]').click(function() {
				var mamCook 	= null;
				var hiddenHis 	= null;
				mamCook = $.cookies.get('mamsCookie');
				hiddenHis = $('<input>').attr({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
				$('<form></form>').attr({'method':'post','action':'listDetail'}).append(hiddenHis).appendTo('body').submit();
			});
    	});
    </script>
</body>
</html>

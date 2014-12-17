<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		                                    	<option value="Other Motorsports">Other Motosports</option>
		                                    	<option value="Other Motorsports (RAW)">Other Motosports (RAW)</option>
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
	                        	<dl>
	                            	<dt>Watch History</dt>
	                            	<c:forEach var="his" items="${history}" varStatus="status">
	                            	<c:choose>
									<c:when test="${fn:length(his.title) > 21}">
									<dd>
										<a id="his" data-contentId="${his.content_id }" data-streamingUrl="${his.streaming_url }">
											<img width="25px" height="14px" src="${his.thumb_url }" alt="" />${fn:substring(his.title, 0, 21)}...
										</a>
									</dd>
									</c:when>
									<c:otherwise>
	                                <dd>
	                                	<a id="his" data-contentId="${his.content_id }" data-streamingUrl="${his.streaming_url }">
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
								<img id="vbHome" src="./resources/images/common/img_logo2.png" alt="Digital Library MAMs" />
							</a>
						</h1>
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
	            	<div class="detail mlr56">
	                	<div class="detail_left">
	                    	<h2><c:out value="${pageInfo.getPlaylist_name()}"/><a class="f_right" id="goList"><img src="./resources/images/common/detai_list.png" alt="List" /></a></h2>
	                        <div class="detail_movie"></div>
	                        <div class="datail_title">
	                        	<h3>${oneStreamPlay.getTitle()}</h3>
	                            <p>${oneStreamPlay.getDuration()} </p>
	                            <!-- 
	                            <span class="admin_icon"><img src="./resources/images/common/icon_admin.png" alt="admin" /></span>
	                             -->
	                        </div>
	                        <div class="datail_info">
	                        	<ul>
	                              <li><span>Category&nbsp;&gt;&nbsp;</span>${pageInfo.category}&nbsp;&gt;&nbsp;${pageInfo.playlist_name}</li>
	                                <li><span>ID&nbsp;:&nbsp;</span>${oneStreamPlay.getCustom_id()}</li>
	                                <li><span>Region&nbsp;:&nbsp;</span>${oneStreamPlay.tag.region}</li>
	                                <li><span>Tag&nbsp;:&nbsp;</span>${oneStreamPlay.tag.category}, ${oneStreamPlay.tag.region}, ${oneStreamPlay.tag.year}, ${oneStreamPlay.tag.type}, ${oneStreamPlay.tag.official}</li>
	                                <hr>
	                                <p>${oneStreamPlay.description}</p>
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
	                                <c:forEach var="file" items="${oneStreamPlay.getDownloadFile()}" varStatus="status">
	                                <c:choose>
	                                <c:when test="${file.getContainer() eq  'flv' || file.getContainer() eq 'mkv' || status.count eq 6}"></c:when>
	                                <c:otherwise>
	                                <li>
	                                	<a id="getTheFile" data-download="${file.getDownload_url()}" data-mediaType="${file.getMedia_type()}" data-contentSize="${file.getFile_size()}" data-videoFormat="${file.getContainer()}" data-videoCodec="${file.getVideo_codec()}" data-videoBps="${file.getVideo_bitrate()}" data-videoFps="${file.getVideo_framerate()}" data-audioCodec="${file.getAudio_codec()}" data-audioBps="${file.getAudio_bitrate()}" data-audioChannel="${file.getAudio_channel()}" data-audioHz="${file.getAudio_samplerate()}">
	                                		<img id="mp4Img" src="./resources/images/common/down_<c:out value="${file.getContainer()}"/>.png" alt="download" /><c:out value="${file.getTitle()}"/>.<c:out value="${file.getContainer()}"/>
	                                	</a>
	                                </li>
	                                </c:otherwise>
	                                </c:choose>
	                                </c:forEach>
	                            </ul>
	                            <hr />
	                            <span class="download_info_title">File info</span>
	                            <ul class="download_info">
	                            	<li>
	                                	<ul>
	                                    	<li><span>Contents Type&nbsp;:&nbsp;</span><label id="mediaType">Video</label></li>
	                                        <li><span>Scale&nbsp;:&nbsp;</span>the base rate</li>
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
	                        <!-- 
	                        <div class="d_share">
	                        	<ul>
	                            	<li class="share_menu01"><a>facebook</a></li>
	                                <li class="share_menu02"><a>youtube</a></li>
	                                <li class="share_menu03"><a>twitter</a></li>
	                                <li class="share_menu04"><a>google+</a></li>
	                                <li class="share_menu05 eng"><a>pinterest</a></li>
	                            </ul>
	                        </div>
	                         -->
	                        <a class="btn_list" id="goList">List</a>
	                    </div>
	                    <div class="detail_right">
	                    	<div class="dr_title"><p><c:out value="${pageInfo.getPlaylist_name()}"/></p><span id="moreVideoMark">more <c:out value="${pageInfo.getTotalCount() - 1}"/> videos</span></div>
	                        <ul class="detail_slide">
	                        	<c:set var="nowPlayContent_id" value="${oneStreamPlay.content_id}"/>
	                        	<c:forEach  var="detailSlide" items="${list }" varStatus="status">
	                        	<c:choose>
	                        	<c:when test="${detailSlide.content_id eq nowPlayContent_id }">
	                            <li class="slide">
	                                <a id="corpSlide"  data-contentId="${detailSlide.content_id }" data-playlistName="${detailSlide.getTag().getCategory()}">
	                                    <div class="d_slide_img">
	                                        <img src="${detailSlide.thumb_url }" alt="">
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
	                                <a id="corpSlide" data-contentId="${detailSlide.content_id }" data-playlistName="${detailSlide.getTag().getCategory()}">
	                                    <div class="d_slide_img">
                                        	<img src="${detailSlide.thumb_url}" alt="" />
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
                            	<c:forEach var="conLst" items="${viewCountASC}" varStatus="status">
	                            	<li>
	                                    <a data-streaming="${conLst.streaming_url}" data-thumb="${conLst.thumb_url}" data-title="${conLst.title}">
	                                       <div class="rm_img">
	                                           <img src="<c:out value="${conLst.getThumb_url()}"/>" alt="" />
	                                       </div>
	                                       <div class="rm_info">
		                                       <c:choose>
		                                    	<c:when test="${fn:length(conLst.title) > 23 }">
		                                    	 <h3 class="on">${fn:substring(conLst.title, 0, 23)}...</h3>
		                                    	</c:when>
		                                    	<c:otherwise>
		                                    	 <h3 class="on">${conLst.title }</h3>
		                                    	</c:otherwise>
		                                    	</c:choose>
	                                           <span><c:out value="${conLst.getReg_date()}"/></span>
	                                       </div>
	                                    </a>
	                                </li>
	                        	</c:forEach>
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
	                    <dd>Contents Type : <label id="mediaType"></label></dd>
	                    <dd>Scale : the base rate</dd>
	                    <dd>Size : <label id="width"></label>x<label id="height"></label> HD <label id="fileSize"></label></dd>
	                    <dd>Video Format : <label id="container"></label></dd>
	                    <dd>Video Codec : <label id="videoCodec"></label></dd>
	                    <dd>Video bps : <label id="videoBps"></label></dd>
	                    <dd>Video fps : <label id="videoFps"></label></dd>
	                    <dd>Audio Codec : <label id="audioCodec"></label></dd>
	                    <dd>Audio bps :<label id="audioBps"></label></dd>
	                    <dd>Audio channel : <label id="audioChannel"></label></dd>
	                    <dd>Audio Hz : <label id="audioSamplerate"></label></dd>
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
							"&mediaUrl=" + encodeURIComponent("${oneStreamPlay.getStreaming_url()}") +
							"&title=${oneStreamPlay.getTitle()}" +
							"&thumbUrl=" + encodeURIComponent("${oneStreamPlay.getThumb_url()}") +
							"&pid=${player_id}" +
							"&autoPlay=true\" name=\"flashvars\">"+
					"</object>"
				);
				
				$('a[id="getTheFile"]').mouseover(function() {
					var mType = $(this).attr('data-mediaType');
					var contentSize = $(this).attr('data-contentSize');
					var videoFormat = $(this).attr('data-videoFormat');
					var videoCodec = $(this).attr('data-videoCodec');
					var videoBps = $(this).attr('data-videoBps');
					var videoFps = $(this).attr('data-videoFps');
					var audioCodec = $(this).attr('data-audioCodec');
					var audioBps = $(this).attr('data-audioBps');
					var audioChannel = $(this).attr('data-audioChannel');
					var audioHz = $(this).attr('data-audioHz');
					var download = $(this).attr('data-download');
					$(this).attr('href', download);
					$('#mediaType').text(mType);
					$('#contentSize').text(contentSize);
					$('#videoFormat').text(videoFormat);
					$('#videoCodec').text(videoCodec);
					$('#videoBps').text(videoBps);
					$('#videoFps').text(videoFps);
					$('#audioCodec').text(audioCodec);
					$('#audioBps').text(audioBps);
					$('#audioChannel').text(audioChannel);
					$('#audioHz').text(audioHz);
				});

				$('a[id="getTheFile"]').mouseout(function() {
					//$(this).removeProp('href');
					$('#mediaType').text('');
					$('#contentSize').text('');
					$('#videoFormat').text('');
					$('#videoCodec').text('');
					$('#videoBps').text('');
					$('#videoFps').text('');
					$('#audioCodec').text('');
					$('#audioBps').text('');
					$('#audioChannel').text('');
					$('#audioHz').text('');
				});

				$('a[id="getTheFile"]').click(function() {
					
				});
				
				// 우측 사이드 thumb nail 을 클릭하면 해당 컨텐츠 실행
				$('a[id="corpSlide"]').click(function() {
					var mamCook		= null;
					var contentId 	= null;
					var playlistName= null;
					var formElement	= null;
					var hiddenCon 	= null;
					var hiddenHis	= null;
					var hiddenPln	= null;
					mamCook 	= $.cookies.get('mamsCookie');
					contentId 	= $(this).attr('data-contentId');
					playlistName= $(this).attr('data-playlistName');
					if (!validCookieContent.isExistContentId(mamCook.myHistory, contentId)) {
						mamCook.myHistory.push(contentId);
						$.cookies.set('mamsCookie', JSON.stringify(mamCook));
					}
					formElement = $('<form></form>').prop({'method':'POST', 'action':'detail'});
					hiddenCon 	= $('<input>').prop({'type':'hidden','name':'content_id','value':contentId});
					hiddenPln 	= $('<input>').prop({'type':'hidden','name':'playlist_name','value':playlistName});
					hiddenHis 	= $('<input>').prop({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
					formElement.append(hiddenCon, hiddenPln, hiddenHis).submit();
				});
				
				// 북마크 추가
				$('#bookCook').click(function() {
					 var mamCook 	= null;
					 var contentId 	= null;
					 mamCook = $.cookies.get('mamsCookie');
					 contentId = '${oneStreamPlay.getContent_id()}';
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
					var hiddenPln	= null;
					var hiddenPld	= null;
					var playlistName= null;
					var playlistId	= null;
					playlistName 	= '<c:out value="${pageInfo.getPlaylist_name()}"/>';
					playlistId		= '<c:out value="${pageInfo.getPlaylist_id()}"/>';
					mamCook 		= $.cookies.get('mamsCookie');
					hiddenPld		= $('<input>').prop({'type':'hidden','name':'playlist_id','value':playlistId});
					hiddenPln		= $('<input>').prop({'type':'hidden','name':'playlist_name','value':playlistName});
					hiddenHis 		= $('<input>').attr({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
					$('<form></form>').attr({'method':'post','action':'playlist'}).append(hiddenHis, hiddenPln, hiddenPld).appendTo('body').submit();
				});

				$('a[id="related"]').click(function() {
					console.log('hiIII');
					var streamingUrl 	= $(this).attr('data-streaming');
					var thumb 			= $(this).attr('data-thumb');
					var title 			= $(this).attr('data-title');
					
					$(".detail_movie").empty();
					$(".detail_movie").append(
						"<object data=\"http://vcase.myskcdn.com/static/ovp/ovp.swf\" name=\"ovp\" id=\"ovp\" type=\"application/x-shockwave-flash\" align=\"middle\" width=\"800\" height=\"480\" >" +
						"<param value=\"high\" name=\"quality\">" + 
						"<param value=\"#000000\" name=\"bgcolor\">" +
						"<param value=\"always\" name=\"allowscriptaccess\">" +
						"<param value=\"transparent\" name=\"wmode\">" +
						"<param value=\"true\" name=\"allowfullscreen\">" +
						"<param value=\"apiUrl=http://api.vcase.myskcdn.com" + 
								"&mediaUrl=" + encodeURIComponent(streamingUrl) +
								"&title=" + title +
								"&thumbUrl=" + encodeURIComponent(thumb) +
								"&pid=${player_id}" +
								"&autoPlay=true\" name=\"flashvars\">"+
						"</object>"
					);
				});
	    	});
	    </script>
	</body>
</html>

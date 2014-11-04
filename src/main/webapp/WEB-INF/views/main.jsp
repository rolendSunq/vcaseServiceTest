<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
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
	                    	<form class="search_form">
	                    		<label for="search" class="hide">아이디</label>
								<input id="search" name="mb_id" type="text" class="search_go" />
	                            <button class="search_btn">search</button>
	                        </form>
	                    </div>
						<div class="personal_menu">
							<ul>
								<li class="p_menu1"><a>설정</a></li>
								<li class="p_menu2"><a>업로드</a></li>
								<li class="p_menu3"><a>로그아웃</a></li>
							</ul>
						</div>
					</div>
					<!-- //header_bottom end -->
					<!-- gnb -->
					<div id="gnb">
						<ul>
							<li class="first menu menu1">
	                        	<a class="">Corporation</a>
	                        </li>
							<li class="menu menu2">
	                        	<a class="">Advertisements</a>
	                        </li>
							<li class="menu menu3">
	                        	<a class="">Products</a>
	                        </li>
							<li class="menu menu4">
	                        	<a class="">Motorsports</a>
	                        </li>
							<li class="menu menu5">
	                        	<a class="">Events</a>
	                        </li>
							<li class="last menu menu6">
	                        	<a class="">Others</a>
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
	                	<div class="latest_movie" id="latestMovie"></div>
	                    <div class="latest_info">
	                        <h3 id="playTitle">${oneStreamPlay.title }</h3>
	                        <p id="playTimeDate">${oneStreamPlay.duration }  /  ${oneStreamPlay.reg_date}</p>
	                        <ul class="latest_info_con">
		                        <li><span>Category&nbsp;&gt;&nbsp;</span>Product Movie</li>
	                            <li><span>ID&nbsp;:&nbsp;</span><span id="playContentId">${oneStreamPlay.content_id }</span></li><!-- 어떤 종류의 아이디를 명시하지 않아서 컨텐츠 ID로 표시함 -->
	                            <li id="playNation"><span>Region&nbsp;:&nbsp;</span>U.S.A</li>
	                            <li id="playTag"><span>Tag&nbsp;:&nbsp;</span>Tire,  Dynapro HP2, RA33</li>
	                            <li id="playVideoUrl"><span>Copy Video URL&nbsp;:&nbsp;</span>http://www.youtube.com/watch?v=N10WS9epgCo&amp;list=PLYkzrxbCq4D0jSb71h5RO2FVznuIf7YtN&amp;feature=player_detailpage</li>
	                        </ul>
	                        <hr />
	                        
	                        <ul class="latest_thumbnail">
	                        	<!-- thumb loop -->
	                        	<c:forEach var="object" items="${list }" end="3" varStatus="status">
	                        		<c:choose>
	                        		<c:when test="${status.count == 1 }"></c:when>
	                        		<c:when test="${status.count != 4 }">
	                        	<li class="mr22" id="content_item" data-content-id="${object.content_id}" data-content-thumb = "${object.thumb_url}" data-content-title="${object.title}" data-content-regDate="${object.reg_date }" data-content-duration="${object.duration }">
	                            	<a>
	                                	<span>
	                                		<img width="153px" height="85" src="${object.thumb_url}" alt="" />
	                                    	<span class="video-time">${object.duration}</span>
	                                    </span>
	                                </a>
	                            </li>
	                        		</c:when>
	                        		<c:otherwise>
	                            <li id="content_item" data-content-id="${object.content_id}" data-content-thumb = "${object.thumb_url}" data-content-title="${object.title}" data-content-regDate="${object.reg_date }" data-content-duration="${object.duration }">
	                            	<a>
	                                	<span>
	                                    	<img width="153px" height="85" src="${object.thumb_url}" alt="" />
	                                        <span class="video-time">${object.duration}</span>
	                                    </span>
	                                </a>
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
	                    	<c:forEach var="popularObject" items="${list }" end="4" varStatus="status">
	                    	<c:choose>
	                    		<c:when test="${status.count < 4}">
	                    	<li class="mr24">
	                        	<a>
	                            	<span>
	                                	<img width="196px" height="110px" src="${popularObject.thumb_url }" alt="" />
	                                    <span class="video-time">${popularObject.duration }</span>
	                                    <span class="admin_icon"><img src="./resources/images/common/icon_admin.png" alt="admin" /></span>
	                                </span>
	                            </a>
	                            <span>Corporation</span>
	                            <c:choose>
								<c:when test="${fn:length(popularObject.title) > 37}">
								<h3><a>${fn:substring(popularObject.title, 0, 37)}...</a></h3>
								</c:when>
								<c:otherwise>
								<h3><a>${popularObject.title}</a></h3>
								</c:otherwise>
								</c:choose>
	                            <span>2,384,880 views</span>
	                            <span class="f_left">2014-07-15</span>
	                            <span class="f_right mr5"><a class="download_btn" data-contentId="${popularObject.content_id }"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
	                        </li>
	                    		</c:when>
	                    		<c:when test="${status.count == 4 }">
	                        <li class="mr23">
	                        	<a>
	                            	<span>
	                                	<img width="196px" height="110px" src="${popularObject.thumb_url }" alt="" />
	                                    <span class="video-time">${popularObject.duration }</span>
	                                </span>
	                            </a>
	                            <span>Corporation</span>
	                            <c:choose>
								<c:when test="${fn:length(popularObject.title) > 37}">
								<h3><a>${fn:substring(popularObject.title, 0, 37)}...</a></h3>
								</c:when>
								<c:otherwise>
								<h3><a>${popularObject.title}</a></h3>
								</c:otherwise>
								</c:choose>
	                            <span>2,384,880 views</span>
	                            <span class="f_left">2014-07-15</span>
	                            <span class="f_right mr5"><a class="download_btn" data-contentId="${popularObject.content_id }"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
	                        </li>
	                    		</c:when>
	                    		<c:otherwise>
	                    	<li>
	                        	<a>
	                            	<span>
	                                	<img width="196px" height="110px" src="${popularObject.thumb_url }" alt="" />
	                                    <span class="video-time">${popularObject.duration }</span>
	                                </span>
	                            </a>
	                            <span>Corporation</span>
	                            <c:choose>
								<c:when test="${fn:length(popularObject.title) > 37}">
								<h3><a>${fn:substring(popularObject.title, 0, 37)}...</a></h3>
								</c:when>
								<c:otherwise>
								<h3><a>${popularObject.title}</a></h3>
								</c:otherwise>
								</c:choose>
	                            <span>2,384,880 views</span>
	                            <span class="f_left">2014-07-15</span>
	                            <span class="f_right mr5"><a class="download_btn" data-contentId="${popularObject.content_id }"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
	                        </li>
	                    		</c:otherwise>
	                    	</c:choose>
	                        </c:forEach>
	                    </ul>
	                </div>
	                <!-- //popular movie -->
	                
	                <!-- category -->
	                <div class="category">
	                    <h2 class="mlr56">Corporation<span>Ventus, Optimo, Dynapro, WinterTire Concept movie</span></h2>
	                    <ul class="category_slide">
	                    	<c:forEach var="corporation" items="${list }" end="10" varStatus="status">
	                        <li class="slide" data-contentId="${corporation.content_id }" data-thumbUrl="${corporation.thumb_url }">
	                            <a>
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
	                
	                <!-- more btn -->
	                <a class="more_btn">MORE</a>
	                <!-- /more btn -->
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
	
		</div>
		<script type="text/javascript" src="./resources/common/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="./resources/common/js/jquery.ui.all.js"></script>
	    <script type="text/javascript" src="./resources/common/js/jquery.bxslider.min.js"></script>
	    <script type="text/javascript" src="./resources/common/js/jquery.cookies.2.2.0.min.js"></script>
	    <script type="text/javascript" src="./resources/common/js/common.js"></script>
	    <script type="text/javascript">
	    	
	    	$(document).ready(function(){
	    		var date = new Date();
	    		var currentYear = date.getFullYear();
	    		var expireDate = new Date(currentYear + 1, 1, 1);
	    		var cookieOption = {
				    domain: '',
				    path: '/',
				    expiresAt: expireDate.toGMTString(),
				    secure: false
	    		};
	    		
	    		var myStorage = {
					myDownload:[],
					myBookmark:[],
					myHistory:[]
				};
	    		
	    		var validCookieContent = {
	    			isExistContentId:function(cookObject, contentID) {
	    				var i		= 0;
	    				var valid 	= 0;
	    				for (i; i < cookObject.length; i = i + 1) {
	    					if (cookObject[i] == contentID) {
	    						valid = valid + 1;
	    					}
	    				}
	    				if (valid == 0) {
	    					return false;
	    				} else {
	    					return true;
	    				}
	    			}
	    		};
	    		
				if ($.cookies.get('mamsCookie') == 'undefined' || $.cookies.get('mamsCookie') == null) {
					var jsonData = JSON.stringify(myStorage);
					$.cookies.set('mamsCookie', jsonData, cookieOption);
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
		    				title = title.replace(/\+/gi, ' ');
		    				thumbUrl 	= data[i].thumb_url;
		    				streamingUrl = data[i].streamingUrl;
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
						"<param value=\"apiUrl=http://api.vcase.myskcdn.com" + 
									"&mediaUrl=" + encodeURIComponent("${streamingUrl}") +
									"&title=${oneStreamPlay.title}" +
									"&thumbUrl=" + encodeURIComponent("${oneStreamPlay.thumb_url}") +
									"&pid=${player_id}" +
									"&autoPlay=true\" name=\"flashvars\">"+
					"</object>"
				);
				
				$('a[class="download_btn"]').click(function(){
					var contentId = $(this).attr('data-contentId');
					$('.mb5').text('ID : ' + contentId);
					$.getJSON('contentInfo', {"contentId":contentId}, function(data){
						var decodeFileName = decodeURIComponent(data.fileName);
						var fileName = decodeFileName.replace(/\+/g, ' ');
						
						var aTag = $('<a>').attr('href', data.downloadUrl).append('<img src="./resources/images/common/icon_mp4.png" alt="download"/>' + fileName).append('</a>');
						var ddTag = $('<dd>').append(aTag).append('</dd>');
						$("#downloadUrl").after(ddTag);
						$("#contentType").text('Contents Type : ' + data.mediaType);
						$("#size").text('Size : ' + data.size);
						$("#videoFormat").text('Video Format : ' + data.videoFormat);
						$("#videoCodec").text('Video Codec : ' + data.videoCodec);
						$("#videoBps").text('Video bps : ' + data.videoBps);
						$("#videoFps").text('Video fps : ' + data.videoFps);
						$("#audioCodec").text('Audio Codec : ' + data.audioCodec);
						$("#audioBps").text('Audio bps : ' + data.audioBps);
						$("#channel").text('Audio channel : ' + data.audioChannel);
						$("#hz").text('Audio Hz : ' + data.audioHz);
					});
				});
				
				// list_my_bookmark.jsp 페이지로 이동
				$('a[id="mamsBookmark"]').click(function() {
					var mamCook 	= null;
					var hiddenInp 	= null;
					var hiddenHis	= null;
					mamCook = $.cookies.get('mamsCookie');
					hiddenHis = $('<input>').attr({'type':'hidden', 'name':'historyList', 'value':JSON.stringify(mamCook.myHistory)});
					hiddenInp = $('<input>').attr({'type':'hidden', 'name':'bookmarkInfo', 'value':JSON.stringify(mamCook.myBookmark)});
					$('<form></form>').attr({'method':'POST','action':'moveMyBookmark'}).append(hiddenInp).append(hiddenHis).appendTo('body').submit();
				});
				
				// list_my_download.jsp 페이지로 이동
				$('#mamsDownload').click(function() {
					var mamCook		= null;
					var hiddenDwn 	= null;
					var hiddenHis	= null;
					mamCook = $.cookies.get('mamsCookie');
					hiddenDwn = $('<input>').attr({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
					hiddenHis = $('<input>').attr({'type':'hidden','name':'downloadList','value':JSON.stringify(mamCook.myDownload)});
					$('<form></form>').attr({'method':'POST','action':'mamsDownload'}).append(hiddenHis).append(hiddenDwn).appendTo('body').submit();
				});
				
				// -- 11/4 update
				$('li[class="slide"]').click(function() {
					var mamCook		= null;
					var jsonData 	= null;
					var hiddenCon	= null;
					var hiddenTmb	= null;
					var hiddenHis	= null;
					var contentId 	= $(this).attr('data-contentId');
					var thumbUrl 	= $(this).attr('data-thumbUrl');
					mamCook = $.cookies.get('mamsCookie');
					if (!validCookieContent.isExistContentId(mamCook.myHistory, contentId)) {
						mamCook.myHistory.push(contentId);
					}
					jsonData = JSON.stringify(mamCook);
					$.cookies.set('mamsCookie', jsonData);
					hiddenCon 	= $('<input>').attr({'type':'hidden','name':'content_id','value':contentId});
					hiddenTmb 	= $('<input>').attr({'type':'hidden','name':'thumbUrl','value':thumbUrl});
					hiddenHis	= $('<input>').attr({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
					$('<form>').attr({'method':'POST','action':'detail'}).append(hiddenCon).append(hiddenTmb).append(hiddenHis).appendTo('body').submit();
				});
				
				$('#myMovies').click(function() {
					var cookieData = $.cookies.get('mamsCookie');
					var downLength = cookieData.myDownload.length;
					var bookLength = cookieData.myBookmark.length;
					$('#downloadCnt').text(downLength);
					$('#bookmarkCnt').text(bookLength);
				});
				
				// history 목록중 하나를 선택하면 detail.jsp 페이지로 이동한다. -- 11/4 update
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
				
	    	});
	    </script>
	</body>
</html>

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
	<form></form>
	<div class="wrapper">
    	<!-- my movie -->
        <div class="my_movie">
        	<div class="my_movie_off">
            	<a>my movie 페이지 열기m</a>
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
								<dd><a id="his" data-streamingUrl="${his.streamingUrl }" data-thumbUrl="${his.thumb_url }" data-title="${his.title }"><img width="25px" height="14px" src="${his.thumb_url }" alt="" />${fn:substring(his.title, 0, 21)}...</a></dd>
								</c:when>
								<c:otherwise>
                                <dd><a><img width="25px" height="14px" src="${his.thumb_url }" alt="" />${his.title }</a></dd>
								</c:otherwise>
								</c:choose>
                            	</c:forEach>
                            </dl>
                        </div>
                        <div class="my_movie_db">
                        	<a class="dow" id="mamsMyDownload">DOWNLOAD<span>0</span></a>
                            <a class="book" id="mamsMyBookmark">BOOKMARK<span id="bookmarkCnt">0</span></a>
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
                            <div>
                            </div>
                        </li>
						<li class="menu menu2">
                        	<a class="">Advertisements</a>
                            <div>
                            </div>
                        </li>
						<li class="menu menu3">
                        	<a class="">Products</a>
                            <div>
                            </div>
                        </li>
						<li class="menu menu4">
                        	<a class="">Motorsports</a>
                            <div>
                            </div>
                        </li>
						<li class="menu menu5">
                        	<a class="">Events</a>
                            <div>
                            </div>
                        </li>
						<li class="last menu menu6">
                        	<a class="">Others</a>
                            <div>
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
                    	<h2>Corporation<a class="f_right" href= "listDetail"><img src="./resources/images/common/detai_list.png" alt="List" /></a></h2>
                        <div class="detail_movie">
                        	<!-- 불러오는 주소 끝에 ;wmode=transparent [ex)  src="http://www.youtube.com/abc;wmode=transparent"]-->
                    		<!-- <iframe width="800" height="480" src="http://www.youtube.com/embed/KravbQxXB7k?list=PLYkzrxbCq4D0jSb71h5RO2FVznuIf7YtN;wmode=transparent" frameborder="0" allowfullscreen></iframe> -->
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
                        	<a class="d_link01">DOWNLOAD</a>
                            <a class="d_link02">SHARE</a>
                            <a class="d_link03" id="bookCook">BOOKMARK</a>
                            <div class="bookmark_layer">
                            	<p>Added to Mypage_Bookmark</p>
                                <a class="bookmark_my" id="mamsBookmark"  >GO TO MYPAGE</a>
                                <a class="bookmark_close">close</a>
                            </div>
                        </div>
                        <div class="d_download">
                        	<ul class="download_movie">
                        		<c:set var="fileName" value="${oneStreamPlay['fileName']}" />
                        		<c:set var="splitArr" value="${fn:split(fileName, '.') }" />
                        		<c:if test="${splitArr[1] == 'mov' }">
                            	<li><a id="fileFormat"><img src="./resources/images/common/icon_mov.png" alt="download" />${oneStreamPlay['fileName']}</a></li>
                        		</c:if>
                        		<c:if test="${splitArr[1] == 'wmv' }">
                                <li><a id="fileFormat"><img src="./resources/images/common/icon_wmv.png" alt="download" />${oneStreamPlay['fileName']}</a></li>
                        		</c:if>
                                <c:if test="${splitArr[1] == 'mp4' }">
                                <li><a id="fileFormat"><img src="./resources/images/common/icon_mp4.png" alt="download" />${oneStreamPlay['fileName']}</a></li>
                        		</c:if>
                                <c:if test="${splitArr[1] == 'mpeg' }">
                                <li><a id="fileFormat"><img src="./resources/images/common/icon_mpeg.png" alt="download" />${oneStreamPlay['fileName']}</a></li>
                        		</c:if>
                                <c:if test="${splitArr[1] == 'avi' }">
                                <li><a id="fileFormat"><img src="./resources/images/common/icon_avi.png" alt="download" />${oneStreamPlay['fileName']}</a></li>
                        		</c:if>
                                <c:if test="${splitArr[1] == 'flv' }">
                                <li><a id="fileFormat"><img src="./resources/images/common/icon_flv.png" alt="download" />${oneStreamPlay['fileName']}</a></li>
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
                        <a class="btn_list" href="listDetail">List</a>
                    </div>
                    <div class="detail_right">
                    	<div class="dr_title"><p>Corporation</p><span id="moreVideoMark">more ${totalCount - 1 } videos</span></div>
                        <ul class="detail_slide">
                        	<c:set var="nowPlayContent_id" value="${oneStreamPlay['content_id'] }"/>
                        	<c:forEach  var="detailSlide" items="${list }" varStatus="">
                        	<c:choose>
                        	<c:when test="${detailSlide.content_id == nowPlayContent_id }">
                            <li class="slide">
                                <a  id="corpSlide"  data-contentId="${detailSlide.content_id }" data-thumbUrl="${detailSlide.thumb_url }">
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
    <script type="text/javascript" src="./resources/common/js/common.js"></script>
    <script type="text/javascript">
    	$(document).ready(function() {
    		$(".detail_movie").empty();
			$(".detail_movie").append(
				"<object data=\"http://vcase.myskcdn.com/static/ovp/ovp.swf\" name=\"ovp\" id=\"ovp\" type=\"application/x-shockwave-flash\" align=\"middle\" width=\"800\" height=\"480\" >" +
				"<param value=\"high\" name=\"quality\">" + 
				"<param value=\"#000000\" name=\"bgcolor\">" +
				"<param value=\"always\" name=\"allowscriptaccess\">" +
				"<param value=\"true\" name=\"allowfullscreen\">" +
				"<param value=\"apiUrl=http://api.vcase.myskcdn.com" + 
						"&mediaUrl=" + encodeURIComponent("${streamingUrl}") +
						"&title=${oneStreamPlay['title']}" +
						"&thumbUrl=" + encodeURIComponent("${thumbUrl}") +
						"&pid=${player_id}" +
						"&autoPlay=true\" name=\"flashvars\">"+
				"</object>"
			);
			$('a[id="fileFormat"]').click(function() {
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
			
			$('a[id="corpSlide"]').click(function() {
				var contentId = $(this).attr('data-contentId');
				var thumbUrl = $(this).attr('data-thumbUrl');
				var hiddenCon = null;
				var hiddenThumb = null;
				hiddenCon = $('<input>').attr({'type':'hidden', 'name':'content_id', 'value':contentId});
				hiddenThumb = $('<input>').attr({'type':'hidden', 'name':'thumbUrl', 'value':thumbUrl});
				$('<form>').attr({'method':'POST', 'action':'detail'}).append(hiddenCon).append(hiddenThumb).append('</form>').submit();
			});
			// 북마크 추가
			$('#bookCook').click(function() {
			});
			$('a[id="mamsBookmark"]').click(function() {
				var jsonResult = $.cookies.get('mamsCookie');
				var bookmarkData = JSON.stringify(jsonResult.bookmark);
				$('form').attr({'method':'POST','action':'moveMyBookmark?bookmarkInfo=' + bookmarkData.toString()}).submit();
			});
			
			$('#mamsMyDownload').click(function() {
				$('<form>').attr({'method':'post','action':'mamsDownload'}).append('</form>').appendTo('body').submit();
			});
			
			$('a[id="his"]').click(function(){
				var streamingUrl = $(this).attr('data-streamingUrl');
				console.log('streamingUrl: ', streamingUrl);
				var thumbUrl = $(this).attr('data-thumbUrl');
				var title = $(this).attr('data-title');
				$(".detail_movie").empty();
				$(".detail_movie").append(
					"<object data=\"http://vcase.myskcdn.com/static/ovp/ovp.swf\" name=\"ovp\" id=\"ovp\" type=\"application/x-shockwave-flash\" align=\"middle\" width=\"800\" height=\"480\" >" +
					"<param value=\"high\" name=\"quality\">" + 
					"<param value=\"#000000\" name=\"bgcolor\">" +
					"<param value=\"always\" name=\"allowscriptaccess\">" +
					"<param value=\"true\" name=\"allowfullscreen\">" +
					"<param value=\"apiUrl=http://api.vcase.myskcdn.com" + 
							"&mediaUrl=" + encodeURIComponent(streamingUrl) +
							"&title=" + title +
							"&thumbUrl=" + encodeURIComponent(thumbUrl) +
							"&pid=${player_id}" +
							"&autoPlay=true\" name=\"flashvars\">"+
					"</object>"
				);
			});
    	})
    </script>
</body>
</html>

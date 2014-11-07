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
    
    	<!-- my movie -->
        <div class="my_movie">
        	<div class="my_movie_off">
            	<a id="myMovies">my movie 페이지 열기m</a>
            </div>
        	<div class="my_movie_on">
            	<div class="my_movie_bg">
                	<div class="my_movie_con">
                    	<div class="my_movie_close">
                    		<a >close</a>
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
						<a >
							<img id="hankookHome" src="./resources/images/common/img_logo.png" alt="Hankook - driving emotion" />
							<img id="mamsHome" src="./resources/images/common/img_logo2.png" alt="Digital Library MAMs" />
						</a>
					</h1>
					<div class="util_navi">
						<ul>
							<li class="util1"><a >동영상</a></li>
							<li class="util2"><a >홈</a></li>
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
							<li class="p_menu1"><a >설정</a></li>
							<li class="p_menu2"><a >업로드</a></li>
							<li class="p_menu3"><a >로그아웃</a></li>
						</ul>
					</div>
				</div>
				<!-- //header_bottom end -->
				<!-- gnb -->
				<div id="gnb">
					<ul>
						<li class="first menu menu1">
							<a class="" >Corporation</a>
						</li>
						<li class="menu menu2">
							<a class="" >Advertisements</a>
						</li>
						<li class="menu menu3">
							<a class="" >Products</a>
						</li>
						<li class="menu menu4">
							<a class="" >Motorsports</a>
						</li>
						<li class="menu menu5">
							<a class="" >Events</a>
							<div>
								<ul class="depth2">
								</ul>
							</div>
						</li>
						<li class="last menu menu6">
							<a class="" >Others</a>
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
				<!-- popular movie -->
				<div class="popular_movie my_list">
					<h2>My Download</h2>
					<div class="search">
						<label for="search_word">
							Search within<input type="text" id="search_word" />
							<a  class="btn_search">찾기</a>
						</label>
					</div>
					<div class="list_top">
						<ul class="sort_count">
							<li class="list20"><a >20개씩 보기</a></li>
							<li class="list15"><a >15개씩 보기</a></li>
							<li class="list10"><a >10개씩 보기</a></li>
						</ul>
						<div class="list_top_right">
							<div class="by first">
								<span>Filter by</span>
								<div class="drop_menu">
									<a >Region</a>
									<input class="hide" type="text" value="" />
									<!-- li 안의 a 태그를 클릭하면 input 태그 안의 value에 해당 값이 들어가도록 개발해주시면 됩니다. -->
									<ul>
										<li><a >region</a></li>
										<li><a >Contents</a></li>
										<li><a >Size</a></li>
                                        <li><a >Video Format</a></li>
                                        <li><a >Video Codec</a></li>
									</ul>
								</div>
							</div>
							<div class="by">
								<span>Sort by</span>
								<div class="drop_menu">
									<a >Select</a>
									<input class="hide" type="text" value="" />
									<ul>
										<li><a >Select</a></li>
										<li><a >Upload date</a></li>
										<li><a >View count </a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<ul class="thumbnail">
						<c:forEach var="content" items="${list }" varStatus="status">
						<c:choose>
						<c:when test="${status.count % 5 == 1 || status.count % 5 == 2 || status.count % 5 == 3 }">
						<li class="mr24">
							<a data-contentId="${content.content_id }" data-thumbUrl="${content.thumb_url }">
								<span>
									<img width="196px" height="110px" src="${content.thumb_url }" alt="" />
									<span class="video-time">${content.duration }</span>
									<span class="admin_icon"><img src="./resources/images/common/icon_admin.png" alt="admin" /></span>
								</span>
							</a>
							<span>Corporation</span>
							<c:choose>
							<c:when test="${fn:length(content.title) > 37}">
							<h3><a>${fn:substring(content.title, 0, 37)}...</a></h3>
							</c:when>
							<c:otherwise>
							<h3><a>${content.title}</a></h3>
							</c:otherwise>
							</c:choose>
							<span>2,384,880 views</span>
							<span class="f_left"><input type="checkbox" id="chkbox" data-contentId="${content.content_id }"/>${content.reg_date }</span>
							<span class="f_right mr5"><a class="download_btn" data-contentId="${content.content_id }" data-fileName="${content.fileName }" data-downloadUrl="${content.downloadUrl }" data-mediaType="${content.mediaType }" data-size="${content.size }" data-videoFormat="${content.videoFormat }" data-videoCodec="${content.videoCodec }" data-videoBps="${content.videoBps }" data-videoFps="${content.videoFps }" data-audioCodec="${content.audioCodec }" data-audioBps="${content.audioBps }" data-channel="${content.audioChannel }" data-hz="${content.audioHz }"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
						</li>
						</c:when>
						<c:when test="${status.count % 5 == 4 }">
						<li class="mr23">
							<a data-contentId="${content.content_id }" data-thumbUrl="${content.thumb_url }">
								<span>
									<img width="196px" height="110px" src="${content.thumb_url }" alt="" />
									<span class="video-time">${content.duration }</span>
								</span>
							</a>
							<span>Corporation</span>
							<c:choose>
							<c:when test="${fn:length(content.title) > 37}">
							<h3><a>${fn:substring(content.title, 0, 37)}...</a></h3>
							</c:when>
							<c:otherwise>
							<h3><a>${content.title}</a></h3>
							</c:otherwise>
							</c:choose>
							<span>2,384,880 views</span>
							<span class="f_left"><input type="checkbox" id="chkbox" data-contentId="${content.content_id }"/>${content.reg_date }</span>
							<span class="f_right mr5"><a class="download_btn" data-contentId="${content.content_id }" data-fileName="${content.fileName }" data-downloadUrl="${content.downloadUrl }" data-mediaType="${content.mediaType }" data-size="${content.size }" data-videoFormat="${content.videoFormat }" data-videoCodec="${content.videoCodec }" data-videoBps="${content.videoBps }" data-videoFps="${content.videoFps }" data-audioCodec="${content.audioCodec }" data-audioBps="${content.audioBps }" data-channel="${content.audioChannel }" data-hz="${content.audioHz }"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
						</li>
						</c:when>
						<c:when test="${status.count % 5 == 0 }">
						<li>
							<a data-contentId="${content.content_id }" data-thumbUrl="${content.thumb_url }">
								<span>
									<img width="196px" height="110px" src="${content.thumb_url }" alt="" />
									<span class="video-time">${content.duration }</span>
								</span>
							</a>
							<span>Corporation</span>
							<c:choose>
							<c:when test="${fn:length(content.title) > 37}">
							<h3><a>${fn:substring(content.title, 0, 37)}...</a></h3>
							</c:when>
							<c:otherwise>
							<h3><a>${content.title}</a></h3>
							</c:otherwise>
							</c:choose>
							<span>2,384,880 views</span>
							<span class="f_left"><input type="checkbox" id="chkbox" data-contentId="${content.content_id }"/>${content.reg_date }</span>
							<span class="f_right mr5">
								<a class="download_btn" data-contentId="${content.content_id }" data-fileName="${content.fileName }" data-downloadUrl="${content.downloadUrl }" data-mediaType="${content.mediaType }" data-size="${content.size }" data-videoFormat="${content.videoFormat }" data-videoCodec="${content.videoCodec }" data-videoBps="${content.videoBps }" data-videoFps="${content.videoFps }" data-audioCodec="${content.audioCodec }" data-audioBps="${content.audioBps }" data-channel="${content.audioChannel }" data-hz="${content.audioHz }">
									<img src="./resources/images/common/dow_icon.png" alt="download" />
								</a>
							</span>
						</li>
						</c:when>
						</c:choose>
						</c:forEach>
					</ul>
					<div class="list_bottom">
						<div class="count">
							<span class="now">1 - 15</span> of 35
						</div>
						<div class="page_control">
							<div class="control"><a  class="btn_prev">previous</a></div>
							<div class="pages">
								<a  class="on">1</a>
								<a>2</a>
								<a>3</a>
								<a>4</a>
							</div>
							<div class="control"><a  class="btn_next">next</a></div>
						</div>
					</div>
					<div class="list_btns txt_left">
						<input type="checkbox" id="allClear" value="" class="mr20" />
						<a class="btn_delete">Delete</a>
					</div>
				</div>
				<!-- //popular movie -->

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
						<li><a >Digital library</a></li>
						<li><a >Digital library lite</a></li>
						<li><a >Hankooktire Global Site</a></li>
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
					<li class="mb5" id="myId">ID : </li>
					<li>region : korea</li>
				</ul>
				<hr />
				<dl class="download">
					<dt>DOWNLOAD</dt>
					<dd><a id="formatType"><img src="./resources/images/common/icon_mov.png" alt="download" /><label id="exten"></label>.mov</a></dd>
					<dd><a id="formatType"><img src="./resources/images/common/icon_wmv.png" alt="download" /><label id="exten"></label>.wmv</a></dd>
					<dd><a id="formatType"><img src="./resources/images/common/icon_mp4.png" alt="download" /><label id="exten"></label>.mp4</a></dd>
					<dd><a id="formatType"><img src="./resources/images/common/icon_mpeg.png" alt="download"/><label id="exten"></label>.mpeg</a></dd>
					<dd><a id="formatType"><img src="./resources/images/common/icon_avi.png" alt="download" /><label id="exten"></label>.avi</a></dd>
					<dd><a id="formatType"><img src="./resources/images/common/icon_flv.png" alt="download" /><label id="exten"></label>.flv</a></dd>
				</dl>
				<hr />
				<dl class="file_info">
					<dt>fILE INFO</dt>
                    <dd id="meidaType">Contents Type :</dd>
                    <dd>Scale : the base rate</dd>
                    <dd id="size">Size : </dd>
                    <dd id="videoFormat">Video Format : </dd>
                    <dd id="videoCodec">Video Codec : </dd>
                    <dd id="videoBps">Video bps : </dd>
                    <dd id="videoFps">Video fps : </dd>
                    <dd id="audioCodec">Audio Codec : </dd>
                    <dd id="audioBps">Audio bps : </dd>
                    <dd id="channel">Audio channel : </dd>
                    <dd id="hz">Audio Hz : </dd>
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
			var myStorage = {
				myDownload:[],
				myFavorite:[],
				myBookmark:[]
			};
			var downloadUrl = null;
			var contentType = null;
			var size = null;
			var videoFormat = null;
			var videoCodec = null;
			var videoBps = null;
			var videoFps = null;
			var audioCodec = null;
			var audioBps = null;
			var channel = null;
			var hz = null;
			$('#myMovies').click(function() {
				
			});
			
			$('a[class="download_btn"]').click(function() {
				var fileName = $(this).attr('data-fileName');
				var contentId = $(this).attr('data-contentId');
				var name = null;
				$('#myId').text('ID : ' + contentId);
				tempArr = fileName.split('.');
				name = tempArr[0].substring(0, 30);
				$('label[id="exten"]').text(name);
				downloadUrl = $(this).attr('data-downloadUrl');
				contentType = $(this).attr('data-mediaType');
				size = $(this).attr('data-size');
				videoFormat = $(this).attr('data-videoFormat');
				videoCodec = $(this).attr('data-videoCodec');
				videoBps = $(this).attr('data-videoBps');
				videoFps = $(this).attr('data-videoFps');
				audioCodec = $(this).attr('data-audioCodec');
				audioBps = $(this).attr('data-audioBps');
				channel = $(this).attr('data-channel');
				hz = $(this).attr('data-hz');
				$('#contentType').text('Contents Type : '); 
				$('#size').text('Size : ');
				$('#videoFormat').text('Video Format : '); 
				$('#videoCodec').text('Video Codec : ');
				$('#videoBps').text('Video bps : ');
				$('#videoFps').text('Video fps : ');
				$('#audioCodec').text('Audio Codec : ');
				$('#audioBps').text('Audio bps : ');
				$('#channel').text('Audio channel : ');
				$('#hz').text('Audio Hz : ');
			});
			
			$('a[id="formatType"]').click(function() {
				$('#contentType').text('Contents Type : ' + contentType); 
				$('#size').text('Size : ' + size);
				$('#videoFormat').text('Video Format : ' + videoFormat); 
				$('#videoCodec').text('Video Codec : ' + videoCodec);
				$('#videoBps').text('Video bps : ' + videoBps);
				$('#videoFps').text('Video fps : ' + videoFps);
				$('#audioCodec').text('Audio Codec : ' + audioCodec);
				$('#audioBps').text('Audio bps : ' + audioBps);
				$('#channel').text('Audio channel : ' + channel);
				$('#hz').text('Audio Hz : ' + hz);
				$(this).attr('href', downloadUrl);
			});
			
			$('input[id="allClear"]').click(function() {
				if ($(this).prop('checked') == true) {
					$('input[id="chkbox"]').each(function() {
						$(this).prop("checked", true);
					});
				} else {
					$('input[id="chkbox"]').each(function() {
						$(this).prop('checked', false);	
					});
				}
			});
			$('a[class="btn_delete"]').click(function() {
				
			});
		});
	</script>
</body>
</html>

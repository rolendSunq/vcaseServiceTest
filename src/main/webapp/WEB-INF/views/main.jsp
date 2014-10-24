<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	            	<a href="#">my movie 페이지 열기m</a>
	            </div>
	        	<div class="my_movie_on">
	            	<div class="my_movie_bg">
	                	<div class="my_movie_con">
	                    	<div class="my_movie_close">
	                    		<a href="#">close</a>
	                        </div>
	                        <div class="my_movie_user">
	                        	<span>Hi! jihong Min</span>
	                        </div>
	                        <div class="my_movie_wh">
	                        	<dl>
	                            	<dt>Watch History</dt>
	                                <dd><a href="#"><img width="25px" height="14px" src="./resources/images/common/thumbnail.jpg" alt="" />The UEFA Europa League 12-13 ...</a></dd>
	                                <dd><a href="#"><img width="25px" height="14px" src="./resources/images/common/thumbnail.jpg" alt="" />Eins mit der Straße - Hankook Reifen ...</a></dd>
	                                <dd><a href="#"><img width="25px" height="14px" src="./resources/images/common/thumbnail.jpg" alt="" />SIENTE LA CONEXION - NEUMATI...</a></dd>
	                                <dd><a href="#"><img width="25px" height="14px" src="./resources/images/common/thumbnail.jpg" alt="" />Be One with it" (20'', English, 2013)...</a></dd>
	                                <dd><a href="#"><img width="25px" height="14px" src="./resources/images/common/thumbnail.jpg" alt="" />Ne faites qu'un avec vos pneus...</a></dd>
	                            </dl>
	                        </div>
	                        <div class="my_movie_db">
	                        	<a class="dow" href="">DOWNLOAD<span>5</span></a>
	                            <a class="book" href="">BOOKMARK<span>32</span></a>
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
							<a href="#">
								<img src="./resources/images/common/img_logo.png" alt="Hankook - driving emotion" />
								<img src="./resources/images/common/img_logo2.png" alt="Digital Library MAMs" />
							</a>
						</h1>
						<div class="util_navi">
							<ul>
								<li class="util1"><a href="#">동영상</a></li>
								<li class="util2"><a href="#">홈</a></li>
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
								<li class="p_menu1"><a href="#">설정</a></li>
								<li class="p_menu2"><a href="#">업로드</a></li>
								<li class="p_menu3"><a href="#">로그아웃</a></li>
							</ul>
						</div>
					</div>
					<!-- //header_bottom end -->
					<!-- gnb -->
					<div id="gnb">
						<ul>
							<li class="first menu menu1">
	                        	<a class="" href="#">Corporation</a>
	                            <div>
	                                <ul class="depth2">
	                                    <li><a href="#">Video</a></li>
	                                    <li><a href="#">Image</a></li>
	                                    <li><a href="#">Other</a></li>
	                                </ul>
	                            </div>
	                        </li>
							<li class="menu menu2">
	                        	<a class="" href="#">Advertisements</a>
	                            <div>
	                                <ul class="depth2">
	                                    <li><a href="#">Video</a></li>
	                                    <li><a href="#">Image</a></li>
	                                    <li><a href="#">Other</a></li>
	                                </ul>
	                            </div>
	                        </li>
							<li class="menu menu3">
	                        	<a class="" href="#">Products</a>
	                            <div>
	                                <ul class="depth2">
	                                    <li><a href="#">Video</a></li>
	                                    <li><a href="#">Image</a></li>
	                                    <li><a href="#">Other</a></li>
	                                </ul>
	                            </div>
	                        </li>
							<li class="menu menu4">
	                        	<a class="" href="#">Motorsports</a>
	                            <div>
	                                <ul class="depth2">
	                                    <li><a href="#">Video</a></li>
	                                    <li><a href="#">Image</a></li>
	                                    <li><a href="#">Other</a></li>
	                                </ul>
	                            </div>
	                        </li>
							<li class="menu menu5">
	                        	<a class="" href="#">Events</a>
	                            <div>
	                                <ul class="depth2">
	                                    <li><a href="#">Video</a></li>
	                                    <li><a href="#">Image</a></li>
	                                    <li><a href="#">Other</a></li>
	                                </ul>
	                            </div>
	                        </li>
							<li class="last menu menu6">
	                        	<a class="" href="#">Others</a>
	                            <div>
	                                <ul class="depth2">
	                                    <li><a href="#">Video</a></li>
	                                    <li><a href="#">Image</a></li>
	                                    <li><a href="#">Other</a></li>
	                                </ul>
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
	                	<div class="latest_movie">
	                    	<!-- 불러오는 주소 끝에 ;wmode=transparent [ex)  src="http://www.youtube.com/abc;wmode=transparent"]-->
	                    	<!-- 동영상 플레이 -->
	                    	<!-- <iframe width="520" height="292" src="http://www.youtube.com/embed/KravbQxXB7k?list=PLYkzrxbCq4D0jSb71h5RO2FVznuIf7YtN;wmode=transparent" frameborder="0" allowfullscreen></iframe> -->
	                    	<object data="http://vcase.myskcdn.com/static/ovp/ovp.swf" name="ovp" id="ovp" type="application/x-shockwave-flash" align="middle" width="520" height="292" >
								<param value="high" name="quality">
								<param value="#000000" name="bgcolor">
								<param value="always" name="allowscriptaccess">
								<param value="true" name="allowfullscreen">
								<param id="streamUrl" value="" name="flashvars">
							</object>
	                    </div>
	                    <div class="latest_info">
	                        <h3>${oneStreamPlay.title }</h3>
	                        <p>${oneStreamPlay.duration }  / ${oneStreamPlay.mod_Date }</p>
	                        <ul class="latest_info_con">
		                        <li><span>Category&nbsp;&gt;&nbsp;</span>Product Movie</li>
	                            <li><span>ID&nbsp;:&nbsp;</span>${oneStreamPlay.content_id }</li><!-- 어떤 종류의 아이디를 명시하지 않아서 컨텐츠 ID로 표시함 -->
	                            <li><span>Region&nbsp;:&nbsp;</span>U.S.A</li>
	                            <li><span>Tag&nbsp;:&nbsp;</span>Tire,  Dynapro HP2, RA33</li>
	                            <li><span>Copy Video URL&nbsp;:&nbsp;</span>http://www.youtube.com/watch?v=N10WS9epgCo&amp;list=PLYkzrxbCq4D0jSb71h5RO2FVznuIf7YtN&amp;feature=player_detailpage</li>
	                        </ul>
	                        <hr />
	                        
	                        <ul class="latest_thumbnail">
	                        	<!-- thumb loop -->
	                        	<c:forEach var="object" items="${list }" end="3" varStatus="status">
	                        		<c:choose>
	                        		<c:when test="${status.count == 1 }"></c:when>
	                        		<c:when test="${status.count != 4 }">
	                        	<li class="mr22" id="content_item" data-content-id="${object.content_id}" data-content-thumb = "${object.thumb_url}" data-content-title="${object.title}">
	                            	<a href="#">
	                                	<span>
	                                		<img width="153px" height="85" src="${object.thumb_url}" alt="" />
	                                    	<span class="video-time">${object.duration}</span>
	                                    </span>
	                                </a>
	                            </li>
	                        		</c:when>
	                        		<c:otherwise>
	                            <li id="content_item" data-content-id="${object.content_id}" data-content-thumb = "${object.thumb_url}" data-content-title="${object.title}">
	                            	<a href="#">
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
	                    	<li class="mr24">
	                        	<a href="#">
	                            	<span>
	                                	<img src="${popularObject.thumb_url }" alt="" />
	                                    <span class="video-time">${popularObject.duration }</span>
	                                    <span class="admin_icon"><img src="./resources/images/common/icon_admin.png" alt="admin" /></span>
	                                </span>
	                            </a>
	                            <span>Corporation</span>
	                            <h3><a href="#">RA33_Dynapro HP2_Motion Graphic(ENG)</a></h3>
	                            <span>2,384,880 views</span>
	                            <span class="f_left">2014-07-15</span>
	                            <span class="f_right mr5"><a class="download_btn" href="#"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
	                        </li>
	                        </c:forEach>
	                        <!-- 
	                        <li class="mr24">
	                        	<a href="#">
	                            	<span>
	                                	<img src="./resources/images/common/thumbnail.jpg" alt="" />
	                                    <span class="video-time">7:04</span>
	                                </span>
	                            </a>
	                            <span>Corporation</span>
	                            <h3><a href="#">RA33_Dynapro HP2_Motion Graphic(ENG)</a></h3>
	                            <span>2,384,880 views</span>
	                            <span class="f_left">2014-07-15</span>
	                            <span class="f_right mr5"><a class="download_btn" href="#"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
	                        </li>
	                        <li class="mr24">
	                        	<a href="#">
	                            	<span>
	                                	<img src="./resources/images/common/thumbnail.jpg" alt="" />
	                                    <span class="video-time">7:04</span>
	                                    <span class="admin_icon"><img src="./resources/images/common/icon_admin.png" alt="admin" /></span>
	                                </span>
	                            </a>
	                            <span>Corporation</span>
	                            <h3><a href="#">RA33_Dynapro HP2_Motion Graphic(ENG)</a></h3>
	                            <span>2,384,880 views</span>
	                            <span class="f_left">2014-07-15</span>
	                            <span class="f_right mr5"><a class="download_btn" href="#"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
	                        </li>
	                        <li class="mr23">
	                        	<a href="#">
	                            	<span>
	                                	<img src="./resources/images/common/thumbnail.jpg" alt="" />
	                                    <span class="video-time">7:04</span>
	                                </span>
	                            </a>
	                            <span>Corporation</span>
	                            <h3><a href="#">RA33_Dynapro HP2_Motion Graphic(ENG)</a></h3>
	                            <span>2,384,880 views</span>
	                            <span class="f_left">2014-07-15</span>
	                            <span class="f_right mr5"><a class="download_btn" href="#"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
	                        </li>
	                        <li>
	                        	<a href="#">
	                            	<span>
	                                	<img src="./resources/images/common/thumbnail.jpg" alt="" />
	                                    <span class="video-time">7:04</span>
	                                </span>
	                            </a>
	                            <span>Corporation</span>
	                            <h3><a href="#">RA33_Dynapro HP2_Motion Graphic(ENG)</a></h3>
	                            <span>2,384,880 views</span>
	                            <span class="f_left">2014-07-15</span>
	                            <span class="f_right mr5"><a class="download_btn" href="#"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
	                        </li>
	                         -->
	                    </ul>
	                </div>
	                <!-- //popular movie -->
	                
	                <!-- category -->
	                <div class="category">
	                    <h2 class="mlr56">Corporation<span>Ventus, Optimo, Dynapro, WinterTire Concept movie</span></h2>
	                    <ul class="category_slide">
	                        <li class="slide">
	                            <a href="#">
	                            	<span>
	                                	<img src="./resources/images/common/thumbnail.jpg" alt="" />
	                                    <span class="video-time">7:01</span>
	                                </span>
	                            </a>
	                            <h3><a href="#">RA33_Dynapro HP2_Motion Graphic(ENG)</a></h3>
	                            <span class="f_left">2014-07-15</span>
	                            <span class="f_right mr5"><a class="download_btn" href="#"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
	                        </li>
	                        <li class="slide">
	                            <a href="#">
	                            	<span>
	                                	<img src="./resources/images/common/thumbnail.jpg" alt="" />
	                                    <span class="video-time">7:02</span>
	                                </span>
	                            </a>
	                            <h3><a href="#">RA33_Dynapro HP2_Motion Graphic(ENG)</a></h3>
	                            <span class="f_left">2014-07-15</span>
	                            <span class="f_right mr5"><a class="download_btn" href="#"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
	                        </li>
	                        <li class="slide">
	                            <a href="#">
	                            	<span>
	                                	<img src="./resources/images/common/thumbnail.jpg" alt="" />
	                                    <span class="video-time">7:03</span>
	                                    <span class="admin_icon"><img src="./resources/images/common/icon_admin.png" alt="admin" /></span>
	                                </span>
	                            </a>
	                            <h3><a href="#">RA33_Dynapro HP2_Motion Graphic(ENG)</a></h3>
	                            <span class="f_left">2014-07-15</span>
	                            <span class="f_right mr5"><a class="download_btn" href="#"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
	                        </li>
	                        <li class="slide">
	                            <a href="#">
	                            	<span>
	                                	<img src="./resources/images/common/thumbnail.jpg" alt="" />
	                                    <span class="video-time">7:04</span>
	                                </span>
	                            </a>
	                            <h3><a href="#">RA33_Dynapro HP2_Motion Graphic(ENG)</a></h3>
	                            <span class="f_left">2014-07-15</span>
	                            <span class="f_right mr5"><a class="download_btn" href="#"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
	                        </li>
	                        <li class="slide">
	                            <a href="#">
	                            	<span>
	                                	<img src="./resources/images/common/thumbnail.jpg" alt="" />
	                                    <span class="video-time">7:05</span>
	                                </span>
	                            </a>
	                            <h3><a href="#">RA33_Dynapro HP2_Motion Graphic(ENG)</a></h3>
	                            <span class="f_left">2014-07-15</span>
	                            <span class="f_right mr5"><a class="download_btn" href="#"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
	                        </li>
	                    </ul>
	                </div>
	                <!-- //category -->
	                
	                <!-- more btn -->
	                <a class="more_btn" href="#">MORE</a>
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
							<li><a href="#">Digital library</a></li>
							<li><a href="#">Digital library lite</a></li>
							<li><a href="#">Hankooktire Global Site</a></li>
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
	                    <dd><a href="#"><img src="./resources/images/common/icon_mov.png" alt="download" />RA33_Dynapro HP2_Motion Graphic(ENG).mov</a></dd>
	                    <dd><a href="#"><img src="./resources/images/common/icon_wmv.png" alt="download" />RA33_Dynapro HP2_Motion Graphic(ENG).wmv</a></dd>
	                    <dd><a href="#"><img src="./resources/images/common/icon_mp4.png" alt="download" />RA33_Dynapro HP2_Motion Graphic(ENG).mp4</a></dd>
	                    <dd><a href="#"><img src="./resources/images/common/icon_mpeg.png" alt="download" />RA33_Dynapro HP2_Motion Graphic(ENG).mpeg</a></dd>
	                    <dd><a href="#"><img src="./resources/images/common/icon_avi.png" alt="download" />RA33_Dynapro HP2_Motion Graphic(ENG).avi</a></dd>
	                    <dd><a href="#"><img src="./resources/images/common/icon_flv.png" alt="download" />RA33_Dynapro HP2_Motion Graphic(ENG).flv</a></dd>
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
	                <a class="dow_layer_close" href="#">close</a>
	            </div>
	        </div>
	        <!-- //download layer -->
	
		</div>
		<script type="text/javascript" src="./resources/common/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="./resources/common/js/jquery.ui.all.js"></script>
	    <script type="text/javascript" src="./resources/common/js/jquery.bxslider.min.js"></script>
	    <script type="text/javascript" src="./resources/common/js/common.js"></script>
	    <script type="text/javascript">
	    	$(document).ready(function(){
	    		var playUrl = encodeURIComponent('${streamingUrl}');
	    		var url = "apiUrl=http://api.vcase.myskcdn.com&amp;mediaUrl=" + playUrl+ "&amp;title=${oneStreamPlay.title}&amp;thumbUrl=${oneStreamPlay.thumb_url}&amp;pid=${player_id}&amp;autoPlay=false";
	    		$('#stramUrl').val(url);
	    	});
	    </script>
	</body>
</html>

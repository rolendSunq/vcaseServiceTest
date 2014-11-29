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
									<a id="his" data-streamingUrl="${his.streamingUrl }" data-thumbUrl="${his.thumb_url }" data-contentId="${his.content_id }">
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
						<form class="search_form">
							<label for="search" class="hide">아이디</label>
							<input id="search" name="mb_id" type="text" class="search_go" />
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
				<!-- popular movie -->
				<div class="popular_movie my_list">
					<h2>My Bookmark</h2>
					<!-- 
					<div class="search">
						<label for="search_word">
							Search within<input type="text" id="search_word" />
							<a class="btn_search">찾기</a>
						</label>
					</div>
					 -->
					<div class="list_top">
						<ul class="sort_count">
							<li class="list20"><a>20개씩 보기</a></li>
							<li class="list15"><a>15개씩 보기</a></li>
							<li class="list10"><a>10개씩 보기</a></li>
						</ul>
						<div class="list_top_right">
							<div class="by first">
								<span>Filter by</span>
								<div class="drop_menu">
									<a>Region</a>
									<input class="hide" type="text" value="" />
									<!-- li 안의 a 태그를 클릭하면 input 태그 안의 value에 해당 값이 들어가도록 개발해주시면 됩니다. -->
									<ul>
										<li id="regions"><a>Europe</a></li>
										<li id="regions"><a>America</a></li>
										<li id="regions"><a>Middle East & Africa</a></li>
                                        <li id="regions"><a>AsiaPacific</a></li>
                                        <li id="regions"><a>China</a></li>
                                        <li id="regions"><a>Korea</a></li>
									</ul>
								</div>
							</div>
							<div class="by">
								<span>Sort by</span>
								<div class="drop_menu">
									<a>Select</a>
									<input class="hide" type="text" value="" />
									<ul>
										<li><a>Select</a></li>
										<li><a>Upload date</a></li>
										<li><a>View count </a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<ul class="thumbnail">
						<c:forEach var="info" items="${item }" varStatus="status">
						<c:choose>
						<c:when test="${status.count % 5 == 1 || status.count % 5 == 2 || status.count % 5 == 3 }">
						<li class="mr24" id="myContent">
							<a>
								<span>
									<img width="196px" height="110px" src="${info.thumb_url }" alt="" />
									<span class="video-time">${info.duration }</span>
									<span class="admin_icon"><img src="./resources/images/common/icon_admin.png" alt="admin" /></span>
								</span>
							</a>
							<span>Corporation</span>
							<h3><a>${info.title }</a></h3>
							<span>2,384,880 views</span>
							<span class="f_left"><input type="checkbox" id="chkbox"/>${info.reg_date }</span>
							<span class="f_right mr5"><a class="download_btn"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
						</li>
						</c:when>
						<c:when test="${status.count % 5 == 4 }">
						<li class="mr23" id="myContent">
							<a>
								<span>
									<img width="196px" height="110px" src="${info.thumb_url }" alt="" />
									<span class="video-time">${info.duration }</span>
								</span>
							</a>
							<span>Corporation</span>
							<h3><a>${info.title }</a></h3>
							<span>2,384,880 views</span>
							<span class="f_left"><input type="checkbox" id="chkbox"/>${info.reg_date }</span>
							<span class="f_right mr5"><a class="download_btn"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
						</li>
						</c:when>
						<c:when test="${status.count % 5 == 0 }">
						<li id="myContent">
							<a>
								<span>
									<img width="196px" height="110px" src="${info.thumb_url }" alt="" />
									<span class="video-time">${info.duration }</span>
								</span>
							</a>
							<span>Corporation</span>
							<h3><a>${info.title }</a></h3>
							<span>2,384,880 views</span>
							<span class="f_left"><input type="checkbox" id="chkbox"/>${info.reg_date }</span>
							<span class="f_right mr5"><a class="download_btn"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
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
							<div class="control"><a class="btn_prev">previous</a></div>
							<div class="pages">
								<a class="on">1</a>
								<a>2</a>
								<a>3</a>
								<a>4</a>
							</div>
							<div class="control"><a class="btn_next">next</a></div>
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
		});
	</script>
</body>
</html>

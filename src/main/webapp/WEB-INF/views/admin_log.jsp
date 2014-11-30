<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<meta http-equiv="Expires" content="0" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
		<title>한국타이어</title>
		<link rel="Stylesheet" type="text/css" href="./resources/common/css/admin.css" />
		<link rel="Stylesheet" type="text/css" href="./resources/common/css/jquery-ui.css" />
	    <link rel="stylesheet" type="text/css" href="./resources/common/lib/jqueryui/jquery-ui-1.10.4.custom.css">
	</head>
	<body>
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
	                                <dd><a><img width="25px" height="14px" src="./resources/images/admin/thumbnail.jpg" alt="" />The UEFA Europa League 12-13 ...</a></dd>
	                                <dd><a><img width="25px" height="14px" src="./resources/images/admin/thumbnail.jpg" alt="" />Eins mit der Straße - Hankook Reifen ...</a></dd>
	                                <dd><a><img width="25px" height="14px" src="./resources/images/admin/thumbnail.jpg" alt="" />SIENTE LA CONEXION - NEUMATI...</a></dd>
	                                <dd><a><img width="25px" height="14px" src="./resources/images/admin/thumbnail.jpg" alt="" />Be One with it" (20'', English, 2013)...</a></dd>
	                                <dd><a><img width="25px" height="14px" src="./resources/images/admin/thumbnail.jpg" alt="" />Ne faites qu'un avec vos pneus...</a></dd>
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
							<a>
								<img src="./resources/images/admin/img_logo.png" alt="Hankook - driving emotion" />
								<img src="./resources/images/admin/img_logo2.png" alt="Digital Library MAMs" />
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
	                                    <li><a>Hankook Tire</a></li>
	                                    <li><a>Hankook Tire (RAW)</a></li>
	                                    <li><a>Other Brand</a></li>
	                                    <li><a>Other Brand (RAW)</a></li>
	                                    <li><a>Technology</a></li>
	                                    <li><a>Technology (RAW)</a></li>
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
	                                    <li><a>Other Motorsports</a></li>
	                                    <li><a>Other Motorsports (RAW)</a></li>
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
	                                    <li><a>Others</a></li>
	                                    <li><a>Others (RAW)</a></li>
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
	                <!-- admin title / tap menu -->
	                <div class="title_tab_con">
	                    <h2>Setting</h2>
	                    <!-- 탭메뉴 -->
	                    <ul class="admin_tab">
		                    <li id="tabUplo"><a id="goUploader">업로더 설정</a></li>
	                        <li id="tabDoc"class="on"><a id="goDoc">Document</a></li>
	                        <li id="tabLog"><a id="goLog">Log</a></li>
	                        <li></li>
	                        <li></li>
	                        <li></li>
	                        <li></li>
	                    </ul>
	                    <!-- //탭메뉴 -->
	                </div>
	                <!-- //admin title / tap menu -->
	                <!-- contents 영역 -->
	                <div class="admin_contents">
	                    <div class="admin_bg_none">
	                        <!-- Search_uploader 팝업 -->
	                        <!-- //Search_uploader 팝업 -->
	                        <!-- Log -->
	                        <div class="admin_title">
	                            <p class="log_title">Setting &nbsp; &gt; <span>Log</span></p>
	                        </div>
	                        <div class="select_con">
	                            <div class="select_left">
	                                <span class="width131">
	                                    <select name="" id="">
	                                        <option value="재생횟수">재생횟수</option>
	                                    </select>
	                                </span>
	                            </div>
	                            <div class="select_right">
	                                <span class="width253 date_wrap">
	                                    <input type="text" class="dateInput" id="startDate" name="" value="2014-10-10" readonly/>
	                                    ~&nbsp;
	                                    <input type="text" class="dateInput" id="endDate" name="" value="2014-11-09" readonly/>
	                                    <!--
	                                    <select name="" id="">
	                                        <option value="2014-10-10 ~ 2014-11-09">2014-1010 ~ 2014-11-09</option>
	                                    </select>
	                                    -->
	                                </span>
	                                <span class="width131">
	                                    <select name="" id="">
	                                        <option value="전체 플레이어">전체 플레이어</option>
	                                    </select>
	                                </span>
	                                <span class="width131">
	                                    <select name="" id="">
	                                        <option value="전체 시간대">전체 시간대</option>
	                                    </select>
	                                </span>
	                            </div>
	                        </div>
	                        <!-- //Log -->
	                        <!-- plugIn -->
	                        <div class="plugin_con">
	
	                        </div>
	                        <!-- //plugIn -->
	                        <!-- 테이블 영역 -->
	                        <div class="table_con log">
	                            <table class="uploader_table log" summary="업로더의 ID, 소속, 이메일, 그룹 등을 관리하는 표입니다.">
	                                <caption>업로더 관리</caption>
	                                <colgroup>
	                                    <col width="62px">
	                                    <col width="auto">
	                                    <col width="140px">
	                                    <col width="300px">
	                                    <col width="86px">
	                                </colgroup>
	                                <thead>
	                                <tr>
	                                    <th scope="col">번호</th>
	                                    <th scope="col">제목</th>
	                                    <th scope="col">콘텐츠ID</th>
	                                    <th scope="col">설명</th>
	                                    <th scope="col">삭제</th>
	                                </tr>
	                                </thead>
	                                <tbody>
	                                <tr>
	                                    <td>1</td>
	                                    <td class="left"><a href="#none">한국타이어 북미 광고영상</a></td>
	                                    <td>21000011</td>
	                                    <td class="left">비주얼커뮤니케이션팀</td>
	                                    <td>32514</td>
	                                </tr>
	                                <tr>
	                                    <td>2</td>
	                                    <td class="left"><a href="#none">한국타이어 북미 광고영상</a></td>
	                                    <td>21000011</td>
	                                    <td class="left">비주얼커뮤니케이션팀</td>
	                                    <td>32514</td>
	                                </tr>
	                                <tr>
	                                    <td>3</td>
	                                    <td class="left"><a href="#none">한국타이어 북미 광고영상</a></td>
	                                    <td>21000011</td>
	                                    <td class="left">비주얼커뮤니케이션팀</td>
	                                    <td>32514</td>
	                                </tr>
	                                <tr>
	                                    <td>4</td>
	                                    <td class="left"><a href="#none">한국타이어 북미 광고영상</a></td>
	                                    <td>21000011</td>
	                                    <td class="left">비주얼커뮤니케이션팀</td>
	                                    <td>32514</td>
	                                </tr>
	                                <tr>
	                                    <td>5</td>
	                                    <td class="left"><a href="#none">한국타이어 북미 광고영상</a></td>
	                                    <td>21000011</td>
	                                    <td class="left">비주얼커뮤니케이션팀</td>
	                                    <td>32514</td>
	                                </tr>
	                                </tbody>
	                            </table>
	                        </div>
	                        <!-- //테이블 영역 -->
	                        <!-- paging 영역 -->
	                        <!--
	                        <div class="paging_con width1072">
	                            <div class="left_btn_con width109">
	                                <div class="current_page">
	                                    <p><span>1 - 15</span> of 35</p>
	                                </div>
	                            </div>
	                            <div class="right_paging_con">
	                                <div class="paging_prev">
	                                    <a href="#none"><img src="./resources/images/admin/prev_btn_off.png" alt="previous"/>previous</a>
	                                </div>
	                                <div class="paging_num">
	                                    <span class="on"><a href="#none">1</a></span>
	                                    <span><a href="#none">2</a></span>
	                                    <span><a href="#none">3</a></span>
	                                </div>
	                                <div class="paging_next paging_on">
	                                    <a href="#none">next<img src="./resources/images/admin/next_btn_on.png" alt="next"/></a>
	                                </div>
	                            </div>
	                        </div>
	                        -->
	                        <!-- //paging 영역 -->
	
	                        <!-- //업로더설정 -->
	                    </div>
	                </div>
	                <!-- //contents 영역 -->
				</div>
			</div>
			<!-- //content_wrap end -->
			<!-- footer_wrap -->
			<div class="footer_wrap">
				<!-- footer -->
				<div id="footer">
					<h2><img src="./resources/images/admin/img_logo_bottom.gif" alt="Hankook - driving emotion" /></h2>
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
	
		</div>
		<script type="text/javascript" src="./resources/common/js/jquery-1.11.1.min.js"></script>
	    <script type="text/javascript" src="./resources/common/js/jquery.bxslider.min.js"></script>
	    <script type="text/javascript" src="./resources/common/lib/jqueryui/jquery-ui-1.10.4.custom.js"></script>
	    <script type="text/javascript" src="./resources/common/js/admin.js"></script>
	    <!-- <script type="text/javascript" src=".././resources/common/js/common.js"></script> -->
	    <script>
	        $(function() {
	            // 리스트
	            $.datepicker.regional['ko'] = {
	                closeText: '닫기',
	                prevText: '이전달',
	                nextText: '다음달',
	                currentText: '오늘',
	                monthNames: ['1월','2월','3월','4월','5월','6월',
	                    '7월','8월','9월','10월','11월','12월'],
	                monthNamesShort: ['1월','2월','3월','4월','5월','6월',
	                    '7월','8월','9월','10월','11월','12월'],
	                dayNames: ['일','월','화','수','목','금','토'],
	                dayNamesShort: ['일','월','화','수','목','금','토'],
	                dayNamesMin: ['일','월','화','수','목','금','토'],
	                //buttonImage: "/images/kr/create/btn_calendar.gif",
	                buttonImageOnly: false,
	                // showOn :"both",
	                weekHeader: 'Wk',
	                dateFormat: 'yy-mm-dd',
	                firstDay: 0,
	                isRTL: false,
	                duration:200,
	                showAnim:'show',
	                showMonthAfterYear: true,
	                yearSuffix: '년'
	            };
	            $.datepicker.setDefaults($.datepicker.regional['ko']);
	
	            $("#startDate").datepicker({ showOn: 'both', buttonImageOnly: true, buttonImage: './resources/images/admin/cal_btn.png' });
	            $("#endDate").datepicker({ showOn: 'both', buttonImageOnly: true, buttonImage: './resources/images/admin/cal_btn.png' });
	
	        });
	    </script>
	</body>
</html>

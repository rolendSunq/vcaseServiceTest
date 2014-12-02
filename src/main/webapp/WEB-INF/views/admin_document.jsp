<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	                        	<a class="dow" href="">DOWNLOAD<span>0</span></a>
	                            <a class="book" href="">BOOKMARK<span>0</span></a>
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
								<img id="hankookHome" src="./resources/images/admin/img_logo.png" alt="Hankook - driving emotion" />
								<img id="vbHome" src="./resources/images/admin/img_logo2.png" alt="Digital Library MAMs" />
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
	                     	<li id="tabUplo"><a>업로더 설정</a></li>
		                    <li id="tabDoc" class="on"><a>Document</a></li>
		                    <li id="tabLog"><a>Log</a></li>
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
	                    <!-- Add_Category 팝업 -->
	                    <div class="category_popup" id="cateAdd">
	                        <div class="category_title_con">
	                            <p>Category Add</p>
	                            <p class="close"><a id="addHide"><img src="./resources/images/admin/close_btn.png" alt="close"/></a></p>
	                        </div>
	                        <div class="category_contents">
	                            <P>Setting &gt; <span>Category Add</span></P>
	                            <div class="input_box">
	                                <input type="text" name="categoryName" id="categoryName" />
	                            </div>
	                            <p class="popup_btn_con"><a><img src="./resources/images/admin/pop_save_btn.png" alt="save"/></a></p>
	                        </div>
	                    </div>
	                    <!-- //Add_Category 팝업 -->
	
	                    <!-- Delete_Category 팝업 -->
	                    <div class="category_popup delete" id="cateDel">
	                        <div class="category_title_con">
	                            <p>Category Delete</p>
	                            <p class="close"><a><img src="./resources/images/admin/close_btn.png" alt="close"/></a></p>
	                        </div>
	                        <div class="category_contents">
	                            <P>Setting &gt; <span>Category Delete</span></P>
	                            <div class="input_box">
	                                <select name="" id="">
	                                    <option value="Company">Company</option>
	                                </select>
	                            </div>
	                            <p class="popup_btn_con"><a><img src="./resources/images/admin/pop_delete_btn.png" alt="delete"/></a></p>
	                        </div>
	                    </div>
	                    <!-- //Delete_Category 팝업 -->
	                    <!-- 좌측 카테고리 -->
	                    <div class="left_menu">
	                        <div class="left_menu_title">
	                            <p>Category</p>
	                            <div>
	                                <span><a><img src="./resources/images/admin/left_add_btn.png" alt=""/></a></span>
	                                <span><a><img src="./resources/images/admin/left_minus_btn.png" alt=""/></a></span>
	                            </div>
	                        </div>
	                        <ul class="left_menu_list">
	                            <li class="on" id="category" data-category="1300000203">
	                                <span class="text"><a>Admin</a></span>
	                                <span class="num"><a id="categoryNum1">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000248">
	                                <span class="text"><a>Company</a></span>
	                                <span class="num"><a id="categoryNum2">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000247">
	                                <span class="text"><a>Company (RAW)</a></span>
	                                <span class="num"><a id="categoryNum3">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000246">
	                                <span class="text"><a>Culture</a></span>
	                                <span class="num"><a id="categoryNum4">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000245">
	                                <span class="text"><a>Culture (RAW)</a></span>
	                                <span class="num"><a id="categoryNum5">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000244">
	                                <span class="text"><a>TV Footages</a></span>
	                                <span class="num"><a id="categoryNum6">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000243">
	                                <span class="text"><a>TV Footages (RAW)</a></span>
	                                <span class="num"><a id="categoryNum7">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000242">
	                                <span class="text"><a>TVC</a></span>
	                                <span class="num"><a id="categoryNum8">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000241">
	                                <span class="text"><a>TVC (RAW)</a></span>
	                                <span class="num"><a id="categoryNum9">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000240">
	                                <span class="text"><a>Campaign</a></span>
	                                <span class="num"><a id="categoryNum10">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000239">
	                                <span class="text"><a>Campaign (RAW)</a></span>
	                                <span class="num"><a id="categoryNum11">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000238">
	                                <span class="text"><a>Sports Marketing</a></span>
	                                <span class="num"><a id="categoryNum12">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000237">
	                                <span class="text"><a>Sports Marketing (RAW)</a></span>
	                                <span class="num"><a id="categoryNum13">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000236">
	                                <span class="text"><a>HanKook Tire</a></span>
	                                <span class="num"><a id="categoryNum14">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000235">
	                                <span class="text"><a>HanKook Tire (RAW)</a></span>
	                                <span class="num"><a id="categoryNum15">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000234">
	                                <span class="text"><a>Other Brand</a></span>
	                                <span class="num"><a id="categoryNum16">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000233">
	                                <span class="text"><a>Other Brand (RAW)</a></span>
	                                <span class="num"><a id="categoryNum17">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000232">
	                                <span class="text"><a>Technoloagy</a></span>
	                                <span class="num"><a id="categoryNum18">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000231">
	                                <span class="text"><a>Technoloagy (RAW)</a></span>
	                                <span class="num"><a id="categoryNum19">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000230">
	                                <span class="text"><a>Europe</a></span>
	                                <span class="num"><a id="categoryNum20">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000229">
	                                <span class="text"><a>Europe (RAW)</a></span>
	                                <span class="num"><a id="categoryNum21">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000228">
	                                <span class="text"><a>Other Motosports</a></span>
	                                <span class="num"><a id="categoryNum22">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000227">
	                                <span class="text"><a>Other Motosports (RAW)</a></span>
	                                <span class="num"><a id="categoryNum23">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000226">
	                                <span class="text"><a>Exhibition</a></span>
	                                <span class="num"><a id="categoryNum24">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000225">
	                                <span class="text"><a>Exhibition (RAW)</a></span>
	                                <span class="num"><a id="categoryNum25">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000224">
	                                <span class="text"><a>Promotion</a></span>
	                                <span class="num"><a id="categoryNum26">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000223">
	                                <span class="text"><a>Promotion (RAW)</a></span>
	                                <span class="num"><a id="categoryNum27">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000222">
	                                <span class="text"><a>Other Event</a></span>
	                                <span class="num"><a id="categoryNum28">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000221">
	                                <span class="text"><a>Other Event (RAW)</a></span>
	                                <span class="num"><a id="categoryNum29">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000220">
	                                <span class="text"><a>Other</a></span>
	                                <span class="num"><a id="categoryNum30">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000219">
	                                <span class="text"><a>Other (RAW)</a></span>
	                                <span class="num"><a id="categoryNum31">0</a></span>
	                            </li>
	                        </ul>
	                    </div>
	                    <!-- //좌측 카테고리 -->
	
	                    <div class="list_wrap">
	                    <!-- 리스트화면 _ 검색영역 -->
	                        <h3>Admin</h3>
	                        <div class="list_search_con">
	                            <span class="order">
	                                <select name="sort" id="sort" >
	                                    <option value="regDate">최신순</option>
	                                    <option value="viewCount">조회순</option>
	                                </select>
	                            </span>
	                            <span class="category">
	                                <select name="searchType" id="searchType" >
	                                    <option value="title">제목</option>
	                                    <option value="fileName">파일이름</option>
	                                    <option value="description">상세설명</option>
	                                </select>
	                            </span>
	                            <span class="search">
	                                <input type="text" name="search" id="search"/>
	                            </span>
	                            <span class="search_btn">
	                                <img src="./resources/images/admin/search_btn.png" alt="Search"/>
	                            </span>
	                        </div>
	                    <!-- //리스트화면 _ 검색영역 -->
	
	                    <!-- 리스트 -->
	                        <div class="list_con">
	                            <ul>
	                            <c:forEach var="content" items="${contentList }" varStatus="status">
	                                <li id="conlst">
	                                    <div class="list_check"><input type="checkbox" name="chkCon"/></div>
	                                    <div class="list_menu">
	                                        <div class="list_img">
	                                            <a><img width="101px" height="59" src="<c:out value="${content.getThumb_url() }" />" alt="썸네일이미지"/></a>
	                                        </div>
	                                        <div class="title_hit_con">
	                                            <p class="list_title"><c:out value="${content.getTitle() }" /></p>
	                                            <p class="list_hit"><c:out value="${content.getReg_date() }" /></p>
	                                        </div>
	                                        <div class="list_date">
	                                            <span><c:out value="${content.getView_count() }" /></span>
	                                        </div>
	                                    </div>
	                                </li>
	                            </c:forEach>
	                                <!-- view화면 -->
	                                    <div class="view_con">
	                                        <div class="view_img_con">
	                                            <ul>
	                                                <li class="view_detail_img"><a href=""><img src="./resources/images/admin/view_detail_img0.png" alt="상세이미지"/></a></li>
	                                                <li class=""><a href=""><img src="./resources/images/admin/view_thumb_img0.png" alt="썸네일이미지"/></a></li>
	                                                <li class="view_thumb_img"><a href=""><img src="./resources/images/admin/view_thumb_img0.png" alt="썸네일이미지"/></a></li>
	                                                <li class="view_thumb_img"><a href=""><img src="./resources/images/admin/view_thumb_img0.png" alt="썸네일이미지"/></a></li>
	                                                <li class="view_thumb_img"><a href=""><img src="./resources/images/admin/view_thumb_img0.png" alt="썸네일이미지"/></a></li>
	                                            </ul>
	                                        </div>
	                                        <div class="view_info_con">
	                                            <ul>
	                                                <li>콘텐츠 ID <span>1800001720</span></li>
	                                                <li>사용자 정의 ID : <span>2013332</span></li>
	                                                <li>파일명 <span>4e99d494cda8ead0e5fa93be76b4df60.jpg</span></li>
	                                            </ul>
	                                            <p class="extension">
	                                                확장자 정보
	                                                <select name="fileFormat" id="fileFormat">
	                                                    <option value="mp4">mp4</option>
	                                                    <option value="avi">avi</option>
	                                                    <option value="mov">mov</option>
	                                                    <option value="wmv">wmv</option>
	                                                </select>
	                                            </p>
	                                            <div class="extension_info">
	                                                <ul>
	                                                    <li>컨테이너  mp4</li>
	                                                    <li>비디오 코덱  mpeg4</li>
	                                                    <li>비디오 비트레이트(bps)  952610</li>
	                                                    <li>비디오 프레임레이트(fps)  15</li>
	                                                    <li>해상도  848x480</li>
	                                                </ul>
	                                                <ul>
	                                                    <li>오디오 코덱  aac</li>
	                                                    <li>오디오 비트레이트(bps)  47994</li>
	                                                    <li>오디오 채널(ch)  2</li>
	                                                    <li>등록 시간  2014.10.02 15:36</li>
	                                                    <li>수정 시간  2014.10.02 15:36</li>
	                                                </ul>
	                                            </div>
	                                        </div>
	
	                                        <!-- 업로드 정보 -->
	                                        <div class="view_up_info">
	                                            <p>업로드 정보</p>
	                                            <ul class="upload_left_con">
	                                                <li class="mb10">
	                                                    <p class="mb10">제목</p>
	                                                    <p><input type="text" name="" id=""/></p>
	                                                </li>
	                                                <li class="mb35">
	                                                    <p class="mb10">카테고리</p>
	                                                    <p>
	                                                        <select name="" id="">
	                                                            <option value="Motosports">Motosports</option>
	                                                        </select>
	                                                    </p>
	                                                </li>
	                                                <li class="width202">
	                                                    <span>Year</span>
	                                                    <select name="" id="">
	                                                        <option value="Select">Select</option>
	                                                    </select>
	                                                </li>
	                                                <li class="width202 ml20 right">
	                                                    <span>Type</span>
	                                                    <select name="" id="">
	                                                        <option value="Select">Select</option>
	                                                    </select>
	                                                </li>
	                                                <li class="width202 mb25">
	                                                    <span>Region</span>
	                                                    <select name="" id="">
	                                                        <option value="Select">Select</option>
	                                                    </select>
	                                                </li>
	                                                <li class="width202 radio right">
	                                                    <label for="video">Finalized Video</label> <input type="radio" name="" id="video" value="Finalized Video"/>
	                                                    <label for="data">Raw Data</label> <input type="radio" name="" id="data" value="Raw Data"/>
	                                                </li>
	                                                <li class="form_info">
	                                                    <p class="mb10">설명 Info</p>
	                                                    <p>
	                                                        <textarea name="" id="" cols="30" rows="10"></textarea>
	                                                    </p>
	                                                </li>
	                                            </ul>
	                                            <ul class="upload_right_con">
	                                                <li class="form_info">
	                                                    <p class="mb10">다운로드 주소 URL</p>
	                                                    <p>
	                                                        <textarea name="" id="" cols="30" rows="10"></textarea>
	                                                    </p>
	                                                </li>
	                                                <li class="form_info">
	                                                    <p class="mb10">스트리밍 주소 URL</p>
	                                                    <p>
	                                                        <textarea name="" id="" cols="30" rows="10"></textarea>
	                                                    </p>
	                                                </li>
	                                            </ul>
	                                        </div>
	                                        <!-- //업로드 정보 -->
	
	                                        <!-- save btn -->
	                                        <div class="save_btn_con">
	                                            <a id="pushTheSave"><img src="./resources/images/admin/view_save_btn.png" alt="save"/></a>
	                                        </div>
	                                        <!-- //save btn -->
	                                    </div>
	                                    <!-- //view화면 -->
	                            </ul>
	                        </div>
	                    <!-- //리스트 -->
	
	                    <!-- paging 영역 -->
	                    <div class="paging_con">
	                        <div class="left_btn_con">
	                            <div class="check_all">
	                                <input type="checkbox" name="allCheck"/>
	                            </div>
	                            <div class="add_delete">
	                                <span><a id="moveCategory"><img src="./resources/images/admin/add_btn.png" alt="파일추가"/></a></span>
	                                <span><a id="deleteContent"><img src="./resources/images/admin/delete_btn.png" alt="파일삭제"/></a></span>
	                            </div>
	                        </div>
	                        <div class="right_paging_con">
	                            <div class="paging_prev">
	                                <a><img src="./resources/images/admin/prev_btn_off.png" alt="previous"/>previous</a>
	                            </div>
	                            <div class="paging_num">
	                                <span class="on"><a>1</a></span>
	                                <span><a>2</a></span>
	                                <span><a>3</a></span>
	                            </div>
	                            <div class="paging_next paging_on">
	                                <a>next<img src="./resources/images/admin/next_btn_on.png" alt="next"/></a>
	                            </div>
	                        </div>
	                    </div>
	                    <!-- //paging 영역 -->
	
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
		<script type="text/javascript" src="./resources/common/js/jquery.ui.all.js"></script>
	    <script type="text/javascript" src="./resources/common/js/jquery.bxslider.min.js"></script>
	    <script type="text/javascript" src="./resources/common/js/jquery.cookies.2.2.0.min.js"></script>
	    <script type="text/javascript" src="./resources/common/js/admin.js"></script>
	    <!-- <script type="text/javascript" src=".././resources/common/js/common.js"></script> -->
	    <script>
	    	var cnt = [];
	    	<c:forEach var="playlist" items="${listCount}" varStatus="status">
	    		var pushVal = '<c:out value="${playlist.getCount()}" />';
				cnt.push(pushVal);
	    	</c:forEach>
	        $(document).ready(function() {
		        
		        // 좌측 컨텐트 리스트의 수를 표시한다.
		        $('a[id*=categoryNum]').each(function(index, element) {
					$(this).text(cnt[index]);
				});
				
	            // 리스트
	            var listContainer = $('.list_con > ul > li');
	            var menuList = $('.list_con > ul > li > .list_menu');
	            var contentList = $('.list_con > ul > li > .view_con');
	            var activeList = [];
	            for (var i = 0, len = menuList.length; i < len; i++) {
	                activeList.push(false);
	            }
	            var prevIndex = -1;
	            var index = 0;
	
	            // 초기 셋팅
	            contentList.hide();
	
	            // 리스트 클릭 이벤트
	            menuList.on('click', function() {
	                index = menuList.index(this);
	                listControl();
	            });
	
	            // 문의 리스트 컨트롤
	            function listControl() {
	                // 이전 리스트 닫기
	                if (prevIndex != -1) {
	                    var prevContent = $(listContainer[prevIndex]).find('.view_con');
	                    activeList[prevIndex] = false;
	                    prevContent.slideUp(300);
	                }
	
	                if (prevIndex == index) {
	                    prevIndex = -1;
	                    return;
	                }
	
	                // 클릭한 컨텐츠가 없다면 리턴
	                var content = $(listContainer[index]).find('.view_con');
	                if (content.length < 1) {
	                    prevIndex = index;
	                    return;
	                }
	
	                // 클릭 리스트 열기
	                activeList[prevIndex] = true;
	                content.slideDown(300);
	
	                prevIndex = index;
	            }
	
	            $('.category_popup').hide();

	            // 플레이리스트(그룹)를 클릭하면 해당 콘텐츠 썸네일 리스트 표시
	            $('li[id="category"]').click(function() {
					var hiddenPid 	= null;
					var formElement = null;
					var playListId 	= $(this).attr('data-category');
					hiddenPid = $('<input>').prop({'type':'hidden','name':'playlist_id','value':playListId});
					formElement = $('<form></form>').prop({'method':'post','action':'adminPlaylist'});
					formElement.append(hiddenPid).appendTo('body').submit();
			    });

			    // save 버튼 클릭 후 알림창 보이고 종료
			    $('#pushTheSave').click(function() {
					alert('파일을 저장하고 설정창을 닫습니다.');
					$('.view_con').hide();
				});

				// All Check Box check
				$('input[name="allCheck"]').click(function() {
					($(this).is(':checked') == true) ? $('input[name="chkCon"]').each(function(){
							$(this).prop('checked', true);
						}) : $('input[name="chkCon"]').each(function(){
							$(this).prop('checked', false);
						});
				});

				// add Category 보임
				$('#moveCategory').click(function() {
					$('#cateAdd').show();
				});

				// category popup close
				$('#addHide').click(function() {
					$('#cateAdd').hide();
				});

				// delete content
				$('#deleteContent').click(function() {
					var delContentList 	= [];
					$('input[id="chkCon"]').each(function() {
						if($(this).is(':checked') == true) {
							console.log('content_id', $(this).prop('data-content'));
							delContentList.push($(this).prop('data-content'));
						}
					});
					if (delContentList.length == null || delContentList.length == 'undefined' || delContentList.length == ''){
						alert('동영상을 선택하세요.');
						return false;
					} else {
						alert('정말 삭제 하시겠습니까?');
						$.getJSON('deleteContent', JSON.stringify(delContentList), function(response) {
							console.log(response);
						});
					}
				});
	        });
	    </script>
	</body>
</html>
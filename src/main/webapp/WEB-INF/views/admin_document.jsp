<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		                                    	<option value="Technoloagy">Technology</option>
		                                    	<option value="Technoloagy (RAW)">Technology (RAW)</option>
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
		    </div>
		    <!--//Upload 팝업-->
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
	                                <c:forEach var="his" items="${history}" varStatus="status">
	                            	<c:choose>
									<c:when test="${fn:length(his.title) > 21}">
									<dd>
										<a id="his" data-contentId="${his.content_id }" data-streamingUrl="${his.streaming_url}" data-playlistName="${his.getTag().getCategory()}">
											<img width="25px" height="14px" src="${his.thumb_url }" alt="" />${fn:substring(his.title, 0, 21)}...
										</a>
									</dd>
									</c:when>
									<c:otherwise>
	                                <dd>
	                                	<a id="his" data-contentId="${his.content_id }" data-streamingUrl="${his.streaming_url}" data-playlistName="${his.getTag().getCategory()}">
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
								<img id="hankookHome" src="./resources/images/admin/img_logo.png" alt="Hankook - driving emotion" />
								<img id="vbHome" src="./resources/images/admin/img_logo2.png" alt="Digital Library MAMs" />
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
		                        			<li><a id="pls1300000236">HanKook Tire</a></li>
		                        			<li><a id="pls1300000235">HanKook Tire (RAW)</a></li>
		                        			<li><a id="pls1300000234">Other Brand</a></li>
		                        			<li><a id="pls1300000233">Other Brand (RAW)</a></li>
		                        			<li><a id="pls1300000232">Technoloagy</a></li>
		                        			<li><a id="pls1300000231">Technoloagy (RAW)</a></li>
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
		                        			<li><a id="pls1300000228">Other Motosports</a></li>
		                        			<li><a id="pls1300000227">Other Motosports (RAW)</a></li>
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
	                                <input type="text" name="addCategory" id="addCategory" />
	                            </div>
	                            <p class="popup_btn_con"><a id="saveCtg"><img src="./resources/images/admin/pop_save_btn.png" alt="save"/></a></p>
	                        </div>
	                    </div>
	                    <!-- //Add_Category 팝업 -->
	
	                    <!-- Delete_Category 팝업 -->
	                    <div class="category_popup delete" id="cateDel">
	                        <div class="category_title_con">
	                            <p>Category Delete</p>
	                            <p class="close"><a id="delClose"><img src="./resources/images/admin/close_btn.png" alt="close"/></a></p>
	                        </div>
	                        <div class="category_contents">
	                            <P>Setting &gt; <span>Category Delete</span></P>
	                            <div class="input_box">
	                                <input type="text" name="delCategory" id="delCategory" />
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
	                                <span><a id="addCtg"><img src="./resources/images/admin/left_add_btn.png" alt=""/></a></span>
	                                <span><a id="delCtg"><img src="./resources/images/admin/left_minus_btn.png" alt=""/></a></span>
	                            </div>
	                        </div>
	                        <ul class="left_menu_list">
	                            <li class="on" id="category" data-category="1300000203">
	                                <span class="text"><a id="categoryName">Admin</a></span>
	                                <span class="num"><a id="1300000203val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000253">
	                                <span class="text"><a id="categoryName">Company</a></span>
	                                <span class="num"><a id="1300000253val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000252">
	                                <span class="text"><a id="categoryName">Company (RAW)</a></span>
	                                <span class="num"><a id="1300000252val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000251">
	                                <span class="text"><a id="categoryName">Culture</a></span>
	                                <span class="num"><a id="1300000251val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000245">
	                                <span class="text"><a id="categoryName">Culture (RAW)</a></span>
	                                <span class="num"><a id="1300000245val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000244">
	                                <span class="text"><a id="categoryName">TV Footages</a></span>
	                                <span class="num"><a id="1300000244val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000243">
	                                <span class="text"><a id="categoryName">TV Footages (RAW)</a></span>
	                                <span class="num"><a id="1300000243val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000242">
	                                <span class="text"><a id="categoryName">TVC</a></span>
	                                <span class="num"><a id="1300000242val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000241">
	                                <span class="text"><a id="categoryName">TVC (RAW)</a></span>
	                                <span class="num"><a id="1300000241val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000240">
	                                <span class="text"><a id="categoryName">Campaign</a></span>
	                                <span class="num"><a id="1300000240val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000239">
	                                <span class="text"><a id="categoryName">Campaign (RAW)</a></span>
	                                <span class="num"><a id="1300000239val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000238">
	                                <span class="text"><a id="categoryName">Sports Marketing</a></span>
	                                <span class="num"><a id="1300000238val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000237">
	                                <span class="text"><a id="categoryName">Sports Marketing (RAW)</a></span>
	                                <span class="num"><a id="1300000237val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000236">
	                                <span class="text"><a id="categoryName">HanKook Tire</a></span>
	                                <span class="num"><a id="1300000236val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000235">
	                                <span class="text"><a id="categoryName">HanKook Tire (RAW)</a></span>
	                                <span class="num"><a id="1300000235val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000234">
	                                <span class="text"><a id="categoryName">Other Brand</a></span>
	                                <span class="num"><a id="1300000234val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000233">
	                                <span class="text"><a id="categoryName">Other Brand (RAW)</a></span>
	                                <span class="num"><a id="1300000233val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000232">
	                                <span class="text"><a id="categoryName">Technoloagy</a></span>
	                                <span class="num"><a id="1300000232val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000231">
	                                <span class="text"><a id="categoryName">Technoloagy (RAW)</a></span>
	                                <span class="num"><a id="1300000231val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000230">
	                                <span class="text"><a id="categoryName">Europe</a></span>
	                                <span class="num"><a id="1300000230val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000229">
	                                <span class="text"><a id="categoryName">Europe (RAW)</a></span>
	                                <span class="num"><a id="1300000229val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000228">
	                                <span class="text"><a id="categoryName">Other Motosports</a></span>
	                                <span class="num"><a id="1300000228val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000227">
	                                <span class="text"><a id="categoryName">Other Motosports (RAW)</a></span>
	                                <span class="num"><a id="1300000227val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000226">
	                                <span class="text"><a id="categoryName">Exhibition</a></span>
	                                <span class="num"><a id="1300000226val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000225">
	                                <span class="text"><a id="categoryName">Exhibition (RAW)</a></span>
	                                <span class="num"><a id="1300000225val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000224">
	                                <span class="text"><a id="categoryName">Promotion</a></span>
	                                <span class="num"><a id="1300000224val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000223">
	                                <span class="text"><a id="categoryName">Promotion (RAW)</a></span>
	                                <span class="num"><a id="1300000223val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000222">
	                                <span class="text"><a id="categoryName">Other Event</a></span>
	                                <span class="num"><a id="1300000222val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000221">
	                                <span class="text"><a id="categoryName">Other Event (RAW)</a></span>
	                                <span class="num"><a id="1300000221val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000220">
	                                <span class="text"><a id="categoryName">Other</a></span>
	                                <span class="num"><a id="1300000220val">0</a></span>
	                            </li>
	                            <li id="category" data-category="1300000219">
	                                <span class="text"><a id="categoryName">Other (RAW)</a></span>
	                                <span class="num"><a id="1300000219val">0</a></span>
	                            </li>
	                        </ul>
	                    </div>
	                    <!-- //좌측 카테고리 -->
	
	                    <div class="list_wrap">
	                    <!-- 리스트화면 _ 검색영역 -->
	                        <h3 id="categoryTitle">Admin</h3>
	                        <div class="list_search_con">
	                            <span class="order">
	                                <select name="sort" id="sort" data-playlistID="<c:out value="${categoryPageVO.getPlaylist_id()}"/>">
	                                    <option value="reg_date" ${categoryPageVO.getSort() eq 'reg_date' ? 'selected' : ''}>최신순</option>
	                                    <option value="view_count" ${categoryPageVO.getSort() eq 'view_count' ? 'selected' : ''}>조회순</option>
	                                </select>
	                            </span>
	                            <span class="category">
	                                <select name="search_type" id="searchType" >
	                                    <option value="title">제목</option>
	                                    <option value="file_name">파일이름</option>
	                                    <option value="description">상세설명</option>
	                                </select>
	                            </span>
	                            <span class="search">
	                                <input type="text" name="search" id="searchWord"/>
	                            </span>
	                            <span class="search_btn" id="searchButton">
	                                <img src="./resources/images/admin/search_btn.png" alt="Search"/>
	                            </span>
	                        </div>
	                    <!-- //리스트화면 _ 검색영역 -->
	
	                    <!-- 리스트 -->
	                        <div class="list_con">
	                            <ul>
	                            <c:forEach var="content" items="${contentList}" varStatus="vsts">
	                                <li id="conlst">
	                                    <div class="list_check">
	                                    	<input type="checkbox" name="chkCon" data-contentID="<c:out value='${content.getContent_id() }' />"/>
	                                    </div>
	                                    <div class="list_menu" data-idIndex="${vsts.count}">
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
	                                    <div class="view_con">
	                                        <div class="view_img_con">
	                                            <ul>
	                                                <li class="view_detail_img">
	                                                	<a id="streamingView<c:out value="${vsts.index}"/>" data-thumbUrl="<c:out value="${content.getThumb_url()}"/>" data-title="<c:out value="${content.getTitle()}"/>" data-streaming="<c:out value="${content.getStreaming_url()}"/>"></a>
	                                                </li>
                                            <c:forEach var="thumbUrl" items="${content.getStaticThumb()}" varStatus="status">
                                            	<c:choose>
                                            		<c:when test="${status.count eq 1}">
	                                                <li class=""><a><img width="101" height="57" src="<c:out value="${thumbUrl.getDownload_url()}"/>" alt="썸네일이미지"/></a></li>
                                            		</c:when>
                                            		<c:otherwise>
	                                                <li class="view_thumb_img"><a><img width="101" height="57" src="<c:out value="${thumbUrl.getDownload_url()}"/>" alt="썸네일이미지"/></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                            </c:forEach>
	                                            </ul>
	                                        </div>
	                                        <div class="view_info_con">
	                                            <ul>
	                                                <li>콘텐츠 ID <span><c:out value="${content.getContent_id()}" /></span></li>
	                                                <li>사용자 정의 ID : <span><c:out value="${content.getCustom_id()}"/></span></li>
	                                                <li>파일명 <span><c:out value="${content.getFile_name()}" /></span></li>
	                                            </ul>
	                                            <p class="extension">
	                                                확장자 정보
	                                                <select name="fileFormat" id="selFmt${vsts.count}" data-contentID="${content.getContent_id()}" data-playlistID="${cagegoryPageVO.getPlaylist_id() == null ? '1300000203' : cagegoryPageVO.getPlaylist_id()}">
	                                                    <option value="none">선택</option>
	                                                    <option value="mp4">mp4</option>
	                                                    <option value="wmv">wmv</option>
	                                                    <option value="avi">avi</option>
	                                                    <option value="mov">mov</option>
	                                                </select>
	                                            </p>
	                                            <div class="extension_info" id="fomatfile${vsts.count}" data-download="${downInfo.getDownload_url()}" data-stream="${downInfo.getStreaming_url()}">
	                                                <ul>
	                                                    <li>컨테이너:  <label id="container${vsts.count}"></label></li>
	                                                    <li>비디오 코덱:  <label id="codec${vsts.count}"></label></li>
	                                                    <li>비디오 비트레이트(bps):  <label id="bps${vsts.count}"></label></li>
	                                                    <li>비디오 프레임레이트(fps):  <label id="fps${vsts.count}"></label></li>
	                                                    <li>해상도:  <label id="resolution">${content.getWidth()}x${content.getHeight()}</label></li>
	                                                </ul>
	                                                <ul>
	                                                    <li>오디오 코덱:  <label id="aCodec${vsts.count}"></label></li>
	                                                    <li>오디오 비트레이트(bps):  <label id="aBps${vsts.count}"></label></li>
	                                                    <li>오디오 채널(ch):  <label id="aCh${vsts.count}"></label></li>
	                                                    <li>등록 시간:  <label id="regDate${vsts.count}"></label></li>
	                                                    <li>수정 시간:  <label id="modDate${vsts.count}"></label></li>
	                                                </ul>
	                                            </div>
	                                        </div>
	                                        <!-- 업로드 정보 -->
	                                        <div class="view_up_info">
	                                            <p>업로드 정보</p>
	                                            <ul class="upload_left_con">
	                                                <li class="mb10">
	                                                    <p class="mb10">제목</p>
	                                                    <p><input type="text" name="modifyTitle" id="modifyTitle${vsts.count}" value="<c:out value="${content.getTitle()}"/>"/></p>
	                                                </li>
	                                                <li class="mb35">
	                                                    <p class="mb10">카테고리</p>
	                                                    <p>
	                                                        <select name="category" id="category${vsts.count}">
	                                                            <optgroup label="Corporation">
							                                    	<option value="Company" ${content.tag.category eq 'Company' ? 'selected' : ''}>Company</option>
							                                    	<option value="Company (RAW)" ${content.tag.category eq 'Company (RAW)' ? 'selected' : ''}>Company (RAW)</option>
							                                    	<option value="Culture" ${content.tag.category eq 'Culture' ? 'selected' : ''}>Culture</option>
							                                    	<option value="Culture (RAW)" ${content.tag.category eq 'Culture (RAW)' ? 'selected' : ''}>Culture (RAW)</option>
							                                    	<option value="TV Footages" ${content.tag.category eq 'TV Footages' ? 'selected' : ''}>TV Footages</option>
							                                    	<option value="TV Footages (RAW)" ${content.tag.category eq 'TV Footages (RAW)' ? 'selected' : ''}>TV Footages (RAW)</option>
							                                	</optgroup>
							                                	<optgroup label="Advertisements">
							                                    	<option value="TVC" ${content.tag.category eq 'TVC' ? 'selected' : ''}>TVC</option>
							                                    	<option value="TVC (RAW)" ${content.tag.category eq 'TVC (RAW)' ? 'selected' : ''}>TVC (RAW)</option>
							                                    	<option value="Campaign" ${content.tag.category eq 'Campaign' ? 'selected' : ''}>Campaign</option>
							                                    	<option value="Campaign (RAW)" ${content.tag.category eq 'Campaign (RAW)' ? 'selected' : ''}>Campaign (RAW)</option>
							                                    	<option value="Sports Marketing" ${content.tag.category eq 'Sports Marketing' ? 'selected' : ''}>Sports Marketing</option>
							                                    	<option value="Sports Marketing (RAW)" ${content.tag.category eq 'Sports Marketing (RAW)' ? 'selected' : ''}>Sports Marketing (RAW)</option>
							                                	</optgroup>
							                                	<optgroup label="Products">
							                                    	<option value="Hankook Tire" ${content.tag.category eq 'Hankook Tire' ? 'selected' : ''}>Hankook Tire</option>
							                                    	<option value="Hankook Tire (RAW)" ${content.tag.category eq 'Hankook Tire (RAW)' ? 'selected' : ''}>Hankook Tire (RAW)</option>
							                                    	<option value="Other Brand" ${content.tag.category eq 'Other Brand' ? 'selected' : ''}>Other Brand</option>
							                                    	<option value="Other Brand (RAW)" ${content.tag.category eq 'Other Brand (RAW)' ? 'selected' : ''}>Other Brand (RAW)</option>
							                                    	<option value="Technology" ${content.tag.category eq 'Technology' ? 'selected' : ''}>Technology</option>
							                                    	<option value="Technology (RAW)" ${content.tag.category eq 'Technology (RAW)' ? 'selected' : ''}>Technology (RAW)</option>
							                                	</optgroup>
							                                	<optgroup label="Motorsports">
							                                    	<option value="Europe" ${content.tag.category eq 'Europe' ? 'selected' : ''}>Europe</option>
							                                    	<option value="Europe (RAW)" ${content.tag.category eq 'Europe (RAW)' ? 'selected' : ''}>Europe (RAW)</option>
							                                    	<option value="Other Motorsports" ${content.tag.category eq 'Other Motorsports' ? 'selected' : ''}>Other Motorsports</option>
							                                    	<option value="Other Motorsports (RAW)" ${content.tag.category eq 'TOther Motorsports (RAW)' ? 'selected' : ''}>Other Motorsports (RAW)</option>
							                                	</optgroup>
							                                	<optgroup label="Events">
							                                    	<option value="Exhibition" ${content.tag.category eq 'Exhibition' ? 'selected' : ''}>Exhibition</option>
							                                    	<option value="Exhibition (RAW)" ${content.tag.category eq 'Exhibition (RAW)' ? 'selected' : ''}>Exhibition (RAW)</option>
							                                    	<option value="Promotion" ${content.tag.category eq 'Promotion' ? 'selected' : ''}>Promotion</option>
							                                    	<option value="Promotion (RAW)" ${content.tag.category eq 'Promotion (RAW)' ? 'selected' : ''}>Promotion (RAW)</option>
							                                    	<option value="Other Event" ${content.tag.category eq 'Other Event' ? 'selected' : ''}>Other Event</option>
							                                    	<option value="Other Event (RAW)" ${content.tag.category eq 'Other Event (RAW)' ? 'selected' : ''}>Other Event (RAW)</option>
							                                	</optgroup>
							                                	<optgroup label="Others">
							                                    	<option value="Other" ${content.tag.category eq 'Other' ? 'selected' : ''}>Other</option>
							                                    	<option value="Other (RAW)" ${content.tag.category eq 'Other (RAW)' ? 'selected' : ''}>Other (RAW)</option>
							                                	</optgroup>
	                                                        </select>
	                                                    </p>
	                                                </li>
	                                                <li class="width202">
	                                                    <span>Year</span>
	                                                    <select name="year" id="year${vsts.count}">
	                                                        <option value="2014" ${content.tag.year eq '2014' ? 'selected' : ''}>2014</option>
							                                <option value="2013" ${content.tag.year eq '2013' ? 'selected' : ''}>2013</option>
							                                <option value="2012" ${content.tag.year eq '2012' ? 'selected' : ''}>2012</option>
							                                <option value="2011" ${content.tag.year eq '2011' ? 'selected' : ''}>2011</option>
							                                <option value="2010 before" ${content.tag.year eq '2010' ? 'selected' : ''}>2010 before</option>
	                                                    </select>
	                                                </li>
	                                                <li class="width202 ml20 right">
	                                                    <span>Type</span>
	                                                    <select name="type" id="type${vsts.count}">
	                                                        <option value="Hankook Tire Official" ${content.tag.type eq 'Hankook Tire Official' ? 'selected' : ''}>Hankook Tire Official</option>
		                                					<option value="Unofficial" ${content.tag.type eq 'Unofficial' ? 'selected' : ''}>Unofficial</option>
	                                                    </select>
	                                                </li>
	                                                <li class="width202 mb25">
	                                                    <span>Region</span>
	                                                    <select name="region" id="region${vsts.count}">
	                                                        <option value="Europe" ${content.tag.region eq 'Europe' ? 'selected' : ''}>Europe</option>
															<option value="America" ${content.tag.region eq 'America' ? 'selected' : ''}>America</option>
															<option value="Middle East & Africa" ${content.tag.region eq 'Middle East & Africa' ? 'selected' : ''}>Middle East &amp; Africa</option>
															<option value="Asia-Pacific" ${content.tag.region eq 'Asia-Pacific' ? 'selected' : ''}>Asia-Pacific</option>
															<option value="China" ${content.tag.region eq 'China' ? 'selected' : ''}>China</option>
															<option value="Korea" ${content.tag.region eq 'Korea' ? 'selected' : ''}>Korea</option>
	                                                    </select>
	                                                </li>
	                                                <li class="width202 radio right">
	                                                    <label for="video">Finalized Video</label> <input type="radio" name="official${vsts.count}" value="Finalized Video" ${content.tag.official eq 'Finalized Video' ? 'checked' : ''}>
	                                                    <label for="data">Raw Data</label> <input type="radio" name="official${vsts.count}" value="Raw Data" ${content.tag.official eq 'Raw Data' ? 'checked' : ''}>
	                                                </li>
	                                                <li class="form_info">
	                                                    <p class="mb10">설명 Info</p>
	                                                    <p>
	                                                        <textarea name="description" id="description${vsts.count}" cols="30" rows="10"><c:out value="${content.getDescription()}"/></textarea>
	                                                    </p>
	                                                </li>
	                                            </ul>
	                                            <ul class="upload_right_con">
	                                                <li class="form_info">
	                                                    <p class="mb10">다운로드 주소 URL</p>
	                                                    <p>
	                                                        <textarea name="downloadUrl" id="downloadUrl${vsts.count}" cols="30" rows="10"><c:out value="${content.getDownload_url()}"/></textarea>
	                                                    </p>
	                                                </li>
	                                                <li class="form_info">
	                                                    <p class="mb10">스트리밍 주소 URL</p>
	                                                    <p>
	                                                        <textarea name="streamingUrl" id="streamingUrl${vsts.count}" cols="30" rows="10"><c:out value="${content.getStreaming_url()}"/></textarea>
	                                                    </p>
	                                                </li>
	                                            </ul>
	                                        </div>
	                                        <!-- //업로드 정보 -->
	
	                                        <!-- save btn -->
	                                        <div class="save_btn_con">
	                                            <a id="pushTheSave" data-contentId="<c:out value="${content.getContent_id()}"/>" data-count="${vsts.count}">
	                                            	<img src="./resources/images/admin/view_save_btn.png" alt="save"/>
	                                            </a>
	                                        </div>
	                                        <!-- //save btn -->
	                                    </div>
	                                    <!-- //view화면 -->
	                                </li>
	                            </c:forEach>
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
	                                <!-- 
	                                 <span><a id="moveCategory"><img src="./resources/images/admin/add_btn.png" alt="파일추가"/></a></span>
	                                 -->
	                                <span><a id="deleteContent"><img src="./resources/images/admin/delete_btn.png" alt="파일삭제"/></a></span>
	                            </div>
	                        </div>
	                        <div class="right_paging_con">
                           	<c:if test="${paging.getCurrentBlock() ne 1}">
	                            <div class="paging_prev">
	                                <a onClick="goPage('${paging.getCurrentBlock() - 1}')"><img src="./resources/images/admin/prev_btn_off.png" alt="previous"/>previous</a>
	                            </div>
                           	</c:if>
	                            <div class="paging_num">
                      		<c:forEach begin="${paging.getStartRow()}" end="${paging.getEndRow()}" varStatus="status">
						        <c:choose>
						            <c:when test="${paging.currentPage eq status.index}">
	                                <span class="on"><a id="page${status.count}"><c:out value="${status.count}"/></a></span>
	                                </c:when>
									<c:when test="${paging.currentPage ne status.index}">
	                                <span><a id="page${status.count}"><c:out value="${status.count}"/></a></span>
	                                </c:when>
							    </c:choose>
							</c:forEach>
	                            </div>
	                        <c:if test="${paging.getCurrentBlock() ne paging.getPageOfBlock()}">
	                            <div class="paging_next paging_on">
	                                <a onClick="goPage('${paging.getCurrentBlock()+ 1}')">next<img src="./resources/images/admin/next_btn_on.png" alt="next"/></a>
	                            </div>
	                        </c:if>
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
	    <script>
	        $(document).ready(function() {
		    	<c:forEach var="playlist" items="${listCount}" varStatus="status">
	        		$('#' + '<c:out value="${playlist.getPlaylist_id()}" />' + 'val').text('<c:out value="${playlist.getCount()}"/>');
	    		</c:forEach>
		        // category 선택후 해당 카테고리에 선택 표시 
		        var selectedCategory = '<c:out value="${categoryPageVO.getPlaylist_id()}" />';
		        if (selectedCategory != '') {
			    	$('li[id=category]').each(function() {
				    	$(this).removeProp('class');
				    	if ($(this).attr('data-category') == selectedCategory) {
							$(this).attr('class', 'on');
							$('#categoryTitle').text($(this).find('#categoryName').text());
				    	}
				   	});
			    }
			    
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
		            // 초기 셋팅
		            contentList.hide();
	            }
	            var prevIndex = -1;
	            var index = 0;
	
	
	            // 리스트 클릭 이벤트
	            menuList.on('click', function() {
	                index = menuList.index(this);
	                listControl();
	            });
	
	            // 문의 리스트 컨트롤
	            function listControl() {
		            var streamIndex = null;
		            var thumbUrl	= null;
		            var streamingUrl= null;
		            var title		= null;
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
	                prevIndex 	= index;
	                streamIndex = '#streamingView' + index;
	                thumbUrl 	= $(streamIndex).attr('data-thumbUrl');
	                streamingUrl= $(streamIndex).attr('data-streaming');
	                contentTitle= $(streamIndex).attr('data-title');
	                $(streamIndex).empty();
	                $(streamIndex).append(
	                		"<object data=\"http://vcase.myskcdn.com/static/ovp/ovp.swf\" name=\"ovp\" id=\"ovp\" type=\"application/x-shockwave-flash\" align=\"middle\" width=\"433\" height=\"244\" >" +
							"<param value=\"high\" name=\"quality\">" + 
							"<param value=\"#000000\" name=\"bgcolor\">" +
							"<param value=\"always\" name=\"allowscriptaccess\">" +
							"<param value=\"true\" name=\"allowfullscreen\">" +
							"<param value=\"transparent\" name=\"wmode\">" +
							"<param value=\"apiUrl=http://api.vcase.myskcdn.com" + 
										"&mediaUrl=" + encodeURIComponent(streamingUrl) +
										'&title=' + encodeURIComponent(contentTitle) +
										"&thumbUrl=" + encodeURIComponent(thumbUrl) +
										"&pid=${player_id}" +
										"&autoPlay=true\" name=\"flashvars\">"+
							"</object>"
	    	        );
	            }
	            
	            $('.category_popup').hide();
	            
	            var clMp4 = null;
				var clMov = null;
				var clWmv = null;
				var clAvi = null;
				
				var textWrite = function (formatCls, index) {
					$('#' + 'container' + index).text(formatCls.container);
					$('#' + 'codec' + index).text(formatCls.video_codec);
					$('#' + 'bps' + index).text(formatCls.video_bitrate);
					$('#' + 'fps' + index).text(formatCls.video_framerate);
					$('#' + 'aCodec' + index).text(formatCls.audio_codec);
					$('#' + 'aBps' + index).text(formatCls.audio_bitrate);
					$('#' + 'aCh' + index).text(formatCls.audio_channel);
					$('#' + 'regDate' + index).text(formatCls.reg_date);
					$('#' + 'modDate' + index).text(formatCls.mod_date);
					$('#' + 'downloadUrl' + index).text(formatCls.download_url);
					$('#' + 'streamingUrl' + index).text(formatCls.streaming_url);
				};

				var textClear = function (index) {
					$('#' + 'container' + index).text('');
					$('#' + 'codec' + index).text('');
					$('#' + 'bps' + index).text('');
					$('#' + 'fps' + index).text('');
					$('#' + 'aCodec' + index).text('');
					$('#' + 'aBps' + index).text('');
					$('#' + 'aCh' + index).text('');
					$('#' + 'regDate' + index).text('');
					$('#' + 'modDate' + index).text('');
					$('#' + 'downloadUrl' + index).text('');
					$('#' + 'streamingUrl' + index).text('');
				};
				
				// 리스트를 클릭하면 확장자 정보를 위해 데이터를 가져온다.
				$('div[class="list_menu"]').click(function() {
					var i		   = 0;
					var contentID  = null;
					var playlistID = null;
					var sendData   = null;
					var thisIndex  = null;
					thisIndex = $(this).attr('data-idIndex');
					contentID  = $('#selFmt' + thisIndex).attr('data-contentID');
					playlistID = $('#selFmt' + thisIndex).attr('data-playlistID');
					sendData = {"content_id":contentID,"playlist_id":playlistID};
					$.getJSON('videoBox/adminFormatInfo', sendData, function(data){
						for(i; i < data.length; i = i + 1) {
							if(data[i].container == 'mp4') {
								clMp4 = data[i];
							}
							if(data[i].container == 'wmv') {
								clWmv = data[i];
							}
							if(data[i].container == 'avi') {
								clAvi = data[i];
							}
							if(data[i].container == 'mov') {
								clMov = data[i];
							}
						}
					});
				});
				
				// 확장자 정보의 셀렉트 박스 선택시 가저온 정보를 보여준다.
				$('select[id*=selFmt]').change(function() {
					var selectedVal= null;
					var indexVal  = null;
					selectedVal= $(this).val();
					indexVal  = $(this).attr('id');
					indexVal  = indexVal.substring(indexVal.length - 1, indexVal.length);
					if(selectedVal == 'mp4') {
						textWrite(clMp4, indexVal);
					}
					if(selectedVal == 'wmv') {
						textWrite(clWmv, indexVal);
					}
					if(selectedVal == 'avi') {
						textWrite(clAvi, indexVal);
					}
					if(selectedVal == 'mov') {
						textWrite(clMov, indexVal);
					}
					if(selectedVal == 'none') {
						textClear(indexVal);
					}
				});
				
	            // 플레이리스트(그룹)를 클릭하면 해당 콘텐츠 썸네일 리스트 표시
	            $('li[id="category"]').click(function() {
					var hiddenPid 	= null;
					var formElement = null;
					var playListId 	= $(this).attr('data-category');
					hiddenPid = $('<input>').prop({'type':'hidden','name':'playlist_id','value':playListId});
					formElement = $('<form></form>').prop({'method':'post','action':'adminPlaylist'});
					formElement.append(hiddenPid).appendTo('body').submit();
			    });

				// All Check Box check
				$('input[name="allCheck"]').click(function() {
					($(this).is(':checked') == true) ? $('input[name="chkCon"]').each(function(){
							$(this).attr('checked', true);
						}) : $('input[name="chkCon"]').each(function(){
							$(this).attr('checked', false);
						});
				});

				// add Category 보임
				$('#addCtg').click(function() {
					$('#cateAdd').layerCenter().show();
					
				});

				// delete Category Popup 보임
				$('#delCtg').click(function() {
					$('#cateDel').layerCenter().show();
				});
				
				// category popup close
				$('#addHide').click(function() {
					$('#addCategory').val('');
					$('#cateAdd').hide();
				});

				// category delete popup close
				$('#delClose').click(function() {
					$('#delCategory').val('');
					$('#cateDel').hide();
				});

				// category Popup 저장 버튼 클릭 category 생성
				$('#saveCtg').click(function (){
					var hiddenCtn 	= null;
					var formEle		= null;
					var regexOpt 	= /[~!@\#$%<>^&*\()\-=+_\']/gi;
					var ctgName 	= $('#addCategory').val();
					hiddenCtn = $('<input>').prop({'type':'hidden',})
					if(ctgName.length == null || ctgName.length == '' || ctgName == 'undefined') {
						$('#addCategory').val('').focus();
						alert('생성할 카테고리를 입력하세요.');
						return false;
					}
					if (regexOpt.test(ctgName)) {
						$('#addCategory').val('').focus();
						alert('특수문자를 허용하지 않습니다.');
						return false;
					}
					$('#cateAdd').hide();
				});
				
				// delete content
				$('#deleteContent').click(function() {
					var delContentList 	= [];
					var jsonData		= {};
					$('input[name="chkCon"]').each(function() {
						if($(this).is(':checked') == true) {
							delContentList.push($(this).attr('data-contentID'));
						}
					});
					
					if (delContentList.length == null || delContentList.length == 'undefined' || delContentList.length == ''){
						alert('동영상을 선택하세요.');
						return false;
					} else {
						alert('정말 삭제 하시겠습니까?');
						jsonData.deleteList = delContentList.toString();
						$.getJSON('adminSuperDelete', jsonData, function(data) {
							var message = decodeURIComponent(data);
							message = message.replace('+', ' ');
							alert(message);
						});
						$('<form></form>').prop({'method':'post','action':'adminDoc'}).submit();
					}
				});

				// 검색
				$('#searchButton').click(function() {
					var mamCook		= null;
					var playlistID	= null;
					var sort 		= null;
					var searchType	= null;
					var search		= null;
					var pageNum		= null;
					var formEle		= null;
					var hiddenSor	= null;
					var hiddenStp	= null;
					var hiddenSch	= null;
					var hiddenPgn	= null;
					var hiddenPls	= null;
					var hiddenHis	= null;
					mamCook		= $.cookies.get('mamsCookie');
					sort 		= $('#sort option:selected').val();
					searchType	= $('#searchType option:selected').val();
					search		= $('#searchWord').val();
					playlistID	= '<c:out value="${categoryPageVO.getPlaylist_id()}"/>';
					pageNum		= '<c:out value="${paging.getCurrentPage() - 1}"/>';
					formEle 	= $('<form></form>').prop({'method':'post','action':'adminDocSort'});
					hiddenSor	= $('<input>').prop({'type':'hidden','name':'sort','value':sort});
					hiddenStp	= $('<input>').prop({'type':'hidden','name':'search_type','value':searchType});
					hiddenSch	= $('<input>').prop({'type':'hidden','name':'search','value':search});
					hiddenPgn	= $('<input>').prop({'type':'hidden','name':'pageNum','value':pageNum});
					hiddenPls	= $('<input>').prop({'type':'hidden','name':'playlist_id','value':playlistID});
					hiddenHis	= $('<input>').prop({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
					formEle.append(hiddenSor, hiddenStp, hiddenSch, hiddenPgn, hiddenPls, hiddenHis).appendTo('body').submit();
				});
				
			 var uploadCls = {
					categoryList:['Company','Company (RAW)','Culture','Culture (RAW)','TV Footages','TV Footages (RAW)','TVC','TVC (RAW)','Campaign','Campaign (RAW)','Sports Marketing','Sports Marketing (RAW)','Hankook Tire','Hankook Tire (RAW)','Other Brand','Other Brand (RAW)','Technology','Technology (RAW)','Europe','Europe (RAW)','Other Motorsports','Other Motorsports (RAW)','Exhibition','Exhibition (RAW)','Promotion','Promotion (RAW)','Other Event','Other Event (RAW)','Other','Other (RAW)'],
					myFile:null,
					title:null,
					category:null,
					year:null,
					type:null,
					region:null,
					official:null,
					description:null,
					setCustomId:function(){
						var customId		= null;
						var resultOfficial 	= null;
						var resultType		= null;
						var resultRegion	= null;
						var resultCategory	= null;
						var yearTmp 		= this.year.split(' ');
						var resultYear 		= yearTmp[0].substring(2,4);
						
						if (this.region != 'Asia-Pacific') {
							resultRegion = this.region.substring(0, 1);
						} else {
							var regionTmp = this.region.split('-');
							resultRegion = regionTmp[1].substring(0,1);
						}
						
						if (this.type == 'Unofficial') {
							resultType = 'B';
						} else {
							resultType = 'A';
						}
						
						if (this.official == 'Raw Data') {
							resultOfficial = 'B';
						} else {
							resultOfficial = 'A';
						}
						resultCategory = this.categoryList.indexOf(this.category);
						customId = resultYear + resultType + (resultCategory + 1) + resultRegion + '-' + resultOfficial + '-';
						return customId;
					}
				};
				
				//--카테고리 바인딩 select box에서 선택하면 해당 카테고리로 컨텐트가 이동한다.
				$('a[id="pushTheSave"]').click(function() {
					var idStr		= '#';
					var dataCount	= $(this).attr('data-count');
					var pageNum		= '<c:out value="${paging.getCurrentPage() - 1}"/>';
					var playlistId	= '<c:out value="${categoryPageVO.getPlaylist_id()}"/>';
					var contentId 	= $(this).attr('data-contentId');
					var category	= $(idStr + 'category' + dataCount + ' option:selected').val();
					var year		= $(idStr + 'year' + dataCount + ' option:selected').val();
					var type		= $(idStr + 'type' + dataCount + ' option:selected').val();
					var region		= $(idStr + 'region' + dataCount + ' option:selected').val();
					var official	= $(':radio[name="official' + dataCount +'"]:checked').val();
					var title		= $(idStr + 'modifyTitle' + dataCount).val();
					var description	= $(idStr + 'description' + dataCount).val();
					var custom_id	= null;
					uploadCls.category 	= category;
					uploadCls.year		= year;
					uploadCls.type		= type;
					uploadCls.region	= region;
					uploadCls.official	= official;
					custom_id = uploadCls.setCustomId();
					var formEle		= $('<form></form>').prop({'method':'post','action':'adminConBind'});
					var hiddenCut	= $('<input>').prop({'type':'hidden','name':'custom_id','value':custom_id});
					var hiddenCon	= $('<input>').prop({'type':'hidden','name':'content_id','value':contentId});
					var hiddenTit	= $('<input>').prop({'type':'hidden','name':'title','value':title});
					var hiddenDes	= $('<input>').prop({'type':'hidden','name':'description','value':description});
					var hiddenCtg	= $('<input>').prop({'type':'hidden','name':'category','value':category});
					var hiddenYer	= $('<input>').prop({'type':'hidden','name':'year','value':year});
					var hiddenTyp	= $('<input>').prop({'type':'hidden','name':'type','value':type});
					var hiddenRgo	= $('<input>').prop({'type':'hidden','name':'region','value':region});
					var hiddenOfc	= $('<input>').prop({'type':'hidden','name':'official','value':official});
					var hiddenPli	= $('<input>').prop({'type':'hidden','name':'playlist_id','value':playlistId});
					var hiddenPgn	= $('<input>').prop({'type':'hidden','name':'pageNum','value':pageNum});
					formEle.append(hiddenCon, hiddenCut, hiddenTit, hiddenDes, hiddenCtg, hiddenYer, hiddenTyp, hiddenRgo, hiddenOfc, hiddenPli, hiddenPgn).appendTo('body').submit();
				});
				
				$('#sort').change(function() {
					var mamCook		= null;
					var searchValue	= null;
					var sortValue 	= null;
					var playlistID	= null;
					var formElement	= null;
					var hiddenHis	= null;
					var hiddenSot	= null;
					var hiddenPgn	= null;
					var hiddenSec	= null;
					var hiddenPld	= null;
					mamCook 	= $.cookies.get('mamsCookie');
					sortValue 	= $(this).val();
					searchValue	= $('#searchWord').val();
					playlistID	= $(this).attr('data-playlistid');
					formElement = $('<form></form>').prop({'method':'post','action':'adminDocSort'});
					hiddenHis	= $('<input>').prop({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
					hiddenSot	= $('<input>').prop({'type':'hidden','name':'sort','value':sortValue});
					hiddenPgn	= $('<input>').prop({'type':'hidden','name':'pageNum','value':'${paging.getCurrentPage() - 1}'});
					hiddenSec	= $('<input>').prop({'type':'hidden','name':'search','value':searchValue});
					hiddenPld	= $('<input>').prop({'type':'hidden','name':'playlist_id','value':playlistID});
					formElement.append(hiddenHis, hiddenSot, hiddenPgn, hiddenSec, hiddenPld).appendTo('body').submit();
				});
	        });
	    </script>
	</body>
</html>
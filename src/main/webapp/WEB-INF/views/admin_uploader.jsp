<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
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
		                                    	<option value="Technology">Technology</option>
		                                    	<option value="Technology (RAW)">Technology (RAW)</option>
		                                	</optgroup>
		                                	<optgroup label="Motorsports">
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
	                <!-- admin title / tap menu -->
	                <div class="title_tab_con">
	                    <h2>Setting</h2>
	                    <!-- 탭메뉴 -->
	                    <ul class="admin_tab">
	                       	<li id="tabUplo" class="on"><a>업로더 설정</a></li>
	                        <li id="tabDoc"><a>Document</a></li>
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
	                    <div class="admin_bg_none">
	                        <!-- Search_uploader 팝업 -->
	                        <div class="uploader_popup">
	                            <div class="uploader_con">
	                                <div class="uploader_title_con">
	                                    <p>업로더 찾기</p>
	                                    <p class="close">
	                                    	<a id="uploadPopCls">
	                                    		<img src="./resources/images/admin/close_btn.png" alt="close"/>
	                                    	</a>
	                                    </p>
	                                </div>
	                                <div class="uploader_contents">
	                                    <div class="uploader_search_con">
	                                        <span class="category">
	                                            <select name="" id="" >
	                                                <option value="Name">Name</option>
	                                            </select>
	                                        </span>
	                                        <span class="search">
	                                            <input type="text" name="uploaderName" id="uploName"/>
	                                        </span>
	                                        <span class="search_btn">
	                                            <img id="searchUpBtn" src="./resources/images/admin/uploader_search_btn.png" alt="Search"/>
	                                        </span>
	                                    </div>
	                                </div>
	                                <!-- 리스트 -->
	                                <div class="table_con_pop">
	                                    <table class="uploader_table" summary="검색을 통해 업로더를 찾는 표입니다.">
	                                        <caption>업로더 찾기</caption>
	                                        <colgroup>
	                                            <col width="30px">
	                                            <col width="140px">
	                                            <col width="80px">
	                                            <col width="150px">
	                                            <col width="auto">
	                                            <col width="130px">
	                                        </colgroup>
	                                        <tbody>
	                                        <tr>
	                                            <td><input type="checkbox" name="uploader" id="uploChk" value=""/></td>
	                                            <td class="left">안드레아 보티첼리</td>
	                                            <td>21000011</td>
	                                            <td class="left">비주얼커뮤니케이션팀</td>
	                                            <td class="left">afaehtjong@hankooktire.com</td>
	                                            <td>Hankook Tire</td>
	                                        </tr>
	                                        <tr>
	                                            <td><input type="checkbox" name="" id="" value=""/></td>
	                                            <td class="left">안드레아 보티첼리</td>
	                                            <td>21000011</td>
	                                            <td class="left">비주얼커뮤니케이션팀</td>
	                                            <td class="left">afaehtjong@hankooktire.com</td>
	                                            <td>Hankook Tire</td>
	                                        </tr>
	                                        <tr>
	                                            <td><input type="checkbox" name="" id="" value=""/></td>
	                                            <td class="left">안드레아 보티첼리</td>
	                                            <td>21000011</td>
	                                            <td class="left">비주얼커뮤니케이션팀</td>
	                                            <td class="left">afaehtjong@hankooktire.com</td>
	                                            <td>Hankook Tire</td>
	                                        </tr>
	                                        <tr>
	                                            <td><input type="checkbox" name="" id="" value=""/></td>
	                                            <td class="left">안드레아 보티첼리</td>
	                                            <td>21000011</td>
	                                            <td class="left">비주얼커뮤니케이션팀</td>
	                                            <td class="left">afaehtjong@hankooktire.com</td>
	                                            <td>Hankook Tire</td>
	                                        </tr>
	                                        </tbody>
	                                    </table>
	                                </div>
	                                <!-- //리스트 -->
	                                <p class="uploader_select_btn">
	                                	<a id="uploSelect">
	                                		<img src="./resources/images/admin/uploader_select_btn.png" alt="Select"/>
	                                	</a>
	                                </p>
	                            </div>
	                        </div>
	                        <!-- //Search_uploader 팝업 -->
	                        <!-- 업로더설정 -->
	                        <div class="admin_title">
	                            <p class="uploader_title">Setting &nbsp; &gt; <span>업로더 설정</span></p>
	                            <p class="uploader_btn">
	                            	<a id="uploadInput">
	                            		<img src="./resources/images/admin/upload_btn.png" alt="등록하기"/>
	                            	</a>
	                            </p>
	                        </div>
	                        <!-- //업로더설정 -->
	                        <!-- 테이블 영역 -->
	                        <div class="table_con">
	                            <table class="uploader_table" summary="업로더의 ID, 소속, 이메일, 그룹 등을 관리하는 표입니다.">
	                                <caption>업로더 관리</caption>
	                                <colgroup>
	                                    <col width="62px">
	                                    <col width="118px">
	                                    <col width="118px">
	                                    <col width="230px">
	                                    <col width="auto">
	                                    <col width="187px">
	                                    <col width="86px">
	                                </colgroup>
	                                <thead>
	                                <tr>
	                                    <th scope="col">번호</th>
	                                    <th scope="col" class="left">이름</th>
	                                    <th scope="col">ID</th>
	                                    <th scope="col" class="left">소속</th>
	                                    <th scope="col" class="left">이메일</th>
	                                    <th scope="col" class="left">그룹</th>
	                                    <th scope="col">삭제</th>
	                                </tr>
	                                </thead>
	                                <tbody>
	                                <tr>
	                                    <td>10</td>
	                                    <td class="left">최주현</td>
	                                    <td>21000011</td>
	                                    <td class="left">비주얼커뮤니케이션팀</td>
	                                    <td class="left">afaehtjong@hankooktire.com</td>
	                                    <td class="left">Hankook Tire</td>
	                                    <td><a id="uploDel"><img src="./resources/images/admin/uploader_delete_btn.png" alt="Delete"/></a></td>
	                                </tr>
	                                <tr>
	                                    <td>9</td>
	                                    <td class="left">최주현</td>
	                                    <td>21000011</td>
	                                    <td class="left">구주법인</td>
	                                    <td class="left">attttg@hankooktire.com</td>
	                                    <td class="left">Delear</td>
	                                    <td><a><img src="./resources/images/admin/uploader_delete_btn.png" alt="Delete"/></a></td>
	                                </tr>
	                                <tr>
	                                    <td>8</td>
	                                    <td class="left">안드레아</td>
	                                    <td>21000011</td>
	                                    <td class="left">구주법인</td>
	                                    <td class="left">attttg@hankooktire.com</td>
	                                    <td class="left">Delear</td>
	                                    <td><a><img src="./resources/images/admin/uploader_delete_btn.png" alt="Delete"/></a></td>
	                                </tr>
	                                <tr>
	                                    <td>7</td>
	                                    <td class="left">안드레아</td>
	                                    <td>21000011</td>
	                                    <td class="left">구주법인</td>
	                                    <td class="left">attttg@hankooktire.com</td>
	                                    <td class="left">Delear</td>
	                                    <td><a><img src="./resources/images/admin/uploader_delete_btn.png" alt="Delete"/></a></td>
	                                </tr>
	                                <tr>
	                                    <td>6</td>
	                                    <td class="left">안드레아</td>
	                                    <td>21000011</td>
	                                    <td class="left">구주법인</td>
	                                    <td class="left">attttg@hankooktire.com</td>
	                                    <td class="left">Delear</td>
	                                    <td><a><img src="./resources/images/admin/uploader_delete_btn.png" alt="Delete"/></a></td>
	                                </tr>
	                                <tr>
	                                    <td>5</td>
	                                    <td class="left">안드레아</td>
	                                    <td>21000011</td>
	                                    <td class="left">구주법인</td>
	                                    <td class="left">attttg@hankooktire.com</td>
	                                    <td class="left">Delear</td>
	                                    <td><a><img src="./resources/images/admin/uploader_delete_btn.png" alt="Delete"/></a></td>
	                                </tr>
	                                <tr>
	                                    <td>4</td>
	                                    <td class="left">안드레아</td>
	                                    <td>21000011</td>
	                                    <td class="left">구주법인</td>
	                                    <td class="left">attttg@hankooktire.com</td>
	                                    <td class="left">Delear</td>
	                                    <td><a><img src="./resources/images/admin/uploader_delete_btn.png" alt="Delete"/></a></td>
	                                </tr>
	                                <tr>
	                                    <td>3</td>
	                                    <td class="left">안드레아</td>
	                                    <td>21000011</td>
	                                    <td class="left">구주법인</td>
	                                    <td class="left">attttg@hankooktire.com</td>
	                                    <td class="left">Delear</td>
	                                    <td><a><img src="./resources/images/admin/uploader_delete_btn.png" alt="Delete"/></a></td>
	                                </tr>
	                                <tr>
	                                    <td>2</td>
	                                    <td class="left">안드레아</td>
	                                    <td>21000011</td>
	                                    <td class="left">구주법인</td>
	                                    <td class="left">attttg@hankooktire.com</td>
	                                    <td class="left">Delear</td>
	                                    <td><a><img src="./resources/images/admin/uploader_delete_btn.png" alt="Delete"/></a></td>
	                                </tr>
	                                <tr>
	                                    <td>1</td>
	                                    <td class="left">안드레아</td>
	                                    <td>21000011</td>
	                                    <td class="left">구주법인</td>
	                                    <td class="left">attttg@hankooktire.com</td>
	                                    <td class="left">Delear</td>
	                                    <td><a><img src="./resources/images/admin/uploader_delete_btn.png" alt="Delete"/></a></td>
	                                </tr>
	                                </tbody>
	                            </table>
	                        </div>
	                        <!-- //테이블 영역 -->
	                        <!-- paging 영역 -->
	                        <div class="paging_con width1072">
	                            <div class="left_btn_con width109">
	                                <div class="current_page">
	                                    <p><span>1 - 15</span> of 35</p>
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
	    <script type="text/javascript">
			$(document).ready(function() {
				// 업로드 popup 숨김
				$('.uploader_popup').hide();
				
				// 등록하기 버튼 클릭 후 업로드 popup 보이기
				$('#uploadInput').click(function() {
					$('.uploader_popup').show();
				});
				
				// 업로드 popup x 클릭 후 숨기기
				$('#uploadPopCls').click(function() {
					$('.uploader_popup').hide();
				});
	
				// 업로더 찾기 Search 버튼 클릭
				$('#searchUpBtn').click(function() {
					var uploaderName = null;
					var regex = null;
					regex = /[~!@\#$%<>^&*\()\-=+_\']/gi;
					uploaderName = $('#uploName').val();
					if (uploaderName.length == null || uploaderName == '' || uploaderName == 'undefined') {
						alert('찾고자 하는 업로더의 이름을 입력하세요.');
						$('#uploName').val('').focus();
						return false;
					}
					if (regex.test(uploaderName)) {
						alert('특수 문자는 허용하지 않습니다.');
						$('#uploName').val('').focus();
						return false;
					}
				});

				// 업로더 popup Select 버튼 클릭
				$('#uploSelect').click(function (){
					console.log('hiii');
					var uploaderValue = null;
					var valueCheckCount = 0;
					$('input[id="uploChk"]').each(function() {
						console.log('val',$(this).val());
						if($(this).is(':checked')) {
							valueCheckCount++;
						}
						if (valueCheckCount == 0) {
							alert('업로더를 선택해주세요.');
							return false;
						}
					});
				});

				// Delete 버튼 클릭 후 업로더 삭제
				$('#uploDel').click(function() {
					var result = null;
					result = confirm('정말 삭제하시겠습니까?');
					if(result) {
						alert('삭제완료');
					}
				});
			});
	    </script>
	</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		                                    	<option value="HanKook Tire">HanKook Tire</option>
		                                    	<option value="HanKook Tire (RAW)">HanKook Tire (RAW)</option>
		                                    	<option value="Other Brand">Other Brand</option>
		                                    	<option value="Other Brand (RAW)">Other Brand (RAW)</option>
		                                    	<option value="Technoloagy">Technoloagy</option>
		                                    	<option value="Technoloagy (RAW)">Technoloagy (RAW)</option>
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
								<li class="p_menu1"><a>설정</a></li>
								<li class="p_menu2"><a>업로드</a></li>
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
		                    <li id="tabUplo"><a>업로더 설정</a></li>
	                        <li id="tabDoc"><a>Document</a></li>
	                        <li id="tabLog" class="on"><a>Log</a></li>
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
	                        <div class="plugin_con" id="chart_div">
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
	                                    <th scope="col">재생횟수</th>
	                                </tr>
	                                </thead>
	                                <tbody>
	                           	<c:forEach var="popList" items="${popularList }" varStatus="status">
	                                <tr>
	                                    <td><c:out value="${status.count }" /></td>
	                                    <td class="left"><a href="#none"><c:out value="${popList.getTitle() }" /></a></td>
	                                    <td><c:out value="${popList.getContent_id() }" /></td>
	                                    <td class="left"></td>
	                                    <td><c:out value="${popList.getView_count() }" /></td>
	                                </tr>
	                           	</c:forEach>
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
	    <script type="text/javascript" src="./resources/common/js/jquery.cookies.2.2.0.min.js"></script>
	    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
	    <script>
	    	var dataTitle = null;
	    	var dataVcount = null;
	    	var resultData = [['title','view count']];
	    <c:forEach var="list" items="${result}" varStatus="status">
	    	dataTitle = '<c:out value="${list.getContent_title()}"/>';
	    	dataTitle = dataTitle.replace(/&#039;/g, '\'');
	    	dataTitel = '\'' + dataTitle + '\'';
	    	dataVcount = <c:out value="${list.getView_count()}" />;
	    	resultData.push([dataTitle,dataVcount]);
	    </c:forEach>
	    	google.load("visualization", "1", {packages:["corechart"]});
        	google.setOnLoadCallback(drawChart);
        	function drawChart() {
				var data = new google.visualization.arrayToDataTable(resultData);

				var options = {
				    title: '조회순',
				    smoothLine: true,
				    width: 1000,
				    height: 250,
				    hAxis:  {title: 'title',  titleTextStyle: {color: 'blue'}}
				};

				var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
				chart.draw(data, options);
        	}
	      	
	        $(document).ready(function() {

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
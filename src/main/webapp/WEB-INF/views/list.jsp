<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
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
	    <!-- Download 팝업 -->
	    <div class="download_popup_wrap" id="downloadPop">
	        <div class="download_popup_con">
	            <div class="popup_title">
	                <div class="mb20">
	                    <p class="mb10" id="dTitle">RA33_Dynapro HP2_Motion Graphic Graphic Graphic Graphic</p>
	                    <p><span>ID :</span> <label id="contentID">2014cvrw001800000255</label> </p>
	                </div>
	                <span><a id="downClose"><img src="./resources/images/common/popup_close_btn.png" alt="닫기"/></a></span>
	            </div>
	            <div class="download_con">
	                <p><img src="./resources/images/common/down_title.png" alt="download"/></p>
	                <ul>
	                  	<li><a id="mp4dl"><img src="./resources/images/common/ndown_mp4.png" alt="mp4"/></a></li>
						<li><a id="avidl"><img src="./resources/images/common/ndown_avi.png" alt="avi"/></a></li>
						<li><a id="movdl"><img src="./resources/images/common/ndown_mov.png" alt="mov"/></a></li>
						<li><a id="wmvdl"><img src="./resources/images/common/ndown_wmv.png" alt="wmv"/></a></li>
	                </ul>
	            </div>
	            <div class="detail_con">
	                <p><img src="./resources/images/common/detail_title.png" alt="detail"/></p>
	                <ul>
	                    <li>
	                        <p>Size : <label id="fwidth"></label>x<label id="fheight"></label> HD <label id="fsize"></label></p>
	                        <p>Video Format : <label id="container"></label></p>
	                        <p>Video Codec : <label id="vCodec"></label></p>
	                        <p>Video bps : <label id="vbps"></label></p>
	                        <p>Video fps :<label id="vfps"></label></p>
	                    </li>
	                    <li>
	                        <p>Audio Codec :<label id="aCodec">aac</label></p>
	                        <p>Audio bps :<label id="aBps">235478</label></p>
	                        <p>Audio channel : <label id="aChannel">2</label></p>
	                        <p>Audio Hz : <label id="aSampleRate">44100</label></p>
	                    </li>
	                </ul>
	            </div>
	        </div>
	    </div>
	    <!--// Download 팝업 -->  
    	<!-- my movie -->         
        <div class="my_movie">
        	<div class="my_movie_off">
            	<a id="myMovies">my movie 페이지 열기 </a>  
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
                            	<c:forEach var="his" items="${history}" varStatus="status">
                            	<c:choose>
								<c:when test="${fn:length(his.title) > 21}">
								<dd>
									<a id="his" data-contentId="${his.content_id}" data-playlistName="${his.getTag().getCategory()}">
										<img width="25px" height="14px" src="${his.thumb_url}" alt="" />${fn:substring(his.title, 0, 21)}...
									</a>
								</dd>
								</c:when>
								<c:otherwise>
                                <dd>
                                	<a id="his" data-contentId="${his.content_id}" data-playlistName="${his.getTag().getCategory()}">
                                		<img width="25px" height="14px" src="${his.thumb_url}" alt="" />${his.title}
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
						<a >
							<img id="hankookHome" src="./resources/images/common/img_logo.png" alt="Hankook - driving emotion" />
							<img id="vbHome" src="./resources/images/common/img_logo2.png" alt="Digital Library MAMs" />
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
				<!-- //header_bottom end    -->
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
				<!-- popular movie -->
				<div class="popular_movie my_list">
					<h2 class="mb0" id="ctgName"><c:out value="${categoryPageVO.getPlaylist_name()}"/></h2>
					<!-- <div class="search">
						<label for="search_word">
							Search within<input type="text" id="search_word" />
							<a  class="btn_search">찾기</a>
						</label>
					</div> -->
                    <div class="location"><span><c:out value="${categoryPageVO.getCategory()}"/></span>&nbsp;&gt;&nbsp;<span class="present"><c:out value="${categoryPageVO.getPlaylist_name()}"/></span></div>
					<div class="list_top">
						<ul class="sort_count">
							<li class="list20"><a>20개씩 보기</a></li>
							<!-- 
							<li class="list15"><a>15개씩 보기</a></li>
							<li class="list10"><a>10개씩 보기</a></li>
							 -->
						</ul>
						<div class="list_top_right">
							<div class="by first">
								<span>Filter by</span>
								<div class="drop_menu">
									<c:choose>
										<c:when test="${categoryPageVO.getRegion() eq null or categoryPageVO.getRegion() eq '' }">
											<c:set var="region" value="Region"/>
										</c:when>
										<c:when test="${categoryPageVO.getRegion() eq 'Europe' }">
											<c:set var="region" value="Europe"/>
										</c:when>
										<c:when test="${categoryPageVO.getRegion() eq 'America' }">
											<c:set var="region" value="America"/>
										</c:when>
										<c:when test="${categoryPageVO.getRegion() eq 'Middle East & Africa' }">
											<c:set var="region" value="Middle East & Africa"/>
										</c:when>
										<c:when test="${categoryPageVO.getRegion() eq 'Asia-Pacific' }">
											<c:set var="region" value="Asia-Pacific"/>
										</c:when>
										<c:when test="${categoryPageVO.getRegion() eq 'China' }">
											<c:set var="region" value="China"/>
										</c:when>
										<c:when test="${categoryPageVO.getRegion() eq 'Korea' }">
											<c:set var="region" value="Korea"/>
										</c:when>
									</c:choose>
									<a><c:out value="${region}"/></a>
									<input class="hide" type="text" value="" />
									<!-- li 안의 a 태그를 클릭하면 input 태그 안의 value에 해당 값이 들어가도록 개발해주시면 됩니다. -->
									<ul>
										<li onClick="sortRegion('Europe')"><a>Europe</a></li>
										<li onClick="sortRegion('America')"><a>America</a></li>
										<li onClick="sortRegion('Middle East & Africa')"><a>Middle East &amp; Africa</a></li>
                                        <li onClick="sortRegion('Asia-Pacific')"><a>Asia-Pacific</a></li>
                                        <li onClick="sortRegion('China')"><a>China</a></li>
                                        <li onClick="sortRegion('Korea')"><a>Korea</a></li>
									</ul>
								</div>
							</div>
							<div class="by">
								<span>Sort by</span>
								<div class="drop_menu">
									<c:choose>
										<c:when test="${categoryPageVO.getSort() eq 'view_count'}">
											<c:set var="sort" value="View count"/>
										</c:when>
										<c:when test="${categoryPageVO.getSort() eq 'reg_date'}">
											<c:set var="sort" value="Update date"/>
										</c:when>
										<c:when test="${categoryPageVO.getSort() eq '' or categoryPageVO.getSort() eq null}">
											<c:set var="sort" value="View count"/>
										</c:when>
									</c:choose>
									<a><c:out value="${sort}"/></a>
									<input class="hide" type="text" value="View count" />
									<ul>
										<li><a onClick="sortPage('reg_date')">Upload date</a></li> 
										<li><a onClick="sortPage('view_count')">View count </a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<ul class="thumbnail"> 
				<c:forEach var="content" items="${list}" varStatus="status"> 
					<c:choose>
					<c:when test="${(status.count % 5) == 1}">
						<li class="mr24"> 
							<a id="detailView" data-contentId="${content.content_id}" data-thumbUrl="${content.thumb_url }">
								<span>
									<img width="196px" height="110px" src="<c:out value='${content.thumb_url}'/>" alt="" />
									<span class="video-time">${content.duration }</span>
									<!-- <span><img src="./resources/images/common/icon_admin.png" alt="admin" /></span> -->
								</span>
							</a>
							<span><c:out value="${content.getTag().getCategory()}"/></span>
							<c:choose>
							<c:when test="${fn:length(content.title) > 37}">
							<h3><a>${fn:substring(content.title, 0, 37)}...</a></h3>
							</c:when>
							<c:otherwise>
							<h3><a>${content.title}</a></h3>
							</c:otherwise>
							</c:choose>
							<span><c:out value="${content.getView_count()}"/> views</span>
							<span class="f_left">${content.reg_date }</span>
							<span class="f_right mr5"><a class="download_btn" data-contentId="${content.content_id }"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
						</li>
					</c:when>
					<c:when test="${(status.count % 5) == 2 || (status.count % 5) == 3}">
						<li class="mr24">
							<a id="detailView" data-contentId="${content.content_id }" data-thumbUrl="${content.thumb_url }">
								<span>
									<img width="196px" height="110px" src="${content.thumb_url }" alt="" />
									<span class="video-time">${content.duration }</span>
									<!-- <span><img src="./resources/images/common/icon_admin.png" alt="admin" /></span> -->
								</span><!-- class="admin_icon" -->
							</a>
							<span><c:out value="${content.getTag().getCategory()}"/></span>   
							<c:choose>
							<c:when test="${fn:length(content.title) > 37}">
							<h3><a>${fn:substring(content.title, 0, 37)}...</a></h3>
							</c:when>
							<c:otherwise>
							<h3><a>${content.title}</a></h3>
							</c:otherwise>
							</c:choose>
							<span>${content.view_count} views</span>
							<span class="f_left">${content.reg_date }</span>
							<span class="f_right mr5"><a class="download_btn" data-contentId="${content.content_id }"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
						</li>
					</c:when>
					<c:when test="${(status.count % 5) == 4}">
						<li class="mr23">
							<a id="detailView" data-contentId="${content.content_id }" data-thumbUrl="${content.thumb_url }">
								<span>
									<img width="196px" height="110px" src="${content.thumb_url }" alt="" />
									<span class="video-time">${content.duration }</span>
								</span>
							</a>
							<span><c:out value="${content.getTag().getCategory()}"/></span>
							<c:choose>
							<c:when test="${fn:length(content.title) > 37}">
							<h3><a>${fn:substring(content.title, 0, 37)}...</a></h3>
							</c:when>
							<c:otherwise>
							<h3><a>${content.title}</a></h3>
							</c:otherwise>
							</c:choose>
							<span><c:out value="${content.getView_count()}"/> views</span>
							<span class="f_left">${content.reg_date }</span>
							<span class="f_right mr5"><a class="download_btn" data-contentId="${content.content_id }"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a id="detailView" data-contentId="${content.content_id }" data-thumbUrl="${content.thumb_url }">
								<span>
									<img width="196px" height="110px" src="${content.thumb_url }" alt="" />
									<span class="video-time">${content.duration }</span>
								</span>
							</a>
							<span><c:out value="${content.getTag().getCategory()}"/></span>
							<c:choose>
							<c:when test="${fn:length(content.title) > 37}">
							<h3><a>${fn:substring(content.title, 0, 37)}...</a></h3>
							</c:when>
							<c:otherwise>
							<h3><a>${content.title}</a></h3>
							</c:otherwise>
							</c:choose>
							<span><c:out value="${content.getView_count()}"/> views</span>
							<span class="f_left">${content.reg_date }</span>
							<span class="f_right mr5"><a class="download_btn" data-contentId="${content.content_id }"><img src="./resources/images/common/dow_icon.png" alt="download" /></a></span>
						</li>
					</c:otherwise>
					</c:choose>
				</c:forEach>
					</ul>
					<div class="list_bottom mb50">
						<div class="count">
							Total : <span class="now">${categoryPageVO.getTotalCount()}</span>           
						</div>
						<div class="page_control">
							<!-- 이전버튼 start -->
					    	<div class="control">
					    	<c:if test="${paging.getCurrentBlock() ne 1}">
					    		<a onClick="goPage('${paging.getCurrentBlock() - 1}')" class="btn_prev">Previous</a>
					    	</c:if>
					    	</div> 
					    	<!-- 이전버튼 end -->
					    	<div class="pages">
							    <c:forEach begin="${paging.getStartRow()}" end="${paging.getEndRow()}" varStatus="status">
							        <c:choose>
							            <c:when test="${paging.currentPage eq status.index}">
											 <a class="on" id="page${status.count}"><c:out value="${status.count}"/></a>
							            </c:when>
										<c:when test="${paging.currentPage ne status.index}">
											 <a id="page${status.count}"><c:out value="${status.count}"/></a>
										</c:when>
							        </c:choose>
							    </c:forEach>
							</div>
						    <!-- 다음버튼 start -->
						    <div class="control"> 
								<c:if test="${paging.getCurrentBlock() ne paging.getPageOfBlock()}">    
						    		<a onClick="goPage('${paging.getCurrentBlock()+ 1}')" class="btn_next">next</a>
						    	</c:if>
								<c:if test="${ pageNum eq categoryPageVO.getTotalCount()}"></c:if>
						    </div> 
						    <!-- 다음버튼 end -->
						</div>
					</div>
					<!-- 페이징 처리 [end] -->	
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
					<p class="copyright">
						Copyright ⓒ Hankook Tire. All Rights Reserved.
					</p>
				</div>
			</div>
			<!-- //footer end -->
		</div>
	</div>
		<!-- //footer_wrap end -->
	<script type="text/javascript" src="./resources/common/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="./resources/common/js/jquery.ui.all.js"></script>
	<script type="text/javascript" src="./resources/common/js/jquery.bxslider.min.js"></script>
	<script type="text/javascript" src="./resources/common/js/jquery.cookies.2.2.0.min.js"></script>
	<script type="text/javascript" src="./resources/common/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('a[id="detailView"]').click(function() {
				var mamCook 		= null;
				var content_id  	= null;
				var playlist_id		= null;
				var playlist_name 	= null;
				var hiddenCon 		= null;
				var hiddenPld 		= null;
				var hiddenHis		= null;
				var hiddenPln		= null;
				playlist_id		= '<c:out value="${categoryPageVO.getPlaylist_id()}"/>';
				playlist_name 	= '<c:out value="${categoryPageVO.getPlaylist_name()}"/>';
				content_id  = $(this).attr('data-contentId');
				mamCook = $.cookies.get('mamsCookie');
				if (!validCookieContent.isExistContentId(mamCook.myHistory, content_id)) {
					mamCook.myHistory.push(content_id);
					$.cookies.set('mamsCookie', JSON.stringify(mamCook));
				}
				hiddenPln	= $('<input>').prop({'type':'hidden','name':'playlist_name','value':playlist_name});
				hiddenPld	= $('<input>').prop({'type':'hidden','name':'playlist_id','value':playlist_id});
				hiddenHis	= $('<input>').prop({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
				hiddenCon 	= $('<input>').prop({'type':'hidden','name':'content_id','value':content_id});
				$('<form></form>').prop({'method':'post','action':'playlistDetail'}).append(hiddenCon, hiddenPld, hiddenPln, hiddenHis).appendTo('body').submit();
			});

			$('#nextBtn').click(function() {
				
			});

			
		});
		
		// 페이지 이동
		function goPage(pageNum) {
			var mamCook 	= null;
			var hiddenHis 	= null;
			var hiddenPgn	= null;
			mamCook 	= $.cookies.get('mamsCookie');
			hiddenPgn	= $('<input>').prop({'type':'hidden','name':'pageNum','value':pageNum});
			hiddenHis 	= $('<input>').prop({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
			hiddenPaging= $('<input>').prop({'type':'hidden','name':'pageNum','value':pageNum });
			$('<form></form>').attr({'method':'post','action':'playlistDetail'}).append(hiddenHis).append(hiddenPgn).appendTo('body').submit();
		}
		
		// sort(정렬) 영역 조회
		function sortPage(sort) {
			var mamCook 	= null;
			var hiddenHis 	= null;
			var hiddenPgn	= null;
			var hiddenPld	= null;
			mamCook 	= $.cookies.get('mamsCookie');
			hiddenPgn	= $('<input>').prop({'type':'hidden','name':'pageNum','value':'${paging.getCurrentPage() - 1}'});
			hiddenHis 	= $('<input>').prop({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
			hiddenSort 	= $('<input>').prop({'type':'hidden','name':'sort','value':sort}); 
			hiddenPld	= $('<input>').prop({'type':'hidden','name':'playlist_id','value':'${categoryPageVO.getPlaylist_id()}'});
			$('<form></form>').attr({'method':'post','action':'sortPlaylist'}).append(hiddenHis, hiddenSort, hiddenPgn, hiddenPld).appendTo('body').submit();
		}

		// region 영역 조회
		function sortRegion(region) {
			var sort		= null;
			var mamCook 	= null;
			var hiddenHis 	= null;
			var hiddenPgn	= null;
			var hiddenPld	= null;
			var hiddenRgo	= null;
			var hiddenPln	= null;
			sort		= '<c:out value="${sort}"/>';
			if (sort == 'View count') {
				sort = 'view_count';
			} else {
				sort = 'reg_date';
			}
			mamCook 	= $.cookies.get('mamsCookie');
			hiddenPgn	= $('<input>').prop({'type':'hidden','name':'pageNum','value':'${paging.getCurrentPage() - 1}'});
			hiddenHis 	= $('<input>').prop({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
			hiddenSort 	= $('<input>').prop({'type':'hidden','name':'sort','value':sort}); 
			hiddenRgo 	= $('<input>').prop({'type':'hidden','name':'region','value':region}); 
			hiddenPld	= $('<input>').prop({'type':'hidden','name':'playlist_id','value':'${categoryPageVO.getPlaylist_id()}'});
			hiddenPln	= $('<input>').prop({'type':'hidden','name':'playlist_name','value':'${categoryPageVO.getPlaylist_name()}'});
			$('<form></form>').attr({'method':'post','action':'regionPlaylist'}).append(hiddenHis, hiddenSort, hiddenPgn, hiddenPld, hiddenRgo, hiddenPln).appendTo('body').submit();
		}
	</script>
</body>
</html>

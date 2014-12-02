/**
 * 
 */
// cookie의 기본 설정및 디폴트 설정
var date = new Date();
var currentYear = date.getFullYear();
var expireDate = new Date(currentYear + 1, 1, 1);
var cookieOption = {
    domain: '',
    path: '/',
    expiresAt: expireDate.toGMTString(),
    secure: false
};

var myStorage = {
	myDownload:[],
	myBookmark:[],
	myHistory:[]
};

var validCookieContent = {
	isExistContentId:function(cookObject, contentID) {
		var i		= 0;
		var valid 	= 0;
		for (i; i < cookObject.length; i = i + 1) {
			if (cookObject[i] == contentID) {
				valid = valid + 1;
			}
		}
		if (valid == 0) {
			return false;
		} else {
			return true;
		}
	}
};

if ($.cookies.get('mamsCookie') == 'undefined' || $.cookies.get('mamsCookie') == null) {
	var jsonData = JSON.stringify(myStorage);
	$.cookies.set('mamsCookie', jsonData, cookieOption);
}
// -- cookie End

$(function() {
	// ################################ DFLUX C&C publishing Start ################################
	//search s
	$('#search').focus(function() {
		$(this).css("background-image","none");
	});
	
	$('#search').blur(function() {
		if ($(this).val()) {
			$(this).css("background-image","none");
		} else {
			$(this).css("background-image","url('./resources/images/common/input_search.png')");
		}
	});
	//search e
	
	//header
	var header_offset 	= null;
	var header_width 	= null;
	var gnb_offset 		= null;
	var gnb_width 		= null;
	header_offset 	= $('#header').offset();    
	header_width 	= $('#header').outerWidth();
	gnb_offset 		= $('#gnb').offset();       
	gnb_width 		= $('#gnb').outerWidth();  
	
	$(window).resize(function () {
        $('#gnb .menu > div').css({
            'width': $('#header_wrap').width(),
            'left': 0
        });
    });
	
    $('#gnb .menu > div').css({
        'width': $('#header_wrap').width(),
        'left': 0
    });
    
    //gnb mouse and tab setting
    $('#gnb > ul').find('> li').mouseenter(function () {
        $('#gnb .menu > div').stop().slideUp(150);
        $(this).find('> div').stop().slideDown(150);
    }).mouseleave(function () {
            $(this).find('> div').stop().slideUp(150);
        });
    
    $('#gnb > ul').find('> li > a').focusin(function () {
        $('#gnb .menu > div').slideUp(150);
        $(this).next('div').stop().slideDown(150);
    });
    
    $('.depth2 li:last-child a').focusout(function () {
        $('#gnb .menu > div').stop().slideUp(150);
    });
    //gnb mouse and tab setting end

    // gnb
    $('#gnb > ul > li.menu > a').mouseenter(function() {
        $(this).css('color', '#ff6600');
    });
    $('#gnb > ul > li.menu > a').mouseleave(function() {
        $(this).css('color', '#513e1f');
    });
    $('#gnb > ul > li.menu > div > ul > li > a').mouseenter(function() {
        $(this).css('color', '#ff6600');
    });
    $('#gnb > ul > li.menu > div > ul > li > a').mouseleave(function() {
        $(this).css('color', '#513e1f');
    });
    $('#gnb > ul > li.menu > div').mouseenter(function(){
        $(this).prev('a').css('color', '#ff6600');
    });
    $('#gnb > ul > li.menu > div').mouseleave(function(){
        $(this).prev('a').css('color', '#513e1f');
    });
    // gnb
    //header
	
	$('.category_slide').bxSlider({
		slideWidth: 196,
		minSlides: 1,
		maxSlides: 5,
		moveSlides: 5,
		slideMargin: 24,
		randomStart: false,
		infiniteLoop: true,
		auto: false,
		autoControls: false,
		autoHover: true,
		autoStart: true,
		pager: false,
		controls: true
	});
	
	$('.detail_slide').bxSlider({
		slideWidth: 251,
		minSlides: 7,
		maxSlides: 1,
		moveSlides: 7,
		slideMargin: 20,
		randomStart: false,
		infiniteLoop: true,
		auto: false,
		autoControls: false,
		autoHover: true,
		autoStart: true,
		pager: false,
		controls: true,
		mode: 'vertical'
	});
	
	//--Upload layer start (developer Add)
	$('.upload_popup_wrap').hide();
	//--Upload layer end
	
	//download s
	$('.detail_link .d_link01').click(function() {
		if($(this).hasClass('d_link01_on')==true){
			$(this).removeClass('d_link01_on');
			$('#d_download').hide();
		}else{
			$(this).addClass('d_link01_on');
			$('#d_download').show();
		}
	});
	
	$('.btn_folding').click(function(){
		$('#d_download').hide();
		$(this).parent().prev('.detail_link').find('.d_link01').removeClass('d_link01_on');
	});
	//download e
	
	//share s
	$('.detail_link .d_link02').click(function() {
		if($(this).hasClass('d_link02_on')==true){
			$(this).removeClass('d_link02_on');
			$('.d_share').hide();
		}else{
			$(this).addClass('d_link02_on');
			$('.d_share').show();
		}
	});
	//share e
	
	//bookmark s
	$('.detail_link .d_link03').click(function() {
		if($(this).hasClass('d_link03_on')==true){
			$(this).removeClass('d_link03_on');
			$('.bookmark_layer').hide();
		}else{
			$(this).addClass('d_link03_on');
			$('.bookmark_layer').show();
		}
	});
	
	$('.bookmark_close').click(function(){
		$('.bookmark_layer').hide();
		$(this).parent().prev('a').removeClass('d_link03_on');
	});
	//bookmark e
	
	//my movie setting
	$('.my_movie').set_my_movie();
	//my movie setting end
	
	$('a[class="download_btn"]').click(function(){
		$('.dow_layer').show();
		$('.dow_layer_close').click(function(){
			$('.dow_layer').hide();
		});
	});
	// ################################ DFLUX C&C publishing End ################################
	// ################################ Web Programmer surpport Start ################################
	
	// a태그의 href 속성 제거로 마우스 hover 효과를 넣음.
	$('a').hover(
		function () {
			$(this).css('cursor', 'pointer');
		}, 
		function () {
			$(this).css('cursor', 'default');
		}
	);
	
	// videoBox 이미지 클릭
	$('#vbHome').click(function() {
		$(location).attr('href', '/videoBox');
	});
	
	// 좌측 사이드의 'MY MOVIE'이미지 클릭
	$('#myMovies').click(function() {
		var cookieData = $.cookies.get('mamsCookie');
		var downLength = cookieData.myDownload.length;
		var bookLength = cookieData.myBookmark.length;
		$('#downloadCnt').text(downLength);
		$('#bookmarkCnt').text(bookLength);
	});
	
	// list_my_bookmark.jsp 페이지로 이동
	$('a[id="mamsBookmark"]').click(function() {
		var mamCook 	= null;
		var hiddenInp 	= null;
		var hiddenHis	= null;
		mamCook = $.cookies.get('mamsCookie');
		hiddenHis = $('<input>').attr({'type':'hidden', 'name':'historyList', 'value':JSON.stringify(mamCook.myHistory)});
		hiddenInp = $('<input>').attr({'type':'hidden', 'name':'bookmarkInfo', 'value':JSON.stringify(mamCook.myBookmark)});
		$('<form></form>').attr({'method':'POST','action':'moveMyBookmark'}).append(hiddenInp).append(hiddenHis).appendTo('body').submit();
	});
	
	// list_my_download.jsp 페이지로 이동
	$('#mamsDownload').click(function() {
		var mamCook		= null;
		var hiddenDwn 	= null;
		var hiddenHis	= null;
		mamCook = $.cookies.get('mamsCookie');
		hiddenDwn = $('<input>').attr({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
		hiddenHis = $('<input>').attr({'type':'hidden','name':'downloadList','value':JSON.stringify(mamCook.myDownload)});
		$('<form></form>').attr({'method':'POST','action':'mamsDownload'}).append(hiddenHis).append(hiddenDwn).appendTo('body').submit();
	});
	
	// 다운로드 아이콘 클릭
	$('a[class="download_btn"]').click(function(){
		var contentId = $(this).attr('data-contentId');
		$('.mb5').text('ID : ' + contentId);
		$.getJSON('contentInfo', {"contentId":contentId}, function(data){
			var decodeFileName = decodeURIComponent(data.fileName);
			var fileName = decodeFileName.replace(/\+/g, ' ');
			var aTag = $('<a id="fileFormat"></a>').attr({'href':data.downloadUrl,'id':'getTheFile','data-contentId':contentId}).append('<img src="./resources/images/common/icon_mp4.png" alt="download"/>' + fileName);
			ddTag = $('<dd></dd>').append(aTag);
			$("#downloadUrl").empty();
			$("#downloadUrl").after(ddTag);
			/*
			$("#contentType").text('Contents Type : ' + data.mediaType);
			$("#size").text('Size : ' + data.size);
			$("#videoFormat").text('Video Format : ' + data.videoFormat);
			$("#videoCodec").text('Video Codec : ' + data.videoCodec);
			$("#videoBps").text('Video bps : ' + data.videoBps);
			$("#videoFps").text('Video fps : ' + data.videoFps);
			$("#audioCodec").text('Audio Codec : ' + data.audioCodec);
			$("#audioBps").text('Audio bps : ' + data.audioBps);
			$("#channel").text('Audio channel : ' + data.audioChannel);
			$("#hz").text('Audio Hz : ' + data.audioHz);
			*/
		});
	});
	
	$(document).on('click', '#getTheFile', function(e){
		var mamCook 	= null;
		var contentId 	= null;
		contentId = $(this).attr('data-contentId');
		mamCook = $.cookies.get('mamsCookie');
		if (!validCookieContent.isExistContentId(mamCook.myDownload, contentId)) {
			mamCook.myDownload.push(contentId);
			$.cookies.set('mamsCookie', JSON.stringify(mamCook));
		}
		$('#downloadCnt').text(mamCook.myDownload.length);
	});
	
	// history list content 실행
	$('a[id="his"]').click(function(){
		var mamCook 	= null;
		var contentId 	= null;
		var thumbUrl	= null;
		var hiddenCon	= null;
		var hiddenTmb	= null;
		var hiddenHis	= null;
		mamCook		= $.cookies.get('mamsCookie');
		contentId 	= $(this).attr('data-contentId');
		thumbUrl	= $(this).attr('data-thumbUrl');
		hiddenCon	= $('<input>').attr({'type':'hidden','name':'content_id','value':contentId});
		hiddenTmb	= $('<input>').attr({'type':'hidden','name':'thumbUrl','value':thumbUrl});
		hiddenHis	= $('<input>').attr({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
		$('<form></form>').attr({'method':'POST','action':'detail'}).append(hiddenCon).append(hiddenTmb).append(hiddenHis).appendTo('body').submit();
	});
	
	// 검색 
	$('#search').keypress(function(event) {
		var mamCook 	= null;
		var hiddenHis 	= null;
		var stringRegx 	= /[~!@\#$%<>^&*\()\-=+_\']/gi;
		mamCook = $.cookies.get('mamsCookie');
		var searchString= $(this).val();
		if(stringRegx.test(searchString)) { 
			alert('특수문자는 허용하지 않습니다.');
			$(this).val('').focus();
			return false;
		}
		
		if (event.which == 13) {
			hiddenHis = $('<input>').prop({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
			$('form[class="search_form"]').append(hiddenHis);
		}
	});
	
	// Region click 후 해당 지역 검색
	$('li[id="regions"]').click(function() {
		var regionValue = null;
		regionValue = $(this).text();
	});
	
	$('li[id="selected"]').click(function() {
		var selectedValue = null;
		selectedValue = $(this).text();
	});
	
	var uploadCls = {
		myFile:null,
		title:null,
		category:null,
		year:null,
		type:null,
		region:null,
		official:null,
		description:null,
		uploadFileCheck:function(jqueryElement) {
			if(jqueryElement.val() == 'undefined' || jqueryElement.val() == null || jqueryElement.val() == '') {
				alert('업로드할 파일을 선택하세요!');
				jqueryElement.focus();
				jqueryElement.val('');
				return false;
			} else {
				return true;
			}
		},
		titleCheck:function(jqueryElement) {
			console.log('title');
			if(jqueryElement.val() == 'undefined' || jqueryElement.val() == null || jqueryElement.val() == '') {
				alert('제목을 입력하세요!');
				jqueryElement.val('').focus();
				return false;
			} else {
				return true;
			}
		},
		officialCheck:function(jqueryElement) {
			console.log(jqueryElement.val());
			if(jqueryElement.val() == 'undefined' || jqueryElement.val() == null || jqueryElement.val() == '') {
				alert('송출 타입을 지정하세요!');
				$('input[name="official"]').focus();
				return false;
			} else {
				return true;
			}
		},
		infoCheck:function(jqueryElement) {
			if(jqueryElement.val() == 'undefined' || jqueryElement.val() == null || jqueryElement.val() == '') {
				alert('파일에 대한 설명을 작성하세요!');
				jqueryElement.val('').focus();
				return false;
			} else {
				return true;
			}
		}
	};
	//--upload layer show and file uploading
	$('#upload').click(function() {
		//method="post" action="video/fileUpload" enctype="multipart/form-data"
		$('.upload_popup_wrap').layerCenter();
		$('.upload_popup_wrap').show();
		uploadCls.myFile		= $('#videoFile').val();
		uploadCls.title 		= $('#videoTitle').val();
		uploadCls.category 		= $('#category').val();
		uploadCls.year 			= $('#year').val();
		uploadCls.type 			= $('#type option:selected').val();
		uploadCls.region 		= $('#region option:selected').val();
		uploadCls.official		= $('input[name="official"]:checked').val();
		uploadCls.description	= $('#info').val();
		//method="post" action="video/fileUpload" enctype="multipart/form-data"
		//$('form[name="uploadFrm"]').prop({'method':'post','action':'video/fileUpload','enctype':'multipart/form-data'})
		//$('.upload_popup_wrap').hide();
		return false;
	});
	
	$('#uploadClose').click(function() {
		$('.upload_popup_wrap').hide();
		return false;
	});
	
	$('#pushTheUpload').click(function() {
		var form = null;
		if(!uploadCls.uploadFileCheck($('#videoFile'))) {
			return false;
		}
		if(!uploadCls.titleCheck($('#videoTitle'))) {
			return false;
		}
		if(!uploadCls.officialCheck($('input[name="official"]:checked'))) {
			return false;
		}
		if(!uploadCls.infoCheck($('#info'))) {
			return false;
		}
		form = new FormData(document.getElementById('uploadForm'));
		$.ajax({
			url: "video/fileUpload",
			data: form,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function (response) {
				alert(response);
			},
			error: function (jqXHR) {
				alert(jqXHR);
			}
		});
	});
	//--upload layer show and file uploading end
	
	//--admin enter start
	$('#admin').click(function() {
		location.replace('/videoBox/adminUploaders');
	});
	//--admin enter end
	
	//--category 항목 클릭후 해당 카테고리로 이동 start
	$('li[id="gnb"]').click(function() {
		var playlistId  = null;
		var formElement = null;
		var hiddenPid	= null;
		var mamCook		= null;
		var hiddenHis	= null;
		mamCook 	= $.cookies.get('mamsCookie');
		playlistId 	= $(this).attr('data-gnb');
		hiddenHis 	= $('<input>').prop({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
		/*
		formElement = $('<form></form>').prop({'method':'post','action':'categorySection'});
		hiddenPid	= $('<input>').prop({'type':'hidden','name':'playlist_id','value':playlistId});
		formElement.append(hiddenPid).append(hiddenHis).appendTo('body').submit();
		*/
	});
	//--category 항목 클릭후 해당 카테고리로 이동 end
	
	//--
	//--
	// ################################ Web Programmer surpport End ################################
});

//################################ DFLUX C&C publishing start ################################
$.fn.set_my_movie = function () {
	var target = $(this);
	var docu_h = $(document).outerHeight(true);
	var util_h = $('.util_navi').outerHeight(true);
	var foot_h = $('.footer_wrap').outerHeight(true);
	target.find('.my_movie_off').css({
		'height': docu_h - util_h - foot_h
	});
	target.find('.my_movie_on').css({
		'height': docu_h - util_h - foot_h
	});
	$('.my_movie_off a').click(function () {
		target.find('.my_movie_on').stop().animate({
			'left':0
		});
		$('.my_movie_off').hide('fade');
		return false;
	});
	$('.my_movie_close a').click(function () {
		$('.my_movie_on').stop().animate({
			'left': -($('.my_movie_on').width())
		}, function () {
			target.find('.my_movie_off').show('fade');
		});
		return false;
	});
};

//--center position screen start (developer Add) 
//--useage: $(element).center();
jQuery.fn.layerCenter = function () {
    this.css("position","absolute");
    this.css("top", Math.max(165, (($(window).height() - $(this).outerHeight()) / 2) + 
                                                $(window).scrollTop()) + "px");
    this.css("left", Math.max(5, (($(window).width() - $(this).outerWidth()) / 2) + 
                                                $(window).scrollLeft()) + "px");
    return this;
};
//--center position screen end
//################################ DFLUX C&C publishing End ################################
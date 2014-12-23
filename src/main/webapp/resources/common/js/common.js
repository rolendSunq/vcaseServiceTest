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

var mp4Cls	= null;
var mp4Cls2 = null;
var aviCls 	= null;
var aviCls2 = null;
var movCls 	= null;
var movCls2 = null;
var wmvCls 	= null;
var wmvCls2 = null;

// ################################ DFLUX C&C publishing Start ################################
$(function() {
	$('#downloadPop').hide();
	$('#uploading').somthingCenter().hide();
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
	/*
	var header_offset 	= null;
	var header_width 	= null;
	var gnb_offset 		= null;
	var gnb_width 		= null;
	*/
	header_offset 	= $('#header').offset();    
	header_width 	= $('#header').outerWidth();
	gnb_offset 		= $('#gnb').offset();       
	gnb_width 		= $('#gnb').outerWidth();  

	//gnb mouse and tab setting
	$('#gnb > ul').find('> li').mouseenter(function () {
		$('#gnb .menu > div').stop().slideDown(150);
		$('.gnb_bg1').stop().slideDown(150);
	}).mouseleave(function () {
        $('#gnb .menu > div').stop().slideUp(150);
        $('.gnb_bg1').stop().slideUp(150);
	});
	$('#gnb > ul').find('> li > a').focusin(function () {
        $('#gnb .menu > div').stop().slideDown(150);
        $('.gnb_bg1').stop().slideDown(150);
	});
	$('.depth2 li:last-child a').focusout(function () {
        $('#gnb .menu > div').stop().slideUp(150);
        $('.gnb_bg1').stop().slideUp(150);
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
		var hiddenBok 	= null;
		var hiddenHis	= null;
		mamCook = $.cookies.get('mamsCookie');
		hiddenHis = $('<input>').attr({'type':'hidden', 'name':'historyList', 'value':JSON.stringify(mamCook.myHistory)});
		hiddenBok = $('<input>').attr({'type':'hidden', 'name':'bookmarkInfo', 'value':JSON.stringify(mamCook.myBookmark)});
		$('<form></form>').attr({'method':'POST','action':'moveMyBookmark'}).append(hiddenBok, hiddenHis).appendTo('body').submit();
	});
	
	// list_my_download.jsp 페이지로 이동
	$('#mamsDownload').click(function() {
		var mamCook		= null;
		var hiddenDwn 	= null;
		var hiddenHis	= null;
		mamCook = $.cookies.get('mamsCookie');
		hiddenHis = $('<input>').attr({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
		hiddenDwn = $('<input>').attr({'type':'hidden','name':'downloadList','value':JSON.stringify(mamCook.myDownload)});
		$('<form></form>').attr({'method':'POST','action':'mamsDownload'}).append(hiddenHis, hiddenDwn).appendTo('body').submit();
	});
	
	// category content Page 이동 (list.page)
	$('a[id*="pls"]').click(function() {
		var playlist_id		= null;
		var playlist_name	= null;
		var formEle			= null;
		var hiddenPls		= null;
		var hiddenPln		= null;
		playlist_id = $(this).attr('id');
		playlist_name = $(this).text();
		playlist_id = playlist_id.substring(3, playlist_id.length);
		formEle = $('<form></form>').prop({'method':'post','action':'categoryPlaylist'});
		hiddenPls = $('<input>').prop({'type':'hidden','name':'playlist_id','value':playlist_id});
		hiddenPln = $('<input>').prop({'type':'hidden','name':'playlist_name','value':playlist_name});
		formEle.append(hiddenPls, hiddenPln).appendTo('body').submit();
	});
	
	// 다운로드 아이콘 클릭
	$('a[class="download_btn"]').click(function(){
		$('#downloadPop').show().downPopCenter();
		var contentId = $(this).attr('data-contentId');
		$('.mb5').text('ID : ' + contentId);
		$.getJSON('getDownload', {"content_id":contentId}, function(data){
			for(var i = 0; i < data.length; i = i + 1) {
				if (data[i].container == 'mp4') {
					if (mp4Cls == null) {
						mp4Cls = data[i];
					} else {
						mp4Cls2 = data[i];
					}
				}
				if (data[i].container == 'avi') {
					if (aviCls == null) {
						aviCls = data[i];
					} else {
						aviCls2 = data[i];
					}
				}
				if (data[i].container == 'mov') {
					if (movCls == null) {
						movCls = data[i];
					} else {
						movCls2 = data[i];
					}
				}
				if (data[i].container == 'wmv') {
					if (wmvCls == null) {
						wmvCls = data[i];
					} else {
						wmvCls2 = data[i];
					}
				}
			}
			$('#dTitle').text(decodeURIComponent(mp4Cls.title));
			$('#mp4dl').prop({'href':mp4Cls.download_url});
			$('#avidl').prop({'href':aviCls.download_url});
			$('#movdl').prop({'href':movCls.download_url});
			$('#wmvdl').prop({'href':wmvCls.download_url});
		});
	});
	
	$('#mp4dl, #avidl, #movdl, #wmvdl').mouseover(function() {
		var idVal = $(this).attr('id');
		if (idVal == 'mp4dl'){
			$('#contentID').text(mp4Cls.content_id);
			$("#fwidth").text(mp4Cls.width);
			$('#fheight').text(mp4Cls.height);
			$('#fsize').text(wmvCls.file_size);
            $('#container').text(mp4Cls.container);
            $('#vCodec').text(mp4Cls.video_codec);
            $('#vbps').text(mp4Cls.video_bitrate);
            $('#vfps').text(mp4Cls.video_framerate);
            $('#aCodec').text(mp4Cls.audio_codec);
            $('#aBps').text(mp4Cls.audio_bitrate);
            $('#aChannel').text(mp4Cls.audio_channel);
            $('#aSampleRate').text(mp4Cls.audio_samplerate);
		}
		if (idVal == 'avidl') {
			$('#contentID').text(aviCls.content_id);
			$("#fwidth").text(aviCls.width);
			$('#fheight').text(aviCls.height);
			$('#fsize').text(wmvCls.file_size);
            $('#container').text(aviCls.container);
            $('#vCodec').text(aviCls.video_codec);
            $('#vbps').text(aviCls.video_bitrate);
            $('#vfps').text(aviCls.video_framerate);
            $('#aCodec').text(aviCls.audio_codec);
            $('#aBps').text(aviCls.audio_bitrate);
            $('#aChannel').text(aviCls.audio_channel);
            $('#aSampleRate').text(aviCls.audio_samplerate);
		}
		if (idVal == 'movdl') {
			$('#contentID').text(movCls.content_id);
			$("#fwidth").text(movCls.width);
			$('#fheight').text(movCls.height);
			$('#fsize').text(wmvCls.file_size);
            $('#container').text(movCls.container);
            $('#vCodec').text(movCls.video_codec);
            $('#vbps').text(movCls.video_bitrate);
            $('#vfps').text(movCls.video_framerate);
            $('#aCodec').text(movCls.audio_codec);
            $('#aBps').text(movCls.audio_bitrate);
            $('#aChannel').text(movCls.audio_channel);
            $('#aSampleRate').text(movCls.audio_samplerate);
		}
		if (idVal == 'wmvdl') {
			$('#contentID').text(wmvCls.content_id);
			$("#fwidth").text(wmvCls.width);
			$('#fheight').text(wmvCls.height);
			$('#fsize').text(wmvCls.file_size);
            $('#container').text(wmvCls.container);
            $('#vCodec').text(wmvCls.video_codec);
            $('#vbps').text(wmvCls.video_bitrate);
            $('#vfps').text(wmvCls.video_framerate);
            $('#aCodec').text(wmvCls.audio_codec);
            $('#aBps').text(wmvCls.audio_bitrate);
            $('#aChannel').text(wmvCls.audio_channel);
            $('#aSampleRate').text(wmvCls.audio_samplerate);
		}
	});
	
	$('#mp4dl, #avidl, #movdl, #wmvdl').mouseout(function (){
		$('#contentID').text('');
		$("#fwidth").text('');
		$('#fhieght').text('');
		$('#fsize').text('');
        $('#container').text('');
        $('#vCodec').text('');
        $('#vbps').text('');
        $('#vfps').text('');
        $('#aCodec').text('');
        $('#aBps').text('');
        $('#aChannel').text('');
        $('#aSampleRate').text('');
	});
	
	// download popup button close
	$('#downClose').click(function() {
		mp4Cls	= null;
		mp4Cls2 = null;
		aviCls 	= null;
		aviCls2 = null;
		movCls 	= null;
		movCls2 = null;
		wmvCls 	= null;
		wmvCls2 = null;
		$('#downloadPop').hide();
		$('#dTitle').text('');
		$("#width").text('');
		$('#hieght').text('');
        $('#container').text('');
        $('#vCodec').text('');
        $('#vbps').text('');
        $('#vfps').text('');
        $('#aCodec').text('');
        $('#aBps').text('');
        $('#aChannel').text('');
        $('#aSampleRate').text('');
	});
	
	$('#mp4dl, #avidl, #movdl, #wmvdl').click(function() {
		var mamCook 	= null;
		var contentId 	= null;
		var formatId	= null;
		$('#downloadPop').hide();
		$('#dTitle').text('');
		$("#width").text('');
		$('#hieght').text('');
        $('#container').text('');
        $('#vCodec').text('');
        $('#vbps').text('');
        $('#vfps').text('');
        $('#aCodec').text('');
        $('#aBps').text('');
        $('#aChannel').text('');
        $('#aSampleRate').text('');
		formatId = $(this).attr('id');
		if (formatId == 'mp4dl') {
			contentId = mp4Cls.content_id;
		}
		if (formatId == 'avidl') {
			contentId = aviCls.content_id;
		}
		if (formatId == 'movdl') {
			contentId = movCls.content_id;
		}
		if (formatId == 'wmvdl') {
			contentId = wmvCls.content_id;
		}
		mamCook = $.cookies.get('mamsCookie');
		if (!validCookieContent.isExistContentId(mamCook.myDownload, contentId)) {
			mamCook.myDownload.push(contentId);
			$.cookies.set('mamsCookie', mamCook);
		}
		$('#downloadCnt').text(mamCook.myDownload.length);
	});
	
	// history list content 실행
	$('a[id="his"]').click(function(){
		var mamCook 	= null;
		var contentId 	= null;
		var playlistName= null;
		var hiddenCon	= null;
		var hiddenPln	= null;
		var hiddenHis	= null;
		mamCook		= $.cookies.get('mamsCookie');
		contentId 	= $(this).attr('data-contentId');
		playlistName= $(this).attr('data-playlistName');
		hiddenCon	= $('<input>').prop({'type':'hidden','name':'content_id','value':contentId});
		hiddenPln	= $('<input>').prop({'type':'hidden','name':'playlist_name','value':playlistName});
		hiddenHis	= $('<input>').prop({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
		$('<form></form>').prop({'method':'POST','action':'detail'}).append(hiddenCon, hiddenPln, hiddenHis).appendTo('body').submit();
	});
	
	//-- search start --
	// 검색 input text에 엔터 입력 
	$('#search').keypress(function(event) {
		var mamCook 	= null;
		var formElement	= null;
		var searchString= null;
		var hiddenHis 	= null;
		var stringRegx 	= /[~!@\#$%<>^&*\()\-=+_\']/gi;
		mamCook 	= $.cookies.get('mamsCookie');
		searchString= $(this).val();
		if(stringRegx.test(searchString)) { 
			alert('특수문자는 허용하지 않습니다.');
			$(this).val('').focus();
			return false;
		}
		if (event.which == 13) {
			hiddenHis 	= $('<input>').prop({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
			formElement = $('#searchFrm').prop({'method':'post','action':'search'});
			formElement.append(hiddenHis).submit();
		}
	});
	
	// search button 실행
	$('#searchBtn').click(function() {
		var mamCook 	= null;
		var formElement	= null;
		var searchString= null;
		var hiddenHis 	= null;
		var stringRegx 	= /[~!@\#$%<>^&*\()\-=+_\']/gi;
		mamCook 	= $.cookies.get('mamsCookie');
		searchString= $('#search').val();
		if(stringRegx.test(searchString)) { 
			alert('특수문자는 허용하지 않습니다.');
			$(this).val('').focus();
			return false;
		}
		hiddenHis 	= $('<input>').prop({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
		formElement = $('#searchFrm').prop({'method':'post','action':'search'});
		formElement.append(hiddenHis).submit();
	});
	//-- search end --
	
	var uploadCls = {
		categoryList:['Company','Company (RAW)','Culture','Culture (RAW)','TV Footages','TV Footages (RAW)','TVC','TVC (RAW)','Campaign','Campaign (RAW)','Sports Marketing','Sports Marketing (RAW)','HanKook Tire','HanKook Tire (RAW)','Other Brand','Other Brand (RAW)','Technoloagy','Technoloagy (RAW)','Europe','Europe (RAW)','Other Motosports','Other Motosports (RAW)','Exhibition','Exhibition (RAW)','Promotion','Promotion (RAW)','Other Event','Other Event (RAW)','Other','Other (RAW)'],
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
			if(jqueryElement.val() == 'undefined' || jqueryElement.val() == null || jqueryElement.val() == '') {
				alert('제목을 입력하세요!');
				jqueryElement.val('').focus();
				return false;
			} else {
				return true;
			}
		},
		officialCheck:function(jqueryElement) {
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
		},
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
	//--upload layer show and file uploading
	$('#upload').click(function() {
		$('.upload_popup_wrap').layerCenter();
		$('.upload_popup_wrap').show();
		var overlay = jQuery('<div id="overlay"> </div>');
		overlay.appendTo(document.body);
	});
	
	$('#uploadClose').click(function() {
		$('.upload_popup_wrap').hide();
		$('#overlay').remove();
		$('#videoFile').val('');                     
		$('#videoTitle').val('');                    
		$('#category').val('');                      
		$('#year option:eq(0)').prop('selected", "selected');                          
		$('#type option:eq(0)').prop('selected', 'selected');          
		$('#region option:eq(0)').prop('selected', 'selected');        
		$('input[name="official"]').each(function() {
			($(this).is(':checked') == true) ? $(this).prop('checked', false) : null;
		});
		$('#info').val('');
	});
	
	$('#pushTheUpload').click(function() {
		var form = null;
		uploadCls.myFile		= $('#videoFile').val();
		uploadCls.title 		= $('#videoTitle').val();
		uploadCls.category 		= $('#category option:selected').val();
		uploadCls.year 			= $('#year option:selected').val();
		uploadCls.type 			= $('#type option:selected').val();
		uploadCls.region 		= $('#region option:selected').val();
		uploadCls.official		= $(':radio[name="official"]:checked').val();
		uploadCls.description	= $('#info').val();
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
		
		$('#customIdValue').val(uploadCls.setCustomId());
		alert('업로드를 시작합니다.');
		$('#uploading').somthingCenter().show();
		form = new FormData(document.getElementById('uploadForm'));
		$.ajax({
			url: "videoFileUpload",
			data: form,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function (response) {
				var data = decodeURIComponent(response);
				$('#uploading').hide();
				alert('업로드: ' + data);
				$('#videoFile').val('');                     
				$('#videoTitle').val('');                    
				$('#category').val('');                      
				$('#year option:eq(0)').prop('selected", "selected');                          
				$('#type option:eq(0)').prop('selected', 'selected');          
				$('#region option:eq(0)').prop('selected', 'selected');        
				$('input[name="official"]').each(function() {
					($(this).is(':checked') == true) ? $(this).prop('checked', false) : null;
				});
				$('#info').val('');
				$('#overlay').remove();
				$('.upload_popup_wrap').hide();
			},
			error: function (jqXHR) {
				$('#uploading').hide();
				alert('업로드 실패!');
				$('#videoFile').val('');                     
				$('#videoTitle').val('');                    
				$('#category').val('');                      
				$('#year option:eq(0)').prop('selected", "selected');                          
				$('#type option:eq(0)').prop('selected', 'selected');          
				$('#region option:eq(0)').prop('selected', 'selected');        
				$('input[name="official"]').each(function() {
					($(this).is(':checked') == true) ? $(this).prop('checked', false) : null;
				});
				$('#info').val('');
			}
		});
		
	});
	//--upload layer show and file uploading end
	
	//--admin enter start
	$('#admin').click(function() {
		var mamCook		= null;
		var formElement = null;
		var hiddenHis	= null;
		mamCook = $.cookies.get('mamsCookie');
		console.log('history', mamCook.myHistory);
		formElement = $('<form></form>').prop({'method':'post','action':'adminUploaders'});
		hiddenHis 	= $('<input>').prop({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
		formElement.append(hiddenHis).appendTo('body').submit();
	});
	//--admin enter end
});
// ################################ Web Programmer surpport End ################################

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

jQuery.fn.downPopCenter = function () {
	this.css("position","absolute");
	this.css("top", Math.max(165, (($(window).height() - $(this).outerHeight()) / 2) + 
			$(window).scrollTop()) + "px");
	this.css("left", Math.max(5, (($(window).width() - $(this).outerWidth()) / 2) + 
			$(window).scrollLeft()) + "px");
	return this;
};

jQuery.fn.somthingCenter = function (){
    this.css("position","fixed");
    this.css("top", ($(window).height() / 2) - (this.outerHeight() / 2));
    this.css("left", ($(window).width() / 2) - (this.outerWidth() / 2));
    return this;
};
//--center position screen end
//################################ DFLUX C&C publishing End ################################
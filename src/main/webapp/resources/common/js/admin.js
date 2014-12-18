
$(function() {
	//################################ DFLUX C&C publishing start ################################
    //search s
    $('#search').focus(function() {
        $(this).css("background-image","none");
    });
    $('#search').blur(function() {
        if ($(this).val()) {
            $(this).css("background-image","none");
        } else {
            $(this).css("background-image","url('./resources/images/admin/input_search.png')");
        }
    });
    //search e

    //header
    //var header_offset = $('#header').offset();
    //var header_width = $('#header').outerWidth();
    //var gnb_offset = $('#gnb').offset();
    //var gnb_width = $('#gnb').outerWidth();
    $(window).resize(function () {
		$('#gnb .menu > div').css({
//			'width': $('#header_wrap').width(),
//			'left': 0
		});
	});
	$('#gnb .menu > div').css({
//		'width': $('#header_wrap').width(),
//		'left': 0
	});
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
        moveSlides: 1,
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
	
	$('.download_btn').click(function(){
        $('.dow_layer').show();
        $('.dow_layer_close').click(function(){
            $('.dow_layer').hide();
        });
    });
	
	//download s
    $('.detail_link .d_link01').click(function() {
        if($(this).hasClass('d_link01_on')==true){
            $(this).removeClass('d_link01_on');
            $('.d_download').hide();
        }else{
            $(this).addClass('d_link01_on');
            $('.d_download').show();
        }
    });
    $('.btn_folding').click(function(){
        $('.d_download').hide();
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
	
	$('.my_movie').set_my_movie();
	//################################ DFLUX C&C publishing end ################################
	
	
	
	//################################ DFLUX C&C developer start ################################
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
	
	// document page 이동
	$('#tabDoc').click(function() {
		var mamCook		= null;
		var formElement = null;
		var hiddenHis	= null;
		mamCook 	= $.cookies.get('mamsCookie');
		formElement = $('<form></form>').prop({'method':'post','action':'adminDoc'});
		hiddenHis 	= $('<input>').prop({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
		formElement.append(hiddenHis).appendTo('body').submit();
	});
	
	// log page 이동
    $('#tabLog').click(function() {
    	var mamCook		= null;
		var formElement = null;
		var hiddenHis	= null;
		mamCook 	= $.cookies.get('mamsCookie');
		formElement = $('<form></form>').prop({'method':'post','action':'adminLog'});
		hiddenHis 	= $('<input>').prop({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
		formElement.append(hiddenHis).appendTo('body').submit();
    });
    
    // uploader page 이동
    $('#tabUplo').click(function() {
    	var mamCook		= null;
		var formElement = null;
		var hiddenHis	= null;
		mamCook 	= $.cookies.get('mamsCookie');
		formElement = $('<form></form>').prop({'method':'post','action':'adminUploaders'});
		hiddenHis 	= $('<input>').prop({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
		formElement.append(hiddenHis).appendTo('body').submit();
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
	
    // tab mouse over
    $('#tabUplo, #tabDoc, #tabLog').mouseenter(function() {
    	$(this).css('cursor', 'pointer');
    });
    
    // tab mouse leave
    $('#tabUplo, #tabDoc, #tabLog').mouseleave(function() {
    	$(this).css('cursor', 'default');
    });
    
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
		uploadCls.myFile		= $('#videoFile').val();
		uploadCls.title 		= $('#videoTitle').val();
		uploadCls.category 		= $('#category option:selected').val();
		uploadCls.year 			= $('#year option:selected').val();
		uploadCls.type 			= $('#type option:selected').val();
		uploadCls.region 		= $('#region option:selected').val();
		uploadCls.official		= $(':radio[name="official"]:checked').val();
		uploadCls.description	= $('#info').val();
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
		$('#customIdValue').val(uploadCls.setCustomId());
		alert('업로드를 시작합니다.');
		form = new FormData(document.getElementById('uploadForm'));
		$.ajax({
			url: "video/fileUpload",
			data: form,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function (response) {
				var data = decodeURIComponent(response);
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
		formElement = $('#searchFrm').prop({'method':'post','action':'search'});
		hiddenHis 	= $('<input>').prop({'type':'hidden','name':'historyList','value':JSON.stringify(mamCook.myHistory)});
		searchString= $('#search').val();
		if(stringRegx.test(searchString)) { 
			alert('특수문자는 허용하지 않습니다.');
			$(this).val('').focus();
			return false;
		}
		formElement.append(hiddenHis).submit();
	});
	//-- search end --
    //################################ DFLUX C&C developer end ################################
});

//################################ DFLUX C&C publishing start ################################
$.fn.set_my_movie = function () {
    var target = $(this);
    var docu_h = $(document).outerHeight(true);
    var util_h = $('.util_navi').outerHeight(true);
    var foot_h = $('.footer_wrap').outerHeight(true);
    //console.log(docu_h, util_h, foot_h);
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
jQuery.fn.layerCenter = function (){
    this.css("position","fixed");
    this.css("top", ($(window).height() / 2) - (this.outerHeight() / 2));
    this.css("left", ($(window).width() / 2) - (this.outerWidth() / 2));
    return this;
};
//--center position screen end
//################################ DFLUX C&C publishing end ################################
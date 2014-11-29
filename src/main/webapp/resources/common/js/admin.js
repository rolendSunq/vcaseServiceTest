
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
    var header_offset = $('#header').offset();
    var header_width = $('#header').outerWidth();
    var gnb_offset = $('#gnb').offset();
    var gnb_width = $('#gnb').outerWidth();
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
    })
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
	
	// document page 이동
	$('#goDoc').click(function() {
		location.replace('/videoBox/adminDoc')
	});
	// log page 이동
    $('#goLogPage').click(function() {
        location.replace('/videoBox/adminLog');
    });
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
//################################ DFLUX C&C publishing end ################################
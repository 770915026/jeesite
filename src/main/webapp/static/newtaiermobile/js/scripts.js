$(function(){
	var mmw = $('.main-menu-wrap')
	var onOff = false;
	$('.login-home-nav').on('click', function(){
		if(onOff) {
			mmw.animate({right:'-=5.4rem'})
		}else{
            mmw.animate({right:'+=5.4rem'}); //菜单块向左移动
        }
        onOff = !onOff;
	})
	$(document).on('click',function(e){
		// var isClickOther = $(this).
		var el = e.target
		if(!onOff) return
		if($(el).hasClass('login-home-nav')) return
		if($(el).closest('.main-menu-wrap').length == 0) {
			if(onOff){
				mmw.animate({right:'-=5.4rem'})
			}else{
				mmw.animate({right:'+=5.4rem'});
			}
			onOff = !onOff;
		}
	})
	mmw.find('ul > li > a').on('click', function(e){
		if($(e.target).siblings('.list02').length > 0){
			$(e.target).siblings('.list02').slideToggle()
		}
	})
})
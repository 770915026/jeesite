$('.qiye_list li a').click(function(){
    $(this).addClass('qiye_xuanzhong');
    $(this).parent().siblings().find('a').removeClass('qiye_xuanzhong');
    $(this).parent().find('ul').show();
    $(this).parent().siblings().find('ul').hide();
    $(this).parent().find('ul').find('ul').hide();
})
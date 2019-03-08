$(function(){
	$('.public-nav dd a').click(function(){
		var tabTitle = $(this).children('.nav').text();

		var url = $(this).attr("rel");
		if(url) {
			document.getElementById("mainFrame").style.height="550px";
            $("#mainFrame").attr("src",url);
            $('.current').removeClass("current");
            $(this).parent().addClass("current");
		}

		addOperateRecords(this);

	})
})
function refreshHeight(){
	var iframe = document.getElementById("mainFrame");
	var h = $(iframe).contents().find("body").height()+30;
    var minheight = $(window).height() - 137 - $("#mainfoot1").outerHeight() - $("#mainfoot2").outerHeight();
    if(h < minheight) {
        height = minheight;
    }
    iframe.style.height=h+"px";

}

function addOperateRecords(obj){
	var menu=$(obj).attr("menu");
	var menuName=$(obj).html().replace(/<[^>]+>/g,"");
	
	$.ajax({
        url: contextPath+"/taier/operateRecords/save",
        type:"post",
        dataType:"json",
        data: {
        	"menu":menu,
        	 "menuName":menuName,
        	 "operateType":"1"
        },
        success: function (data){
            if(data.code==200){
            	
            }
            
        }
	});
}

var hotNewsPage=1;

$(function(){
	getHotNewsList(hotNewsPage);
	getNewsListByType(1,tradeNewsPage);
	getNewsListByType(2,productNewsPage);
	getNewsListByType(3,productNewsPage);
});
function getHotNewsList(hotNewsPage){
	$.ajax({
        url: contextPath+"/taier/news/findNewsPageByConditions",
        type:"post",
        dataType:"json",
        data: {"pageNo":hotNewsPage,
        	   "isHot":"1"
        },
        success: function (data){
        	
            if(data.code==200){
            	var hotNewsListStr="";
            	var newsPage=data.hashMap.newsPage.list;
            	if(data.hashMap.lastPage){
            		$("#getMoreHotNews").attr("onclick","");
            		$("#getMoreHotNews").html("暂无更多数据");
            	}
            	if(newsPage && newsPage.length>0){
            		for(var i=0;i<newsPage.length;i++){
            			
            			hotNewsListStr+='<dl>'+
            								'<a href="javascript:void(0)" onclick="newsDetail(\''+newsPage[i].id+'\')">'+
							    	            '<dt>'+
							                        '<span class="c_dian"></span>'+
							                        newsPage[i].title+
							                    '</dt>'+
							                    '<dd style="padding-bottom: 0px;line-height: 20px;max-height: 40px;padding-top: 0px;">'+
							                    	newsPage[i].contentText+
							                    '</dd>'+
							                    
							                 '</a>'+
							                 '<dd style="padding: 0;padding-bottom: 23px;">'+
							                 	'<span>'+newsPage[i].createDate+'</span>'+
							                 '</dd>'+
						                '</dl>';
            		}
            		$("#hotNewsList").append(hotNewsListStr);
            	}else{
            		$("#getMoreHotNews").attr("disabled",true);
            	}
            }
            
        }
	});
	
}
function getMoreHotNews(){
	hotNewsPage=hotNewsPage+1;
	getHotNewsList(hotNewsPage);
}


function newsDetail(id){
    window.location.href=contextPath+"/taier/jump/gotoNewsDetail?id="+id;
}
	
var hotNewsPage=1;
var tradeNewsPage=1;
var productNewsPage=2;
var reportNewsPage=3;
$(function(){
    parent.window.selectmaintab(1);
	getHotNewsList(hotNewsPage);
	//getNewsListByType(1,tradeNewsPage);
	//getNewsListByType(2,productNewsPage);
	//getNewsListByType(3,productNewsPage);
});
var getNewsListFlag=true;
function getHotNewsList(hotNewsPage){
	if(!getNewsListFlag){
		return false;
	}
	getNewsListFlag=false;
	$.ajax({
        url: contextPath+"/taier/news/findNewsPageByConditions",
        type:"post",
        dataType:"json",
        data: {"pageNo":hotNewsPage,
        	   "isHot":"1",
            "pageSize":5
        },
        success: function (data){
        	getNewsListFlag=true;
            if(data.code==200){
            	var hotNewsListStr="";
            	var newsPage=data.hashMap.newsPage.list;
            	if(data.hashMap.lastPage){
            		$("#getMoreHotNews").attr("onclick","");
            		$("#getMoreHotNews").html("暂无更多数据");
            	}
            	if(newsPage && newsPage.length>0){
            		for(var i=0;i<newsPage.length;i++){
            			hotNewsListStr+='<dd>'+
                           '<a href="javascript:;">'+
                            '<span class="news-img">'+
                           ' <img src="images/news/ico02.jpg">'+
                           ' </span>'+
                           ' <span class="news-text">'+
                           ' <strong class="tit">'+newsPage[i].title+'</strong>'+
                        '<span class="text">'+newsPage[i].contentText+'</span>'+
                        '</span>'+
                        '</a>'+
                        '<b class="date">'+newsPage[i].createDate.substring(0,10)+'</b>'+
                         '   </dd>';
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
var getNewsListByTypeFlag=true;
function getNewsListByType(type,pageNo){
	if(!getNewsListByTypeFlag){
		return false;
	}
	getNewsListByTypeFlag=false;
	$.ajax({
        url: contextPath+"/taier/news/findNewsPageByConditions",
        type:"post",
        dataType:"json",
        data: {"pageNo":pageNo,
        	   "type":type
        },
		async:false,
        success: function (data){
        	getNewsListByTypeFlag=true;
            if(data.code==200){
            	var newsListStr="";
            	var newsPage=data.hashMap.newsPage.list;
            	if(data.hashMap.lastPage){
            		$("#getMoreNewsType"+type).attr("onclick","");
            		$("#getMoreNewsType"+type).html("暂无更多数据");
            	}
            	if(newsPage && newsPage.length>0){
            		for(var i=0;i<newsPage.length;i++){
            			newsListStr+='<dd>'+
                            '<a href="javascript:;">'+
                            '<span class="news-img">'+
                            ' <img src="images/news/ico02.jpg">'+
                            ' </span>'+
                            ' <span class="news-text">'+
                            ' <strong class="tit">'+newsPage[i].title+'</strong>'+
                            '<span class="text">'+newsPage[i].contentText+'</span>'+
                            '</span>'+
                            '</a>'+
                            '<b class="date">'+newsPage[i].createDate.substring(0,10)+'</b>'+
                            '   </dd>';
            		}
            		$("#newsListType"+type).append(newsListStr);
            	}else{
            		/*$("#getMoreHotNews").attr("disabled",true);*/
            	}
            }
            
        }
	});
}
function getMoreNewsByType(type){
	if(type==1){
		tradeNewsPage++;
		getNewsListByType(type,tradeNewsPage);
	}
	if(type==2){
		productNewsPage++;
		getNewsListByType(type,productNewsPage);
	}
	if(type==3){
		reportNewsPage++;
		getNewsListByType(type,reportNewsPage);
		
	}
}
function newsDetail(id){
	window.location.href=contextPath+"/taier/jump/gotoNewsDetail?id="+id;
}
	
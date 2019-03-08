var curPageNo=1;
var pageCount=1;
var count=0;
$(function(){
	//refreshRemaintTime();
	getActivityList(1);
	setInterval('refreshRemaintTime()',1000); 
	getUnderwayActNum();

	$(".hdlml").click(function(){
        $(".hdlml").removeClass("acti");
		$(this).addClass("acti");
	})
    $(".tt").click(function(){
        $(".tt").removeClass("tit_active");
        $(this).addClass("tit_active");
    })
})
function getActivityList(curPageNo,type){
	if(type == null) {
		type = "";
	}
	$.ajax({
        url: contextPath+"/taier/activityFront/getActivityPage",
        type:"post",
        dataType:"json",
        data: {
        	"pageNo":curPageNo,
			"type":type
        },
        success: function (data){

            if(data.code==200){
            	$("#activityList").html("")
            	var activityPage=data.hashMap.activityPage;
            	var activityList=activityPage.list;
            	curPageNo=activityPage.pageNo;
            	pageCount=activityPage.pageCount;
            	count=activityPage.count;
            	if(activityList && activityList.length>0){
            		var activityListStr='';
            		for(var i=0;i<activityList.length;i++){
            			var activity=activityList[i];
            			activityListStr+='<div class="hd_list">'+
						        			'<a href="javascript:void(0)" onclick="activityDeatail(\''+activity.id+'\')">'+
								                '<dl class="shop_xx">'+
								                    '<dt><img src="'+activity.cover +'"></dt>'+
								                    '<dd>'+activity.title +'</dd>'+
								                '</dl>'+

							                	'<p class="jutia">时 间：'+
								                	'<span>'+
								                		activity.starttime+
								                		'至'+
								                		activity.endtime+
								                	'</span>'+
							                	'</p>'+
							                	'<p class="jutia">性 质：<span>'+activity.describe+'</span></p>'+
							                	'<p class="jutia">参 与：<span>'+activity.joinNum +'</span></p>'+
						                	'</a>'+
							                '<p class="last_shop">'+
							                	'<span class="shop_time remaintTime" endTime="'+activity.endtime+'">'+
							                		'<img src="'+ctxStatic+'/taier/images/biao.png">'+
								                	'剩余时间：'+
								                	'<span>3</span>天'+
								                	'<span>3</span> 时'+
								                	'<span>3</span>分'+
								                	'<span>3</span>秒'+
							                	'</span>' +
							                	'<a href="javascript:void(0)" onclick="joinActivity(\''+activity.id+'\')" class="my_bm">'+
							                		'<i class="icon iconfont icon-xiugai"></i> '+
							                		'<span>我要报名</span>'+
							                	'</a>'+
							                '</p>'+
								        '</div>';
            		}

            		$("#activityList").html(activityListStr);


            	}
            	buildPage("page", curPageNo, pageCount, count, "getActivityList", "");
            	window.parent.refreshHeight();
            }

        }
	});
}
function refreshRemaintTime(){
	$(".last_shop .remaintTime").each(function(){
		
		var endTime=new Date($(this).attr("endTime")).getTime()/1000;
		var curDate=new Date().getTime()/1000;
		
		var diffTime=endTime-curDate;
		var second=0;
		var minute=0;
		var hour=0;
		var day=0;
		if(diffTime>0){
			second=parseInt(diffTime%60);
			minute=parseInt(diffTime/60%60);
			hour=parseInt(diffTime/(60*60)%24);
			day=parseInt(diffTime/(60*60*24));
			
		}else{
			$(this).next().removeAttr('onclick');
			$(this).next().find("span").html("活动已结束");
			
		}
		$(this).children("span").eq(0).html(day);
		$(this).children("span").eq(1).html(hour);
		$(this).children("span").eq(2).html(minute);
		$(this).children("span").eq(3).html(second);
		
		
	});

}
var addClickNumFlag=true;
function activityDeatail(id){
	if(!addClickNumFlag){
		return false;
	}
	addClickNumFlag=false;
	$.ajax({
        url:contextPath+"/taier/activityFront/addActClickNum",
        type:"POST",
        data:{"id":id},
        success:function(result){
        	addClickNumFlag=true;
        	window.location.href=contextPath+"/taier/activityFront/gotoLatestActivityDetail?id="+id;
        }
    })
	
}
var saveFlag=true;
function joinActivity(id){
	if(!saveFlag){
		return;
	}
	saveFlag=false;
	
	$.ajax({
        url:contextPath+"/taier/activityJoin/saveActivityJoin",
        type:"POST",
        data:{"activityId":id},
        success:function(result){
        	saveFlag=true
            if(result.code==200){
               alert("参加活动成功！");
               window.location.href=window.location.href;
            }else if(result.code==300){
            	alert("您已参加过该活动");
            }else{
            	window.location.href=contextPath
            }
        }
    })
}

function getUnderwayActNum(){
	$.ajax({
        url:contextPath+"/taier/activityFront/getUnderwayActNum",
        type:"POST",
        success:function(result){
            if(result.code==200){
            	var underwayActNum=result.hashMap.underwayActNum;
            	var joinNumOfPeople=result.hashMap.joinNumOfPeople;
            	
            	var one=underwayActNum%10;
            	var ten=parseInt(underwayActNum/10%10);
            	var hundred=parseInt(underwayActNum/100%10);
            	var thousand=parseInt(underwayActNum/1000%10);
            	var wan=parseInt(underwayActNum/10000%10);
            	var shiwan=parseInt(underwayActNum/100000%10);
            	var baiwan=parseInt(underwayActNum/1000000%10);
            	$("#underwayActNum span").eq(-1).html(one);
            	$("#underwayActNum span").eq(-2).html(ten);
            	$("#underwayActNum span").eq(-3).html(hundred);
            	$("#underwayActNum span").eq(-4).html(thousand);
            	$("#underwayActNum span").eq(-5).html(wan);
            	$("#underwayActNum span").eq(-6).html(shiwan);
            	$("#underwayActNum span").eq(-7).html(baiwan);
            	
            	var one=joinNumOfPeople%10;
            	var ten=parseInt(joinNumOfPeople/10%10);
            	var hundred=parseInt(joinNumOfPeople/100%10);
            	var thousand=parseInt(joinNumOfPeople/1000%10);
            	var wan=parseInt(joinNumOfPeople/10000%10);
            	var shiwan=parseInt(joinNumOfPeople/100000%10);
            	var baiwan=parseInt(joinNumOfPeople/1000000%10);
            	$("#joinNumOfPeople span").eq(-1).html(one);
            	$("#joinNumOfPeople span").eq(-2).html(ten);
            	$("#joinNumOfPeople span").eq(-3).html(hundred);
            	$("#joinNumOfPeople span").eq(-4).html(thousand);
            	$("#joinNumOfPeople span").eq(-5).html(wan);
            	$("#joinNumOfPeople span").eq(-6).html(shiwan);
            	$("#joinNumOfPeople span").eq(-7).html(baiwan);
            	
            }else{
            	
            }
        }
    })
}
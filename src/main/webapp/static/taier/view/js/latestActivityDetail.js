var getCommentsFlag=true;
$(function(){
	//refreshRemaintTime();
	setInterval('refreshRemaintTime()',1000); 
	getUnderwayActNum();
	getCommentsList();
})
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
function activityDeatail(id){
	window.location.href=contextPath+"/taier/activityFront/gotoLatestActivityDetail?id="+id;
}
var saveFlag=true;
function joinActivity(id){
	if(!saveFlag){
		return;
	}
	saveFlag=false;
	
	$.ajax({
        url:ctxOne+"/taier/activityJoin/saveActivityJoin",
        type:"POST",
        data:{"activityId":id},
        success:function(result){
        	saveFlag=true
            if(result.code==200){
               alert("参加活动成功！");
               window.location.href= window.location.href;
            }else if(result.code==300){
            	alert("您已参加过该活动");
            }else{
            	parent.location.href=contextPath
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
            	
            	
            	
            }else{
            	
            }
        }
    })
}

var saveLikeFlag=true;
function saveLike(id){
	if(!saveLikeFlag){
		return;
	}
	saveLikeFlag=false;
	
	$.ajax({
        url:contextPath+"/taier/like/saveLike",
        type:"POST",
        data:{"activityId":id},
        success:function(result){
        	saveLikeFlag=true
            if(result.code==200){
               alert("点赞成功！");
               window.location.href=window.location.href;
            }else if(result.code==300){
            	alert("您已点过赞");
            }else{
            	parent.location.href=contextPath
            }
        }
    })
}

var saveCollectFlag=true;
function saveCollect(id){
	if(!saveCollectFlag){
		return;
	}
	saveCollectFlag=false;
	
	$.ajax({
        url:ctx+"/taier/collect/saveCollect",
        type:"POST",
        data:{"activity.id":id},
        success:function(result){
        	saveCollectFlag=true
            if(result.code==200){
               alert("收藏成功！");
               window.location.href=window.location.href;
            }else if(result.code==300){
            	alert("您已收藏");
            }else{
            	parent.location.href=contextPath
            }
        }
    })
}
var saveCommentsFlag=true;
function saveComments(id){
	if(!saveCommentsFlag){
		return;
	}
	var content=$("#content").val().trim();
	if(content == null || content==''){
		alert("请填写评论内容");
		return;
	}
	
	saveCommentsFlag=false;
	$.ajax({
        url:contextPath+"/taier/comments/saveComments",
        type:"POST",
        data:{"activityId":id,"content":content,"parentid":"0"},
        success:function(result){
        	saveCommentsFlag=true
            if(result.code==200){
               alert("评论成功！");
               window.location.href=window.location.href;
            }else{
            	parent.location.href=contextPath;
            }
        }
    })
	
}
var pageNo=1;

function getCommentsList(){
	getCommentsFlag=false;
	$.ajax({
        url:contextPath+"/taier/comments/getActCommentsList",
        type:"POST",
        data:{"activityId":id,"pageNo":pageNo,"pageSize":5},
        success:function(result){
        	getCommentsFlag=true;
            if(result.code==200){
            	if(result.hashMap.lastPage){
            		$("#getMoreComments").attr("onclick","");
            		$("#getMoreComments").html("暂无更多数据");
            	}
               var commentsPage=result.hashMap.commentsPage.list;
               var commentsStr="";
               if(commentsPage!=null &&  commentsPage.length>0){
            	   for(var i=0;i<commentsPage.length;i++){
            		   var user=commentsPage[i].user;
                	   commentsStr+='<dl class="pl_list_small">'+
				    	                '<dd class="pl_name2">'
				       	                	+user.name+
				    	                	'<span>'+commentsPage[i].createDate+
				    	                	'</span>'+
				    	                	'<a href="javascript:void(0)" class="return_pl"  onclick="reply(this)">回复</a>'+
				    	                '</dd>'+
				    	                '<dd class="pl_name2">'+commentsPage[i].content+
				    	                '</dd>';
                	   var childrenCommentsList=commentsPage[i].childrenCommentsList;
                	   var childrenCommentsStr='';
                	   if(childrenCommentsList && childrenCommentsList.length>0){
                		   childrenCommentsStr+='<div class="ej_pl">';
                    	   for(var j=0;j<childrenCommentsList.length;j++){
                    		   var childrenUser=childrenCommentsList[j].user;
                    		   childrenCommentsStr+='<dl>'+
								                        '<dd class="pl_name2">'+
								                        	childrenUser.name+
								                        	'<span>'+childrenCommentsList[j].createDate+'</span>'+
                    		   							'</dd>'+
								                        '<dd class="pl_name2">'+
								                        	childrenCommentsList[j].content+
                    		   							'</dd>'+
								                    '</dl>';
                    	   }
                    	   childrenCommentsStr+='</div>';
                	   }
                	   commentsStr+=childrenCommentsStr;
                	   commentsStr+='<dd class="add_pl12">'+
                	   					'<textarea type="text" placeholder="回复："></textarea>'+
                	   					'<span onclick="subReply(\''+user.id+'\',\''+commentsPage[i].id+'\',this)">回复</span>'+
                	   				'</dd>'+
                	   			'</dl>'	;
                	   
                	   
                   }
            	   $("#commentList").append(commentsStr);
            	   window.parent.refreshHeight();
               }else{
            	   
               }
               
            }else{
            	
            }
        }
    })
}

function getMoreComments(){
	//防止重复提交
	if(getCommentsFlag){
		pageNo++;
		getCommentsList();
	}
	
}
function reply(obj){
    if($(obj).parent().parent().find('.add_pl12').css('display')=='none'){
        
        $(obj).parent().parent().siblings().find('.add_pl12').hide();
        $(obj).parent().parent().find('.add_pl12').show();
    } else{
        $(obj).parent().parent().find('.add_pl12').hide();
    }
}

var replyFlag=true;
function subReply(toUserId,commentId,obj){
	if(!replyFlag){
		return false;
	}
	var content=$(obj).prev().val();
	if(content == null || content==''){
		alert("请填写评论内容");
		return;
	}
	
	replyFlag=false;
	$.ajax({
        url:contextPath+"/taier/comments/saveComments",
        type:"POST",
        data:{"activityId":id,"content":content,"parentid":commentId,"toUserId":toUserId},
        success:function(result){
        	replyFlag=true
            if(result.code==200){
               alert("评论成功！");
               window.location.href=window.location.href;
            }else{
            	parent.location.href=contextPath;
            }
        }
    })
}
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/include/taglibmobile.jsp"%>
<%@ include file="/WEB-INF/views/mobile/taier/include.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1 maximum-scale=2, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-title" content="Add to Home">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="x-rim-auto-match" content="none">
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/newtaiermobile/css/index.css">
<style type="text/css">
h2, .h2 {
	font-size: 100%;
}
</style>

</head>
<body>
	<section>
		<!--菜单弹层-->

		<!--菜单弹层 end-->
		<!--HEADER-->
		<div class="header-wrap-bar">
			<div class="taier-logo"></div>
			<div class="taier-login-box">
				<c:if test="${fns:getUser().name eq null}">
					<span class="login-btn"
						onclick="window.location.href='${ctx}/logout'"></span>
				</c:if>
				<c:if test="${fns:getUser().name ne null}">
					<span class="login-btn" onclick="showuserinfo(this)"
						style="background-image: none; float: left; line-height: 1.08rem;">${fns:getUser().name}</span>
				</c:if>
				<span class="login-home-nav"></span>
			</div>
		</div>
		<!--HEADER END-->
		<!--主内容-->
		<div class="taier-say-container zcdiv">
			<!--有奖活动-->
			<div class="say-award-box  pb30 clearfix">
				<!--切换按钮-->
				<div class="certificate-nav">
					<a class="list tt tt1" href="javascript:;"
						onclick="getActivityList(1,1)">现场活动</a> <a class="list tt tt2"
						href="javascript:;" onclick="getActivityList(1,2)">在线活动</a> <a
						class="list tt tt0 current" href="javascript:;"
						onclick="getActivityList(1,0)">全&nbsp;&nbsp;部</a>
				</div>
				<!--切换按钮 end-->
				<!--全部-->
				<ul class="say-list-box" id="activityList">

				</ul>
				<!--全部 end-->
			</div>
			<!--有奖活动 end-->

		</div>
		<!--主内容 end-->
		<!--FOOTER-->
		<div class="footer-wrap">
			<ul class="footer-nav-box clearfix">
				<li><a href="${contextPath}/taier/jump/gotoFirstPage">首页</a></li>
				<li><a href="${contextPath}/taier/jump/gotoTaierauth">泰尔证书</a>
				</li>
				<li><a href="${contextPath}/taier/jump/unionInfoListUSer">信息发布</a>
				</li>
				<li><a href="${contextPath}/taier/jump/preSetAppListUSer">预置应用公示</a>
				</li>
				<li><a
					href="${contextPath}/taier/analysisReportFront/gotoAnalysisReport">行业分析报告</a>
				</li>
				<li class="liList"><span> <a
						href="${contextPath}/taier/activityFront/gotoActivity">小泰说</a>
				</span> <span> <a href="${contextPath}/taier/policyFront/gotoPolicy">政策</a>
				</span> <span> <a href="${contextPath}/taier/jump/gotoAboutUs">关于我们</a>
				</span> <span> <a href="${contextPath}/taier/jump/gotoConnectUs">联系我们</a>
				</span></li>
			</ul>
			<ul class="friend-box clearfix">
				<h3 class="friend-tit">友情链接</h3>
				<li id="linksli"></li>
			</ul>
			<p class="record-text">ICP备案号：京ICP备09013372号-25</p>
		</div>
		<!--FOOTER END-->
	</section>
</body>
<script type="text/javascript">
	var contextPath="${contextPath}"
    var ctxOne="${ctxOne}";
    var user_id='${user.id}';
    var ctxStatic="${ctxStatic}";
    $(function(){
    })
</script>
<script>
    var curPageNo=1;
    var pageCount=1;
    var count=0;
    $(function(){
        //refreshRemaintTime();
        getActivityList(1,0);
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
    var ttype=0;
    function getActivityList(curPageNo,type){
        $(".tt").removeClass("current");
        $(".tt"+type).addClass("current");
        ttype=type;
        getActivityList1(curPageNo);
    }
    function getActivityList1(curPageNo){
        if(ttype == 0) {
            ttype = "";
        }
        $.ajax({
            url: contextPath+"/taier/activityFront/getActivityPage",
            type:"post",
            dataType:"json",
            data: {
                "pageSize":6,
                "pageNo":curPageNo,
                "type":ttype
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
                            activityListStr+='<li>'+
                        '       <a href="javascript:;">'+
                        '       <img class="img" src="'+activity.cover+'" onclick="activityDeatail(\''+activity.id+'\')">'+
                        '       <div class="say-text">'+
                        '       <strong class="tit">'+activity.title+'</strong>'+
                        '   <span class="text01">'+activity.starttime.substring(0,10)+'至'+activity.endtime.substring(0,10)+'</span>'+
                        '   <span class="text01 text02">'+activity.address+'</span>'+
                        '       <div class="said-time">'+
                        '       <span class="time-tit">剩余时间：</span>'+
                        '  <div class="time-box"   endTime="'+activity.endtime+'">'+
                        '      <span><em>53</em>天</span>'+
                        '   <span><em>10</em>时</span>'+
                        '   <span><em>8</em>分</span>'+
                        '   <span><em>53</em>秒</span>'+
                        '   </div>'+
                        '   </div>'+
                        '   <a class="signUpBtn" href="javascript:;" onclick="joinActivity(\''+activity.id+'\')">立即报名</a>'+
                        '       </div>'+
                        '       </a>'+
                        '      </li>';
                        }

                        $("#activityList").html(activityListStr);


                    }
                    buildPage("pagenumber", curPageNo, pageCount, count, "getActivityList1", "");
                }

            }
        });
    }
    function refreshRemaintTime(){
        $(".time-box").each(function(){

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
//                $(this).next().removeAttr('onclick');
//                $(this).next().find("span").html("活动已结束");

            }
            $(this).find("em").eq(0).html(day);
            $(this).find("em").eq(1).html(hour);
            $(this).find("em").eq(2).html(minute);
            $(this).find("em").eq(3).html(second);


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

</script>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
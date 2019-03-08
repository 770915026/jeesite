<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="toTop" content="true">
<%@ include file="/WEB-INF/views/taier/include.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/newtaier/css/taierSaid.css">
<style type="text/css">
h2, .h2 {
	font-size: 100%;
}
</style>
<style>
.ywbla {
	background-color: #7d7d7d;
}

.ywbla:hover {
	background-color: #4285ff;
}
</style>

</head>
<body>
	<div class="container" style="padding-left: 0px; padding-right: 0px;">
		<!--右侧滚动导航-->
		<div class="taier-tips">
			<dl>
				<dd class="list">
					<a href="javascript:;">在线业务</a>
				</dd>
				<dd>
					<a href="${ctx}/taier/theNet/gotoCCC">CCC<br />业务
					</a>
				</dd>
				<dd>
					<a href="${ctx}/taier/theNet/gotoTheNet">进网<br />业务
					</a>
				</dd>
				<dd>
					<a href="javascript:;">国内<br />委托
					</a>
				</dd>
				<dd>
					<a href="javascript:;">网站<br />业务
					</a>
				</dd>
				<dd>
					<a href="javascript:;" class="ketan">客服<br />中心
					</a>
				</dd>
			</dl>
		</div>
		<!--右侧滚动导航 end-->
		<!--头部-->
		<div class="header-box">
			<!--LOGO-->
			<div class="taier-logo fl">
				<img src="${ctxStatic}/newtaier/images/logo.jpg">
			</div>
			<!--LOGO END-->
			<!--TAB导航-->
			<dl class="public-nav">
				<dd>
					<a href="${contextPath}/taier/jump/gotoFirstPage" menu="1">首页</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/jump/gotoNews" menu="2">新闻动态</a>
				</dd>
				<dd id="businessBar">
					<a href="javascript:void(0);" menu="3">业务办理</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/jump/gotoFirstPage#tezs" menu="30">泰尔证书</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/jump/unionInfoListUSer" menu="4">信息发布</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/jump/preSetAppListUSer" menu="5">应用公示</a>
				</dd>
				<dd>
					<a
						href="${contextPath}/taier/analysisReportFront/gotoAnalysisReport"
						menu="6">行业分析报告</a>
				</dd>
				<dd class="current">
					<a href="${contextPath}/taier/activityFront/gotoActivity" menu="7">小泰说</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/policyFront/gotoPolicy" menu="8">政策</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/jump/gotoAboutUs" menu="9">关于我们</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/jump/gotoFirstPage#contactUs"
						menu="10">联系我们</a>
				</dd>
			</dl>
			<div class="public-nav public-nav02" id="businessIntro"
				style="display: none;">
				<span class="business-tit">业务办理</span>
				<div class="business-list">
					<a href="${ctx}/taier/theNet/gotoCCC" class="ywbla"><img
						src="${ctxStatic}/newtaier/images/index-bg07.jpg" /></a> <a
						href="${ctx}/taier/theNet/gotoTheNet" class="ywbla"><img
						src="${ctxStatic}/newtaier/images/index-bg08.jpg" /></a> <a
						href="javascript:;" class="ywbla"><img
						src="${ctxStatic}/newtaier/images/index-bg09.jpg" /></a> <a
						href="javascript:;" class="ywbla"><img
						src="${ctxStatic}/newtaier/images/index-bg10.jpg" /></a>
				</div>
			</div>
			<!--业务办理 end-->
			<script type="text/javascript">
            voteIco({
                "voteIco":"businessBar",//点击元素Id
                "voteContent":"businessIntro"//展现内容Id
            });
        </script>
			<!--TAB导航 END-->
			<!--SEARCH-->
			<div class="form-box fr">
				<span class="search-input"> <input class="input" type=""
					name="" id="searchkey"> <em class="search-btn"
					onclick="search()">搜索按钮</em>
				</span>


				<c:if test="${fns:getUser().name eq null}">
					<a class="input-btn" href="${ctx}/logout">登录</a>
					<a class="input-btn" href="${contextPath}/taier/jump/register1">注册</a>
				</c:if>
				<c:if test="${fns:getUser().name ne null}">
					<a class="input-btn" href="javascript:void(0);"
						onclick="showuserinfo(this)">${fns:getUser().name}</a>
					<a class="input-btn" href="javascript:void(0);"
						onclick="framelogout()">退出登陆</a>
				</c:if>
			</div>
			<!--SEARCH END-->
		</div>
		<div class="taier-said-banner"></div>
		<div class="taier-said-wrap">

			<div class="taier-container">
				<!--有奖活动-->
				<div class="taier-award clearfix">
					<!--标题-->
					<div class="taier-said-box taier-award-box">
						<span class="title">有奖活动</span>
						<div class="taier-said-nav taierList-said-nav">
							<span class="tt tt1"><a href="javascript:;"
								onclick="getActivityList(1,1)">在线活动</a></span> <span class="tt tt2"><a
								href="javascript:;" onclick="getActivityList(1,2)">现场活动</a></span> <span
								class="tt tt0 current"><a href="javascript:;"
								onclick="getActivityList(1,0)">全部</a></span>
						</div>
					</div>
					<!--标题 end-->
					<div class="taier-award-wrap">
						<!--列表-->
						<div id="activityList"></div>


						<!--列表 end-->
						<!--翻页-->
						<div class="page-main" id="pagenumber"></div>
						<!--翻页 end-->
					</div>

				</div>
				<!--有奖活动 end-->
			</div>


		</div>

		<div class="footer-wrap" id="contactUs">
			<div class="footer-outer">
				<!--联系方式-->
				<div class="footer-container lines">
					<div class="enterprise-intro">
						<div class="maps fl">
							<div id=container style="height: 100%; width: 100%;"></div>
						</div>
						<div class="contact-us fr">
							<h3 class="title">联系我们</h3>
							<p class="text">
								公司地址: <span id="address"></span><br />联系电话：<span id="phone"></span><br />泰尔邮箱：<span
									id="email"></span>
							</p>
							<h3 class="title mt26">关注泰尔视角</h3>
							<p class="follow-us">
								<img id="qrwximg"
									src="${ctxStatic}/newtaier/images/taier-ico02.png"> <img
									id="qrwbimg" src="${ctxStatic}/newtaier/images/taier-ico03.png">
							</p>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<!--联系方式 end-->
				<!--在线留言-->
				<div class="footer-container">
					<div class="online-message">
						<h3 class="title">在线留言</h3>
						<div class="form-box">
							<span class="input-box"> <input class="input"
								style="width: 209px;" id="lyname" type="text" placeholder="姓名">
								<input class="input" style="width: 209px;" id="lyphone"
								type="tel" placeholder="电话"> <input class="input"
								style="width: 209px;" id="lyemail" type="email" placeholder="邮箱">
							</span>
							<div class="textarea-box">
								<span class="textarea-div" style="text-align: left;"> <textarea
										class="textarea" placeholder="" id="lycontent"
										style="width: 100%;"></textarea>
								</span>
							</div>
							<div style="margin-top: 15px; text-align: center;">
								<a class="input-btn" href="javascript:void(0);" id="lyBtn">留言</a>
							</div>

						</div>
					</div>
				</div>
				<!--在线留言 end-->
			</div>
			<!--友情链接-->
			<div class="footer-container">
				<div class="oem-wrap">
					<div class="oem-outer lines">
						<h3 class="title">友情链接</h3>
						<div class="oem-link">
							<c:forEach items="${linkList }" var="link">
								<a href="${link.linkUrl }" target="_blank">${link.title }&nbsp;&nbsp;|</a>
							</c:forEach>
						</div>
					</div>
					<div class="record-number">ICP备案号：京ICP备09013372号-25</div>
				</div>

			</div>
			<!--友情链接 end-->
		</div>
		<script src="${ctxStatic}/taier/js/swiper1.js"></script>
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
                            activityListStr+='<div class="taier-award-list">'+
                         '      <div class="award-list">'+
                         '      <span class="award-img">'+
                         '      <img src="'+activity.cover+'"  style="cursor: pointer;" onclick="activityDeatail(\''+activity.id+'\')"/>'+
                         '      </span>'+
                         '      <span class="award-text">'+
                         '      <strong class="text01">'+activity.title+'</strong>'+
                         '  <span class="text02">'+activity.starttime.substring(0,10)+'至'+activity.endtime.substring(0,10)+'</span>'+
                         '  <span class="text03">'+activity.address+'</span>'+
                         '      </span>'+
                         '      </div>'+
                         '      <div class="award-right">'+
                         '      <a class="award-btn" href="javascript:;" onclick="joinActivity(\''+activity.id+'\')">立即报名</a>'+
                         '      <div class="said-time">'+
                         '      <span class="time-tit" >剩余时间：</span>'+
                         ' <div class="time-box"  endTime="'+activity.endtime+'">'+
                         '     <span><em>53</em>天</span>'+
                         '  <span><em>10</em>时</span>'+
                         '  <span><em>8</em>分</span>'+
                         '  <span><em>53</em>秒</span>'+
                         '  </div>'+
                         '  </div>'+
                         '  </div>'+
                         ' </div>';
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
</html>
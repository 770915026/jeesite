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
<style>
.newtitle {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box !important;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
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
		<div class="taier-news-container">
			<div class="news-banner">
				<p class="news-banner-text">
					<strong>动态新闻</strong> <em>泰尔视角聚焦业内热点话题</em>
				</p>
			</div>
			<!--切换导航-->
			<div class="taier-news-nav">
				<a class="list lista current" href="javascript:;"
					onclick="getNewsListByType(1,0)">热点新闻</a> <a class="list lista"
					href="javascript:;" onclick="getNewsListByType(1,1)">行业动态</a> <a
					class="list lista" href="javascript:;"
					onclick="getNewsListByType(1,2)">产品动态</a> <a class="list lista"
					href="javascript:;" onclick="getNewsListByType(1,3)">泰尔快报</a>
			</div>
			<!--切换导航 end-->
			<!--热点新闻-->
			<div class="taier-news-tab clearfix" style="display: block;">
				<ul id="hotNewsList">

				</ul>
			</div>
			<!--热点新闻 end-->
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

	<script type="text/javascript">
	var contextPath="${contextPath}"
    $('.new_listright h1 span').click(function() {
        $('.new_listright h1 span').removeClass('r_active');
        $(this).addClass('r_active');
        $('.r_con').eq($(this).index()).show().siblings().hide();
    });

	$(function(){
	    $(".lista").click(function(){
            $(".lista").removeClass("current");
            $(this).addClass("current");
        })

        getNewsListByType(1,0);
    })


</script>
	<script>
    function getNewsListByType(pageNo,type){
        var data = {};
        data.pageNo = pageNo;
        data.pageSize = 5;
        if(type == 0) {
            data.isHot = "1";
        } else {
            data.type = type;
        }
        $.ajax({
            url: contextPath+"/taier/news/findNewsPageByConditions",
            type:"post",
            dataType:"json",
            data: data,
            success: function (data){
                $("#hotNewsList").html("");
                if(data.code==200){
                    var hotNewsListStr="";
                    var newsPage=data.hashMap.newsPage.list;
                    var page=data.hashMap.newsPage;
                    if(data.hashMap.lastPage){
                    }
                    if(newsPage && newsPage.length>0){
                        for(var i=0;i<newsPage.length;i++){
                            var img = newsPage[i].img;
                            if(!img) {
                                img="${ctxStatic}/newtaier/images/news/ico03.jpg";
                            }
                            hotNewsListStr+='<li>'+
                             '   <a href="javascript:;" onclick="newsDetail(\''+newsPage[i].id+'\')">'+
                            '    <img src="'+img+'">'+
                            '    <strong class="newtitle">'+newsPage[i].title+'</strong>'+
                            ' <p>'+newsPage[i].contentText+'</p>'+
                            ' </a>'+
                            ' </li>';
                        }
                        $("#hotNewsList").append(hotNewsListStr);
                    }else{
                    }
                    buildPage("pagenumber", page.pageNo, page.pageCount, page.count, "getNewsListByType", type);

                }

            }
        });

    }

    function newsDetail(id){
        window.location.href=contextPath+"/taier/jump/gotoNewsDetail?id="+id;
    }
</script>
</body>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
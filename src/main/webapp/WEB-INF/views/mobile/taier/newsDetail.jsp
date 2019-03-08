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
<meta name="keywords" content="${news.keyWord }">
<link rel="stylesheet" href="${ctxStatic}/taier/css/style.css">
<script type="text/javascript"
	src="${ctxStatic}/taier/view/js/newsDetail.js?version=<%=Math.random()%>"></script>
<style>
.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

#hotNewsList dl a dd {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	display: -moz-box;
	-moz-line-clamp: 2;
	-moz-box-orient: vertical;
}
</style>
</head>
<body>
	<!--右侧滚动导航-->
	<div class="container" style="padding-left: 0px; padding-right: 0px;">
		<!--右侧滚动导航-->

		<!--右侧滚动导航 end-->
		<!--头部-->
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
		<div class="w1200 zcdiv zcdiv">
			<div class="new_box">
				<div class="new_left">
					<h1 class="new_title">${news.title }<br>
						<br> <small>${news.author }<span><fmt:formatDate
									value="${news.createDate}" type="both" dateStyle="full"
									pattern="yyyy-MM-dd hh:HH:mm" /> </span></small>
					</h1>
					<div class="new_cont">
						${news.content } <input
							style="margin-left: 50%; margin-top: 40px;" id="btnCancel"
							class="btn" type="button" value="返 回" onclick="history.go(-1)" />
						<div class="come_where">
							*文章为作者独立观点，不代表泰尔视角立场 <span>本文由${news.author } 授权 泰尔视角
								发表，并经泰尔视角编辑。转载此文章须经作者同意，并请附上出处（泰尔视角）及本页链接。原文链接${news.originalLink }</span>
						</div>
					</div>
				</div>
				<div class="new_right">
					<h2 class="new_rtitle">热门新闻</h2>
					<div id="hotNewsList"></div>

					<div class="liulan_more">
						<a id="getMoreHotNews" href="javascript:void(0)"
							style="padding: 0" onclick="getMoreHotNews()" class="c_more">浏览更多</a>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
	var contextPath="${contextPath}"
</script>

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
	</div>

</body>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
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
<link rel="stylesheet" href="${ctxStatic}/taier/css/style.css">
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
</style>
</head>
<body>
	<div class="container" style="padding-left: 0px; padding-right: 0px;">
		<!--右侧滚动导航-->
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
		<!--右侧滚动导航 end-->
		<!--头部-->


		<div class="tc_table w1200 zcdiv"
			style="margin-top: 30px; position: relative;">
			<h1 class="know_title">${tlApppreset.productName}(${tlApppreset.phoneVersion})</h1>
			<p class="know_time">
				<fmt:formatDate value="${tlApppreset.createDate}"
					pattern="yyyy-MM-dd" />
			</p>
			<input style="position: absolute; right: 0px; top: 0px;"
				id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" />
			<table class="show_table table table-bordered table-striped">
				<tr>
					<td>序号</td>
					<td>app名称</td>
					<td>开发者</td>
					<td>访问权限</td>
					<td>功能描述</td>
				</tr>
				<c:forEach items="${applist}" var="app" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td style="word-wrap: break-word;">${app.name}</td>
						<td>${app.developer}</td>
						<td>${app.visitAuth}</td>
						<td>${app.description}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
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
	</div>
</body>
<script>
    $(function(){
        if(window.parent.refreshHeight){
            window.parent.refreshHeight();
        }
    })
</script>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
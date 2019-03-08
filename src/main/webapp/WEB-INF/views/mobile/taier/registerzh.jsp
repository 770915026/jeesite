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

	<!--头部end-->
	<section class="register_box">
		<div class="w1200 register1200">
			<h1 class="register_title jue_register">
				欢迎注册泰尔视角<small>已有泰尔视角账号？<a href="javascript:void(0);"
					onclick="framelogout()">快速登录 ></a></small>
			</h1>
			<form class="register_form" id="df"
				action="${contextPath}/taier/jump/register3">
				<div class="role_box">
					<span> <img src="${ctxStatic}/taier/images/reg2.png">
						<input type="radio" class="paper" name="userType" value="3"
						checked>包含进网业务在内的业务办理
					</span> <span> <img src="${ctxStatic}/taier/images/reg3.png">
						<input type="radio" class="paper" name="userType" value="4">不包含进网业务在内的业务办理
					</span>
				</div>
				<div style="display: inline-block; width: 100%;">
					<a href="javascript:void(0);" onclick="javascript:history.back();"
						class="registerbtn"
						style="display: block; text-align: center; float: left;">上一步</a> <a
						href="javascript:void(0);" onclick="$('#df').submit();"
						class="registerbtn"
						style="float: right; display: block; text-align: center;">下一步</a>
				</div>
			</form>
		</div>
	</section>
	<div class="footer-wrap">
		<ul class="footer-nav-box clearfix">
			<li><a href="${contextPath}/taier/jump/gotoFirstPage">首页</a></li>
			<li><a href="${contextPath}/taier/jump/gotoTaierauth">泰尔证书</a></li>
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

</body>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
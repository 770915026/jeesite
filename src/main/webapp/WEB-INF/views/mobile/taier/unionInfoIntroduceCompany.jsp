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

ul {
	margin-right: 0px;
	margin-left: 0px;
}
</style>
</head>
<body>
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

	<!--中间部分-->
	<section class="qiye_cont w1200">
		<div class="qiye_left">
			<div class="qiye_lefttop">
				<span class="date_qiye"><img
					src="${ctxStatic}/taier/images/qiye_img1.png">2018-07-10到期</span> <span
					class="shenfen"><img
					src="${ctxStatic}/taier/images/qiye_img2.png" class="qiye_avator"><span
					class="dengji">v3</span></span> <span class="qiye_name">${fns:getUser().name}的账户</span>
			</div>
			<ul class="qiye_list">
			</ul>
		</div>
		<div class="qiye_right operation_box">
			<h3>
				<i class="icon iconfont icon-arrfill_u-copy"></i>业务流程和说明
			</h3>
			<div class="operation">
				<h5 class="operation_title">业务流程和说明</h5>
				<div class="operation_cont">
					--点击新办，可增加信息表。<br>
					--点击保存，保存已填好的信息表。保存后的信息表会自动生成以“任务号+产品名称+型号+信息发布表”为命名的列表，在下一个栏目“状
					态查询及修改”内可以点击看到完整信息，并可进行在线修改。
					--点击提交，将保存好的信息表提交到内部管理员。同时弹出缴费提示信息，预览发布。内部管理员收到提示有待审核业务信息。
				</div>
			</div>
			<h1 class="operation_title1">新申请任务的发布流程</h1>
			<div class="operation_shu">
				<img src="${ctxStatic}/taier/images/shu.png">
			</div>
			<h1 class="operation_title1">已发布的任务的修改流程</h1>
			<div class="operation_shu">
				<img src="${ctxStatic}/taier/images/shu2.png">
			</div>
		</div>
	</section>

	<script>
    $(function(){
        addmenu();
        $("#lfywlist").show();
        $("#lflist1").show();
        $("#lm6").addClass("qiye_xuanzhong");
    })
</script>
</body>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
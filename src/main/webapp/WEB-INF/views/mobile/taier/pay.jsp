<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/include/taglibmobile.jsp"%>
<%@ include file="/WEB-INF/views/mobile/taier/taglibmobile.jsp"%>
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
		<div class="qiye_right qiye_right1">
			<h3>
				<i class="icon iconfont icon-arrfill_u-copy"></i>企业联合信息发布
			</h3>
			<p class="jiaofei_title">
				线下缴费<small>注：收到缴费信息后1~2个工作日内完成审核发布</small>
			</p>
			<div class="pay_div pay_div1">
				<div class="pay_leftinfo">
					<p>开户银行： ${tlPaymentInfo.bank}</p>
					<p>银行账户： ${tlPaymentInfo.banknum}</p>
					<p>税号信息： ${tlPaymentInfo.dutynum}</p>
					<p>备注：${tlPaymentInfo.remark}</p>
				</div>
			</div>

		</div>
	</section>
	<script>
    $(function(){
        addmenu();
        $("#lfywlist1").show();

        $("#lm21").addClass("qiye_xuanzhong");
        $('input[type=radio][name=pay]').change(function() {
             if (this.value == '1') {
                     $("#ewm").attr("src","${tlPaymentInfo.aliurl}");
                 }
             else if (this.value == '2') {
                    $("#ewm").attr("src","${tlPaymentInfo.weixinurl}");
                 }
             else if (this.value == '3') {
                    $("#ewm").attr("src","${tlPaymentInfo.baiduurl}");
             }
        });
    })
</script>
</body>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
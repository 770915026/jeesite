<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/taier/include.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="toTop" content="true">
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


</body>
</html>
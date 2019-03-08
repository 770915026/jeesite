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
	<!--中间部分-->
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
		<div class="qiye_right">
			<h3>
				<i class="icon iconfont icon-arrfill_u-copy"></i>厂家基本信息表
			</h3>
			<form action="${ctx}/taier/tlCompanyInfo/save" method="post">
				<input type="hidden" name="id" value="${tlCompanyInfo.id}">
				<table class="qiye_table table table-bordered">
					<tr>
						<td>申请企业名称中文<sup>*</sup></td>
						<td><input type="text" name="name"
							value="${tlCompanyInfo.name}"></td>
					</tr>
					<tr>
						<td>申请企业名称英文</td>
						<td><input type="text" name="nameEn"
							value="${tlCompanyInfo.nameEn}"></td>
					</tr>
					<tr>
						<td>地址<sup>*</sup></td>
						<td><input type="text" name="address"
							value="${tlCompanyInfo.address}"></td>
					</tr>
					<tr>
						<td>邮政编码<sup>*</sup></td>
						<td><input type="text" name="zipCode"
							value="${tlCompanyInfo.zipCode}"></td>
					</tr>
					<tr>
						<td>联系人姓名<sup>*</sup></td>
						<td><input type="text" name="linkmanName"
							value="${tlCompanyInfo.linkmanName}"></td>
					</tr>
					<tr>
						<td>联系人电话<sup>*</sup></td>
						<td><input type="text" name="phone"
							value="${tlCompanyInfo.phone}"></td>
					</tr>
					<tr>
						<td>邮箱<sup>*</sup></td>
						<td><input type="text" name="email"
							value="${tlCompanyInfo.email}"></td>
					</tr>
					<tr>
						<td>厂家<sup>*</sup></td>
						<td><input type="text" name="factoryName"
							value="${tlCompanyInfo.factoryName}"></td>
						<%-- <td>
                        <form:select path="tlCompanyInfo.tlFactory.id" style="width: 66%; height: 34px; line-height: 34px; border: 1px solid #E6E6E6; border-radius: 5px; padding-left: 10px;">
                            <form:options items="${list}" itemLabel="name" itemValue="id" htmlEscape="false"/>
                        </form:select>
                    </td> --%>
					</tr>
				</table>
				<p class="table_btn">
					<button type="submit" class="save">保存</button>
					<button type="button" onclick="back()">返回</button>
				</p>
			</form>
		</div>
	</section>

	<script>
    function back(){
        window.location.href='${ctx}/taier/tlCompanyInfo/view';
    }
    $(function(){
        addmenu();
        $("#lm1").addClass("qiye_xuanzhong");
        if(window.parent.refreshHeight){
            window.parent.refreshHeight();
        }
    })
</script>
</body>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
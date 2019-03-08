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
		<div class="qiye_right">
			<h3>
				<i class="icon iconfont icon-arrfill_u-copy"></i>厂家基本信息表
			</h3>
			<p class="upda_qiye">
				<span style="cursor: pointer;" onclick="modify()"> <i
					class="icon iconfont icon-xiugai"></i> 修改
				</span> <span style="cursor: pointer;" onclick="submit()"> <i
					class="icon iconfont icon-tijiao1"></i> 提交
				</span>
			</p>
			<table class="qiye_table table table-bordered">
				<tr>
					<td>申请企业名称中文<sup>*</sup></td>
					<td>${tlCompanyInfo.name}</td>
				</tr>
				<tr>
					<td>申请企业名称英文</td>
					<td>${tlCompanyInfo.nameEn}</td>
				</tr>
				<tr>
					<td>地址<sup>*</sup></td>
					<td>${tlCompanyInfo.address}</td>
				</tr>
				<tr>
					<td>邮政编码<sup>*</sup></td>
					<td>${tlCompanyInfo.zipCode}</td>
				</tr>
				<tr>
					<td>联系人姓名<sup>*</sup></td>
					<td>${tlCompanyInfo.linkmanName}</td>
				</tr>
				<tr>
					<td>联系人电话<sup>*</sup></td>
					<td>${tlCompanyInfo.phone}</td>
				</tr>
				<tr>
					<td>邮箱<sup>*</sup></td>
					<td>${tlCompanyInfo.email}</td>
				</tr>
				<tr>
					<td>厂家<sup>*</sup></td>
					<td>${tlCompanyInfo.factoryName}</td>
				</tr>
			</table>
		</div>
	</section>
	<script>
    function submit(){
        alert("提交成功！");
    }

    function modify(){
        window.location.href='${ctx}/taier/tlCompanyInfo/form?id=${tlCompanyInfo.id}';
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
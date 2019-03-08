<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglibmobile.jsp"%>
<html>
<head>
<title>协议管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
<style>
.input-xxlarge {
	display: none !important;
}
</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/taier/tlSysAgreement/">协议列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/tlSysAgreement/form?id=${tlSysAgreement.id}">协议<shiro:hasPermission
					name="taier:tlSysAgreement:edit">${not empty tlSysAgreement.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="taier:tlSysAgreement:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="tlSysAgreement"
		action="${ctx}/taier/tlSysAgreement/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">泰尔视角服务协议：</label>
			<div class="controls">
				<form:textarea path="serviceAgreement" htmlEscape="false" rows="4"
					class="input-xxlarge " />
				<sys:ckeditor replace="serviceAgreement"
					uploadPath="/cms/serviceAgreement" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">泰尔视角服务条款(注册)：</label>
			<div class="controls">
				<form:textarea path="serviceAgreement1" htmlEscape="false" rows="4"
					class="input-xxlarge " />
				<sys:ckeditor replace="serviceAgreement1"
					uploadPath="/cms/serviceAgreement" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">法律声明和隐私政策条款(注册)：</label>
			<div class="controls">
				<form:textarea path="serviceAgreement2" htmlEscape="false" rows="4"
					class="input-xxlarge " />
				<sys:ckeditor replace="serviceAgreement2"
					uploadPath="/cms/serviceAgreement" />
			</div>
		</div>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit"
				value="保 存" />&nbsp; <input id="btnCancel" class="btn" type="button"
				value="返 回" onclick="history.go(-1)" />
		</div>
	</form:form>
</body>
</html>
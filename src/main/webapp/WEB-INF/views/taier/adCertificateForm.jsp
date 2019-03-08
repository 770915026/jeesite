<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>广告证书管理</title>
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
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/taier/adCertificate/">广告证书列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/adCertificate/form?id=${adCertificate.id}">广告证书<shiro:hasPermission
					name="taier:adCertificate:edit">${not empty adCertificate.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="taier:adCertificate:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="adCertificate"
		action="${ctx}/taier/adCertificate/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">图片：</label>
			<div class="controls">
				<form:hidden id="imgUrl" path="imgUrl" htmlEscape="false"
					maxlength="200" class="input-xlarge" />
				<sys:ckfinder input="imgUrl" type="files"
					uploadPath="/taier/tlAdcertificate" selectMultiple="true" />
				<span class="help-inline"><font color="red">*</font>
					(请上传小于10M的图片)</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">按钮文字：</label>
			<div class="controls">
				<form:input path="buttonName" htmlEscape="false" maxlength="100"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">按钮链接：</label>
			<div class="controls">
				<form:input path="buttonHref" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
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
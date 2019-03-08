<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>泰尔证书管理</title>
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
		<li><a href="${ctx}/taier/certificate/">泰尔证书列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/certificate/form?id=${certificate.id}">泰尔证书<shiro:hasPermission
					name="taier:certificate:edit">${not empty certificate.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="taier:certificate:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="certificate"
		action="${ctx}/taier/certificate/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<%-- <div class="control-group">
			<label class="control-label">证书标题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="200" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">证书名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="100"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">证书图片：</label>
			<div class="controls">
				<form:hidden id="img" path="img" htmlEscape="false" maxlength="200"
					class="input-xlarge" />
				<sys:ckfinder input="img" type="files"
					uploadPath="/taier/certificateImg" selectMultiple="true" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">内容：</label>
			<div class="controls">
				<form:textarea id="content" htmlEscape="false" path="content"
					rows="4" maxlength="200" class="input-xxlarge" hidden="hidden" />
				<sys:ckeditor replace="content" uploadPath="/test/test" />
				<%-- <form:textarea path="content" htmlEscape="false" rows="4" class="input-xxlarge required"/> --%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">序号：</label>
			<div class="controls">
				<form:input path="orderNo" htmlEscape="false" maxlength="10"
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
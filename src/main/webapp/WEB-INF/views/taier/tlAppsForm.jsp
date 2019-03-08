<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>app管理</title>
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
		<li><a href="${ctx}/taier/tlApps/">app列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/tlApps/form?id=${tlApps.id}">app<shiro:hasPermission
					name="taier:tlApps:edit">${not empty tlApps.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="taier:tlApps:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="tlApps"
		action="${ctx}/taier/tlApps/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">app名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="200"
					class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">开发者：</label>
			<div class="controls">
				<form:input path="developer" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">访问权限：</label>
			<div class="controls">
				<form:input path="visitAuth" htmlEscape="false" maxlength="500"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">功能描述：</label>
			<div class="controls">
				<form:input path="description" htmlEscape="false" maxlength="500"
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
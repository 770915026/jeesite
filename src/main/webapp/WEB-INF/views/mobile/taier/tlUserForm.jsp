<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglibmobile.jsp"%>
<html>
<head>
<title>账户管理</title>
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
		<li><a href="${ctx}/taier/user/list/">账户列表</a></li>
		<li class="active"><a href="${ctx}/taier/user/form?id=${user.id}">账户${not empty user.id?'修改':'添加'}</a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="user"
		action="${ctx}/taier/user/save" method="post" class="form-horizontal">
		<form:hidden path="id" />
		<form:hidden path="password" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">用户名：</label>
			<div class="controls">
				<input id="oldLoginName" name="oldLoginName" type="hidden"
					value="${user.loginName}">
				<form:input path="name" htmlEscape="false" maxlength="100"
					class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">密码：</label>
			<div class="controls">
				<form:input path="newPassword" htmlEscape="false" maxlength="100"
					class="input-xlarge" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">手机号：</label>
			<div class="controls">
				<form:input path="phone" htmlEscape="false" maxlength="100"
					class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">用户类型：</label>
			<div class="controls">
				<form:select path="userType" class="input-xlarge required">
					<form:options items="${fns:getDictList('sys_user_type')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">用户角色:</label>
			<div class="controls">
				<form:checkboxes path="roleIdList" items="${allRoles}"
					itemLabel="name" itemValue="id" htmlEscape="false" class="required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>

		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit"
				value="保 存" />
			<c:if test="${user.id ne null}">
				<input id="btnfbqx" class="btn btn-primary" type="submit"
					value="添加发布权限" />
			</c:if>
			<input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" />

		</div>
	</form:form>
</body>
</html>
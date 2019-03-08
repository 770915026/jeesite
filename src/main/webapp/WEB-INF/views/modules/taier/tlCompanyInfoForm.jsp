<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>厂家基本信息管理</title>
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
		<li><a href="${ctx}/taier/tlCompanyInfo/">厂家基本信息列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/tlCompanyInfo/form?id=${tlCompanyInfo.id}">厂家基本信息<shiro:hasPermission
					name="taier:tlCompanyInfo:edit">${not empty tlCompanyInfo.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="taier:tlCompanyInfo:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="tlCompanyInfo"
		action="${ctx}/taier/tlCompanyInfo/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">企业名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="100"
					class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">企业英文名称：</label>
			<div class="controls">
				<form:input path="nameEn" htmlEscape="false" maxlength="100"
					class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">地址：</label>
			<div class="controls">
				<form:input path="address" htmlEscape="false" maxlength="100"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系人电话：</label>
			<div class="controls">
				<form:input path="phone" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮箱：</label>
			<div class="controls">
				<form:input path="email" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系人姓名：</label>
			<div class="controls">
				<form:input path="linkmanName" htmlEscape="false" maxlength="100"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">用户id：</label>
			<div class="controls">
				<sys:treeselect id="user" name="user.id"
					value="${tlCompanyInfo.user.id}" labelName="user.name"
					labelValue="${tlCompanyInfo.user.name}" title="用户"
					url="/sys/office/treeData?type=3" cssClass="required"
					allowClear="true" notAllowSelectParent="true" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮编：</label>
			<div class="controls">
				<form:input path="zipCode" htmlEscape="false" maxlength="64"
					class="input-xlarge " />
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="taier:tlCompanyInfo:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit"
					value="保 存" />&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" />
		</div>
	</form:form>
</body>
</html>
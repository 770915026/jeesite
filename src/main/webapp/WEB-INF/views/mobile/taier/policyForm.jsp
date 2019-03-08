<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglibmobile.jsp"%>
<html>
<head>
<title>政策管理</title>
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
		<li><a href="${ctx}/taier/policy/">政策列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/policy/form?id=${policy.id}">政策<shiro:hasPermission
					name="sys:policy:edit">${not empty policy.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="sys:policy:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="policy"
		action="${ctx}/taier/policy/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">政策名称：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="200"
					class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">关键字：</label>
			<div class="controls">
				<form:input path="keyWord" htmlEscape="false" maxlength="200"
					class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>

		</div>
		<div class="control-group">
			<label class="control-label">类型：</label>
			<div class="controls">
				<form:select path="type" class="input-xlarge ">
					<form:option value="1" label="政策文件" />
					<form:option value="2" label="政策法规" />
					<%-- <form:option value="3" label="行政法规"/>
					<form:option value="4" label="部门规章"/> --%>
					<%-- <form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/> --%>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">内容：</label>
			<div class="controls">
				<form:textarea id="content" htmlEscape="false" path="content"
					rows="4" maxlength="200" class="input-xxlarge" />
				<sys:ckeditor replace="content" uploadPath="/test/test" />
				<%-- <form:textarea path="content" htmlEscape="false" rows="4" class="input-xxlarge required"/> --%>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">来源：</label>
			<div class="controls">
				<form:input path="source" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
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
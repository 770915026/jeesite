<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglibmobile.jsp"%>
<html>
<head>
<title>手机预置应用公示管理</title>
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
		<li><a href="${ctx}/taier/tlApppreset/">手机预置应用公示列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/tlApppreset/form?id=${tlApppreset.id}">手机预置应用公示<shiro:hasPermission
					name="taier:tlApppreset:edit">${not empty tlApppreset.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="taier:tlApppreset:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="tlApppreset"
		action="${ctx}/taier/tlApppreset/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">联合信息：</label>
			<div class="controls">
				<form:input path="unionId" htmlEscape="false" maxlength="64"
					class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">手机大版本号：</label>
			<div class="controls">
				<form:input path="phoneVersion" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">版本日期：</label>
			<div class="controls">
				<form:input path="versionDate" htmlEscape="false" maxlength="64"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">预置应用卸载方法：</label>
			<div class="controls">
				<form:input path="uninstallType" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">图标：</label>
			<div class="controls">
				<form:hidden id="img" path="img" htmlEscape="false" maxlength="200"
					class="input-xlarge" />
				<sys:ckfinder input="img" type="files"
					uploadPath="/taier/tlApppreset" selectMultiple="true" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">应用id：</label>
			<div class="controls">
				<form:input path="apps" htmlEscape="false" maxlength="500"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">审核标志0-已保存1-待发布2-已发布：</label>
			<div class="controls">
				<form:select path="flag" class="input-xlarge ">
					<form:option value="" label="" />
					<form:options items="${fns:getDictList('')}" itemLabel="label"
						itemValue="value" htmlEscape="false" />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">可修改：</label>
			<div class="controls">
				<form:input path="modifiable" htmlEscape="false" maxlength="1"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">热门：</label>
			<div class="controls">
				<form:input path="hotflag" htmlEscape="false" maxlength="1"
					class="input-xlarge " />
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="taier:tlApppreset:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit"
					value="保 存" />&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" />
		</div>
	</form:form>
</body>
</html>
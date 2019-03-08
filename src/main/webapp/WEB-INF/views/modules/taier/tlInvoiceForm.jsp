<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>发票管理</title>
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
		<li><a href="${ctx}/taier/tlInvoice/">发票列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/tlInvoice/form?id=${tlInvoice.id}">发票<shiro:hasPermission
					name="taier:tlInvoice:edit">${not empty tlInvoice.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="taier:tlInvoice:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="tlInvoice"
		action="${ctx}/taier/tlInvoice/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">厂家信息id：</label>
			<div class="controls">
				<form:input path="companyId" htmlEscape="false" maxlength="64"
					class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">发票类型：0-不开发票；1-纸质发票；2-电子发票：</label>
			<div class="controls">
				<form:input path="type" htmlEscape="false" maxlength="4"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">名称：</label>
			<div class="controls">
				<form:input path="invoiceName" htmlEscape="false" maxlength="100"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">税号：</label>
			<div class="controls">
				<form:input path="taxNumber" htmlEscape="false" maxlength="100"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">纸质发票接收方式：0-自取；1-邮寄：</label>
			<div class="controls">
				<form:input path="receiveType" htmlEscape="false" maxlength="4"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮寄地址：</label>
			<div class="controls">
				<form:input path="receiveAddress" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">收票人电话：</label>
			<div class="controls">
				<form:input path="receivePhone" htmlEscape="false" maxlength="20"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">收票人邮箱：</label>
			<div class="controls">
				<form:input path="receiveEmail" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">企业或个人0-企业；1-个人：</label>
			<div class="controls">
				<form:input path="type2" htmlEscape="false" maxlength="4"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">完成标志0-申请；1-开票：</label>
			<div class="controls">
				<form:input path="flag" htmlEscape="false" maxlength="1"
					class="input-xlarge " />
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="taier:tlInvoice:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit"
					value="保 存" />&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" />
		</div>
	</form:form>
</body>
</html>
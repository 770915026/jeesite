<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>缴费信息管理</title>
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
		<li><a href="${ctx}/taier/tlPaymentInfo/">缴费信息列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/tlPaymentInfo/form?id=${tlPaymentInfo.id}">缴费信息<shiro:hasPermission
					name="taier:tlPaymentInfo:edit">${not empty tlPaymentInfo.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="taier:tlPaymentInfo:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="tlPaymentInfo"
		action="${ctx}/taier/tlPaymentInfo/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">金额：</label>
			<div class="controls">
				<form:input path="amount" htmlEscape="false"
					class="input-xlarge  number" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">支付宝二维码url：</label>
			<div class="controls">
				<form:hidden id="aliurl" path="aliurl" htmlEscape="false"
					maxlength="200" class="input-xlarge" />
				<sys:ckfinder input="aliurl" type="files"
					uploadPath="/taier/tlPaymentInfo" selectMultiple="true" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">微信二维码url：</label>
			<div class="controls">
				<form:hidden id="weixinurl" path="weixinurl" htmlEscape="false"
					maxlength="200" class="input-xlarge" />
				<sys:ckfinder input="weixinurl" type="files"
					uploadPath="/taier/tlPaymentInfo" selectMultiple="true" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">百度钱包二维码url：</label>
			<div class="controls">
				<form:hidden id="baiduurl" path="baiduurl" htmlEscape="false"
					maxlength="200" class="input-xlarge" />
				<sys:ckfinder input="baiduurl" type="files"
					uploadPath="/taier/tlPaymentInfo" selectMultiple="true" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">开户行：</label>
			<div class="controls">
				<form:input path="bank" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">银行账号：</label>
			<div class="controls">
				<form:input path="banknum" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">税号：</label>
			<div class="controls">
				<form:input path="dutynum" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:input path="remark" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="taier:tlPaymentInfo:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit"
					value="保 存" />&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" />
		</div>
	</form:form>
</body>
</html>
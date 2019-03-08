<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>二维码管理</title>
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
		<li><a href="${ctx}/taier/tlQrcode/">二维码列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/tlQrcode/form?id=${tlQrcode.id}">二维码${not empty tlQrcode.id?'修改':'添加'}</a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="tlQrcode"
		action="${ctx}/taier/tlQrcode/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">微信公众号二维码：</label>
			<div class="controls">
				<form:hidden id="weixinurl" path="weixinurl" htmlEscape="false"
					maxlength="200" class="input-xlarge" />
				<sys:ckfinder input="weixinurl" type="files"
					uploadPath="/taier/tlQrcode" selectMultiple="true" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">微博二维码：</label>
			<div class="controls">
				<form:hidden id="weibourl" path="weibourl" htmlEscape="false"
					maxlength="200" class="input-xlarge" />
				<sys:ckfinder input="weibourl" type="files"
					uploadPath="/taier/tlQrcode" selectMultiple="true" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">登录页二维码：</label>
			<div class="controls">
				<form:hidden id="loginurl" path="loginurl" htmlEscape="false"
					maxlength="200" class="input-xlarge" />
				<sys:ckfinder input="loginurl" type="files"
					uploadPath="/taier/tlQrcode" selectMultiple="true" />
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
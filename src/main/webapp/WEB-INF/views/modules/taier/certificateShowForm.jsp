<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>证书展示管理</title>
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
		<li><a href="${ctx}/taier/certificateShow/">证书展示列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/certificateShow/form?id=${certificateShow.id}">证书展示<shiro:hasPermission
					name="taier:certificateShow:edit">${not empty certificateShow.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="taier:certificateShow:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="certificateShow"
		action="${ctx}/taier/certificateShow/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">证书名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="100"
					class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">证书图片：</label>
			<div class="controls">
				<form:hidden id="img" path="img" htmlEscape="false" maxlength="200"
					class="input-xlarge" />
				<sys:ckfinder input="img" type="files"
					uploadPath="/taier/certificateShowImg" selectMultiple="true" />
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
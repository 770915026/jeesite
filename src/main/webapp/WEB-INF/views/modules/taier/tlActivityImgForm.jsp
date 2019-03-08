<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>图片管理</title>
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
		<li><a href="${ctx}/taier/tlActivityImg/">图片列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/tlActivityImg/form?id=${tlActivityImg.id}">图片${not empty tlActivityImg.id?'修改':'添加'}</a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="tlActivityImg"
		action="${ctx}/taier/tlActivityImg/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">图片：</label>
			<div class="controls">
				<form:hidden id="imgUrl" path="imgUrl" htmlEscape="false"
					maxlength="200" class="input-xlarge" />
				<sys:ckfinder input="imgUrl" type="files"
					uploadPath="/taier/tlActivityImg" selectMultiple="true" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">序号：</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" maxlength="18"
					class="input-xlarge  digits" />
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
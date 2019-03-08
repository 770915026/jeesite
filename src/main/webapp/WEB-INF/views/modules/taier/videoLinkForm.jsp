<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>视频链接管理</title>
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
		<li><a href="${ctx}/taier/videoLink/">视频链接列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/videoLink/form?id=${videoLink.id}">视频链接<shiro:hasPermission
					name="taier:videoLink:edit">${not empty videoLink.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="taier:videoLink:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="videoLink"
		action="${ctx}/taier/videoLink/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">链接标题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">封面图片：</label>
			<div class="controls">
				<form:hidden id="faceImg" path="faceImg" htmlEscape="false"
					maxlength="200" class="input-xlarge" />
				<sys:ckfinder input="faceImg" type="files"
					uploadPath="/taier/videoImg" selectMultiple="true" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">视频链接路径：</label>
			<div class="controls">
				<form:input path="linkUrl" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">排序：</label>
			<div class="controls">
				<form:input path="sortNum" htmlEscape="false" maxlength="18"
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
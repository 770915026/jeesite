<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglibmobile.jsp"%>
<html>
<head>
<title>新闻管理</title>
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
		<li><a href="${ctx}/taier/news/">新闻列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/news/trashForm?id=${news.id}">新闻<shiro:hasPermission
					name="sys:news:edit">${not empty news.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="sys:news:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="news"
		action="${ctx}/taier/news/saveTrash" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">新闻标题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="200"
					class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">作者：</label>
			<div class="controls">
				<form:input path="author" htmlEscape="false" maxlength="100"
					class="input-xlarge " />
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
			<label class="control-label">原文链接：</label>
			<div class="controls">
				<form:input path="originalLink" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
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
			<label class="control-label">新闻类型：</label>
			<div class="controls">
				<form:select path="type" class="input-medium">
					<form:options items="${fns:getDictList('news_type')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
				<%-- <form:input path="type" htmlEscape="false" maxlength="4" class="input-xlarge required"/> --%>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否热门：</label>
			<div class="controls">
				<form:select path="isHot" class="input-medium">
					<form:options items="${fns:getDictList('yes_no')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
				<%-- <form:input path="isHot" htmlEscape="false" maxlength="4" class="input-xlarge "/> --%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否发布到首页：</label>
			<div class="controls">
				<form:select path="isToFirstPage" class="input-medium">
					<form:options items="${fns:getDictList('yes_no')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
				<%-- <form:input path="isHot" htmlEscape="false" maxlength="4" class="input-xlarge "/> --%>
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
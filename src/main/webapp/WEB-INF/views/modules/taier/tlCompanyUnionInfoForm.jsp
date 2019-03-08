<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>企业联合信息管理</title>
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
		<li><a href="${ctx}/taier/tlCompanyUnionInfo/">企业联合信息列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/tlCompanyUnionInfo/form?id=${tlCompanyUnionInfo.id}">企业联合信息<shiro:hasPermission
					name="taier:tlCompanyUnionInfo:edit">${not empty tlCompanyUnionInfo.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="taier:tlCompanyUnionInfo:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="tlCompanyUnionInfo"
		action="${ctx}/taier/tlCompanyUnionInfo/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">表名：</label>
			<div class="controls">
				<form:input path="tableName" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">产品名称：</label>
			<div class="controls">
				<form:input path="productName" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">产品型号：</label>
			<div class="controls">
				<form:input path="productVersion" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">产品照片：</label>
			<div class="controls">
				<form:input path="productImgs" htmlEscape="false" maxlength="500"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">配置信息类型0-图文 1-纯文字：</label>
			<div class="controls">
				<form:input path="configureType" htmlEscape="false" maxlength="64"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">配置信息图标：</label>
			<div class="controls">
				<form:input path="configureImg" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">配置信息标题：</label>
			<div class="controls">
				<form:input path="configureTitle" htmlEscape="false" maxlength="500"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">配置信息描述：</label>
			<div class="controls">
				<form:input path="configureContent" htmlEscape="false"
					maxlength="1500" class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">国内认证图片：</label>
			<div class="controls">
				<form:input path="auth1Img" htmlEscape="false" maxlength="1500"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">国内认证内容：</label>
			<div class="controls">
				<form:input path="auth1Content" htmlEscape="false" maxlength="1500"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">国际认证图片：</label>
			<div class="controls">
				<form:input path="auth2Img" htmlEscape="false" maxlength="1500"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">国际认证内容：</label>
			<div class="controls">
				<form:input path="auth2Content" htmlEscape="false" maxlength="1500"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">泰尔认证图片：</label>
			<div class="controls">
				<form:input path="auth3Img" htmlEscape="false" maxlength="1500"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">泰尔认证内容：</label>
			<div class="controls">
				<form:input path="auth3Content" htmlEscape="false" maxlength="1500"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">发布人id：</label>
			<div class="controls">
				<sys:treeselect id="user" name="user.id"
					value="${tlCompanyUnionInfo.user.id}" labelName="user.name"
					labelValue="${tlCompanyUnionInfo.user.name}" title="用户"
					url="/sys/office/treeData?type=3" cssClass="" allowClear="true"
					notAllowSelectParent="true" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">审核标志0-已保存1-待发布2-已发布：</label>
			<div class="controls">
				<form:input path="flag" htmlEscape="false" maxlength="64"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否可修改0-不可 1-可修改：</label>
			<div class="controls">
				<form:input path="modifiable" htmlEscape="false" maxlength="1"
					class="input-xlarge " />
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="taier:tlCompanyUnionInfo:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit"
					value="保 存" />&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" />
		</div>
	</form:form>
</body>
</html>
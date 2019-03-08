<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglibmobile.jsp"%>
<html>
<head>
<title>广告证书管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/taier/adCertificate/">广告证书列表</a></li>
		<li><a href="${ctx}/taier/adCertificate/form">广告证书添加</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="adCertificate"
		action="${ctx}/taier/adCertificate/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>标题：</label> <form:input path="title"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary"
				type="submit" value="查询" /></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>标题</th>
				<th>按钮文字</th>
				<th>按钮链接</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="adCertificate">
				<tr>
					<td><a
						href="${ctx}/taier/adCertificate/form?id=${adCertificate.id}">
							${adCertificate.title} </a></td>
					<td>${adCertificate.buttonName}</td>
					<td>${adCertificate.buttonHref}</td>
					<td><a
						href="${ctx}/taier/adCertificate/form?id=${adCertificate.id}">修改</a>
						<a href="${ctx}/taier/adCertificate/delete?id=${adCertificate.id}"
						onclick="return confirmx('确认要删除该广告证书吗？', this.href)">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
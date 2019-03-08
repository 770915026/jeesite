<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>泰尔证书管理</title>
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
		<li class="active"><a href="${ctx}/taier/certificate/">泰尔证书列表</a></li>
		<li><a href="${ctx}/taier/certificate/form">泰尔证书添加</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="certificate"
		action="${ctx}/taier/certificate/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>证书名称：</label> <form:input path="name"
					htmlEscape="false" maxlength="100" class="input-medium" /></li>
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
				<th>证书名称</th>
				<th>序号</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="certificate">
				<tr>
					<td><a
						href="${ctx}/taier/certificate/form?id=${certificate.id}">
							${certificate.name} </a></td>
					<td>${certificate.orderNo}</td>
					<td><fmt:formatDate value="${certificate.createDate}"
							type="both" dateStyle="full" pattern="yyyy-MM-dd hh:HH:mm" /></td>
					<td><a
						href="${ctx}/taier/certificate/form?id=${certificate.id}">修改</a> <a
						href="${ctx}/taier/certificate/delete?id=${certificate.id}"
						onclick="return confirmx('确认要删除该泰尔证书吗？', this.href)">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
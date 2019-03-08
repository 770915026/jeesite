<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>企业联合信息管理</title>
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
		<li class="active"><a href="${ctx}/taier/tlCompanyUnionInfo/">企业联合信息列表</a></li>
		<shiro:hasPermission name="taier:tlCompanyUnionInfo:edit">
			<li><a href="${ctx}/taier/tlCompanyUnionInfo/form">企业联合信息添加</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tlCompanyUnionInfo"
		action="${ctx}/taier/tlCompanyUnionInfo/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>表名：</label> <form:input path="tableName"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li><label>产品名称：</label> <form:input path="productName"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li><label>产品型号：</label> <form:input path="productVersion"
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
				<th>表名</th>
				<th>产品名称</th>
				<th>产品型号</th>
				<th>update_date</th>
				<shiro:hasPermission name="taier:tlCompanyUnionInfo:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="tlCompanyUnionInfo">
				<tr>
					<td><a
						href="${ctx}/taier/tlCompanyUnionInfo/form?id=${tlCompanyUnionInfo.id}">
							${tlCompanyUnionInfo.tableName} </a></td>
					<td>${tlCompanyUnionInfo.productName}</td>
					<td>${tlCompanyUnionInfo.productVersion}</td>
					<td><fmt:formatDate value="${tlCompanyUnionInfo.updateDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<shiro:hasPermission name="taier:tlCompanyUnionInfo:edit">
						<td><a
							href="${ctx}/taier/tlCompanyUnionInfo/form?id=${tlCompanyUnionInfo.id}">修改</a>
							<a
							href="${ctx}/taier/tlCompanyUnionInfo/delete?id=${tlCompanyUnionInfo.id}"
							onclick="return confirmx('确认要删除该企业联合信息吗？', this.href)">删除</a></td>
					</shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>发票管理</title>
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
		<li class="active"><a href="${ctx}/taier/tlInvoice/">发票列表</a></li>
		<shiro:hasPermission name="taier:tlInvoice:edit">
			<li><a href="${ctx}/taier/tlInvoice/form">发票添加</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tlInvoice"
		action="${ctx}/taier/tlInvoice/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
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
				<th>厂家信息id</th>
				<th>update_date</th>
				<shiro:hasPermission name="taier:tlInvoice:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="tlInvoice">
				<tr>
					<td><a href="${ctx}/taier/tlInvoice/form?id=${tlInvoice.id}">
							${tlInvoice.companyId} </a></td>
					<td><fmt:formatDate value="${tlInvoice.updateDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<shiro:hasPermission name="taier:tlInvoice:edit">
						<td><a href="${ctx}/taier/tlInvoice/form?id=${tlInvoice.id}">修改</a>
							<a href="${ctx}/taier/tlInvoice/delete?id=${tlInvoice.id}"
							onclick="return confirmx('确认要删除该发票吗？', this.href)">删除</a></td>
					</shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
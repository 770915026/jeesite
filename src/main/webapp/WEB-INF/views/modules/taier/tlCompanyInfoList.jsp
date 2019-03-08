<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>厂家基本信息管理</title>
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
		<li class="active"><a href="${ctx}/taier/tlCompanyInfo/">厂家基本信息列表</a></li>
		<shiro:hasPermission name="taier:tlCompanyInfo:edit">
			<li><a href="${ctx}/taier/tlCompanyInfo/form">厂家基本信息添加</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tlCompanyInfo"
		action="${ctx}/taier/tlCompanyInfo/" method="post"
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
				<th>update_date</th>
				<th>企业名称</th>
				<shiro:hasPermission name="taier:tlCompanyInfo:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="tlCompanyInfo">
				<tr>
					<td><a
						href="${ctx}/taier/tlCompanyInfo/form?id=${tlCompanyInfo.id}">
							<fmt:formatDate value="${tlCompanyInfo.updateDate}"
								pattern="yyyy-MM-dd HH:mm:ss" />
					</a></td>
					<td>${tlCompanyInfo.name}</td>
					<shiro:hasPermission name="taier:tlCompanyInfo:edit">
						<td><a
							href="${ctx}/taier/tlCompanyInfo/form?id=${tlCompanyInfo.id}">修改</a>
							<a
							href="${ctx}/taier/tlCompanyInfo/delete?id=${tlCompanyInfo.id}"
							onclick="return confirmx('确认要删除该厂家基本信息吗？', this.href)">删除</a></td>
					</shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglibmobile.jsp"%>
<html>
<head>
<title>留言管理</title>
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
		<li class="active"><a href="${ctx}/taier/leaveWord/">留言列表</a></li>
		<shiro:hasPermission name="taier:leaveWord:edit">
			<li><a href="${ctx}/taier/leaveWord/form">留言添加</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="leaveWord"
		action="${ctx}/taier/leaveWord/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>姓名：</label> <form:input path="name"
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
				<th>姓名</th>
				<th>电话</th>
				<th>留言时间</th>
				<shiro:hasPermission name="taier:leaveWord:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="leaveWord">
				<tr>
					<td><a href="${ctx}/taier/leaveWord/form?id=${leaveWord.id}">
							${leaveWord.name} </a></td>
					<td>${leaveWord.phone}</td>
					<td><fmt:formatDate value="${leaveWord.createDate}"
							type="both" dateStyle="full" pattern="yyyy-MM-dd hh:HH:mm" /></td>
					<shiro:hasPermission name="taier:leaveWord:edit">
						<td><a href="${ctx}/taier/leaveWord/form?id=${leaveWord.id}">修改</a>
							<a href="${ctx}/taier/leaveWord/delete?id=${leaveWord.id}"
							onclick="return confirmx('确认要删除该留言吗？', this.href)">删除</a></td>
					</shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>友情链接管理</title>
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
		<li class="active"><a href="${ctx}/taier/tlLink/">友情链接列表</a></li>
		<li><a href="${ctx}/taier/tlLink/form">友情链接添加</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="tlLink"
		action="${ctx}/taier/tlLink/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>链接标题：</label> <form:input path="title"
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
				<th>链接</th>
				<th>创建时间</th>
				<th>序号</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="tlLink">
				<tr>
					<td>${tlLink.title}</td>
					<td>${tlLink.linkUrl}</td>
					<td><fmt:formatDate value="${tlLink.createDate}" type="both"
							dateStyle="full" pattern="yyyy-MM-dd hh:HH:mm" /></td>
					<td>${tlLink.sortNum}</td>
					<td><a href="${ctx}/taier/tlLink/form?id=${tlLink.id}">修改</a>
						<a href="${ctx}/taier/tlLink/delete?id=${tlLink.id}"
						onclick="return confirmx('确认要删除该友情链接吗？', this.href)">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
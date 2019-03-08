<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>图片管理</title>
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
		<li class="active"><a href="${ctx}/taier/tlActivityImg/">图片列表</a></li>
		<li><a href="${ctx}/taier/tlActivityImg/form">图片添加</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="tlActivityImg"
		action="${ctx}/taier/tlActivityImg/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
	</form:form>
	<sys:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>图片</th>
				<th>序号</th>
				<shiro:hasPermission name="taier:tlActivityImg:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="tlActivityImg">
				<tr>
					<td><a
						href="${ctx}/taier/tlActivityImg/form?id=${tlActivityImg.id}">
							<img src="${tlActivityImg.imgUrl}" style="height: 100px;" />
					</a></td>
					<td>${tlActivityImg.sort}</td>
					<td><a
						href="${ctx}/taier/tlActivityImg/form?id=${tlActivityImg.id}">修改</a>
						<a href="${ctx}/taier/tlActivityImg/delete?id=${tlActivityImg.id}"
						onclick="return confirmx('确认要删除该图片吗？', this.href)">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
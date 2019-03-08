<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>证书展示管理</title>
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
		<li class="active"><a href="${ctx}/taier/certificateShow/">证书展示列表</a></li>
		<li><a href="${ctx}/taier/certificateShow/form">证书展示添加</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="certificateShow"
		action="${ctx}/taier/certificateShow/" method="post"
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
			<c:forEach items="${page.list}" var="certificateShow">
				<tr>
					<td><a
						href="${ctx}/taier/certificateShow/form?id=${certificateShow.id}">
							${certificateShow.name} </a></td>
					<td>${certificateShow.orderNo}</td>
					<td><fmt:formatDate value="${certificateShow.createDate}"
							type="both" dateStyle="full" pattern="yyyy-MM-dd hh:HH:mm" /></td>
					<td><a
						href="${ctx}/taier/certificateShow/form?id=${certificateShow.id}">修改</a>
						<a
						href="${ctx}/taier/certificateShow/delete?id=${certificateShow.id}"
						onclick="return confirmx('确认要删除该证书展示吗？', this.href)">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
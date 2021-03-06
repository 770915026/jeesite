<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>关于我们管理</title>
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
		<li class="active"><a href="${ctx}/taier/aboutUs/">关于我们列表</a></li>
		<li><a href="${ctx}/taier/aboutUs/form">关于我们添加</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="aboutUs"
		action="${ctx}/taier/aboutUs/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<!-- <ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul> -->
	</form:form>
	<sys:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<td>地址</td>
				<td>联系电话</td>
				<td>创建时间</td>
				<td>qq群</td>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="aboutUs">
				<tr>
					<td>${aboutUs.address}</td>
					<td>${aboutUs.phone}</td>
					<td><fmt:formatDate value="${aboutUs.createDate}" type="both"
							dateStyle="full" pattern="yyyy-MM-dd hh:HH:mm" /></td>
					<td>${aboutUs.qqgroup}</td>
					<td><a href="${ctx}/taier/aboutUs/form?id=${aboutUs.id}">修改</a>
						<a href="${ctx}/taier/aboutUs/delete?id=${aboutUs.id}"
						onclick="return confirmx('确认要删除该关于我们吗？', this.href)">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
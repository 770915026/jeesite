<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>联系方式管理</title>
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
		<li class="active"><a href="${ctx}/taier/contact/">联系方式列表</a></li>
		<li><a href="${ctx}/taier/contact/form">联系方式添加</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="contact"
		action="${ctx}/taier/contact/" method="post"
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
				<th>地址</th>
				<th>联系电话</th>
				<td>创建时间</td>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="contact">
				<tr>
					<td>${contact.address}</td>
					<td>${contact.phone}</td>
					<td><fmt:formatDate value="${aboutUs.createDate}" type="both"
							dateStyle="full" pattern="yyyy-MM-dd hh:HH:mm" /></td>
					<td><a href="${ctx}/taier/contact/form?id=${contact.id}">修改</a>
						<a href="${ctx}/taier/contact/delete?id=${contact.id}"
						onclick="return confirmx('确认要删除该联系方式吗？', this.href)">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
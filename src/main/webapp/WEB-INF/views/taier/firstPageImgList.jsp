<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>首页图片管理</title>
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
		<li class="active"><a href="${ctx}/taier/firstPageImg/">首页图片列表</a></li>
		<li><a href="${ctx}/taier/firstPageImg/form">首页图片添加</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="firstPageImg"
		action="${ctx}/taier/firstPageImg/" method="post"
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
				<td>图片</td>
				<td>大标题</td>
				<td>小标题</td>
				<td>图片顺序</td>
				<td>添加时间</td>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="firstPageImg">
				<tr>
					<td><img src="${firstPageImg.imgUrl}" style="height: 100px;" /></td>
					<td>${firstPageImg.title }</td>
					<td>${firstPageImg.title1 }</td>
					<td>${firstPageImg.sort }</td>
					<td><fmt:formatDate value="${firstPageImg.createDate}"
							type="both" dateStyle="full" pattern="yyyy-MM-dd hh:HH:mm" /></td>
					<td><a
						href="${ctx}/taier/firstPageImg/form?id=${firstPageImg.id}">修改</a>
						<a href="${ctx}/taier/firstPageImg/delete?id=${firstPageImg.id}"
						onclick="return confirmx('确认要删除该首页图片吗？', this.href)">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
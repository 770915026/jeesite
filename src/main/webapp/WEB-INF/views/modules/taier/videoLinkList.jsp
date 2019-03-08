<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>视频链接管理</title>
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
		<li class="active"><a href="${ctx}/taier/videoLink/">视频链接列表</a></li>
		<li><a href="${ctx}/taier/videoLink/form">视频链接添加</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="videoLink"
		action="${ctx}/taier/videoLink/" method="post"
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
				<th>封面图</th>
				<th>链接</th>
				<th>创建时间</th>
				<th>序号</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="videoLink">
				<tr>
					<td>${videoLink.title}</td>
					<td style="max-width: 200px">${videoLink.faceImg}</td>
					<td>${videoLink.linkUrl}</td>
					<td><fmt:formatDate value="${videoLink.createDate}"
							type="both" dateStyle="full" pattern="yyyy-MM-dd hh:HH:mm" /></td>
					<td>${videoLink.sortNum}</td>
					<td><a href="${ctx}/taier/videoLink/form?id=${videoLink.id}">修改</a>
						<a href="${ctx}/taier/videoLink/delete?id=${videoLink.id}"
						onclick="return confirmx('确认要删除该视频链接吗？', this.href)">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
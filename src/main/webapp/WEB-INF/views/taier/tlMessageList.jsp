<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>消息管理</title>
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
		<li class="active"><a href="${ctx}/taier/tlMessage/">消息列表</a></li>
		<li><a href="${ctx}/taier/tlMessage/form">消息添加</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="tlMessage"
		action="${ctx}/taier/tlMessage/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>消息类型：</label> <form:select path="type"
					class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('sys_msg_type')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select></li>
			<li><label>标题：</label> <form:input path="tittle"
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
				<th>标题</th>
				<th>消息类型</th>
				<th>创建日期</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="tlMessage">
				<tr>
					<td><a href="${ctx}/taier/tlMessage/form?id=${tlMessage.id}">
							${tlMessage.tittle} </a></td>
					<td>${fns:getDictLabel(tlMessage.type, 'sys_msg_type', '')}</td>
					<td><fmt:formatDate value="${tlMessage.createDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><a href="${ctx}/taier/tlMessage/form?id=${tlMessage.id}">修改</a>
						<a href="${ctx}/taier/tlMessage/delete?id=${tlMessage.id}"
						onclick="return confirmx('确认要删除该消息吗？', this.href)">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>活动管理</title>
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
		<li class="active"><a href="${ctx}/taier/activity/">活动列表</a></li>
		<li><a href="${ctx}/taier/activity/form">活动添加</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="activity"
		action="${ctx}/taier/activity/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>活动标题：</label> <form:input path="title"
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
				<th>活动标题</th>
				<th>活动类型</th>
				<th>活动性质</th>
				<th>活动描述</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>是否发布到首页</th>
				<th>地点</th>

				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="activity">
				<tr>
					<td><a href="${ctx}/taier/activity/form?id=${activity.id}">
							${activity.title} </a></td>
					<th>${fns:getDictLabel(activity.type, 'activity_type', '')}</th>
					<th>${activity.nature}</th>
					<th>${activity.describe}</th>
					<th><fmt:formatDate value="${activity.starttime}" type="both"
							dateStyle="full" pattern="yyyy-MM-dd hh:HH:mm" /></th>
					<th><fmt:formatDate value="${activity.endtime}" type="both"
							dateStyle="full" pattern="yyyy-MM-dd hh:HH:mm" /></th>
					<th>${fns:getDictLabel(activity.isToFirstPage, 'yes_no', '')}</th>
					<th>${activity.address}</th>
					<td><a href="${ctx}/taier/activity/form?id=${activity.id}">修改</a>
						<a href="${ctx}/taier/activity/delete?id=${activity.id}"
						onclick="return confirmx('确认要删除该活动吗？', this.href)">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>手机预置应用公示管理</title>
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
		<li class="active"><a href="${ctx}/taier/tlApppreset/">手机预置应用公示列表</a></li>
		<shiro:hasPermission name="taier:tlApppreset:edit">
			<li><a href="${ctx}/taier/tlApppreset/form">手机预置应用公示添加</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tlApppreset"
		action="${ctx}/taier/tlApppreset/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>手机大版本号：</label> <form:input path="phoneVersion"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li><label>审核标志0-已保存1-待发布2-已发布：</label> <form:select path="flag"
					class="input-medium">
					<form:option value="" label="" />
					<form:options items="${fns:getDictList('')}" itemLabel="label"
						itemValue="value" htmlEscape="false" />
				</form:select></li>
			<li><label>可修改：</label> <form:input path="modifiable"
					htmlEscape="false" maxlength="1" class="input-medium" /></li>
			<li><label>热门：</label> <form:input path="hotflag"
					htmlEscape="false" maxlength="1" class="input-medium" /></li>
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
				<th>联合信息</th>
				<th>手机大版本号</th>
				<th>版本日期</th>
				<th>审核标志0-已保存1-待发布2-已发布</th>
				<th>修改日期</th>
				<shiro:hasPermission name="taier:tlApppreset:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="tlApppreset">
				<tr>
					<td><a
						href="${ctx}/taier/tlApppreset/form?id=${tlApppreset.id}">
							${tlApppreset.unionId} </a></td>
					<td>${tlApppreset.phoneVersion}</td>
					<td>${tlApppreset.versionDate}</td>
					<td>${fns:getDictLabel(tlApppreset.flag, '', '')}</td>
					<td><fmt:formatDate value="${tlApppreset.updateDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<shiro:hasPermission name="taier:tlApppreset:edit">
						<td><a
							href="${ctx}/taier/tlApppreset/form?id=${tlApppreset.id}">修改</a>
							<a href="${ctx}/taier/tlApppreset/delete?id=${tlApppreset.id}"
							onclick="return confirmx('确认要删除该手机预置应用公示吗？', this.href)">删除</a></td>
					</shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
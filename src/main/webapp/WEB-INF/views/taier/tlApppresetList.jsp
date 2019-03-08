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
			<li><label>大版本号：</label> <form:input path="phoneVersion"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li><label>状态</label> <form:select path="flag"
					class="input-medium">
					<form:option value="" label="全部" />
					<form:option value="1" label="待发布" />
					<form:option value="2" label="已发布" />
				</form:select></li>
			<li><label>可修改：</label> <form:select path="modifiable"
					class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('yes_no')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select></li>
			<li><label>热门：</label> <form:select path="hotflag"
					class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('yes_no')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select></li>
			<li><label>申请修改：</label> <form:select path="applymdf"
					class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('yes_no')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select></li>
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
				<th width="15%">手机大版本号</th>
				<th width="5%">版本日期</th>
				<th width="5%">状态</th>
				<th width="5%">可修改</th>
				<th width="5%">热门</th>
				<th width="5%">申请修改</th>
				<th width="15%">申请理由</th>

				<th width="10%">修改日期</th>
				<th width="15%">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="tlApppreset">
				<tr>
					<td><a
						href="${ctx}/taier/tlApppreset/form?id=${tlApppreset.id}">
							${tlApppreset.phoneVersion} </a></td>
					<td>${tlApppreset.versionDate}</td>
					<td><c:if test="${tlApppreset.flag eq '0'}">
						已保存
					</c:if> <c:if test="${tlApppreset.flag eq '1'}">
						待发布
					</c:if> <c:if test="${tlApppreset.flag eq '2'}">
						已发布
					</c:if></td>
					<td>${fns:getDictLabel(tlApppreset.modifiable, 'yes_no', '')}
					</td>
					<td>${fns:getDictLabel(tlApppreset.hotflag, 'yes_no', '')}</td>
					<td>${fns:getDictLabel(tlApppreset.applymdf, 'yes_no', '')}</td>
					<td>${tlApppreset.reason}</td>
					<td><fmt:formatDate value="${tlApppreset.updateDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><a
						href="${ctx}/taier/tlApppreset/approve?id=${tlApppreset.id}">通过</a>&nbsp;
						<a href="${ctx}/taier/tlApppreset/approveNo?id=${tlApppreset.id}">不通过</a>&nbsp;
						<a
						href="${ctx}/taier/tlApppreset/changeModifyable?id=${tlApppreset.id}">更改可修改</a>&nbsp;
						<a href="${ctx}/taier/tlApppreset/sethot?id=${tlApppreset.id}">更改热门</a>

					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
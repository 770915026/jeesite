<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>缴费信息管理</title>
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
		<li class="active"><a href="${ctx}/taier/tlPaymentInfo/">缴费信息列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="tlPaymentInfo"
		action="${ctx}/taier/tlPaymentInfo/" method="post"
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
				<th>金额</th>
				<th>开户行</th>
				<th>银行账号</th>
				<th>税号</th>
				<shiro:hasPermission name="taier:tlPaymentInfo:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="tlPaymentInfo">
				<tr>
					<td><a
						href="${ctx}/taier/tlPaymentInfo/form?id=${tlPaymentInfo.id}">
							${tlPaymentInfo.amount} </a></td>
					<td>${tlPaymentInfo.bank}</td>
					<td>${tlPaymentInfo.banknum}</td>
					<td>${tlPaymentInfo.dutynum}</td>
					<shiro:hasPermission name="taier:tlPaymentInfo:edit">
						<td><a
							href="${ctx}/taier/tlPaymentInfo/form?id=${tlPaymentInfo.id}">修改</a>
						</td>
					</shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
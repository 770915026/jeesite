<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>发票管理</title>
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
		<li class="active"><a href="${ctx}/taier/tlInvoice/">发票列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="tlInvoice"
		action="${ctx}/taier/tlInvoice/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>厂家名称：</label>
			<form:input path="company.name" htmlEscape="false" maxlength="50"
					class="input-medium" /></li>
			<li><label>开票状态：</label> <form:select path="flag"
					class="input-medium">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('sys_invoice_stat')}"
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
				<th width="40%">厂家名称</th>
				<th width="20%">开票状态</th>
				<th width="30%">更新时间</th>
				<th width="10%">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="tlInvoice">
				<tr>
					<td><a href="${ctx}/taier/tlInvoice/form?id=${tlInvoice.id}">
							${tlInvoice.company.name} </a></td>
					<td>${fns:getDictLabel(tlInvoice.flag, 'sys_invoice_stat', '')}
					</td>
					<td><fmt:formatDate value="${tlInvoice.updateDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><c:if test="${tlInvoice.flag eq '0'}">
							<a href="${ctx}/taier/tlInvoice/invoice?id=${tlInvoice.id}"
								onclick="return confirmx('确认开票吗？', this.href)">开票</a>
						</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
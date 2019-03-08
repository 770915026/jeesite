<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>行业分析报告管理</title>
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
		<li class="active"><a href="${ctx}/taier/analysisReport/">行业分析报告列表</a></li>
		<li><a href="${ctx}/taier/analysisReport/form">行业分析报告添加</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="analysisReport"
		action="${ctx}/taier/analysisReport/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label style="width: 130px;">企业分析报告标题：</label> <form:input
					path="title" htmlEscape="false" maxlength="200"
					class="input-medium" /></li>
			<li><label style="width: 130px;">作者：</label> <form:input
					path="author" htmlEscape="false" maxlength="64"
					class="input-medium" /></li>
			<li><label style="width: 130px;">创建时间：</label> <input
				name="beginCreateDate" type="text" readonly="readonly"
				maxlength="20" class="input-medium Wdate"
				value="<fmt:formatDate value="${analysisReport.beginCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
				- <input name="endCreateDate" type="text" readonly="readonly"
				maxlength="20" class="input-medium Wdate"
				value="<fmt:formatDate value="${analysisReport.endCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
			</li>
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
				<th>企业分析报告标题</th>
				<th>编号</th>
				<th>来源</th>
				<th>作者</th>
				<th>责编</th>
				<th>是否发布到首页</th>
				<th>创建时间</th>
				<th>序号</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="analysisReport">
				<tr>
					<td><a
						href="${ctx}/taier/analysisReport/form?id=${analysisReport.id}">
							${analysisReport.title} </a></td>
					<th>${analysisReport.reportnum}</th>
					<th>${analysisReport.source}</th>
					<th>${analysisReport.author}</th>
					<th>${analysisReport.editor}</th>
					<th>${fns:getDictLabel(analysisReport.isToFirstPage, 'yes_no', '')}</th>
					<th><fmt:formatDate value="${analysisReport.createDate}"
							type="both" dateStyle="full" pattern="yyyy-MM-dd hh:HH:mm" /></th>
					<td>${analysisReport.orderNo}</td>
					<td><a
						href="${ctx}/taier/analysisReport/form?id=${analysisReport.id}">修改</a>
						<a
						href="${ctx}/taier/analysisReport/delete?id=${analysisReport.id}"
						onclick="return confirmx('确认要删除该行业分析报告吗？', this.href)">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>

</html>
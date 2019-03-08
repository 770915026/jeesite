<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglibmobile.jsp"%>
<html>
<head>
<title>app管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
		$(document).ready(function() {
			$("#btnImport").click(function(){
				$.jBox($("#importBox").html(), {title:"导入数据", buttons:{"关闭":true}, 
					bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
			});
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
	<div id="importBox" class="hide">
		<form id="importForm" action="${ctx}/taier/tlApps/import"
			method="post" enctype="multipart/form-data" class="form-search"
			style="padding-left: 20px; text-align: center;"
			onsubmit="loading('正在导入，请稍等...');">
			<br /> <input id="uploadFile" name="file" type="file"
				style="width: 330px" /><br />
			<br /> <input id="btnImportSubmit" class="btn btn-primary"
				type="submit" value="   导    入   " /> <a
				href="${ctxStatic}/template/app.xlsx">下载模板</a>
		</form>
	</div>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/taier/tlApps/">app列表</a></li>
		<li><a href="${ctx}/taier/tlApps/form">app添加</a></li>

	</ul>
	<form:form id="searchForm" modelAttribute="tlApps"
		action="${ctx}/taier/tlApps/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>app名称：</label> <form:input path="name"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li><label>开发者：</label> <form:input path="developer"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>

			<li class="btns"><input id="btnSubmit" class="btn btn-primary"
				type="submit" value="查询" /> <input id="btnImport"
				class="btn btn-primary" type="button" value="导入" /></li>

			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>应用名称</th>
				<th>开发者</th>
				<th>功能描述</th>
				<th>权限列表</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="tlApps">
				<tr>
					<td>${tlApps.name}</td>
					<td>${tlApps.developer}</td>
					<td>${tlApps.description}</td>
					<td>${tlApps.visitAuth}</td>
					<td><a href="${ctx}/taier/tlApps/form?id=${tlApps.id}">修改</a>
						<a href="${ctx}/taier/tlApps/delete?id=${tlApps.id}"
						onclick="return confirmx('确认要删除该app吗？', this.href)">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
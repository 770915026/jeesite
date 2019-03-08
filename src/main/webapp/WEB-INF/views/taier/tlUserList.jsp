<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>账户管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
		$(document).ready(function() {
			$("#btnExport").click(function(){
				top.$.jBox.confirm("确认要导出用户数据吗？","系统提示",function(v,h,f){
					if(v=="ok"){
						var userType="${userType}";
						if(userType==''){
							userType=3;
						}
						$("#searchForm").attr("action","${ctx}/sys/user/export?userType="+userType);
						$("#searchForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});
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
		<form id="importForm" action="${ctx}/taier/user/import" method="post"
			enctype="multipart/form-data" class="form-search"
			style="padding-left: 20px; text-align: center;"
			onsubmit="loading('正在导入，请稍等...');">
			<br /> <input id="uploadFile" name="file" type="file"
				style="width: 330px" /><br />
			<br /> <input id="btnImportSubmit" class="btn btn-primary"
				type="submit" value="   导    入   " /> <a
				href="${ctxStatic}/template/importCompanyUser.xlsx">下载模板</a>
		</form>
	</div>
	<ul class="nav nav-tabs">
		<li class="${userType==3?'active':''}"><a
			href="${ctx}/taier/user/list/?userType=3">厂家用户A列表</a></li>
		<li class="${userType==4?'active':''}"><a
			href="${ctx}/taier/user/list/?userType=4">厂家用户B列表</a></li>
		<li class="${userType==2?'active':''}"><a
			href="${ctx}/taier/user/list/?userType=2">普通用户列表</a></li>
		<li class="${userType==1?'active':''}"><a
			href="${ctx}/taier/user/list/?userType=1">管理员列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="user"
		action="${ctx}/taier/user/list/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>姓名：</label> <form:input path="name"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<input name="userType" type="hidden" value="${userType}" />
			<li class="btns"><input id="btnSubmit" class="btn btn-primary"
				type="submit" value="查询" /></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<c:if test="${userType=='1' }">
		<a href="${ctx}/taier/user/form" class="btn btn-primary"
			style="margin: 0 0 10px 4px;">新增</a>
	</c:if>
	<input id="btnExport" class="btn btn-primary"
		style="margin: 0 0 10px 4px;" type="button" value="导出" />
	<input id="btnImport" class="btn btn-primary"
		style="margin: 0 0 10px 4px;" type="button" value="导入企业用户" />

	<sys:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>用户名</th>
				<th>用户类型</th>
				<th>发布权限</th>
				<th>创建日期</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="user">
				<tr>
					<td>${user.name}</td>
					<td>${fns:getDictLabel(user.userType, 'sys_user_type', '')}</td>
					<td>${fns:getDictLabel(user.flag, 'yes_no', '')}</td>
					<td><fmt:formatDate value="${user.createDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>

					<td><a href="${ctx}/taier/user/changefbqx?id=${user.id}">更改发布权限</a>
						<a href="${ctx}/taier/user/delUser?id=${user.id}"
						onclick="return confirmx('确认要删除该用户吗？', this.href)">删除</a> <c:if
							test="${userType=='1' }">
							<a href="${ctx}/taier/user/form?id=${user.id}">修改</a>
						</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>二维码管理</title>
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
		<li class="active"><a href="${ctx}/taier/tlQrcode/">二维码列表</a></li>
		<li><a href="${ctx}/taier/tlQrcode/form">二维码添加</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="tlQrcode"
		action="${ctx}/taier/tlQrcode/" method="post"
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
				<th>微信公众号二维码</th>
				<th>微博二维码</th>
				<th>登录页二维码</th>
				<th>创建日期</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="tlQrcode">
				<tr>
					<td><img src="${tlQrcode.weixinurl}" style="height: 100px;" />
					</td>
					<td><img src="${tlQrcode.weibourl}" style="height: 100px;" />
					</td>
					<td><img src="${tlQrcode.loginurl}" style="height: 100px;" />
					</td>
					<td><fmt:formatDate value="${tlQrcode.createDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><a href="${ctx}/taier/tlQrcode/form?id=${tlQrcode.id}">修改</a>
						<a href="${ctx}/taier/tlQrcode/delete?id=${tlQrcode.id}"
						onclick="return confirmx('确认要删除该二维码吗？', this.href)">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglibmobile.jsp"%>
<html>
<head>
<title>政策管理</title>
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
		function checkAll(e, itemName){
			var repairId = document.getElementsByName(itemName);    //获取全选复选框
			for (var i=0; i<repairId.length; i++){
			    repairId[i].checked = e.checked;    //改变所有复选框的状态为全选复选框的状态
			 }
		}
		function checkdel(){
			var num = $("input[type='checkbox']:checked").length;
			if(num == 0){
				alert("请选择你要删除的数据");
			}else{
			  confirmx('确定要删除已选中的路灯抢修信息吗？',batchDel);
			}

		}
		function batchDel(){
			//批量删除
			var id = document.getElementsByName("repairId");//获取全选复选框
			var ids = new Array();
			//拼接所有id
			for(var i=0;i<id.length;i++){
				if(id[i].checked){
					ids.push(id[i].value);
				}
			}
			window.location.href="${ctx}/taier/policy/batchDel?ids="+ids;
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/taier/policy/">政策列表</a></li>
		<li><a href="${ctx}/taier/policy/form">政策添加</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="policy"
		action="${ctx}/taier/policy/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>政策名称：</label> <form:input path="title"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary"
				type="submit" value="查询" /></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<a href="#" onclick="checkdel()" class="btn btn-primary"
		style="margin: 0 0 10px 4px;">批量删除</a>
	<sys:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th><input type=checkbox name="selid" id="checkId"
					onclick="checkAll(this, 'repairId')"></th>
				<th>政策名称</th>
				<th>关键字</th>
				<th>类型</th>
				<th>来源</th>
				<th>添加时间</th>
				<th>序号</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="policy">
				<tr>
					<td><input type="checkbox" name="repairId"
						value="${policy.id}" /></td>
					<td><a href="${ctx}/taier/policy/form?id=${policy.id}">
							${policy.title} </a></td>
					<td>${policy.keyWord}</td>
					<td><c:if test="${policy.type==1 }">
						政策文件
					</c:if> <c:if test="${policy.type==2 }">
						政策法规
					</c:if> <%-- <c:if test="${policy.type==3 }">
						行政法规
					</c:if>
					<c:if test="${policy.type==4 }">
						部门规章
					</c:if> --%></td>
					<th>${policy.source}</th>
					<td><fmt:formatDate value="${policy.updateDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${policy.orderNo}</td>
					<td><a href="${ctx}/taier/policy/form?id=${policy.id}">修改</a>
						<a href="${ctx}/taier/policy/delete?id=${policy.id}"
						onclick="return confirmx('确认要删除该政策吗？', this.href)">删除</a> <c:if
							test="${policy.delFlag=='2'}">
							<a href="${ctx}/taier/policy/publishPolicy?id=${policy.id}">发布</a>
						</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
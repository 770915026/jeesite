<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglibmobile.jsp"%>
<%@ include file="/WEB-INF/views/mobile/taier/include.jsp"%>
<html>
<head>
<title>企业联合信息管理</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1 maximum-scale=2, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-title" content="Add to Home">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="x-rim-auto-match" content="none">
<!--bootstrap框架↓-->
<link href="${ctxStatic}/taier/bootstrap-3.3.7-dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link
	href="${ctxStatic}/taier/bootstrap-3.3.7-dist/css/bootstrap-theme.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${ctxStatic}/taier/js/jquery-3.1.1.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/taier/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<style type="text/css">
#showApprovalDiv {
	padding-right: 17px;
	margin-left: auto;
	margin-right: auto;
	width: 500px;
	height: 260px;
	padding: 0px;
	top: 28%;
}
</style>
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
			window.location.href="${ctx}/taier/tlCompanyUnionInfo/batchDel?ids="+ids;
		}
		function showApproveDiv(flag,id){
			$("#flag").val(flag);
			$("#id").val(id);
			$('#showApprovalDiv').modal({backdrop: 'static', keyboard: false});
			$("#showApprovalDiv").modal('show');
			
		}
		function saveApproval(){
			var flag=$("#flag").val();
			var id=$("#id").val();
			var approvalRemark=$("#approvalRemark").val();
			if(flag==2){
				window.location.href="${ctx}/taier/tlCompanyUnionInfo/approve?id="+id+"&approvalRemark="+approvalRemark;
			}
			if(flag==1){
				window.location.href="${ctx}/taier/tlCompanyUnionInfo/approveNo?id="+id+"&approvalRemark="+approvalRemark;
			}
		}
	</script>
</head>
<body>
	<div class="header-wrap-bar">
		<div class="taier-logo"></div>
		<div class="taier-login-box">
			<c:if test="${fns:getUser().name eq null}">
				<span class="login-btn"
					onclick="window.location.href='${ctx}/logout'"></span>
			</c:if>
			<c:if test="${fns:getUser().name ne null}">
				<span class="login-btn" onclick="showuserinfo(this)"
					style="background-image: none; float: left; line-height: 1.08rem;">${fns:getUser().name}</span>
			</c:if>
			<span class="login-home-nav"></span>
		</div>
	</div>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/taier/tlCompanyUnionInfo/">企业联合信息列表</a></li>
		<li><a href="${ctx}/taier/tlCompanyUnionInfo/form">企业联合信息添加</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="tlCompanyUnionInfo"
		action="${ctx}/taier/tlCompanyUnionInfo/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>表名：</label> <form:input path="tableName"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li><label>产品名称：</label> <form:input path="productName"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li><label>产品型号：</label> <form:input path="productVersion"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li><label>状态：</label> <form:select path="flag"
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
				<th width="15%">表名</th>
				<th width="15%">产品名称</th>
				<th width="15%">产品型号</th>
				<th width="10%">状态</th>
				<th width="10%">可修改</th>
				<th width="10%">热门</th>
				<th width="10%">更新日期</th>
				<th width="10%">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="tlCompanyUnionInfo">
				<tr>
					<td><input type="checkbox" name="repairId"
						value="${tlCompanyUnionInfo.id}" /></td>
					<td><a
						href="${ctx}/taier/tlCompanyUnionInfo/form?id=${tlCompanyUnionInfo.id}">
							${tlCompanyUnionInfo.tableName} </a></td>
					<td>${tlCompanyUnionInfo.productName}</td>
					<td>${tlCompanyUnionInfo.productVersion}</td>

					<td><c:if test="${tlCompanyUnionInfo.flag eq '0'}">
						已保存
					</c:if> <c:if test="${tlCompanyUnionInfo.flag eq '1'}">
						待发布
					</c:if> <c:if test="${tlCompanyUnionInfo.flag eq '2'}">
						已发布
					</c:if></td>
					<td>${fns:getDictLabel(tlCompanyUnionInfo.modifiable, 'yes_no', '')}
					</td>
					<td>${fns:getDictLabel(tlCompanyUnionInfo.hotflag, 'yes_no', '')}
					</td>
					<td><fmt:formatDate value="${tlCompanyUnionInfo.updateDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><a href="javaScript:void(0)"
						onclick="showApproveDiv(2,'${tlCompanyUnionInfo.id}')">通过</a>&nbsp;
						<%-- <a href="${ctx}/taier/tlCompanyUnionInfo/approve?id=${tlCompanyUnionInfo.id}" onclick="approve(${tlCompanyUnionInfo.id})">通过</a>&nbsp; --%>
						<a href="javaScript:void(0)"
						onclick="showApproveDiv(1,'${tlCompanyUnionInfo.id}')">不通过</a>&nbsp;
						<%-- <a href="${ctx}/taier/tlCompanyUnionInfo/approveNo?id=${tlCompanyUnionInfo.id}" onclick="approveNo(${tlCompanyUnionInfo.id})">不通过</a>&nbsp; --%>
						<a
						href="${ctx}/taier/tlCompanyUnionInfo/changeModifyable?id=${tlCompanyUnionInfo.id}">更改可修改</a>&nbsp;
						<a
						href="${ctx}/taier/tlCompanyUnionInfo/sethot?id=${tlCompanyUnionInfo.id}">更改热门</a>
						<a
						href="${ctx}/taier/tlCompanyUnionInfo/updateTable?id=${tlCompanyUnionInfo.id}">修改</a>
						<a
						href="${ctx}/taier/tlCompanyUnionInfo/preview?id=${tlCompanyUnionInfo.id}">预览</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>

	<div class="modal" id="showApprovalDiv"
		style="background-color: transparent; width: 603px;">
		<div class="modal-dialog" role="document" style="margin: 0px">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">审批意见</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="height: 120px;">
					<input type="text" class="form-control" placeholder="请输入审批内容"
						id="approvalRemark" style="height: 40px;">

				</div>
				<input id="flag" type="hidden"> <input id="id" type="hidden">
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="saveApproval()">保存</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglibmobile.jsp"%>
<html>
<head>
<title>发票管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/taier/tlInvoice/">发票列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/tlInvoice/form?id=${tlInvoice.id}">发票<shiro:hasPermission
					name="taier:tlInvoice:edit">${not empty tlInvoice.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="taier:tlInvoice:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="tlInvoice"
		action="${ctx}/taier/tlInvoice/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">厂家名称：</label>
			<div class="controls">${tlInvoice.company.name}</div>
		</div>
		<div class="control-group">
			<label class="control-label">发票类型：</label>
			<div class="controls">${fns:getDictLabel(tlInvoice.type, 'sys_invoice_type', '')}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">名称：</label>
			<div class="controls">${tlInvoice.invoiceName}</div>
		</div>
		<div class="control-group">
			<label class="control-label">税号：</label>
			<div class="controls">${tlInvoice.taxNumber}</div>
		</div>
		<div class="control-group">
			<label class="control-label">纸质发票接收方式：</label>
			<div class="controls">
				${fns:getDictLabel(tlInvoice.receiveType, 'sys_invoice_receive_type', '')}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮寄地址：</label>
			<div class="controls">${tlInvoice.receiveAddress}</div>
		</div>
		<div class="control-group">
			<label class="control-label">收票人电话：</label>
			<div class="controls">${tlInvoice.receivePhone}</div>
		</div>
		<div class="control-group">
			<label class="control-label">收票人邮箱：</label>
			<div class="controls">${tlInvoice.receiveEmail}</div>
		</div>
		<div class="control-group">
			<label class="control-label">类型：</label>
			<div class="controls">${fns:getDictLabel(tlInvoice.type2, 'sys_invoice_type2', '')}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">状态：</label>
			<div class="controls">${fns:getDictLabel(tlInvoice.flag, 'sys_invoice_stat', '')}
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="taier:tlInvoice:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit"
					value="保 存" />&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="开 票"
				onclick="kaipiao()" /> <input id="btnCancel" class="btn"
				type="button" value="返 回" onclick="history.go(-1)" />
		</div>
	</form:form>
	<script>
	function kaipiao(){
        if(confirm("确定开票吗?")){
            window.location.href='${ctx}/taier/tlInvoice/invoice?id=${tlInvoice.id}';
        }

    }
</script>
</body>
</html>
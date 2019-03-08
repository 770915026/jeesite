<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglibmobile.jsp"%>
<html>
<head>
<title>新闻管理</title>
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
			alert("请选择你要恢复的数据");
			}else{
			  confirmx('确定要恢复已选中的路灯抢修信息吗？',batchDel);
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
			window.location.href="${ctx}/taier/news/batchRestore?ids="+ids;
		}

	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/taier/news/newsTrash">新闻列表</a></li>

	</ul>
	<form:form id="searchForm" modelAttribute="news"
		action="${ctx}/taier/news/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>新闻标题：</label> <form:input path="title"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary"
				type="submit" value="查询" /></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<a href="#" onclick="checkdel()" class="btn btn-primary"
		style="margin: 0 0 10px 4px;">批量恢复</a>
	<sys:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th><input type=checkbox name="selid" id="checkId"
					onclick="checkAll(this, 'repairId')"></th>
				<th>新闻标题</th>
				<th>作者</th>
				<!-- <th>新闻内容</th> -->
				<th>关键字</th>
				<th>新闻类型</th>
				<th>创建时间</th>
				<th>是否热门</th>
				<th>是否发布到首页</th>
				<th>原文链接</th>
				<th>序号</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="news">
				<tr>
					<td><input type="checkbox" name="repairId" value="${news.id}" /></td>
					 

					<td
						style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; max-width: 150px"
						title="${news.title}"><a
						href="${ctx}/taier/news/form?id=${news.id}"> ${news.title} </a></td>
					<td>${news.author}</td>
					<td>${news.keyWord}</td>
					<%-- <th>${fns:replaceHtml(news.content)}<p style="overflow:hidden; width:200px;">${fns:replaceHtml(news.content)}</p></th> --%>
					<td>${fns:getDictLabel(news.type, 'news_type', '')}</td>
					<td><fmt:formatDate value="${news.createDate}" type="both"
							dateStyle="full" pattern="yyyy-MM-dd hh:HH:mm" /></td>
					<td>${fns:getDictLabel(news.isHot, 'yes_no', '')}</td>
					<td>${fns:getDictLabel(news.isToFirstPage, 'yes_no', '')}</td>
					<td
						style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; max-width: 150px"
						title="${news.originalLink}">${news.originalLink}</td>
					<td>${news.orderNo}</td>
					<td><a href="${ctx}/taier/news/trashForm?id=${news.id}">修改</a>
						<a href="${ctx}/taier/news/restore?id=${news.id}"
						onclick="return confirmx('确认要恢复该新闻吗？', this.href)">恢复</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
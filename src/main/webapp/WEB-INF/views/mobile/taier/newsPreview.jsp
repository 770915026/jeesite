<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglibmobile.jsp"%>
<html>
<head>
<title>新闻管理</title>
<meta name="decorator" content="default" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="toTop" content="true">
<meta name="keywords" content="${news.keyWord }">
<%@ include file="/WEB-INF/views/taier/include.jsp"%>
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
<style>
.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

#hotNewsList dl a dd {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	display: -moz-box;
	-moz-line-clamp: 2;
	-moz-box-orient: vertical;
}
</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a style="color: #2fa4e7" href="${ctx}/taier/news/">新闻列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/news/preview?id=${news.id}">新闻预览</a></li>
	</ul>
	<br />

	<div class="w1200">
		<div class="new_box">
			<div class="new_left">
				<h1 class="new_title">${news.title }<br>
					<br> <small>${news.author }<span><fmt:formatDate
								value="${news.createDate}" type="both" dateStyle="full"
								pattern="yyyy-MM-dd hh:HH:mm" /> </span></small>
				</h1>
				<div class="new_cont">
					${news.content }
					<div class="come_where">
						*文章为作者独立观点，不代表泰尔视角立场 <span>本文由${news.author } 授权 泰尔视角
							发表，并经泰尔视角编辑。转载此文章须经作者同意，并请附上出处（泰尔视角）及本页链接。原文链接${news.originalLink }</span>
					</div>
				</div>
			</div>
			<!--  <div class="new_right">
            <h2 class="new_rtitle">热门新闻</h2>
            <div id="hotNewsList">
            </div>
            
            <div class="liulan_more">
                <a id="getMoreHotNews" href="javascript:void(0)" style="padding: 0" onclick="getMoreHotNews()" class="c_more">浏览更多</a>
            </div>
        </div> -->
		</div>
	</div>
	<div class="form-actions" style="padding-left: 30%;">
		<input id="btnCancel" class="btn" type="button" value="返 回"
			onclick="history.go(-1)" />
	</div>
	<script type="text/javascript">
	var contextPath="${contextPath}"
</script>
</body>
</html>
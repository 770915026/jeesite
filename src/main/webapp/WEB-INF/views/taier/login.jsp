<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/taier/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>登录</title>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/newtaier/css/login.css">
<%
        String t = request.getParameter("t");
    %>
<style>
.ywbla {
	background-color: #7d7d7d;
}

.ywbla:hover {
	background-color: #4285ff;
}
</style>
</head>
<body>
	<div class="container" style="padding-left: 0px; padding-right: 0px;">

		<!--头部-->
		<div class="header-box">
			<!--LOGO-->
			<div class="taier-logo fl">
				<img src="${ctxStatic}/newtaier/images/logo.jpg">
			</div>
			<!--LOGO END-->
			<!--TAB导航-->
			<dl class="public-nav">
				<dd class="">
					<a href="${contextPath}/taier/jump/gotoFirstPage" menu="1">首页</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/jump/gotoNews" menu="2">新闻动态</a>
				</dd>
				<dd id="businessBar">
					<a href="javascript:void(0);" menu="3">业务办理</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/jump/gotoFirstPage#tezs" menu="30">泰尔证书</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/jump/unionInfoListUSer" menu="4">信息发布</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/jump/preSetAppListUSer" menu="5">应用公示</a>
				</dd>
				<dd>
					<a
						href="${contextPath}/taier/analysisReportFront/gotoAnalysisReport"
						menu="6">行业分析报告</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/activityFront/gotoActivity" menu="7">小泰说</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/policyFront/gotoPolicy" menu="8">政策</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/jump/gotoAboutUs" menu="9">关于我们</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/jump/gotoFirstPage#contactUs"
						menu="10">联系我们</a>
				</dd>
			</dl>
			<div class="public-nav public-nav02" id="businessIntro"
				style="display: none;">
				<span class="business-tit">业务办理</span>
				<div class="business-list">
					<a href="${ctx}/taier/theNet/gotoCCC" class="ywbla"><img
						src="${ctxStatic}/newtaier/images/index-bg07.jpg" /></a> <a
						href="${ctx}/taier/theNet/gotoTheNet" class="ywbla"><img
						src="${ctxStatic}/newtaier/images/index-bg08.jpg" /></a> <a
						href="javascript:;" class="ywbla"><img
						src="${ctxStatic}/newtaier/images/index-bg09.jpg" /></a> <a
						href="javascript:;" class="ywbla"><img
						src="${ctxStatic}/newtaier/images/index-bg10.jpg" /></a>
				</div>
			</div>
			<!--业务办理 end-->
			<script type="text/javascript">
            voteIco({
                "voteIco":"businessBar",//点击元素Id
                "voteContent":"businessIntro"//展现内容Id
            });
        </script>
			<!--TAB导航 END-->
			<!--SEARCH-->
			<div class="form-box fr">
				<span class="search-input"> <input class="input" type=""
					name="" id="searchkey"> <em class="search-btn"
					onclick="search()">搜索按钮</em>
				</span> <a class="input-btn" href="${ctx}/logout">登录</a> <a
					class="input-btn" href="${contextPath}/taier/jump/register1">注册</a>
			</div>
			<!--SEARCH END-->
		</div>
		<!--头部 END-->
		<!--主体-->
		<div class="login-wrap" style="position: relative;">
			<div style="position: absolute; top: 57%;">
				<img id="wx" src="${ctxStatic}/newtaier/images/taier-ico02.png"
					style="margin-left: 344px; width: 153px; height: 147px;"> <img
					id="wb" src="${ctxStatic}/newtaier/images/taier-ico03.png"
					style="width: 153px; height: 147px;">
			</div>
			<div class="taier-container-outer">
				<div class="login-box">
					<h3 class="login-tit">登录泰尔视角</h3>
					<div class="login-form">
						<div id="messageBox"
							class="alert alert-error ${empty message ? 'hide' : ''}">
							<button data-dismiss="alert" class="close">×</button>
							<label id="loginError" class="error">${message}</label>
						</div>
						<form method="post" name="loginForm" action="${ctxOne}/login"
							id="loginForm">
							<input type="hidden" name="t" value="<%=t%>"> <span
								class="input-box"><input class="input" type="text"
								placeholder="用户名" id="username" name="username"></span> <span
								class="input-box"><input class="input" type="password"
								placeholder="密码" id="password" name="password"></span>
							<div class="code-box clearfix">
								<sys:validateCode name="validateCode" refreshtitle="换一批" />
							</div>
							<div class="login-btn" id="loginBtn" style="cursor: pointer;">登录</div>
							<div class="login-resgin">
								<a href="${contextPath}/taier/jump/register1">立即注册</a> <a
									href="${contextPath}/taier/jump/forgetPassword">忘记密码</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!--主体 END-->
		<!--FOOTER-->
		<div class="login-footer">ICP备案号：京ICP备09013372号-25</div>
		<!--FOOTER END-->
	</div>
</body>
<script type="text/javascript">
	$(function(){
	    removeother();
		$("#loginBtn").click(function(){
			var username=$("#username").val();
			if(username==null || username==""){
				alert("用户名不能为空！");
				$("#username").focus();
				return false;
			}
			var password=$("#password").val();
			if(null==password || password==""){
				alert("密码不能为空！");
				$("#password").focus();
				return false;
				
			}
			
			var validateCode=$("#validateCode").val();
			if(null==validateCode || validateCode==""){
				alert("验证码不能为空！");
				$("#validateCode").focus();
				return false;
				
			}
			$('#loginForm').submit();


		})

        $.ajax({
            type:"post",
            url:"${contextPath}/taier/jump/qryQrCode",
            dataType:"json",
            success: function (e) {
                var tlqrcode = e.hashMap.tlQrcode;
                if(tlqrcode.id){
                    $("#wx").attr("src",tlqrcode.weixinurl);
                    $("#wb").attr("src",tlqrcode.weibourl);
                }
            }
        })
	})
	
	$("#authlink").click(function(){
		$("#yzmimg").hide().attr("src", "${contextPath }/code/verify.do?" + Math.floor(Math.random() * 100)).fadeIn();
	});
	function removeother(){
	    var t = "<%=t%>";
	    if(t==""){
            $("header").remove();
            $(".login_box").removeClass("login_box");
            $("footer").remove();
            $(".middle_ewm").remove();


        }
    }
	var contextPath="${contextPath}";
	function addOperateRecords(obj){
		var menu=$(obj).attr("menu");
		var menuName=$(obj).html().replace(/<[^>]+>/g,"");
		
		$.ajax({
	        url: contextPath+"/taier/operateRecords/save",
	        type:"post",
	        dataType:"json",
	        data: {
	        	"menu":menu,
	        	 "menuName":menuName,
	        	 "operateType":"1"
	        },
	        success: function (data){
	            if(data.code==200){
	            	
	            }
	            
	        }
		});
	}
</script>
</html>
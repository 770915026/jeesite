<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/include/taglibmobile.jsp"%>
<%@ include file="/WEB-INF/views/mobile/taier/include.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1 maximum-scale=2, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-title" content="Add to Home">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="x-rim-auto-match" content="none">
<title>登录</title>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/newtaiermobile/css/login.css">
<%
        String t = request.getParameter("t");
    %>
</head>
<body>
	<section>
		<!--菜单弹层-->

		<!--菜单弹层 end-->
		<!--HEADER-->
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
		<!--HEADER END-->
		<!--登录-->
		<div class="login-container zcdiv">
			<div class="login-top-banner"></div>
			<div class="login-form">
				<div id="messageBox"
					class="alert alert-error ${empty message ? 'hide' : ''}">
					<button data-dismiss="alert" class="close">×</button>
					<label id="loginError" class="error">${message}</label>
				</div>
				<form method="post" name="loginForm" action="${ctxOne}/login"
					id="loginForm">
					<span class="input-box"><input class="input" type="text"
						name="username" id="username" placeholder="用户名"></span> <span
						class="input-box"><input class="input" type="password"
						name="password" id="password" placeholder="密码"></span>
					<div class="code-box clearfix">
						<sys:validateCode name="validateCode" refreshtitle="换一批" />
					</div>
					<div class="login-btn" id="loginBtn">登录</div>
					<div class="login-resgin">
						<a href="${contextPath}/taier/jump/register1">立即注册</a> <a
							class="links" href="${contextPath}/taier/jump/forgetPassword">忘记密码</a>
					</div>
				</form>
			</div>
		</div>
		<!--登录 end-->
		<!--FOOTER-->
		<div class="footer-wrap">
			<ul class="footer-nav-box clearfix">
				<li><a href="${contextPath}/taier/jump/gotoFirstPage">首页</a></li>
				<li><a href="${contextPath}/taier/jump/gotoTaierauth">泰尔证书</a>
				</li>
				<li><a href="${contextPath}/taier/jump/unionInfoListUSer">信息发布</a>
				</li>
				<li><a href="${contextPath}/taier/jump/preSetAppListUSer">预置应用公示</a>
				</li>
				<li><a
					href="${contextPath}/taier/analysisReportFront/gotoAnalysisReport">行业分析报告</a>
				</li>
				<li class="liList"><span> <a
						href="${contextPath}/taier/activityFront/gotoActivity">小泰说</a>
				</span> <span> <a href="${contextPath}/taier/policyFront/gotoPolicy">政策</a>
				</span> <span> <a href="${contextPath}/taier/jump/gotoAboutUs">关于我们</a>
				</span> <span> <a href="${contextPath}/taier/jump/gotoConnectUs">联系我们</a>
				</span></li>
			</ul>
			<ul class="friend-box clearfix">
				<h3 class="friend-tit">友情链接</h3>
				<li id="linksli"></li>
			</ul>
			<p class="record-text">ICP备案号：京ICP备09013372号-25</p>
		</div>
		<!--FOOTER END-->
	</section>
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
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
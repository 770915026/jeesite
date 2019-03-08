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

ul {
	margin-right: 0px;
	margin-left: 0px;
}
</style>
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
	<!--中间部分-->
	<section class="qiye_cont w1200">
		<div class="qiye_left">
			<div class="qiye_lefttop">
				<span class="date_qiye"><img
					src="${ctxStatic}/taier/images/qiye_img1.png">2018-07-10到期</span> <span
					class="shenfen"><img
					src="${ctxStatic}/taier/images/qiye_img2.png" class="qiye_avator"><span
					class="dengji">v3</span></span> <span class="qiye_name">${fns:getUser().name}的账户</span>
			</div>
			<ul class="qiye_list">
			</ul>
		</div>
		<div class="qiye_right">
			<h3>
				<i class="icon iconfont icon-arrfill_u-copy"></i>修改密码
			</h3>
			<div class="">
				<div id="step"></div>
				<!--<div class="btns">-->
				<!--<button id="prevBtn">上一步</button>-->
				<!--<button id="btn1">跳到第二步</button>-->
				<!--<button id="btn2">跳到第三步</button>-->
				<!--</div>-->
				<!--<div class="info">index：<span id="index"></span></div>-->
				<div class="write_biao">
					<p>
						<i class="icon iconfont icon-shouji"></i><input type="text"
							value="${phone}" readonly>
					</p>
					<p>
						<i class="icon iconfont icon-tubiao_fuzhi-"></i><input type="text"
							id="code" placeholder="请输入图形验证码">
						<sys:validateCode name="validateCode" type="1" showInput="false"
							inputCssStyle="margin-bottom:0;" />
					</p>
					<p>
						<i
							class="icon iconfont icon-xinxiduanxinxiaoxitixingyoujiansixinyouxiang"></i>
						<input type="text" id="code1" placeholder="请输入短信验证码">
						<button onclick="getSMSCode()">获取验证码</button>
					</p>
					<button id="nextBtn" onclick="checkCode();">下一步</button>
				</div>
				<div class="write_biao1">
					<p>
						<i class="icon iconfont icon-mima"></i><input id="newpwd"
							type="text" placeholder="请输入新密码">
					</p>
					<p>
						<i class="icon iconfont icon-mima"></i><input id="newpwd1"
							type="text" placeholder="确认新密码">
					</p>
					<button id="nextBtn1" onclick="checkpwd();">下一步</button>
				</div>
				<div class="write_biao2">
					<img src="${ctxStatic}/taier/images/radio.png"><span>您的新密码已经修改成功！</span>返回<a
						href="javascript:void(0);" onclick="framelogout()">登录</a>页面
				</div>
			</div>
		</div>
	</section>

	<script>
    var $step = $("#step");
    var $index = $("#index");

    $step.step({
        index: 0,
        time: 500,
        title: ["身份验证", "重置密码", "完成"]
    });

    $index.text($step.getIndex());

    function checkpwd(){
        var pwdval = $("#newpwd").val();
        var pwdval1 = $("#newpwd1").val();
        if(pwdval != pwdval1) {
            alert("密码不一致");
        } else {
            var data = {};
            data.password = pwdval;
            ajax("${ctx}/taier/user/modeifyPwd",data,function (result) {
                var code  = result.code;
                if(code == 200) {
                    $step.nextStep();
                    $index.text($step.getIndex());
                    $('.write_biao1').hide();
                    $('.write_biao2').show();
                }
            });
        }


    }

    function checkCode(){
        var data = {};
        data.code = $("#code").val();
        data.code1 = $("#code1").val();
        ajax("${ctx}/taier/user/checkCode",data,function (result) {
                var code  = result.code;
                if(code == 200) {
                    $step.nextStep();
                    $index.text($step.getIndex());
                    $('.write_biao').hide()
                    $('.write_biao1').show()
                } else {
                    alert(result.hashMap.msg);
                }
        });
    }

    function getSMSCode(){
        var data = {};
        data.phone = "${phone}";
        data.type = "mpd";
        ajax("${contextPath}/taier/jump/getSMSCode",data,function (result) {});
    }
    $(function(){
        addmenu();
        $("#lm16").addClass("qiye_xuanzhong");
    })
</script>
</body>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
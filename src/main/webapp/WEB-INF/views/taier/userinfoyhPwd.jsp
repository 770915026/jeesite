<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/taier/include.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="toTop" content="true">
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

	<div class="header-box">
		<!--LOGO-->
		<div class="taier-logo fl">
			<img src="${ctxStatic}/newtaier/images/logo.jpg">
		</div>
		<!--LOGO END-->
		<!--TAB导航-->
		<dl class="public-nav">
			<dd>
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

	<section class="personal_cont">
		<div class="w1200">
			<div class="personal_left">
				<dl>
					<dt>
						<img src="${ctxStatic}/taier/images/avator.png"
							class="personal_avator">
					</dt>
					<dd>${fns:getUser().name}的账户</dd>
				</dl>
			</div>
			<div class="personal_right">
				<p class="per_titless">
					<i class="icon iconfont icon-arrfill_u-copy"></i>个人资料
				</p>
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
							<i class="icon iconfont icon-tubiao_fuzhi-"></i><input
								type="text" id="code" placeholder="请输入图形验证码">
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

</script>


	<script>
    $(function () {
        addmenu();
        $("#lm1").addClass("per_active");
    })

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
</script>
</body>
</html>
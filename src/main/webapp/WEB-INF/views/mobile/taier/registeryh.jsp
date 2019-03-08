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
<link rel="stylesheet" href="${ctxStatic}/taier/css/style.css">
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
</style>
</head>
<body>
	<section class="register_box">
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
		<div class="w1200 register1200 zcdiv">
			<h1 class="register_title">欢迎注册泰尔视角</h1>
			<form class="register_form">
				<p class="tologin">
					已有泰尔视角账号？<a href="javascript:void(0);" onclick="framelogout()">快速登录
						></a>
				</p>
				<p>
					<label>设置会员名：</label><input type="text" id="name"
						placeholder="请输入您的会员名">
				</p>
				<p>
					<label>设置密码：</label><input type="text" id="pass"
						placeholder="6-20个大小写英文字母、符号或数字">
				</p>
				<p>
					<label>确认密码：</label><input type="text" id="pass1"
						placeholder="请再次输入密码">
				</p>
				<p>
					<label>手机号：</label><input type="text" id="phone"
						placeholder="请输入手机号码">
				</p>
				<p>
					<label>短信验证码：</label><input type="text" id="code1">
					<button type="button" onclick="getSMSCode();" class="getyzm">获取验证码</button>
				</p>
				<p>
					<label>图形验证码：</label><input type="text" id="code">
					<sys:validateCode name="validateCode" refreshtitle="换一批" type="2"
						showInput="false"
						inputCssStyle="width: 192px;height: 53px;padding-left: 15px;border: 1px solid #BDC7D3;font-size: 14px;margin-top: 10px;"
						buttonCssStyle="font-size: 14px;color: #006EFF;cursor: pointer;" />
				</p>
				<button class="registerbtn" type="button" onclick="checkCode()">立即注册</button>
				<span class="registersm"><input type="checkbox" name=""
					id="chec1" checked><label class="tag-label" for="chec1"></label>我已阅读并同意《<a
					href="javascript:;" class="xiey_tc">泰尔视角服务条款</a>》《<a href="#">法律声明和隐私权政策</a>》</span>
			</form>
			<div class="xiey_waa">
				版本号： 2018v4<br>
				<br>
				<br> 提示条款<br>
				<br>
				<br> 欢迎您与各我方平台经营者（详见定义条款）共同签署本《用户服务协议》（下称“本协议”）并使用我方平台服务！ <br>
				<br>
				<br>
				各条款标题仅为帮助您理解该条款表达的主旨之用，不影响或限制本协议条款的含义或解释。为维护您自身权益，建议您仔细阅读各条款具体表述。<br>
				<br>
				<br>

				【审慎阅读】您在申请注册流程中点击同意本协议之前，应当认真阅读本协议。请您务必审慎阅读、充分理解各条款内容，特别是免除或者限制责任的条款、法律适用和争议解决条款。免除或者限制责任的条款将以粗体下划线标识，您应重点阅读。
				如您对协议有任何疑问，可向我方平台客服咨询。 <br>
				<br>
				【签约动作】当您按照注册页面提示填写信息、阅读并同意本协议且完成全部注册程序后，即表示您已充分阅读、理解并接受本协议的全部内容，并与我方平台网站达成一致，成为优酷网或我方平台“用户”。阅读本协议的过程中，如果您不同意本协议或其中任何条款约定，您应立即停止注册程序。
				<br>
				<br> 如果您未申请注册流程，您仍可浏览网站内容，但不能发表评论、弹幕或观看付费内容。<br>
				<br>
				如果您在本协议生效前已成为我方平台的注册用户，则您通过访问和/或使用我方平台网站，即视为您表示同意接受本协议的全部内容，否则请您不要访问或使用我方平台网站。
				1. 定义<br>
				<br> 我方平台：指包括优酷网（域名为
				youku.com）、土豆网（域名为tudou.com）、来疯网（域名为laifeng.com）、来玩网（域名为laiwantv.com）、搜库网（域名为soku.com）等网站、优酷视频开放平台及我方提供内容服务的互联网电视业务平台（含优酷与互联网电视播控集成机构和互联网电视内容牌照方合作的平台和与智能电视厂商合作的平台）和相关客户端（包括不限于大屏端、移动端APP、APK、SDK、API等方式）及我方和我方从事互联网视频、移动端和互联网电视内容服务的关联公司所控制、管理的媒资管理系统、CDN、服务器等及未来我方拥有、占有、使用和运营的平台。如我方关联公司（范围详见定义部分）的产品或服务中使用了我方平台提供的产品或服务，但未设独立法律声明及隐私权政策的，则本政策同样适用于该部分产品或服务。

			</div>
		</div>
	</section>
	<div class="footer-wrap">
		<ul class="footer-nav-box clearfix">
			<li><a href="${contextPath}/taier/jump/gotoFirstPage">首页</a></li>
			<li><a href="${contextPath}/taier/jump/gotoTaierauth">泰尔证书</a></li>
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
	<script>
    $('.xiey_tc').click(function(){
        $('.register1200 h1').html('泰尔视角服务条款<i class="icon iconfont icon-guanbi1 xy_close"></i>');
        $('.register_form').hide();
        $('.xiey_waa').show();
        $('.xy_close').click(function(){
            console.log('1111');
            $('.register_form').show();
            $('.xiey_waa').hide();
            $('.register1200 h1').html('欢迎注册泰尔视角');

        })
    })

</script>
	<script type="text/javascript">
    function getSMSCode(){
        var phonevl = $("#phone").val();
        if(phonevl == "") {
            alert("请输入手机号");
            return;
        }
        var data = {};
        data.phone = phonevl;
        data.type = "qyzc";
        ajax("${contextPath}/taier/jump/getSMSCode",data,function (result) {});
    }

    function istruepas(str){
        var reg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,12}$/i;
        return reg.test(str);
    }

    function istruename(str){
        var reg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{4,50}$/i;
        return reg.test(str);
    }

    function checkCode(){
        var name = $("#name").val();
        var pass = $("#pass").val();
        var pass1 = $("#pass1").val();
        var phone = $("#phone").val();
        var code = $("#code").val();
        var code1 = $("#code1").val();

        if(name == "") {
            alert("请输入用户名");
            return;
        }
        if(pass == "") {
            alert("请输入密码");
            return;
        }
        if(pass1 != pass) {
            alert("两次密码输入不一致");
            return;
        }
        if(phone == "") {
            alert("请输入手机号");
            return;
        }
        if(code == "") {
            alert("请输入手机验证码");
            return;
        }
        if(code1 == "") {
            alert("请输入图形验证码");
            return;
        }

        if(!istruename(name)){
            alert("用户名必须为4-50位的英文字母或阿拉伯数字");
            return;
        }
        if(!istruepas(pass)){
            alert("密码必须为数字字母混合，长度8-12位");
            return;
        }
        var data = {};
        data.name = name;
        data.code = $("#code").val();
        data.code1 = $("#code1").val();
        ajax("${contextPath}/taier/jump/checkCodeRegister",data,function (result) {
            var code  = result.code;
            if(code == 200) {
                var data1 = {};
                data1.name = name;
                data1.newPassword = pass;
                data1.userType = "${user.userType}";
                data1.phone = phone;
                ajax("${contextPath}/taier/jump/registerSave",data1,function (result) {
                    var code  = result.code;
                    if(code == 200) {
                        alert("注册成功");
                        window.location.href='${ctx}/logout';
                    } else {
                        alert(result.hashMap.msg);
                    }
                });
            } else {
                alert(result.hashMap.msg);
            }
        });
    }

    $(function(){
        $('#pass').keyup(function () {
            var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
            var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
            var enoughRegex = new RegExp("(?=.{6,}).*", "g");

            if (false == enoughRegex.test($(this).val())) {
                $('#level').removeClass('pw-weak');
                $('#level').removeClass('pw-medium');
                $('#level').removeClass('pw-strong');
                $('#level').addClass(' pw-defule');
                //密码小于六位的时候，密码强度图片都为灰色
            }
            else if (strongRegex.test($(this).val())) {
                $('#level').removeClass('pw-weak');
                $('#level').removeClass('pw-medium');
                $('#level').removeClass('pw-strong');
                $('#level').addClass(' pw-strong');
                //密码为八位及以上并且字母数字特殊字符三项都包括,强度最强
            }
            else if (mediumRegex.test($(this).val())) {
                $('#level').removeClass('pw-weak');
                $('#level').removeClass('pw-medium');
                $('#level').removeClass('pw-strong');
                $('#level').addClass(' pw-medium');
                //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等
            }
            else {
                $('#level').removeClass('pw-weak');
                $('#level').removeClass('pw-medium');
                $('#level').removeClass('pw-strong');
                $('#level').addClass('pw-weak');
                //如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的
            }
            return true;
        });
        if(window.parent.refreshHeight){
            window.parent.refreshHeight();
        }
    })

    function framelogout(){
        window.parent.location.href='${ctx}/logout';
    }
</script>
</body>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/taier/include.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="toTop" content="true">
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/newtaier/css/style.css">
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

	<section class="register_box">
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
		<div class="register1200 qiye_reg">
			<h2>企业注册</h2>
			<div>说明：目前网站支持的业务有进网业务的在线下单、查询，CCC、企业信息联合发布、预置应用公示、其他委托业务的下单、查询业务</div>
		</div>
		<div class="qiye_reg">
			<div class="zhuce1">
				<p class="acc_info">账号信息</p>
				<form class="acc_form">
					<p>
						<label>用户名<sup>*</sup>：
						</label><input id="name" type="text" placeholder="4-50位的英文字母或阿拉伯数字 ">
					</p>
					<p>
						<label>密码<sup>*</sup>：
						</label><input id="pass" placeholder="必须为数字字母混合，长度8-12位"
							class="input-style" size="30" maxlength="30" name="pass"
							type="text" />
					</p>
					<div id="level" class="pw-strength">
						<label>密码强度监测<sup>*</sup>：
						</label> <span class="pwd_qiang">
							<div class="pw-bar"></div>
							<div class="pw-bar-on"></div>
							<div class="pw-txt">
								<span>弱</span> <span>中</span> <span>强</span>
							</div>
						</span>
					</div>
					<p>
						<label>确认密码<sup>*</sup>：
						</label><input id="pass1" type="text" />
					</p>
					<p>
						<label>手机<sup>*</sup>：
						</label><input id="phone" type="text"
							placeholder="办理进网业务的手机应与中国泰尔实验室预留厂家信息一致，本网站的验证码将发送该手机号上，请输入验证码验证。" />
					</p>
					<p class="telyzm">
						<label>手机验证码<sup>*</sup>：
						</label><input id="code1" type="text" /><span style="cursor: pointer;"
							onclick="getSMSCode();">发送验证码</span>
					</p>
					<p class="graphical">
						<label> 图形验证码<sup>*</sup>：
						</label><input id="code" type="text" />
						<sys:validateCode name="validateCode" refreshtitle="换一批" type="2"
							showInput="false"
							inputCssStyle="width: 192px;height: 53px;padding-left: 15px;border: 1px solid #BDC7D3;font-size: 14px;margin-top: 10px;"
							buttonCssStyle="font-size: 14px;color: #006EFF;cursor: pointer;" />
					</p>
				</form>
				<span class="registersm registersm1"><input type="checkbox"
					name="" id="chec1" checked><label class="tag-label"
					for="chec1"></label>我已阅读并同意《<a href="javascript:;" class="xiey_a">泰尔视角服务条款</a>》《<a
					href="#">法律声明和隐私权政策</a>》</span>
				<button class="immediately" onclick="checkCode()">立即注册</button>
			</div>
			<div class="qiyezhuce1">
				<p class="acc_info">
					泰尔视角服务条款<i class="icon iconfont icon-guanbi1 xy_close"></i>
				</p>
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
		</div>
	</section>
	<script>
    $('.xiey_a').click(function(){
        $('.zhuce1').hide();
        $('.qiyezhuce1').show();
        $('.xiey_waa').show();
        $('.qiyezhuce1 .acc_info').show()
        $('.xy_close').click(function(){
            $('.zhuce1').show();
            $('.qiyezhuce1').hide();
            $('.xiey_waa').hide();

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
        if(pass1 != pass) {
            alert("两次密码输入不一致");
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
                            window.parent.location.href='${ctx}/logout';
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
</script>


</body>
</html>
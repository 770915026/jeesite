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

.dela {
	display: block;
	color: black;
	position: absolute;
	right: 0px;
	top: 0px;
	width: 20px;
	height: 20px;
	z-index: 1002;
	line-height: 20px;
}

.appli_file a {
	color: black !important;
}

.appli_file a:hover {
	color: black !important;
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
	<%--<section class="qiye_cont w1200">
   <div class="qiye_left">
        <div class="qiye_lefttop">
            <span class="date_qiye"><img src="${ctxStatic}/taier/images/qiye_img1.png">2018-07-10到期</span>
            <span class="shenfen"><img src="${ctxStatic}/taier/images/qiye_img2.png" class="qiye_avator"><span class="dengji">v3</span></span>
            <span class="qiye_name">${fns:getUser().name}的账户</span>
        </div>
        <ul class="qiye_list">
        </ul>

    </div> --%>

	<!--弹出层-->
	<div class="tcc_appli" id="yldiv"
		style="display: none; z-index: 20000;">
		<div class="tcc_a" style="margin-top: 0px; height: 100%;">
			<div class="w1200">
				<p class="know_name">

					<span style="cursor: pointer;" onclick="history.go(-1)"><i
						class="icon iconfont icon-guanbi1"></i> 返回</span>
				</p>
				<div class="swiper-container tel_swiper">
					<div class="swiper-wrapper" id="yldt"></div>
					<!-- Add Arrows -->
					<div class="swiper-button-next">
						<img src="${ctxStatic}/taier/images/xq_img2.png">
					</div>
					<div class="swiper-button-prev">
						<img src="${ctxStatic}/taier/images/xq_img3.png">
					</div>
				</div>
				<div class="detailed_box">
					<h1>${tlCompanyUnionInfo.productName}</h1>
					<div class="detailed_cont">
						<ul>
							<li class="li_active0" onclick="showyltb(this,5)">配置信息</li>
							<li onclick="showyltb(this,1)">产品介绍</li>
							<li onclick="showyltb(this,2)">国内证书信息</li>
							<li onclick="showyltb(this,3)" style="display: none;">国际认证信息</li>
							<li onclick="showyltb(this,4)">泰尔证书信息</li>
						</ul>
						<div>
							<div class="config1" id="cf5"></div>
							<div class="config1" id="cf1"></div>
							<div class="config1" id="cf2"></div>
							<div class="config1" id="cf3"></div>
							<div class="config1" id="cf4"></div>
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>
	<script>

</script>



	<script>
    $(function(){
    	showyl()
        //产品照片
        var cpzps = "${tlCompanyUnionInfo.productImgs}";
        var cpzpary = cpzps.split("||");
        var cpzphtml = "";
        for(var i=0;i<cpzpary.length;i++){
            if(cpzpary[i]) {
                cpzphtml += '<span class="look_img1"><img src="' + cpzpary[i] + '"></span>';
            }
        }
        $("#cpzp").append(cpzphtml);

        //配置信息
        var configureType = "${tlCompanyUnionInfo.configureType}";
        var pzxxhtml = "";
        var cf1html = "";
        if(configureType == "0") {
            var configureImg = '${tlCompanyUnionInfo.configureImg}'.split("||");
            var configureTitle = '${tlCompanyUnionInfo.configureTitle}'.split("||");
            var configureContent = '${tlCompanyUnionInfo.configureContent}'.split("||");
            for(var i=0;i<configureImg.length-1;i++){
                pzxxhtml += '<span style="margin-top: 20px;display: block;"><div href="javascript:;" class="appli_file pei_input"> <img src="'+configureImg[i]+'" style="width: 100%; height: 100%; position: absolute; z-index: 1000; left: 0px;"/>\n' +
                    '                        </div><input type="text" readonly style="margin-top: 15px;" class="pzxxbt" value="'+configureTitle[i]+'" placeholder=""><textarea readonly class="appli_text appli_text1">'+configureContent[i]+'</textarea></span>';
                cf1html += '<dl class="config_img"  style="width: 100%;"><dt style="margin-left: auto;margin-right: auto;"><img src="'+configureImg[i]+'"></dt><dd class="config_tittext">"'+configureTitle[i]+'"</dd><dd style="word-break: break-all;">'+configureContent[i]+'</dd></dl>';
            }
        } else {
            pzxxhtml = '<span style="word-break: break-all;line-height: 24px;">'+'${tlCompanyUnionInfo.configureContent}'+'</span>';
            cf1html += '<span style="word-break: break-all;line-height: 24px;">'+'${tlCompanyUnionInfo.configureContent}'+'</span>';
        }
        $("#pzxx").append(pzxxhtml);
        $("#cf1").append(cf1html);

        //国内认证
        var auth1Img = '${tlCompanyUnionInfo.auth1Img}'.split("||");
        var auth1Content = '${tlCompanyUnionInfo.auth1Content}'.split("||");
        var gnrzhtml = "";
        var cf2html = "";
        for(var i=0;i<auth1Img.length-1;i++){
            gnrzhtml += ' <span class="look_img1"><img src="'+auth1Img[i]+'"></span><span class="miaoshu_appli"  style="word-break: break-all;width: 60%;line-height: 25px;">'+auth1Content[i]+'</span><br/>';
            cf2html += '<dl class="config_img"><dt><img src="'+auth1Img[i]+'"></dt><dd style="word-break: break-all;">'+auth1Content[i]+'</dd></dl>';
        }
        $("#gnrz").append(gnrzhtml);
        $("#cf2").append(cf2html);

        //国际认证
        var auth2Img = '${tlCompanyUnionInfo.auth2Img}'.split("||");
        var auth2Content = '${tlCompanyUnionInfo.auth2Content}'.split("||");
        var gjrzhtml = "";
        var cf3html = "";
        for(var i=0;i<auth2Img.length-1;i++){
            gjrzhtml += ' <span class="look_img1"><img src="'+auth2Img[i]+'"></span><span class="miaoshu_appli"  style="word-break: break-all;width: 60%;line-height: 25px;">'+auth2Content[i]+'</span><br/>';
            cf3html += '<dl class="config_img"><dt><img src="'+auth2Img[i]+'"></dt><dd style="word-break: break-all;">'+auth2Content[i]+'</dd></dl>';
        }
        $("#gjrz").append(gjrzhtml);
        $("#cf3").append(cf3html);


        //泰尔认证
        var auth3Img = '${tlCompanyUnionInfo.auth3Img}'.split("||");
        var auth3Content = '${tlCompanyUnionInfo.auth3Content}'.split("||");
        var terzhtml = "";
        var cf4html = "";
        for(var i=0;i<auth3Img.length-1;i++){
            terzhtml += ' <span class="look_img1"><img src="'+auth3Img[i]+'"></span><span class="miaoshu_appli"  style="word-break: break-all;width: 60%;line-height: 25px;">'+auth3Content[i]+'</span><br/>';
            cf4html += '<dl class="config_img"><dt><img src="'+auth3Img[i]+'"></dt><dd style="word-break: break-all;">'+auth3Content[i]+'</dd></dl>';
        }
        $("#terz").append(terzhtml);
        $("#cf4").append(cf4html);

        $("#cf5").append('<span style="word-break: break-all;line-height: 24px;">'+'${tlCompanyUnionInfo.productintro}'+'</span>');

        var productImgs = "${tlCompanyUnionInfo.productImgs}".split("||");
        var productImgshtml = "";
        for(var i=0;i<productImgs.length-1;i++){
            if(productImgs[i]){
                productImgshtml += '<div class="swiper-slide"><img style="width: 100%;" src="'+productImgs[i]+'"></div>';
            }
        }
        $("#yldt").append(productImgshtml);
        var swiper = new Swiper('.swiper-container', {
            observer:true,
            observeParents:true,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev'
            }
        });
    })

    function showyl(){
        $("#yldiv").show();
    }


    function showyltb(obj, idx){
        $(".li_active0").removeClass("li_active0");
        $(obj).addClass("li_active0");
        $("#cf1").hide();$("#cf2").hide();$("#cf3").hide();$("#cf4").hide();$("#cf5").hide();
        $("#cf"+idx).show();
    }


</script>
</body>
<script type="text/javascript" src="${ctxStatic}/taier/js/swiper.min.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
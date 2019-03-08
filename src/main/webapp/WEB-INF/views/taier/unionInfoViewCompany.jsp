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
		<div class="qiye_right operation_box">
			<h3>
				<i class="icon iconfont icon-arrfill_u-copy"></i>企业联合信息发布
			</h3>
			<p class="appli_name">
				任务编号：${tlCompanyUnionInfo.tableName} <span class="appli_look">
					<span style="cursor: pointer;" onclick="showyl()"><i
						class="icon iconfont icon-yanjing"></i>预览提交</span> <span
					style="cursor: pointer;" onclick="modifyTable()"><i
						class="icon iconfont icon-xiugai"></i>修改</span>
				</span>
			</p>
			<table class="qiye_table table table-bordered">
				<tr>
					<td>产品名称</td>
					<td>${tlCompanyUnionInfo.productName}</td>
				</tr>
				<tr>
					<td>产品型号</td>
					<td>${tlCompanyUnionInfo.productVersion}</td>
				</tr>
				<tr>
					<td>产品照片</td>
					<td id="cpzp"></td>
				</tr>
				<tr>
					<td>配置信息</td>
					<td id="cpjs"></td>
				</tr>
				<tr>
					<td>产品介绍</td>
					<td id="pzxx"></td>
				</tr>
				<tr>
					<td>国内证书信息</td>
					<td id="gnrz"></td>
				</tr>
				<tr style="display: none;">
					<td>国际认证</td>
					<td id="gjrz"></td>
				</tr>
				<tr>
					<td>泰尔证书信息</td>
					<td id="terz"></td>
				</tr>
			</table>
			<input style="margin-left: 50%;" id="btnCancel" class="btn"
				type="button" value="返 回" onclick="history.go(-1)" />
		</div>

	</section>

	<!--弹出层-->
	<div class="tcc_appli" id="yldiv"
		style="display: none; z-index: 20000;">
		<div class="tcc_a" style="margin-top: 0px;">
			<div class="w1200">
				<p class="know_name">
					<c:if test="${tlCompanyUnionInfo.flag eq '0'}">
						<span style="cursor: pointer;"
							onclick="submittable('${tlCompanyUnionInfo.id}')"><i
							class="icon iconfont icon-tijiao1"></i> 提交发布申请</span>
					</c:if>

					<span style="cursor: pointer;" onclick="hideyl()"><i
						class="icon iconfont icon-guanbi1"></i> 关闭</span>
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



	<!--弹出层-->
	<div class="tcc_appli" id="bkxg" style="z-index: 20004; display: none;">
		<div class="appli_white">
			<h1>温馨提示</h1>
			<span class="tc_cont">需联系在线客服解锁后变更信息</span> <span class="sure_btn"
				onclick="$('#bkxg').hide();" style="left: 0px;">确定</span>
		</div>
	</div>



	<script>
    $(function(){
        addmenu();
        $("#lfywlist").show();
        $("#lflist1").show();
        $("#lm7").addClass("qiye_xuanzhong");
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
        $("#cpjs").append('<span style="word-break: break-all;line-height: 24px;">'+'${tlCompanyUnionInfo.productintro}'+'</span>');
        $("#cf5").append('<span style="word-break: break-all;line-height: 24px;">'+'${tlCompanyUnionInfo.productintro}'+'</span>');

        //配置信息
        var configureType = "${tlCompanyUnionInfo.configureType}";
        var pzxxhtml = "";
        var cf1html = "";
        if(configureType == "0") {
            var configureImg = '${tlCompanyUnionInfo.configureImg}'.split("||");
            var configureTitle = '${tlCompanyUnionInfo.configureTitle}'.split("||");
            var configureContent = '${tlCompanyUnionInfo.configureContent}'.split("||");
            for(var i=0;i<configureImg.length-1;i++){
                pzxxhtml += '<span style="margin-top: 20px;display: block;">'+
                	'<div href="javascript:;" class="appli_file pei_input"> '+
                	'<img src="'+configureImg[i]+'" style="width: 100%; height: 100%; position: absolute; z-index: 1000; left: 0px;"/>\n' +
                    '                        </div>'+
                    /* '<input type="text" readonly style="margin-top: 15px;" class="pzxxbt" value="'+configureTitle[i]+'" placeholder="">'+ */
                    /* '<textarea readonly class="appli_text appli_text1">'+configureContent[i]+'</textarea>'+ */
                   
                    '</span>'+
                    '<span>'+configureContent[i]+'</span>';
                cf1html += '<dl class="config_img" style="width: 100%;"><dt style="margin-left: auto;margin-right: auto;"><img src="'+configureImg[i]+'"></dt>'+
                /* '<dd class="config_tittext">"'+configureTitle[i]+'"</dd>'+ */
                '<dd style="word-break: break-all;">'+configureContent[i]+'</dd></dl>';
            }
        } else {
            pzxxhtml = '<span style="word-break: break-all;line-height: 24px;">'+'${tlCompanyUnionInfo.configureContent}'+'</span>';
            cf1html += '<span style="word-break: break-all;line-height: 24px;">'+'${tlCompanyUnionInfo.configureContent}'+'</span>';
        }
        $("#pzxx").append(pzxxhtml);
        $("#cf1").append(cf1html);

        //国内认证11
        var f;
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
        parent.window.refreshHeight();
    })

    function showyl(){
        $("#yldiv").show();
    }

    function hideyl(){
        $("#yldiv").hide();
    }

    function showyltb(obj, idx){
        $(".li_active0").removeClass("li_active0");
        $(obj).addClass("li_active0");
        $("#cf1").hide();$("#cf2").hide();$("#cf3").hide();$("#cf4").hide();$("#cf5").hide();
        $("#cf"+idx).show();
    }

    function submittable(id){
        var data = {};
        data.id = id;
        ajax("${ctx}/taier/tlCompanyUnionInfo/submit",data,function (result) {
            var code  = result.code;
            if(code == 200) {
                alert("提交成功");
                window.location.href="${ctx}/taier/tlCompanyUnionInfo/checkStatus";
            } else {
                alert("提交失败");
            }
        });
    }

    function modifyTable(){
        var im = "${tlCompanyUnionInfo.modifiable}";
        if(im == "0"){
            $("#bkxg").show();
        } else {
            window.location.href='${ctx}/taier/tlCompanyUnionInfo/modifyTable?id=${tlCompanyUnionInfo.id}';
        }
    }
</script>
</body>
<script type="text/javascript" src="${ctxStatic}/taier/js/swiper.min.js"></script>
</html>
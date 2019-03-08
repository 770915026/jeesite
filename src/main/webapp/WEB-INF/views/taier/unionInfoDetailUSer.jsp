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
	href="${ctxStatic}/newtaier/css/informationdDelivery.css">
<link rel="stylesheet" href="${ctxStatic}/taier/css/style.css">
<link href="${ctxStatic}/taier/css/swiper.min.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" src="${ctxStatic}/taier/js/swiper.min.js"></script>
<style>
.divcurrent {
	border: 2px solid #006eff;
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
	<div class="container" style="padding-left: 0px; padding-right: 0px;">
		<!--右侧滚动导航-->
		<div class="taier-tips">
			<dl>
				<dd class="list">
					<a href="javascript:;">在线业务</a>
				</dd>
				<dd>
					<a href="${ctx}/taier/theNet/gotoCCC">CCC<br />业务
					</a>
				</dd>
				<dd>
					<a href="${ctx}/taier/theNet/gotoTheNet">进网<br />业务
					</a>
				</dd>
				<dd>
					<a href="javascript:;">国内<br />委托
					</a>
				</dd>
				<dd>
					<a href="javascript:;">网站<br />业务
					</a>
				</dd>
				<dd>
					<a href="javascript:;" class="ketan">客服<br />中心
					</a>
				</dd>
			</dl>
		</div>
		<!--右侧滚动导航 end-->
		<!--头部-->
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
				<dd class="current">
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
				</span>


				<c:if test="${fns:getUser().name eq null}">
					<a class="input-btn" href="${ctx}/logout">登录</a>
					<a class="input-btn" href="${contextPath}/taier/jump/register1">注册</a>
				</c:if>
				<c:if test="${fns:getUser().name ne null}">
					<a class="input-btn" href="javascript:void(0);"
						onclick="showuserinfo(this)">${fns:getUser().name}</a>
					<a class="input-btn" href="javascript:void(0);"
						onclick="framelogout()">退出登陆</a>
				</c:if>
			</div>
			<!--SEARCH END-->
		</div>
		<!--头部 END-->
		<!--主体-->
		<div class="taier-information-wrap">
			<!--顶部-->
			<div class="information-header">
				<div class="taier-container-outer">
					<span class="informationd-tit">企业信息发布</span>
					<div class="informationd-form">
						<div class="selectBox">
							<select id="select" name="select" style="line-height: 46px;">
								<option value="">产品名称</option>
							</select>
						</div>
						<div class="inputBox">
							<input class="input" type="" name="" id="textinp"
								style="line-height: 30px;" placeholder="品牌名称、型号、获证情况">
						</div>
						<a class="search" href="javascript:;" style="margin-right: 0px;"
							onclick="xxfb('','','','')"></a>
					</div>
				</div>
			</div>
			<!--顶部 end-->
			<!--产品相关-->
			<div class="taier-container-outer">
				<!--产品配置导航-->
				<div class="detailed-nav clearfix" id="dhl"></div>
				<!--产品配置导航 end-->
			</div>
			<!--产品相关 end-->
			<!--介绍-->
			<div class="taier-container-outer">
				<div class="product-intro-wrap">
					<!--左侧产品图-->
					<div class="preview-wrap">
						<!--产品框架-->
						<div class="preview-box">
							<!--大图-->
							<div class="preview-big-img">
								<ul id="yldt">
									<li><img id="bigimg" onclick="showprobigimg(this)" src="">
									</li>
								</ul>
							</div>
							<!--大图 end-->
							<!--小图-->
							<div class="preview-small-box">
								<span class="leftArrow"></span> <span class="rightArrow"></span>
								<div class="preview-small-img" id="yldtxt" class="yldtxt">
								</div>
							</div>
							<!--小图 end-->
						</div>
						<!--产品框架 end-->
						<div class="preview-text">
							<p></p>
						</div>
					</div>
					<!--左侧产品图 end-->
					<!--右侧产品介绍-->
					<div class="preview-box-right">
						<h4 class="preview-right-tit">${tlCompanyUnionInfo.productName}
						</h4>
						<div class="preview-nav">
							<span id="tbspan2" class="tbspan"><a id="tba2"
								style="color: black !important" href="javascript:void(0);"
								onclick="showyltb(this,2)">国内证书信息</a></span> <span id="tbspan5"
								class="tbspan current"><a id="tba5"
								style="color: black !important" href="javascript:void(0);"
								onclick="showyltb(this,5)">配置信息</a></span> <span id="tbspan1"
								class="tbspan"><a id="tba1"
								style="color: black !important" href="javascript:void(0);"
								onclick="showyltb(this,1)">产品介绍</a></span> <span id="tbspan4"
								class="tbspan"><a id="tba4"
								style="color: black !important" href="javascript:void(0);"
								onclick="showyltb(this,4)">泰尔证书信息</a></span>
						</div>
						<!--产品介绍-->
						<div class="product-box-list" id="cf5"></div>
						<div class="product-box-list" id="cf1"></div>
						<div class="product-box-list" id="cf2"></div>
						<div class="product-box-list" id="cf3"></div>
						<div class="product-box-list" id="cf4"></div>

						<!--产品介绍 end-->
					</div>
					<!--右侧产品介绍 end-->
					<div class="clear"></div>
					<!--参与评论-->
					<div class="w1200" style="width: 100%;">
						<div class="xq_title xq_title2">参与评论</div>
						<div class="writebox">
							<textarea placeholder="" class="writepl" id="content"></textarea>
							<input type="hidden" id="parentcommid">
							<div class="pltj">
								<c:if test="${fns:getUser().userType eq null}">
									<a href="javascript:void(0);" onclick="framelogout()">登录</a>后参与评论
                            </c:if>
								<c:if test="${fns:getUser().userType ne null}">
									<button onclick="saveComments('${tlCompanyUnionInfo.id}')">提交评论</button>
								</c:if>
							</div>
						</div>
						<div class="xq_title xq_title2">最新评论</div>
						<div class="pl_lists" style="margin-bottom: 50px;">
							<div id="commentList"></div>
							<p class="rela_more">
								<a href="javascript:void(0);" id="getMoreComments"
									onclick="getMoreComments()">查看更多评论 >></a>
							</p>
						</div>

					</div>
					<!--最新评论 end-->
				</div>
			</div>
			<!--介绍 end-->

		</div>
		<!--主体 END-->
		<!--FOOTER-->
		<div class="footer-wrap" id="contactUs">
			<div class="footer-outer">
				<!--联系方式-->
				<div class="footer-container lines">
					<div class="enterprise-intro">
						<div class="maps fl">
							<div id=container style="height: 100%; width: 100%;"></div>
						</div>
						<div class="contact-us fr">
							<h3 class="title">联系我们</h3>
							<p class="text">
								公司地址: <span id="address"></span><br />联系电话：<span id="phone"></span><br />泰尔邮箱：<span
									id="email"></span>
							</p>
							<h3 class="title mt26">关注泰尔视角</h3>
							<p class="follow-us">
								<img id="qrwximg"
									src="${ctxStatic}/newtaier/images/taier-ico02.png"> <img
									id="qrwbimg" src="${ctxStatic}/newtaier/images/taier-ico03.png">
							</p>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<!--联系方式 end-->
				<!--在线留言-->
				<div class="footer-container">
					<div class="online-message">
						<h3 class="title">在线留言</h3>
						<div class="form-box">
							<span class="input-box"> <input class="input"
								style="width: 209px;" id="lyname" type="text" placeholder="姓名">
								<input class="input" style="width: 209px;" id="lyphone"
								type="tel" placeholder="电话"> <input class="input"
								style="width: 209px;" id="lyemail" type="email" placeholder="邮箱">
							</span>
							<div class="textarea-box">
								<span class="textarea-div" style="text-align: left;"> <textarea
										class="textarea" placeholder="" id="lycontent"
										style="width: 100%;"></textarea>
								</span>
							</div>
							<div style="margin-top: 15px;">
								<a class="input-btn" href="javascript:void(0);" id="lyBtn">留言</a>
							</div>

						</div>
					</div>
				</div>
				<!--在线留言 end-->
			</div>
			<!--友情链接-->
			<div class="footer-container">
				<div class="oem-wrap">
					<div class="oem-outer lines">
						<h3 class="title">友情链接</h3>
						<div class="oem-link">
							<c:forEach items="${linkList }" var="link">
								<a href="${link.linkUrl }" target="_blank">${link.title }&nbsp;&nbsp;|</a>
							</c:forEach>
						</div>
					</div>
					<div class="record-number">ICP备案号：京ICP备09013372号-25</div>
				</div>

			</div>
			<!--友情链接 end-->
		</div>
		<!--FOOTER END-->
	</div>
	<div id="bigimgprodiv" class="tan_swiper"
		style="display: none; position: fixed; top: 0; width: 100%; background: rgba(0, 0, 0, 0.5); height: 100%; z-index: 999">
		<div class="swiper-container big_swiper"
			style="width: 540px; margin: 5% auto; height: 40%">
			<span onclick="closeprobigimg()"
				style="position: absolute; right: 0px; top: 0px; width: 23px; height: 40px; z-index: 1000; font-size: 20px; cursor: pointer;">X</span>
			<div class="swiper-wrapper" id="bigproductimg">
				<div class="swiper-slide" style="width: 540px; height: 540px;">
					<img id="probigimg" src=""
						style="max-width: 400px; max-height: 540px;">
				</div>
			</div>
			<!-- Add Arrows -->
		</div>
	</div>
	<div id="bigimgauthdiv" class="tan_swiper"
		style="display: none; position: fixed; top: 0; width: 100%; background: rgba(0, 0, 0, 0.5); height: 100%; z-index: 999">
		<div class="swiper-container big_swiper"
			style="width: 540px; margin: 5% auto; height: 40%">
			<span onclick="closeauthbigimg()"
				style="position: absolute; right: 0px; top: 0px; width: 23px; height: 40px; z-index: 1000; font-size: 20px; cursor: pointer;">X</span>
			<div class="swiper-wrapper" id="bigauthimg"></div>
		</div>
	</div>
	<script>

    var pp = "${pp}";
    var nc = "${nc}";
    var cc = "${cc}";
    function createdhl(){
        var str = "";
        if(pp != ""){
            str+='<span style="cursor: pointer;" onclick="xxfb(\'\',\''+pp+'\',\'\',\'\')">'+pp+'></span>';
        }
        if(nc != ""){
            str+='<span style="cursor: pointer;" onclick="xxfb(\'\',\''+pp+'\',\''+nc+'\',\'\')">'+nc+'></span>';
        }
        if(cc != ""){
            str+='<span  style="cursor: pointer;" onclick="xxfb(\'\',\''+pp+'\',\''+nc+'\',\''+cc+'\')">'+cc+'></span>';
        }
        $("#dhl").html(str);
    }
    function xxfb(text,pp,nc,cc) {
        if(pp==""){
            text = $("#textinp").val();
            window.location.href="${contextPath}/taier/jump/unionInfoListUSer?text="+text;
        } else {
            window.location.href='${contextPath}/taier/jump/unionInfoListUSer?pp='+pp+'&nc='+nc+'&cc='+cc;
        }

    }
    $(function () {
        createdhl();
    })
</script>
	<script>

    function closeprobigimg(){
        $("#bigimgprodiv").hide();
    }
    function showprobigimg(obj){
        $("#probigimg").attr("src",$(obj).attr("src"));
        $("#bigimgprodiv").show();
    }

    function showbigimg(obj){
        $(".imgpro").parent().removeClass("current");
        $(obj).parent().addClass("current");

        $("#bigimg").attr("src",$(obj).attr("src"));
    }
    function closeauthbigimg(){
        $("#bigimgauthdiv").hide();
    }
    function showauthbigimg(url){
        $("#bigauthimg").html("");
        $("#bigauthimg").html('<div class="swiper-slide" style="width: 540px;height: 540px;"><img src="'+url+'" style="max-width: 400px;max-height: 540px;"></div>');
        $("#bigimgauthdiv").show();
    }

    var swiper = new Swiper('.swiper-container', {
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev'
        }
    });
</script>
	<script type="text/javascript">
    $('.detailed_cont ul li').click(function() {
        $('.detailed_cont ul li').removeClass('li_active0');
        $(this).addClass('li_active0');
        $('.config1').eq($(this).index()).show().siblings().hide();
    });

    $(function(){
        //产品照片
        var productImgs = "${tlCompanyUnionInfo.productImgs}".split("||");
        var productImgshtml = "";
        var productxtImgshtml = "";
        var productBigImgshtml = "";
        for(var i=0;i<productImgs.length-1;i++){
            if(productImgs[i]){
                var curr = "";
                if(i==0) {
                    curr = "divcurrent";
                    $("#bigimg").attr("src",productImgs[i]);
                }
                productxtImgshtml += '<div class="'+curr+'" style="list-style: none;display: inline-block;"><img class="img imgpro"  style="width: 62px;height: 62px;" onclick="showbigimg(this)" src="${ctxStatic}/newtaier/images/taier-ico02.png"></div>';
                productBigImgshtml += '';
            }
        }
        $("#yldtxt").append(productxtImgshtml);
        var swiper = new Swiper('.yldtxt', {
            spaceBetween:30,
            slidesPerGroup:3,
            observer:true,
            observeParents:true,
            navigation: {
                nextEl: '.leftArrow',
                prevEl: '.rightArrow'
            }
        });






        //配置信息
        var configureType = "${tlCompanyUnionInfo.configureType}";
        var pzxxhtml = "";
        var cf1html = "";
        if(configureType == "0") {
            var configureImg = "${tlCompanyUnionInfo.configureImg}".split("||");
            var configureTitle = "${tlCompanyUnionInfo.configureTitle}".split("||");
            var configureContent = '${tlCompanyUnionInfo.configureContent}'.split("||");
            for(var i=0;i<configureImg.length-1;i++){
                pzxxhtml += '<span style="margin-top: 20px;display: block;"><div href="javascript:;" class="appli_file pei_input"> <img onclick="showauthbigimg('+configureImg[i]+')" src="'+configureImg[i]+'" style="width: 100%; height: 100%; position: absolute; z-index: 1000; left: 0px;"/>\n' +
                    '                        </div><input type="text" readonly style="margin-top: 15px;" class="pzxxbt" value="'+configureTitle[i]+'" placeholder=""><textarea readonly class="appli_text appli_text1">'+configureContent[i]+'</textarea></span>';
                cf1html += '<dl class="config_img" style="width: 100%;">'+
                				'<dt style="margin-left: auto;margin-right: auto;"><img onclick="showauthbigimg(\''+configureImg[i]+'\')"  src="'+configureImg[i]+'"></dt>'+
                				'<dd style="word-break: break-all;">'+configureContent[i]+'</dd>'+
                		   '</dl>';
            }
        } else {
            pzxxhtml = '<span style="word-break: break-all;line-height: 24px;">'+'${tlCompanyUnionInfo.configureContent}'+'</span>';
            cf1html += '<span style="word-break: break-all;line-height: 24px;">'+'${tlCompanyUnionInfo.configureContent}'+'</span>';
        }
        $("#pzxx").append(pzxxhtml);
        $("#cf1").append(cf1html);

        //国内认证
        var auth1Img = "${tlCompanyUnionInfo.auth1Img}".split("||");
        var auth1Content = '${tlCompanyUnionInfo.auth1Content}'.split("||");
        var gnrzhtml = "";
        var cf2html = "";
        for(var i=0;i<auth1Img.length-1;i++){
        	var imgHtml='';
        	var imgSrc=auth1Img[i];
        	if(imgSrc!=''){
        		imgHtml+='<dt><img onclick="showauthbigimg(\''+imgSrc+'\')" src="'+imgSrc+'"></dt>';
        	}
            gnrzhtml += ' <span class="look_img1"><img src="'+auth1Img[i]+'"></span><span class="miaoshu_appli"  style="word-break: break-all;width: 60%;line-height: 25px;">'+auth1Content[i]+'</span><br/>';
            cf2html += '<dl class="config_img">'+
            				imgHtml+
            				'<dd style="word-break: break-all;">'+auth1Content[i]+'</dd>'+
            			'</dl>';
        }
        $("#gnrz").append(gnrzhtml);
        $("#cf2").append(cf2html);

        //国际认证
        var auth2Img = "${tlCompanyUnionInfo.auth2Img}".split("||");
        var auth2Content = "${tlCompanyUnionInfo.auth2Content}".split("||");
        var gjrzhtml = "";
        var cf3html = "";
        for(var i=0;i<auth2Img.length-1;i++){
        	var imgHtml='';
        	var imgSrc=auth2Img[i];
        	if(imgSrc!=''){
        		imgHtml+='<dt><img onclick="showauthbigimg(\''+imgSrc+'\')" src="'+imgSrc+'"></dt>';
        	}
            gjrzhtml += ' <span class="look_img1"><img src="'+auth2Img[i]+'"></span><span class="miaoshu_appli"  style="word-break: break-all;width: 60%;line-height: 25px;">'+auth2Content[i]+'</span><br/>';
            cf3html += '<dl class="config_img">'+
            				imgHtml+
            				'<dd style="word-break: break-all;">'+auth2Content[i]+'</dd>'+
            		   '</dl>';
        }
        $("#gjrz").append(gjrzhtml);
        $("#cf3").append(cf3html);

        //泰尔认证
        var auth3Img = "${tlCompanyUnionInfo.auth3Img}".split("||");
        var auth3Content = '${tlCompanyUnionInfo.auth3Content}'.split("||");
        var terzhtml = "";
        var cf4html = "";
        for(var i=0;i<auth3Img.length-1;i++){
        	var imgHtml='';
        	var imgSrc=auth3Img[i];
        	if(imgSrc!=''){
        		imgHtml+='<dt><img onclick="showauthbigimg(\''+imgSrc+'\')" src="'+imgSrc+'"></dt>';
        	}
            terzhtml += ' <span class="look_img1"><img src="'+auth3Img[i]+'"></span><span class="miaoshu_appli"  style="word-break: break-all;width: 60%;line-height: 25px;">'+auth3Content[i]+'</span><br/>';
            cf4html += '<dl class="config_img">'+
            				imgHtml+
            				'<dd style="word-break: break-all;">'+auth3Content[i]+'</dd>'+
            		   '</dl>';
        }
        $("#terz").append(terzhtml);
        $("#cf4").append(cf4html);

        $("#cf5").append('<span style="word-break: break-all;line-height: 24px;">'+'${tlCompanyUnionInfo.productintro}'+'</span>');
        getCommentsList();
    })

    function showyltb(obj, idx){
        $(".tbspan").removeClass("current");
        $(obj).parent().addClass("current");
        $("#cf1").hide();$("#cf2").hide();$("#cf3").hide();$("#cf4").hide();$("#cf5").hide();
        $("#cf"+idx).show();
    }

    $(function () {
        var type = "${type}";
        var obj = $("#tba"+type)[0];
        showyltb(obj, type)
    })
</script>

	<script>
    var pageNo=1;
    var id='${tlCompanyUnionInfo.id}';
    var contextPath="${contextPath}"
    function getCommentsList(){
        getCommentsFlag=false;
        $.ajax({
            url:contextPath+"/taier/comments/getActCommentsList",
            type:"POST",
            data:{"activityId":id,"pageNo":pageNo,"pageSize":5},
            success:function(result){
                getCommentsFlag=true;
                if(result.code==200){
                    if(result.hashMap.lastPage){
                        $("#getMoreComments").attr("onclick","");
                        $("#getMoreComments").html("暂无更多数据");
                    }
                    var commentsPage=result.hashMap.commentsPage.list;
                    var commentsStr="";
                    if(commentsPage!=null &&  commentsPage.length>0){
                        for(var i=0;i<commentsPage.length;i++){
                            var user=commentsPage[i].user;
                            commentsStr+='<dl class="pl_list_small">'+
                                '<dd class="pl_name2">'
                                +user.name+
                                '<span>'+commentsPage[i].createDate+
                                '</span>'+
                                '<a href="javascript:void(0)" class="return_pl"  onclick="reply(this)">回复</a>'+
                                '</dd>'+
                                '<dd class="pl_name2">'+commentsPage[i].content+
                                '</dd>';
                            var childrenCommentsList=commentsPage[i].childrenCommentsList;
                            var childrenCommentsStr='';
                            if(childrenCommentsList && childrenCommentsList.length>0){
                                childrenCommentsStr+='<div class="ej_pl">';
                                for(var j=0;j<childrenCommentsList.length;j++){
                                    var childrenUser=childrenCommentsList[j].user;
                                    childrenCommentsStr+='<dl>'+
                                        '<dd class="pl_name2">'+
                                        childrenUser.name+
                                        '<span>'+childrenCommentsList[j].createDate+'</span>'+
                                        '</dd>'+
                                        '<dd class="pl_name2">'+
                                        childrenCommentsList[j].content+
                                        '</dd>'+
                                        '</dl>';
                                }
                                childrenCommentsStr+='</div>';
                            }
                            commentsStr+=childrenCommentsStr;
                            commentsStr+='<dd class="add_pl12">'+
                                '<textarea type="text" placeholder="回复："></textarea>'+
                                '<span onclick="subReply(\''+user.id+'\',\''+commentsPage[i].id+'\',this)">回复</span>'+
                                '</dd>'+
                                '</dl>'	;


                        }
                        $("#commentList").append(commentsStr);
                        if(window.parent.refreshHeight){
                            window.parent.refreshHeight();
                        }
                    }else{

                    }

                }else{

                }
            }
        })
    }
    function getMoreComments(){
        //防止重复提交
        if(getCommentsFlag){
            pageNo++;
            getCommentsList();
        }

    }
    function reply(obj){
        if($(obj).parent().parent().find('.add_pl12').css('display')=='none'){

            $(obj).parent().parent().siblings().find('.add_pl12').hide();
            $(obj).parent().parent().find('.add_pl12').show();
        } else{
            $(obj).parent().parent().find('.add_pl12').hide();
        }
    }

    var replyFlag=true;
    function subReply(toUserId,commentId,obj){
        if(!replyFlag){
            return false;
        }
        var content=$(obj).prev().val();
        if(content == null || content==''){
            alert("请填写评论内容");
            return;
        }

        replyFlag=false;
        $.ajax({
            url:contextPath+"/taier/comments/saveComments",
            type:"POST",
            data:{"activityId":id,"content":content,"parentid":commentId,"toUserId":toUserId},
            success:function(result){
                replyFlag=true
                if(result.code==200){
                    alert("评论成功！");
                    window.location.href=window.location.href;
                }else{
                    parent.location.href=contextPath;
                }
            }
        })
    }
    var saveCommentsFlag=true;
    function saveComments(id){
        if(!saveCommentsFlag){
            return;
        }
        var content=$("#content").val().trim();
        if(content == null || content==''){
            alert("请填写评论内容");
            return;
        }

        saveCommentsFlag=false;
        $.ajax({
            url:contextPath+"/taier/comments/saveComments",
            type:"POST",
            data:{"activityId":id,"content":content,"parentid":"0"},
            success:function(result){
                saveCommentsFlag=true
                if(result.code==200){
                    alert("评论成功！");
                    window.location.href=window.location.href;
                }else{
                    parent.location.href=contextPath;
                }
            }
        })

    }

</script>

</body>
</html>
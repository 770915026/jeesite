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
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/newtaiermobile/css/index.css">
<link href="${ctxStatic}/taier/css/swiper.min.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" src="${ctxStatic}/taier/js/swiper.min.js"></script>
<style>
.divcurrent {
	border: 2px solid #006eff;
}
</style>
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
		<!--主内容-->
		<div class="domestic-container">
			<!--产品展示-->
			<div class="domsitic-public">
				<!--大图-->
				<div class="big-img">
					<ul>
						<li><img class="img" id="bigimg" src="images/ico08.jpg">
						</li>
					</ul>
					<!--小圆点-->
					<!--小圆点 end-->
				</div>
				<!--大图 end-->
				<div class="img-title">
					<p>${tlCompanyUnionInfo.productName}</p>
				</div>
			</div>
			<!--产品展示 end-->
			<!--导航-->
			<div class="public-tab-nav mt70">
				<span class="span tbspan " onclick="showyltb(this,2)">国内证书</span> <span
					class="span tbspan current" onclick="showyltb(this,5)">配置信息</span>
				<span class="span tbspan" onclick="showyltb(this,1)">产品介绍</span> <span
					class="span tbspan" onclick="showyltb(this,4)">泰尔证书</span>
			</div>
			<div class="public-wrap product-box-list" id="cf5"></div>
			<div class="public-wrap product-box-list" id="cf1"></div>
			<div class="public-wrap product-box-list" id="cf2"></div>
			<div class="public-wrap product-box-list" id="cf3"></div>
			<div class="public-wrap product-box-list" id="cf4"></div>
		</div>
		<br>
		<!--主内容 end-->
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
        $(obj).addClass("current");
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
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
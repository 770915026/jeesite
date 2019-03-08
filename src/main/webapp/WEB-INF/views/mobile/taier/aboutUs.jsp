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
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/swiper.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/newtaiermobile/css/swiper.min.css">
<STYLE>
.taier-intro-con p {
	height: auto;
}

.swiper-slide {
	margin-left: 0px !important;
	margin-right: 0px !important;
}
</STYLE>
</head>
<body>
	<section>
		<!--右侧滚动导航-->
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
		<div class="abotUs-container zcdiv">
			<!--头图-->
			<div class="top-banner-wrap">
				<p class="top-banner-text">
					<strong>关于我们</strong> <em>ABOUT US</em>
				</p>
			</div>
			<!--头图 end-->
			<!--泰尔视角概况-->
			<div class="taier-visual-text" style="width: 90%; margin-left: 5%;">
				${aboutUs.situationContent }</div>
			<!--泰尔视角概况 end-->
			<!--获奖展示-->
			<div class="award-box-list">
				<div class="award-list">
					<ul id="zsdiv" class="swiper-wrapper">
					</ul>
					<div class="swiper-button-prev leftArrow"></div>
					<div class="swiper-button-next rightArrow"></div>
				</div>
			</div>
			<!--获奖展示 end-->
		</div>
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
	</section>
</body>
<script>
    $(function(){
        findTaierauth();

    })
    function findTaierauth(){
        var data ={};
        data.pageNo = 1;
        $.ajax({
            url: "${contextPath}/taier/jump/findTaierauth",
            type:"post",
            dataType:"json",
            data: data,
            success: function (data){
                $("#zsdiv").html("");
                if(data.code==200){
                    var hotNewsListStr="";
                    var newsPage=data.hashMap.certificateShowPage.list;
                    var page=data.hashMap.certificateShowPage;
                    if(newsPage && newsPage.length>0){
                        for(var i=0;i<newsPage.length;i++){
                            hotNewsListStr+='<li class="swiper-slide" style="">'+
                               ' <a href="${contextPath}/taier/jump/gotoTaierauthDetail?id='+newsPage[i].id+'">'+
                                '<img src="'+newsPage[i].img+'">'+
                                '<p class="text">'+newsPage[i].name+'</p>'+
                               ' </a>'+
                                '</li>';
                        }
                        $("#zsdiv").append(hotNewsListStr);
                        var mySwiper = new Swiper ('.award-list', {
                            slidesPerView: 2,

                            // 定义slides的数量多少为一组
                            slidesPerGroup: 2,
                            direction: 'horizontal',
                            // autoplay: true,
                            loop: true, // 循环模式选项
                            // 如果需要前进后退按钮
                            navigation: {
                                nextEl: '.swiper-button-prev',
                                prevEl: '.swiper-button-next',
                            },
                            observer:true,//修改swiper自己或子元素时，自动初始化swiper
                            observeParents:true//修改swiper的父元素时，自动初始化swiper
                        })
                    }else{
                    }
                }

            }
        });
    }
</script>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
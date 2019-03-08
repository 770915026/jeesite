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
</head>
<body>
	<!--右侧滚动导航-->
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
		<div class="taier-certificate-container zcdiv">
			<div class="certificate-banner">
				<p class="certificate-banner-text">泰尔权威证书</p>
			</div>
			<!--切换按钮-->
			<div class="certificate-nav">
				<a class="list current" href="javascript:;">优势与流程</a> <a
					class="list" href="javascript:;">颁发行业</a>
			</div>
			<!--切换按钮 end-->
			<!--优势与流程-->
			<div class="certificate-tab-list current">
				<div class="advantage-box">
					<p class="advantage-text">
						对于企业用户尤其是一些高端用户来说，在竞争激烈的市场，从宣传的角度考虑，一份委托测试报告往往不具备良好的宣传效果，他们更需要的是一张合格证书或评估结论;<br />
						<br />为“好学生”的“优势学科”发证书;<br />
						<br />泰尔证书只颁发给优质企业的明星产品;<br />
						<br />泰尔证书可以分不同的维度进行颁发，如“通信能力，定位能力，信息安全防护能力，游戏高性能，快速充电能力等”方面；测试方案可以贴近企业的产品特性量身打造。
					</p>
					<div class="advantage-img"></div>
				</div>
			</div>
			<!--优势与流程 end-->
			<!--颁发行业-->
			<div class="certificate-tab-list mt70">
				<h3 class="title">颁发行业</h3>
				<ul class="tab-list" id="zsdiv">
					<c:forEach items="${certificateList }" var="certificate">
						<li><a
							href="${contextPath}/taier/jump/gotoTaierauthDetail?id=${certificate.id}">
								<img src="${certificate.img}">
								<p>${certificate.name}</p>
						</a></li>
					</c:forEach>

				</ul>
				<!--获证展示-->
				<div class="get-certificate-box mt70">
					<h3 class="title">获证展示</h3>
					<div class="swiper-container award-box-list">
						<div class="swiper-wrapper">
							<c:forEach items="${certificateShowList }" var="certificateShow">
								<div class="swiper-slide award-list">
									<ul>
										<li><a href="javascript:;"> <img
												src="${certificateShow.img}">
												<p class="text">${certificateShow.name}</p>
										</a></li>
									</ul>
								</div>
							</c:forEach>
						</div>

						<!-- 如果需要导航按钮 -->
						<div class="swiper-button-prev leftArrow"></div>
						<div class="swiper-button-next rightArrow"></div>

					</div>
				</div>
				<!--获证展示 end-->
			</div>
			<!--颁发行业 end-->

		</div>
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
	<script type="text/javascript">
    $(function() {
        $(".certificate-nav a").click(function() {
            var _index = $(this).index();
            $(this).addClass("current").siblings().removeClass("current");
            $(".certificate-tab-list").eq(_index).addClass("current").siblings().removeClass("current");
        })

        var mySwiper = new Swiper ('.award-box-list', {
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
    })
</script>
	<script type="text/javascript">
    $(function(){
       // findTaierauth(1);

    });

    function searchtaizs(){
        var text = $("#zssearch").val();
        findTaierauth(1,text);
    }

    function findTaierauth(pageNo,text){
        var data ={};
        data.pageNo = pageNo;
        data.pageSize = 6;
        if(text) {
            data.name = text;
        }
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
                            hotNewsListStr+='<dd><a href="${contextPath}/taier/jump/gotoTaierauthDetail?id='+newsPage[i].id+'"> <img src="'+newsPage[i].img+'"> <p>'+newsPage[i].name+'</p> </a> </dd>';
                        }
                        $("#zsdiv").append(hotNewsListStr);
                    }else{
                    }
                    buildPage("pagenumber", page.pageNo, page.pageCount, page.count, "searchtaizs", text);
                }

            }
        });
    }
</script>
</body>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/taier/include.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="toTop" content="true">
<%@ include file="/WEB-INF/views/taier/include.jsp"%>

<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/newtaier/css/news.css">
<style>
.newdd {
	text-align: center;
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
	<!--右侧滚动导航-->
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
				<dd class="current">
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
		<div class="taier-news-banners">
			<div class="taier-container">
				<p class="banner-text ">
					<strong>动态新闻</strong> <em>泰尔视角聚焦业内热点话题 </em>
				</p>
			</div>
		</div>
		<div class="taier-news-wrap">
			<!--新闻动态-->
			<div class="taier-container">
				<div class="taier-news-outer">
					<!--左侧导航-->
					<div class="taier-news-nav">
						<dl class="taier-news-dl">
							<dd class="newdd current" onclick="getNewsListByType(1,0)">
								<span class="tit">热点新闻</span> <span class="ico"></span>
							</dd>
							<dd class="newdd " onclick="getNewsListByType(1,1)">
								<span class="tit">行业动态</span> <span class="ico"></span>
							</dd>
							<dd class="newdd " onclick="getNewsListByType(1,2)">
								<span class="tit">产品动态</span> <span class="ico"></span>
							</dd>
							<dd class="newdd " onclick="getNewsListByType(1,3)">
								<span class="tit">泰尔快报</span> <span class="ico"></span>
							</dd>
						</dl>
					</div>
					<!--左侧导航 end-->
					<!--右侧新闻-->
					<div class="taier-news-tab">
						<h3 class="taier-tit" id="newstitle">热点新闻</h3>
						<dl class="news-box" id="hotNewsList">

						</dl>
						<div class="clear"></div>
						<!--翻页-->
						<div class="page-main" id="pagenumber"></div>
						<!--翻页 end-->
					</div>
					<!--右侧新闻 end-->
				</div>
			</div>
			<!--新闻动态 END-->
		</div>

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

	<script>
    var swiper = new Swiper('.swiper-container', {
        spaceBetween: 30,
        centeredSlides: true,
        loop:true,
       autoplay: {
           delay:2000,
           disableOnInteraction: false
       },
        pagination: {
            el: '.swiper-pagination',
            clickable: true
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev'
        }
    });
</script>
	<script type="text/javascript">
	var contextPath="${contextPath}"
    $('.new_listright h1 span').click(function() {
        $('.new_listright h1 span').removeClass('r_active');
        $(this).addClass('r_active');
        $('.r_con').eq($(this).index()).show().siblings().hide();
    });

	$(function(){
	    $(".newdd").click(function(){
            $(".newdd").removeClass("current");
            $(this).addClass("current");
            $("#newstitle").html($(this).children().eq(0).html());
        })

        getNewsListByType(1,0);
    })


</script>
	<script>
    function getNewsListByType(pageNo,type){
        var data = {};
        data.pageNo = pageNo;
        data.pageSize = 5;
        if(type == 0) {
            data.isHot = "1";
        } else {
            data.type = type;
        }
        $.ajax({
            url: contextPath+"/taier/news/findNewsPageByConditions",
            type:"post",
            dataType:"json",
            data: data,
            success: function (data){
                $("#hotNewsList").html("");
                if(data.code==200){
                    var hotNewsListStr="";
                    var newsPage=data.hashMap.newsPage.list;
                    var page=data.hashMap.newsPage;
                    if(data.hashMap.lastPage){
                    }
                    if(newsPage && newsPage.length>0){
                        for(var i=0;i<newsPage.length;i++){
                            var img = newsPage[i].img;
                            if(!img) {
                                img="${ctxStatic}/newtaier/images/news/ico03.jpg";
                            }
                            hotNewsListStr+='<dd>'+
                                '<a href="javascript:;" onclick="newsDetail(\''+newsPage[i].id+'\')">'+
                                '<span class="news-img">'+
                                ' <img src="'+img+'">'+
                                ' </span>'+
                                ' <span class="news-text">'+
                                ' <strong class="tit">'+newsPage[i].title+'</strong>'+
                                '<span class="text" style=" text-overflow: -o-ellipsis-lastline;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;line-clamp: 2;-webkit-box-orient: vertical;">'+newsPage[i].contentText+'</span>'+
                                '</span>'+
                                '</a>'+
                                '<b class="date">'+newsPage[i].createDate.substring(0,10)+'</b>'+
                                '   </dd>';
                        }
                        $("#hotNewsList").append(hotNewsListStr);
                    }else{
                    }
                    buildPage("pagenumber", page.pageNo, page.pageCount, page.count, "getNewsListByType", type);

                }

            }
        });

    }

    function newsDetail(id){
        window.location.href=contextPath+"/taier/jump/gotoNewsDetail?id="+id;
    }
</script>
</body>
</html>
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
	href="${ctxStatic}/newtaier/css/aboutUs.css">
<STYLE>
.taier-intro-con p {
	height: auto;
}
</STYLE>
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
				<dd class="current">
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
		<div class="taier-aboutUs-banner">
			<div class="taier-container">
				<p class="banner-text ">
					<strong>关于我们</strong> <em>ABOUT US</em>
				</p>
			</div>
		</div>
		<div class="taier-container">
			<!--泰尔视角概况-->
			<div class="taier-intro-con">
				<h3 class="title">泰尔视角概况</h3>
				${aboutUs.situationContent }
			</div>
			<!--泰尔视角概况 end-->
			<!--获证展示-->
			<div class="certified-show-con">
				<div class="certified-show-tit">
					<span class="title">获证展示</span> <a class="more"
						href="${contextPath}/taier/jump/gotoTaierauth">更多 ></a>
				</div>
				<div class="certified-show-list">
					<span class="leftArrow" id="leftArrow"></span>
					<div class="certified-show-dl">
						<dl id="zsdiv">

						</dl>
					</div>
					<span class="rightArrow" id="rightArrow"></span>
				</div>
			</div>
			<!--获证展示 end-->
		</div>
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
							<div style="margin-top: 15px; text-align: center;">
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
                            hotNewsListStr+='<dd>'+
                               ' <a href="${contextPath}/taier/jump/gotoTaierauthDetail?id='+newsPage[i].id+'">'+
                                '<img src="'+newsPage[i].img+'">'+
                                '<p>'+newsPage[i].name+'</p>'+
                               ' </a>'+
                                '</dd>';
                        }
                        $("#zsdiv").append(hotNewsListStr);
                    }else{
                    }
                    pictrueList({
                        "leftArrow":"leftArrow",//左边箭头
                        "rightArrow":"rightArrow",//右边箭头
                        "listNum":3,//展现个数
                        "spaceLong":963,//移动距离
                        "scrollId":"zsdiv"//滚动元素
                    });
                }

            }
        });
    }
</script>
</html>
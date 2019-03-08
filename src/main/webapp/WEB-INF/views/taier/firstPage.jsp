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
	href="${ctxStatic}/newtaier/css/index.css">
<style>
.img-box {
	position: absolute;
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
<body onbeforeunload="cancelScroll()">
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
				<dd class="current">
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
		<div class="public-list">
			<!--首页-->
			<div class="list-box">
				<!--headerBanner-->
				<div class="header-banner">
					<ul class="banner-flash" id="banner-flash">
						<c:forEach items="${firstPageImgList }" var="firstPageImg">
							<li><a href="javascript:;"> <img
									src="${firstPageImg.imgUrl}">
									<p class="banner-text">
										<strong>${firstPageImg.title}</strong> <em>${firstPageImg.title1}</em>
									</p>
							</a></li>
						</c:forEach>
					</ul>
					<ul class="focus-box" id="focus-box">
						<c:forEach items="${firstPageImgList}" var="firstPageImg"
							varStatus="sta">
							<li>${sta.count}</li>
						</c:forEach>
					</ul>
					<script type="text/javascript">
                    changeTagzdlb({
                        'thumShow':'banner-flash',//大图父标签ID
                        'thumShowTag':'li',//包含大图的标签名称
                        'thumList':'focus-box',//小图父标签ID
                        'thumListTag':'li',//包含小图的标签名称
                        'thumListCurrent':'current',//小图当前样式名称
                        'thumNum':0,//默认显示第几个
                        'thumTrue':true,//是否轮播
                        'scrollTime':5000//自动轮播时间
                    })
                </script>
				</div>
				<!--headerBanner END-->
				<!--泰尔头条-->

				<div class="taier-head-lines">
					<div class="taier-news">
						<h3 class="taier-news-tit">泰尔头条</h3>
						<div class="taier-news-public">
							<ul class="public_ul" id="newsList1">
							</ul>
						</div>
						<a class="more" href="${contextPath }/taier/jump/gotoNews">查看全部
							></a>
					</div>
				</div>
				<!--泰尔头条 end-->
				<!--企业信息发布-->
				<div class="enterprise-news-wrap">
					<div class="taier-container">
						<div class="enterprise-news">
							<h3 class="news-title">企业信息发布</h3>
							<span class="news-text">快速查看企业相关资质证书获取信息</span>
							<div class="news-bg-img"></div>
							<div class="enterprise-news-box">
								<span class="arrow-left" id="leftArrow">左箭头</span>
								<div class="enterprise-news-list">
									<dl id="ulId">
										<dd>
											<span> <a href="javascript:void(0);"
												onclick="xxfb('华为')"> <img
													src="${ctxStatic}/newtaier/images/news-ico01.jpg">
											</a>
											</span> <span> <a href="javascript:void(0);"
												onclick="xxfb('OPPO')"> <img
													src="${ctxStatic}/newtaier/images/news-ico02.jpg">
											</a>
											</span>
										</dd>
										<dd>
											<span> <a href="javascript:void(0);"
												onclick="xxfb('小米')"> <img
													src="${ctxStatic}/newtaier/images/news-ico03.jpg">
											</a>
											</span> <span> <a href="javascript:void(0);"
												onclick="xxfb('VIVO')"> <img
													src="${ctxStatic}/newtaier/images/news-ico04.jpg">
											</a>
											</span>
										</dd>
										<dd>
											<span> <a href="javascript:void(0);"
												onclick="xxfb('诺基亚')"> <img
													src="${ctxStatic}/newtaier/images/news-ico05.jpg">
											</a>
											</span> <span> <a href="javascript:void(0);"
												onclick="xxfb('中兴')"> <img
													src="${ctxStatic}/newtaier/images/news-ico06.jpg">
											</a>
											</span>
										</dd>
										<dd>
											<span> <a href="javascript:void(0);"
												onclick="xxfb('联想')"> <img
													src="${ctxStatic}/newtaier/images/news-ico07.jpg">
											</a>
											</span> <span> <a href="javascript:void(0);"
												onclick="xxfb('三星')"> <img
													src="${ctxStatic}/newtaier/images/news-ico08.jpg">
											</a>
											</span>
										</dd>
										<dd>
											<span> <a href="javascript:void(0);"
												onclick="xxfb('魅族')"> <img
													src="${ctxStatic}/newtaier/images/news-ico09.jpg">
											</a>
											</span> <span> <a href="javascript:void(0);"
												onclick="xxfb('一加')"> <img
													src="${ctxStatic}/newtaier/images/news-ico10.jpg">
											</a>
											</span>
										</dd>



										<dd>
											<span> <a href="javascript:void(0);"
												onclick="xxfb('魅族')"> <img
													src="${ctxStatic}/newtaier/images/news-ico09.jpg">
											</a>
											</span> <span> <a href="javascript:void(0);"
												onclick="xxfb('一加')"> <img
													src="${ctxStatic}/newtaier/images/news-ico10.jpg">
											</a>
											</span>
										</dd>
										<dd>
											<span> <a href="javascript:void(0);"
												onclick="xxfb('魅族')"> <img
													src="${ctxStatic}/newtaier/images/news-ico09.jpg">
											</a>
											</span> <span> <a href="javascript:void(0);"
												onclick="xxfb('一加')"> <img
													src="${ctxStatic}/newtaier/images/news-ico10.jpg">
											</a>
											</span>
										</dd>

									</dl>
								</div>
								<span class="arrow-right" id="rightArrow">右箭头</span>
							</div>
							<script type="text/javascript">
                            pictrueList({
                                "leftArrow":"leftArrow",//左边箭头
                                "rightArrow":"rightArrow",//右边箭头
                                "listNum":5,//展现个数
                                "spaceLong":197,//移动距离
                                "scrollId":"ulId"//滚动元素
                            });
                        </script>
						</div>
					</div>
				</div>
				<!--企业信息发布 end-->
				<!--泰尔权威证书-->
				<div class="taier-coa-wrap" id="tezs">
					<div class="taier-container-coa">
						<div class="taier-coa">
							<h3 class="coa-tit">泰尔权威证书</h3>
							<div class="taier-coa-nav">
								<span class="current">优势与流程</span><span>颁发行业</span>
							</div>
							<!--优势与流程-->
							<div class="advantage-tab taier-coa-tab current">
								<div class="advantage-text">
									<p>对于企业用户尤其是一些高端用户来说，在竞争激烈的市场，从宣传的角度考虑，一份委托测试报告往往不具备良好的宣传效果，他们更需要的是一张合格证书或评估结论;</p>
									<p>为“好学生”的“优势学科”发证书;</p>
									<p>泰尔证书只颁发给优质企业的明星产品;</p>
									<p>泰尔证书可以分不同的维度进行颁发，如“通信能力，定位能力，信息安全防护能力，游戏高性能，快速充电能力等”方面；测试方案可以贴近企业的产品特性量身打造。</p>
									<a class="more" href="${contextPath}/taier/jump/gotoTaierauth">了解更多</a>
								</div>
							</div>
							<!--优势与流程 end-->
							<!--颁发行业-->
							<dl class="taier-coa-tab">
								<dd>
									<img src="${ctxStatic}/newtaier/images/taier-coa-01.jpg">
								</dd>
								<dd>
									<img src="${ctxStatic}/newtaier/images/taier-coa-02.jpg">
								</dd>
								<dd>
									<img src="${ctxStatic}/newtaier/images/taier-coa-03.jpg">
								</dd>
								<dd>
									<img src="${ctxStatic}/newtaier/images/taier-coa-04.jpg">
								</dd>
								<dd>
									<img src="${ctxStatic}/newtaier/images/taier-coa-05.jpg">
								</dd>
							</dl>
							<!--颁发行业 end-->
						</div>
					</div>
				</div>
				<script type="text/javascript">
				$(function() {
					$(".taier-coa .taier-coa-nav span").click(function() {
						var _index = $(this).index();
						console.error(_index)
						$(this).addClass("current").siblings().removeClass("current");
						$(".taier-coa-tab").eq(_index).fadeIn(1000).addClass("current").siblings('.taier-coa-tab').removeClass("current").hide();
						// $(".taier-coa-tab").
					})
				})
            </script>
				<!--泰尔权威证书 end-->
				<!--行业分析报告-->
				<div class="taier-report-wrap">
					<div class="taier-container-2">
						<div class="taier-report">
							<h3 class="report-tit">行业分析报告</h3>
							<span class="report-text">请写一段文案在此位置</span>
						</div>
						<ul class="report-ul">
							<li><a style="text-align: center;" href="javascript:;"
								onclick="tzfxbg()"><img
									src="${ctxStatic}/newtaier/images/fenxi-img01.png">5G</a></li>
							<li><a style="text-align: center;" href="javascript:;"
								onclick="tzfxbg()"><img
									src="${ctxStatic}/newtaier/images/fenxi-img02.png">VR</a></li>
							<li><a style="text-align: center;" href="javascript:;"
								onclick="tzfxbg()"><img
									src="${ctxStatic}/newtaier/images/fenxi-img03.png">AI</a></li>
							<li><a style="text-align: center;" href="javascript:;"
								onclick="tzfxbg()"><img
									src="${ctxStatic}/newtaier/images/fenxi-img04.png">手机</a></li>
							<li><a style="text-align: center;" href="javascript:;"
								onclick="tzfxbg()"><img
									src="${ctxStatic}/newtaier/images/fenxi-img05.png">数据终端</a></li>
							<li><a style="text-align: center;" href="javascript:;"
								onclick="tzfxbg()"><img
									src="${ctxStatic}/newtaier/images/fenxi-img06.png">物联网</a></li>
							<li><a style="text-align: center;" href="javascript:;"
								onclick="tzfxbg()"><img
									src="${ctxStatic}/newtaier/images/fenxi-img07.png">车载</a></li>
						</ul>
					</div>
				</div>
				<!--行业分析报告 end-->
				<!--泰尔视角聚焦业内热点话题-->
				<div class="taier-hotspot-wrap">
					<div class="taier-container">
						<div class="taier-hotspot">
							<h3 class="title">泰尔视角聚焦业内热点话题</h3>
							<div class="taier-news-nav">
								<span class="current" onclick="getHotFirstPageNews()">热点新闻</span>
								<span onclick="getNewsListByType(1,this)">行业动态</span> <span
									onclick="getNewsListByType(2,this)">产品动态</span> <span
									onclick="getNewsListByType(3,this)">泰尔动态</span>
							</div>
							<!--热点新闻-->
							<div class="taier-news-tab current">
								<ul id="newsList" style="height: 260px;">


								</ul>
							</div>

							<div class="clear"></div>
							<div class="more-con">
								<a class="more" href="${contextPath }/taier/jump/gotoNews"></a>
							</div>
						</div>
					</div>
				</div>
				<!--泰尔视角聚焦业内热点话题 end-->
			</div>
			<!--首页 END-->
		</div>
		<!--主体 END-->
		<script type="text/javascript">
        function tzfxbg(){
            window.location.href="${contextPath }/taier/analysisReportFront/gotoAnalysisReport#";
        }
        function dwfxbg(){
            var ssw = $(".taier-report-wrap").width();
            var pyl = (1863-ssw)/2-16;
            var ssd = $('.fxbg');
            ssd.each(function(i, btn) {
                var sleft = $(btn).position().left;
                $(btn).css("left",sleft-pyl);

            });
        }
        function xxfb(pp){
            window.location.href="${contextPath}/taier/jump/unionInfoListUSer?pp="+pp;
        }
        $(function() {
            dwfxbg();
            $(".taier-news-nav span").click(function() {
                var _index = $(this).index();
                $(this).addClass("current").siblings().removeClass("current");
                $(".taier-news-tab").eq(_index).addClass("current").siblings().removeClass("current");
            })
        })
    </script>
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
</body>
<!--主体 END-->
<script type="text/javascript">
    $(function() {
        $(".taier-news-nav span").click(function() {
            var _index = $(this).index();
            $(this).addClass("current").siblings().removeClass("current");
            $(".taier-news-tab").eq(_index).addClass("current").siblings().removeClass("current");
        })
    })
</script>

<script>
    $(function(){
    	
        $(".icon-guanbi").click(function(e){
            $(this).parent().parent().parent().hide();
        });
        $(parent.window).scroll(function(){
            $('#hyfxxdl').css({
                top : $(parent.window).scrollTop()-200
            })
        });
    })
    function cancelScroll(){
    	$(parent.window).unbind('scroll')
    	
    }
   
</script>
<script type="text/javascript">
	var contextPath="${contextPath}"
    var ctxStatic="${ctxStatic}";
</script>
<script type="text/javascript">
    function slideUp(obj,top,time) {
        $(obj).animate({
            marginTop: top
        }, time, function () {
            $(this).css({marginTop:"0"}).find(":first").appendTo(this);
        })
    };

    $(function () {
        setInterval("slideUp('.taier-news-public .public_ul','-50px',500)", 2000);
    })
</script>
<script>
    $(function(){

        //新闻
        getHotFirstPageNews();
        //行业分析报告
        getAnalysisReportList();
        //活动
        getActivityList();
        //关于我们
        getAboutUs();
    })
    function toregiste(){
        window.location.href = "${contextPath}/taier/jump/register1#";
    }
    function getHotFirstPageNews(){
        $(".innew_active").removeClass("innew_active");
        $("#rdxw").addClass("innew_active");
        $("#newsList1").html("");
        $("#newsList").html("");
        $.ajax({
            url: contextPath+"/taier/news/getFirstPageNewsByConditions",
            type:"post",
            dataType:"json",
            data: {
                "isHot":"1"
            },
            success: function (data){
                if(data.code==200){
                    var newsListStr="";
                    var newsList1Str="";
                    var newsPage=data.hashMap.newsList;
                    var resultNews=data.hashMap.resultNewsList;
                    $("#newsImg").attr("src",resultNews.img);
                    $("#newsTitle").html(resultNews.title);
                    $("#createDate").html(resultNews.createDate);
                    $("#tojintou").click(function(){
                        newsDetail(resultNews.id+"");
                    });
                    if(newsPage && newsPage.length>0){
                        for(var i=0;i<newsPage.length;i++) {
                            var createDate=newsPage[i].createDate;
                            var dateStr=createDate.substring(0,7);
                            var dayStr=createDate.substring(8,10);
                            newsList1Str+='<li style="width: 100%;"><a class="news" onclick="newsDetail(\''+newsPage[i].id+'\')">'+newsPage[i].title+'<em class="line">|</em>'+dateStr+'<em class="icon"></em></a></li>';
                        }

                        $("#newsList1").html(newsList1Str);
                    }
                    if(resultNews && resultNews.length>0){
                        for(var i=0;i<resultNews.length&&i<1;i++){
                            var createDate=resultNews[i].createDate;
                            var dateStr=createDate.substring(0,7);
                            var dayStr=createDate.substring(8,10);
                            newsListStr+='<li class="list">\n' +
                                '<a href="javascript:;" onclick="newsDetail(\''+resultNews[i].id+'\')">\n' +
                                '<span class="img-box" style="display: block;">\n' +
                                '<img src="'+resultNews[i].img+'" style="width: 340px;height:157px;">\n' +
                                '<em class="opac" ></em>\n' +
                                '<em class="text">'+resultNews[i].title+'</em>\n' +
                                '</span>\n' +
                                '<p class="news-text">'+resultNews[i].contentText+'</p>\n' +
                                '</a>\n' +
                                '</li>';
                        }
                        $("#newsList").html(newsListStr);
                    }else{

                    }
                }
            }
        });
    }

    function getNewsListByType(type,obj){
        $("#newsList").html("");
        $.ajax({
            url: contextPath+"/taier/news/getFirstPageNewsByConditions",
            type:"post",
            dataType:"json",
            data: {
                "type":type
            },
            success: function (data){
                if(data.code==200){
                    var newsListStr="";
                    var newsPage=data.hashMap.resultNewsList;
                    var resultNews=data.hashMap.resultNews;
                    $("#newsImg").attr("src",resultNews.img);
                    $("#newsTitle").html(resultNews.title);
                    $("#createDate").html(resultNews.createDate);
                    $("#tojintou").attr("onclick","newsDetail('"+resultNews.id+"')")
                    if(newsPage && newsPage.length>0){
                        for(var i=0;i<newsPage.length;i++){
                            var createDate=newsPage[i].createDate;
                            var dateStr=createDate.substring(0,7);
                            var dayStr=createDate.substring(8,10);
                            newsListStr+='<li class="list">\n' +
                                '<a href="javascript:;" onclick="newsDetail(\''+newsPage[i].id+'\')">\n' +
                                '<span class="img-box" style="display: block;">\n' +
                                '<img src="'+newsPage[i].img+'" style="width: 340px;height:157px;">\n' +
                                '<em class="opac" ></em>\n' +
                                '<em class="text" style="overflow: hidden;">'+newsPage[i].title+'</em>\n' +
                                '</span>\n' +
                                '<p class="news-text">'+newsPage[i].contentText+'</p>\n' +
                                '</a>\n' +
                                '</li>';
                        }
                        $("#newsList").html(newsListStr);
                        if(window.parent.refreshHeight){
                            window.parent.refreshHeight();
                        }
                    }else{

                    }
                }
            }
        });

    }

    function newsDetail(id){
        window.location.href=contextPath+"/taier/jump/gotoNewsDetail?id="+id;
    }

    function getAnalysisReportList(){
        $.ajax({
            url: contextPath+"/taier/analysisReportFront/getFirstPageAnalysisReport",
            type:"post",
            dataType:"json",

            success: function (data){

                if(data.code==200){
                    var analysisReportList=data.hashMap.analysisReportList;
                    var analysisReportListStr='';
                    if(analysisReportList && analysisReportList.length>0){
                        for(var i=0;i<analysisReportList.length;i++){
                            var rowNum='0'+(i+1);
                            analysisReportListStr+='<li>'+
                                '<a href="javascript:void(0)" onclick="gotoAnalysisReportDetail(\''+analysisReportList[i].id+'\')">'+
                                '<span class="indus_num">'+
                                rowNum+
                                '</span>'+
                                '<span class="indus_co">'+
                                analysisReportList[i].title+
                                '<img src="'+ctxStatic+'/taier/images/hy2.png" class="indus_r">'+
                                '</span>'+
                                '</a>'+
                                '</li>';
                        }

                        $("#analysisReportList").html(analysisReportListStr);
                        if(window.parent.refreshHeight){
                            window.parent.refreshHeight();
                        }
                    }

                }

            }
        });
    }
    function gotoAnalysisReportDetail(id){
        var username = "${fns:getUser().name}";
        if(username == '' || username == null) {
            $("#hyfxxdl").show();
        } else {
            window.location.href=contextPath+"/taier/analysisReportFront/gotoAnalysisReportDetail?id="+id;
        }

    }

    function getActivityList(){
        $.ajax({
            url: contextPath+"/taier/activityFront/getFirstActivity",
            type:"post",
            dataType:"json",

            success: function (data){

                if(data.code==200){
                    var activityList=data.hashMap.activityList;
                    var activityListStr='';
                    if(activityList && activityList.length>0){
                    	 activityListStr+='<div class="newact_list">'+
					                         '<div class="act_left">'+
						                         '<dl class="act_dl">'+
							                         '<a href="#">'+
								                         '<dt>'+activityList[0].title+'</dt>'+
//								                         '<dd>'+activityList[0].describe+'</dd>'+
								                         '<dd>'+
								                         	'<a href="javascript:void(0)"  onclick="activityDeatail(\''+activityList[0].id+'\')" class="look_ht">查看话题<img src="'+ctxStatic+'/taier/images/xjt.png"></a>'+
								                         '</dd>'+
							                         '</a>'+
						                         '</dl>'+
					                         '</div>'+
					                         '<div class="act_rig">'+
					                         	'<img src="'+activityList[0].cover+'" class="act_img">'+
					                         '</div>'+
					                     '</div>';
					                     
					    if(activityList.length>1){
					    	 activityListStr+='<div class="newact_list">'+
										    	 '<div class="act_left">'+
						                         	'<img src="'+activityList[1].cover+'" class="act_img">'+
						                         '</div>'+
						                         '<div class="act_rig">'+
							                         '<dl class="act_dl">'+
								                         '<a href="#">'+
									                         '<dt>'+activityList[1].title+'</dt>'+
									                         '<dd>'+activityList[1].describe+'</dd>'+
									                         '<dd>'+
									                         	'<a href="javascript:void(0)"  onclick="activityDeatail(\''+activityList[1].id+'\')" class="look_ht">查看话题<img src="'+ctxStatic+'/taier/images/xjt.png"></a>'+
									                         '</dd>'+
								                         '</a>'+
							                         '</dl>'+
						                         '</div>'+
						                         
						                     '</div>';
					    }

                        $("#activityList").html(activityListStr);
                        if(window.parent.refreshHeight){
                            window.parent.refreshHeight();
                        }
                    }

                }

            }
        });
    }
    function activityDeatail(id){
        window.location.href=contextPath+"/taier/activityFront/gotoLatestActivityDetail?id="+id+"#";
    }
    function getAboutUs(){
        $.ajax({
            url: contextPath+"/taier/aboutUs/getAboutUs",
            type:"post",
            dataType:"json",
            success: function (data){
                if(data.code==200){
                    var aboutUs=data.hashMap.aboutUs;
                    var situationContent=aboutUs.situationContent.replace(/<br\/>/g,'');
                    $("#aboutUs").html(situationContent);
                    if(window.parent.refreshHeight){
                        window.parent.refreshHeight();
                    }
                }

            }
        });
    }
</script>
</html>
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
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/swiper.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/newtaiermobile/css/index.css">
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/newtaiermobile/css/swiper.min.css">

<style>
.img-box {
	position: absolute;
}
</style>
</head>
<body onbeforeunload="cancelScroll()">
	<div class="container" style="padding-left: 0px; padding-right: 0px;">
		<!--右侧滚动导航-->
		<section>
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
			<div class="home-container zcdiv">
				<!--头图-->
				<div class="top-banner-wrap swiper-container">
					<div class="swiper-wrapper top-banner-box">
						<c:forEach items="${firstPageImgList}" var="firstPageImg"
							varStatus="sta">
							<div class="swiper-slide top-banner-box">
								<ul class="top-banner-box">
									<li><a href="javascript:;"> <img
											src="${firstPageImg.imgUrl}">
											<p class="banner-text">
												<strong>${firstPageImg.title}</strong> <em>${firstPageImg.title1}</em>
											</p>
									</a></li>
								</ul>
							</div>
						</c:forEach>
					</div>
					<div class="swiper-pagination"></div>
				</div>
				<!--头图 end-->
				<!--泰尔头条-->
				<div class="taier-top-news">
					<h3 class="taier-news-tit" style="line-height: 0.63rem;">泰尔头条</h3>
					<div class="taier-top-div">
						<ul class="taier-top-ul" id="newsList1">
						</ul>
					</div>
				</div>
				<!--泰尔头条 end-->
				<!--企业信息发布-->
				<div class="information-delivery-wrap">
					<h3 class="title-box">
						<strong>企业信息发布</strong>
						<p>快速查看企业相关资质证书获取信息</p>
					</h3>
					<div class="info-bg"></div>
					<div class="information-intro">
						<ul>
							<li><a href="javascript:;" onclick="xxfb('华为')"> <img
									src="${ctxStatic}/newtaiermobile/images/info-ico11.jpg">
							</a> <a href="javascript:;" onclick="xxfb('小米')"> <img
									src="${ctxStatic}/newtaiermobile/images/info-ico01.jpg">
							</a> <a href="javascript:;" onclick="xxfb('三星')"> <img
									src="${ctxStatic}/newtaiermobile/images/info-ico02.jpg">
							</a></li>
							<li><a href="javascript:;" onclick="xxfb('诺基亚')"> <img
									src="${ctxStatic}/newtaiermobile/images/info-ico03.jpg">
							</a> <a href="javascript:;" onclick="xxfb('VIVO')"> <img
									src="${ctxStatic}/newtaiermobile/images/info-ico04.jpg">
							</a> <a href="javascript:;" onclick="xxfb('OPPO')"> <img
									src="${ctxStatic}/newtaiermobile/images/info-ico05.jpg">
							</a></li>
							<li><a href="javascript:;" onclick="xxfb('中兴')"> <img
									src="${ctxStatic}/newtaiermobile/images/info-ico06.jpg">
							</a> <a href="javascript:;" onclick="xxfb('联想')"> <img
									src="${ctxStatic}/newtaiermobile/images/info-ico07.jpg">
							</a> <a href="javascript:;" onclick="xxfb('魅族')"> <img
									src="${ctxStatic}/newtaiermobile/images/info-ico08.jpg">
							</a></li>
							<li><a href="javascript:;" onclick="xxfb('一加')"> <img
									src="${ctxStatic}/newtaiermobile/images/info-ico09.jpg">
							</a></li>
						</ul>
						<div class="more">
							<a href="${contextPath}/taier/jump/unionInfoListUSer"> <img
								src="${ctxStatic}/newtaiermobile/images/info-ico10.jpg">
							</a>
						</div>
					</div>
				</div>
				<!--企业信息发布 end-->
				<!--泰尔权威证书-->
				<div class="information-coa-wrap">
					<h3 class="info-coa-title">泰尔权威证书</h3>
					<div class="swiper-container info-coa-intro">
						<div class="swiper-wrapper info-coa-list">
							<div class="swiper-slide info-coa-list">
								<ul>
									<li>
										<p class="text">
											对于企业用户尤其是一些高端用户来说，在竞争激烈的市场，从宣传的角度考虑，一份委托测试报告往往不具备良好的宣传效果，他们更需要的是一张合格证书或评估结论;<br />
											<br /> 为“好学生”的“优势学科”发证书;<br />
											<br /> 泰尔证书只颁发给优质企业的明星产品;<br />
											<br />
											泰尔证书可以分不同的维度进行颁发，如“通信能力，定位能力，信息安全防护能力，游戏高性能，快速充电能力等”方面；测试方案可以贴近企业的产品特性量身打造。
										</p>
										<p class="more-link">
											<a href="javascript:;">了解更多</a>
										</p>
										<p class="info-img"></p>
									</li>
								</ul>
							</div>
							<div class="swiper-slide info-coa-list">
								<ul>
									<li>
										<p class="text">
											对于企业用户尤其是一些高端用户来说，在竞争激烈的市场，从宣传的角度考虑，一份委托测试报告往往不具备良好的宣传效果，他们更需要的是一张合格证书或评估结论;<br />
											<br /> 为“好学生”的“优势学科”发证书;<br />
											<br /> 泰尔证书只颁发给优质企业的明星产品;<br />
											<br />
											泰尔证书可以分不同的维度进行颁发，如“通信能力，定位能力，信息安全防护能力，游戏高性能，快速充电能力等”方面；测试方案可以贴近企业的产品特性量身打造。
										</p>
										<p class="more-link">
											<a href="javascript:;">了解更多</a>
										</p>
										<p class="info-img"></p>
									</li>
								</ul>
							</div>
						</div>

						<!-- 如果需要导航按钮 -->
						<div class="swiper-button-prev leftArrow"></div>
						<div class="swiper-button-next rightArrow"></div>
					</div>
					<!-- <div class="info-coa-intro">
                    <span class="leftArrow"></span>
                    <span class="rightArrow"></span>
                    <div class="info-coa-list">
                        <ul>
                            <li>
                                <p class="text">
                                    对于企业用户尤其是一些高端用户来说，在竞争激烈的市场，从宣传的角度考虑，一份委托测试报告往往不具备良好的宣传效果，他们更需要的是一张合格证书或评估结论;<br/><br/>
                                    为“好学生”的“优势学科”发证书;<br/><br/>
                                    泰尔证书只颁发给优质企业的明星产品;<br/><br/>
                                    泰尔证书可以分不同的维度进行颁发，如“通信能力，定位能力，信息安全防护能力，游戏高性能，快速充电能力等”方面；测试方案可以贴近企业的产品特性量身打造。
                                </p>
                                <p class="more-link">
                                    <a href="javascript:;">了解更多</a>
                                </p>
                                <p class="info-img"></p>
                            </li>
                        </ul>
                    </div>
                </div> -->
				</div>
				<!--泰尔权威证书 end-->
				<!--行业分析报告-->
				<div class="analysis-report-wrap">
					<h3 class="analysis-title">
						<strong class="tit01">行业分析报告</strong>
						<p class="tit02">请写一段文案在此位置</p>
					</h3>
					<div class="analysis-list-box">
						<a class="a1"
							href="${contextPath}/taier/analysisReportFront/gotoAnalysisReport"><img
							src="${ctxStatic}/newtaiermobile/images/fenxi-img01.png">5G</a>
						<a class="a2"
							href="${contextPath}/taier/analysisReportFront/gotoAnalysisReport"><img
							src="${ctxStatic}/newtaiermobile/images/fenxi-img02.png">VR</a>
						<a class="a3"
							href="${contextPath}/taier/analysisReportFront/gotoAnalysisReport"><img
							src="${ctxStatic}/newtaiermobile/images/fenxi-img03.png">AI</a>
						<a class="a4"
							href="${contextPath}/taier/analysisReportFront/gotoAnalysisReport"><img
							src="${ctxStatic}/newtaiermobile/images/fenxi-img04.png">手机</a>
						<a class="a5"
							href="${contextPath}/taier/analysisReportFront/gotoAnalysisReport"><img
							src="${ctxStatic}/newtaiermobile/images/fenxi-img05.png">数据终端</a>
						<a class="a6"
							href="${contextPath}/taier/analysisReportFront/gotoAnalysisReport"><img
							src="${ctxStatic}/newtaiermobile/images/fenxi-img06.png">物联网</a>
						<a class="a7"
							href="${contextPath}/taier/analysisReportFront/gotoAnalysisReport"><img
							src="${ctxStatic}/newtaiermobile/images/fenxi-img07.png">车载</a>
					</div>
				</div>
				<!--行业分析报告 end-->
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
					</span> <span> <a
							href="${contextPath}/taier/policyFront/gotoPolicy">政策</a>
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
                            var createDate = newsPage[i].createDate;
                            var dateStr = createDate.substring(0, 7);
                            var dayStr = createDate.substring(8, 10);
                            newsList1Str += '<li><a href="javascript:;" onclick="newsDetail(\'' + newsPage[i].id + '\')">'+newsPage[i].title+'</a></li>';
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
<script type="text/javascript">
    function slideUp(obj,top,time) {
        $(obj).animate({
            marginTop: top
        }, time, function () {
            $(this).css({marginTop:"0"}).find(":first").appendTo(this);
        })
    };

    $(function () {
        setInterval("slideUp('.taier-top-div .taier-top-ul','-0.63rem',500)", 2000);
        var mySwiper1 = new Swiper ('.top-banner-wrap', {
            direction: 'horizontal',
            autoplay: true,
            pagination: {
                el: '.swiper-pagination',
            },
            loop: true, // 循环模式选项
            observer:true,//修改swiper自己或子元素时，自动初始化swiper
            observeParents:true//修改swiper的父元素时，自动初始化swiper
        })
        var mySwiper2 = new Swiper ('.info-coa-intro', {
            direction: 'horizontal',
            autoplay: true,
            loop: true, // 循环模式选项
            // 如果需要前进后退按钮
            navigation: {
                nextEl: '.swiper-button-prev',
                prevEl: '.swiper-button-next',
            },
            pagination: {
                el: '.swiper-pagination',
            },
            observer:true,//修改swiper自己或子元素时，自动初始化swiper
            observeParents:true//修改swiper的父元素时，自动初始化swiper
        })
    })
</script>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
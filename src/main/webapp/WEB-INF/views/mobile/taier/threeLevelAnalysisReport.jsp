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
<link rel="stylesheet" href="${ctxStatic}/taier/css/style.css">
<script type="text/javascript"
	src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
</head>
<body>
	<div class="container" style="padding-left: 0px; padding-right: 0px;">
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
		<section class="two_hangbox zcdiv">
			<div class="w1200" style="position: relative;">
				<h1 class="two_title">${analysisReport.title }</h1>
				<p class="two_desi" style="width: 80%">
					<fmt:formatDate value="${analysisReport.createDate}" type="both"
						dateStyle="full" pattern="yyyy-MM-dd hh:HH:mm" />
					[ ${analysisReport.source } 原创 ] 作者：${analysisReport.author } |
					责编：${analysisReport.editor }
				</p>
				<div class="two_cont">
					${analysisReport.threeLevelContent }
					<!-- <div class="top_two">检测周期：   2016-09-20到2017-09-21</div>
            <div class="top_two"> 舆情综述：   针对全网检测,共抓取数据281条,负面出现22条,正面出现0条,中性出现259条。</div>
            <div class="two_list">
                <h2 class="list_title">声量趋势</h2>
                <div class="list_cont">笔者小时候虽然买不起电脑，但是回忆里每当暑假到来的时候，几乎都是蹲在自己家或别人家的电视前，和小伙伴们一起玩着FC、MD度过的，那段无忧无虑的时光可以说是人生中最快乐的一段时光。</div>
                <div class="list_cont">开始工作之后，别说跟“暑假”二字彻底无缘，就是连玩游戏的闲暇时光也很难挤出来，不过你要是想问我暑假如何玩爽游戏？那你就找对人了，毕竟作为一名20多年的老玩家，对于各种游戏设备几乎是门儿清。下面就来聊聊暑假爽玩游戏的三种方案。</div>
                <div style="width: 100%"><img src="images/1.png" style="width: 100%;"></div>
            </div>
            <div class="two_list">
                <h2 class="list_title">声量趋势</h2>
                <div class="list_cont">笔者小时候虽然买不起电脑，但是回忆里每当暑假到来的时候，几乎都是蹲在自己家或别人家的电视前，和小伙伴们一起玩着FC、MD度过的，那段无忧无虑的时光可以说是人生中最快乐的一段时光。</div>
                <div class="list_cont">开始工作之后，别说跟“暑假”二字彻底无缘，就是连玩游戏的闲暇时光也很难挤出来，不过你要是想问我暑假如何玩爽游戏？那你就找对人了，毕竟作为一名20多年的老玩家，对于各种游戏设备几乎是门儿清。下面就来聊聊暑假爽玩游戏的三种方案。</div>
                <div class="two_map"><img src="images/map.png"></div>
            </div> -->
				</div>
				<input style="position: absolute; right: 0px; top: 0px;"
					id="btnCancel" class="btn" type="button" value="返 回"
					onclick="history.go(-1)" />
			</div>
		</section>
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
	</div>
	<script>
    $(function(){
        parent.window.selectmaintab(6);
        if(window.parent.refreshHeight){
            window.parent.refreshHeight();
        }
    })
</script>

	<script type="text/javascript">
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    option = {
        title: {
            text: '折线图堆叠'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ['周一','周二','周三','周四','周五','周六','周日']
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name:'邮件营销',
                type:'line',
                stack: '总量',
                data:[120, 132, 101, 134, 90, 230, 210]
            },
            {
                name:'联盟广告',
                type:'line',
                stack: '总量',
                data:[220, 182, 191, 234, 290, 330, 310]
            },
            {
                name:'视频广告',
                type:'line',
                stack: '总量',
                data:[150, 232, 201, 154, 190, 330, 410]
            },
            {
                name:'直接访问',
                type:'line',
                stack: '总量',
                data:[320, 332, 301, 334, 390, 330, 320]
            },
            {
                name:'搜索引擎',
                type:'line',
                stack: '总量',
                data:[820, 932, 901, 934, 1290, 1330, 1320]
            }
        ]
    };
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }

</script>
</body>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
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
<script type="text/javascript" src="${ctxStatic}/taier/js/pdf.js"></script>
<script type="text/javascript" src="${ctxStatic}/taier/js/pdf.worker.js"></script>
<style>
a:link {
	color: #0b2c89;
}
</style>
</head>
<body>
	<div class="container" style="padding-left: 0px; padding-right: 0px;">
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
		<!--右侧滚动导航 end-->
		<!--头部-->

		<section class="two_hangbox zcdiv">
			<div class="w1200" style="position: relative;">
				<h1 class="two_title">${analysisReport.title }</h1>
				<p class="two_desi" style="width: 80%">
					<fmt:formatDate value="${analysisReport.createDate}" type="both"
						dateStyle="full" pattern="yyyy-MM-dd hh:HH:mm" />
					[ ${analysisReport.source } 原创 ] 作者：${analysisReport.author } |
					责编：${analysisReport.editor } <a
						style="color: #337ab7; float: right;" href="javaScript:void(0)"
						onclick="gotoThreeLevel('${analysisReport.id}')">三级页面</a>
				</p>
				<div class="two_cont">${analysisReport.content }</div>
				<div>
					<div id="pdfcontent"
						style="height: 93%; padding: 8px; background-color: white; z-index: 1002; overflow: auto;"></div>
				</div>
				<input style="position: absolute; right: 0px; top: 0px;"
					id="btnCancel" class="btn" type="button" value="返 回"
					onclick="history.go(-1)" />
			</div>
		</section>

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
	</div>
	<script>
    $(function(){
        if(window.parent.refreshHeight){
            window.parent.refreshHeight();
        }
    })
</script>

	<script type="text/javascript">
	function gotoThreeLevel(id){
		window.location.href="${contextPath}/taier/analysisReportFront/gotoThreeLevelAnalysisReport?id="+id;
	}

	$(function(){
	    var url = "${analysisReport.pdfurl}";
        var pop=document.getElementById('pdfcontent');
        PDFJS.workerSrc = '${ctxStatic}/taier/js/pdf.worker.js';
            PDFJS.getDocument(url).then(function getPdfHelloWorld(pdf) {
                createCanvas(1, pdf, pdf.numPages, pop, "pdfcontent");
                if (window.parent.refreshHeight) {
                    window.parent.refreshHeight();
                }
            });
    })

    function createCanvas(indx, pdf, totalpage, conpop, pwid){
        pdf.getPage(indx).then(function getPageHelloWorld(page) {
            var scale = 1;
            var oDiv=document.createElement('canvas');
            var fDiv=document.createElement('div');
            var cDiv=document.createElement('div');
            var viewport = page.getViewport(scale);
            var pw = $("#"+pwid).width();
            scale = pw/viewport.width;
            viewport = page.getViewport(scale);
            var canvas = oDiv;
            var context = canvas.getContext('2d');

            canvas.height = viewport.height;
            canvas.width = viewport.width;

            cDiv.appendChild(oDiv);
            cDiv.appendChild(fDiv);
            cDiv.style.position = "relative";
            fDiv.style.position = "absolute";
            fDiv.style.left=0;
            fDiv.style.top=0;
            fDiv.style.height=viewport.height+"px";
            fDiv.style.width=viewport.width+"px";
            var renderContext = {
                canvasContext: context,
                viewport: viewport
            };
            conpop.appendChild(cDiv);
            page.render(renderContext);
            if(window.parent.refreshHeight){
                window.parent.refreshHeight();
            }
            if(indx+1 <= totalpage) {
                createCanvas(indx+1,pdf, totalpage, conpop, pwid);
            }
        });
        if(window.parent.refreshHeight){
            window.parent.refreshHeight();
        }
    }
</script>
</body>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
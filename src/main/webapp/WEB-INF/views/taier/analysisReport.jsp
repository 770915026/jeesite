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
<link rel="stylesheet" href="${ctxStatic}/taier/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/newtaier/css/news.css">
<link rel="stylesheet" href="${ctxStatic}/taier/font/iconfont.css">
<style type="text/css">
.on1 {
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
				<dd class="current">
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
		<div class="taier-news-banner">
			<div class="taier-container">
				<p class="banner-text ">
					<strong style="line-height: 1;">行业分析报告</strong> <em>泰尔视角聚焦业内热点话题
					</em>
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
							<dd class="on1 current" lb="5G">
								<span class="tit">5G</span> <span class="ico"></span>
							</dd>
							<dd class="on1" lb="VR">
								<span class="tit">VR</span> <span class="ico"></span>
							</dd>
							<dd class="on1" lb="AI">
								<span class="tit">AI</span> <span class="ico"></span>
							</dd>
							<dd class="on1" lb="手机">
								<span class="tit">手机</span> <span class="ico"></span>
							</dd>
							<dd class="on1" lb="数据终端">
								<span class="tit">数据终端</span> <span class="ico"></span>
							</dd>
							<dd class="on1" lb="物联网">
								<span class="tit">物联网</span> <span class="ico"></span>
							</dd>
							<dd class="on1" lb="车载">
								<span class="tit">车载</span> <span class="ico"></span>
							</dd>
						</dl>
					</div>
					<!--左侧导航 end-->
					<!--右侧新闻-->
					<div class="taier-news-tab">
						<h3 class="taier-tit">
							<span id="lbspan">5G</span>分析报告
						</h3>
						<dl class="taier-data-list" id="analysisReportList">

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
		<div class="hang_tc" id="hyfxxdl">
			<div class="hang_tcbai">
				<span class="close_btn"><i class="icon iconfont icon-guanbi"></i></span>
				<div class="tc_cont">
					<div>
						<img src="${ctxStatic}/taier/images/gold.png">
					</div>
					<div class="tc_center">
						<h3 class="gold_title2">该功能仅限会员可用</h3>
						<button class="gold_btn"
							style="background: #6389C1; display: block; margin: 10px auto"
							id="loginBut">请登录</button>
						<button class="gold_btn" id="regBut">注册成为会员</button>
					</div>
				</div>
			</div>
		</div>
		<div class="hang_tc" id="fffxxdl">
			<div class="hang_tcbai">
				<span class="close_btn"><i class="icon iconfont icon-guanbi"></i></span>
				<div class="tc_cont">
					<div>
						<img src="${ctxStatic}/taier/images/gold.png">
					</div>
					<div class="tc_center">
						<h3 class="gold_title2">该报告为付费报告</h3>
						<button class="gold_btn" id="servicer">请联系客服</button>
					</div>
				</div>
			</div>
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
		<!--FOOTER END-->
	</div>
</body>
<script type="text/javascript">
	var curPageNo=1;
	var pageCount=1;
	var count=0;
	var contextPath='${contextPath}'
    var textvl = "5G";
	$(function(){
        $(".on1").click(function(){
            $(".on1").removeClass("current");
            $(this).addClass("current");
            textvl = $(this).attr("lb");
            $("#lbspan").html(textvl);
            getAnalysisReport(1);
        })
		getAnalysisReport(1);
        $(".icon-guanbi").click(function(e){
            $(this).parent().parent().parent().hide();
        });
        if(window.parent.refreshHeight){
            window.parent.refreshHeight();
        }
        
        $("#loginBut").click(function(){
        	parent.window.location.href="${ctx}/logout";
        })
         $("#regBut").click(function(){
        	parent.window.location.href="${contextPath}/taier/jump/register1";
        })
        
        <!--客服弹出-->
        $("#servicer").click(function(){
  	      var length=$(window.parent).scrollTop();
  	      $(".dialog").show().css("top",length+"px");
  		  $(".half").show().css("height",$(document).height());	 
        })   
        $(".closees").click(function(){$(".dialog").hide();$(".half").hide();});
	})

    function toregiste(){
        window.location.href = "${contextPath}/taier/jump/register1#";
    }
	function getAnalysisReport(curPageNo){
	    var searchtxt = textvl;
		$.ajax({
	        url: contextPath+"/taier/analysisReportFront/getAnalysisReportPage",
	        type:"post",
	        dataType:"json",
	        data: {
	        	"pageNo":curPageNo,"pageSize":5,
                "title":searchtxt
	        },
	        success: function (data){
	            if(data.code==200){
                    $("#analysisReportList").html("");
	            	var analysisReportPage=data.hashMap.analysisReportPage;
	            	var analysisReportList=analysisReportPage.list;
	            	curPageNo=analysisReportPage.pageNo;
	            	pageCount=analysisReportPage.pageCount;
	            	count=analysisReportPage.count;
	            	if(analysisReportList && analysisReportList.length>0){
	            		var analysisReportListStr='';
	            		analysisReportListStr+='';
	            		for(var i=0;i<analysisReportList.length;i++){
	            			var coverStr='';
	            			if(analysisReportList[i].cover){
	            				coverStr='<img src="'+analysisReportList[i].cover+'">';
	            			}
	            			var contentText='';
	            			if(analysisReportList[i].contentText && analysisReportList[i].contentText !=null){
	            				contentText=analysisReportList[i].contentText;
	            			}
	            			analysisReportListStr+='<dd onclick="gotoAnalysisReportDetail(\''+analysisReportList[i].id+'\',\''+analysisReportList[i].isCharge+'\')">'+
                                '      <a href="javascript:;">'+
                                '      <span class="intro-box">'+
                                '      <strong>'+analysisReportList[i].title+'</strong>'+
                                '  <p>'+contentText +'</p>'+
                                ' </span>'+
                                ' <span class="data-box">'+
                                '     <em>'+analysisReportList[i].createDate+'</em></em> &ensp;| &ensp;来源：'+analysisReportList[i].source+'</em>'+
                                ' </span>'+
                                ' </a>'+
                                ' </dd>';
	            		}
	            		
	            		$("#analysisReportList").html(analysisReportListStr);
	            	}
	            	buildPage("pagenumber", curPageNo, pageCount, count, "getAnalysisReport", "");
	            }
	            
	        }
		});
	}
	function gotoAnalysisReportDetail(id,isCharge){

        var username = "${fns:getUser().name}";
        //var height= $(window.parent).height() -186;
        var height=0;
        if(username == '' || username == null) {
            $("#hyfxxdl").show();
            $("#hyfxxdl").css("top",height);
        }else if(isCharge==1){ 
        	$("#fffxxdl").show();
        	$("#fffxxdl").css("top",height);
        }else {
        
            window.location.href="${contextPath}/taier/analysisReportFront/gotoAnalysisReportDetail?id="+id;
        }

	}
	
	function gotoStatisticalChart(){
		window.location.href="${contextPath}/taier/analysisReportFront/gotoStatisticalChart";
	}
</script>
</html>
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

<style>
a:hover {
	text-decoration: none;
}

.container {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

.hang_tc, .hang_tc2 {
	position: fixed;
	top: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	display: none;
}

.hang_tcbai {
	margin: 10% auto;
	text-align: center;
}

.close_btn {
	display: inline-block;
	text-align: right;
	position: absolute;
	width: 80%;
}

.close_btn i {
	color: #fff;
}

.tc_cont {
	display: inline-block;
	text-align: center;
	width: 80%;
	font-size: 16px;
	color: #999;
}

.tc_cont {
	background: #fff;
}

.tc_center {
	text-align: center;
}

.gold_title2 {
	font-size: 24px;
	color: #333;
	text-align: center;
	margin: 30px 0;
}

.gold_btn {
	width: 136px;
	height: 35px;
	line-height: 35px;
	color: #fff;
	background: #006EFF;
	font-size: 14px;
	border: none;
	margin: 0 0 30px 0;
}
</style>
</head>
<body>
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
		<div class="taier-anaylysis-container zcdiv">
			<div class="anaylysis-banner">
				<p class="anaylysis-banner-text">
					<strong>行业分析报告</strong> <em>文案位置</em>
				</p>
			</div>
			<!--全部报告-->
			<div class="anaylysis-tab-list">
				<div class="anaylysis-tit-box">
					<h3 class="anaylysis-tit">全部报告</h3>
					<div class="selectBox">
						<select id="select" name="select">
							<option value="">全部</option>
							<option value="5G">5G</option>
							<option value="VR">VR</option>
							<option value="AI">AI</option>
							<option value="手机">手机</option>
							<option value="数据终端">数据终端</option>
							<option value="物联网">物联网</option>
							<option value="车载">车载</option>
						</select>
					</div>
				</div>
				<ul class="anaylysis-list" id="analysisReportList">

				</ul>
			</div>
			<!--全部报告 end-->
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
	<div class="container" style="padding-left: 0px; padding-right: 0px;">

		<div class="hang_tc" id="hyfxxdl">
			<div class="hang_tcbai">
				<span class="close_btn">X</span>
				<div class="tc_cont">
					<div>
						<img style="width: 100%;" src="${ctxStatic}/taier/images/gold.png">
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
				<span class="close_btn">X</span>
				<div class="tc_cont">
					<div>
						<img style="width: 100%;" src="${ctxStatic}/taier/images/gold.png">
					</div>
					<div class="tc_center">
						<h3 class="gold_title2">该报告为付费报告</h3>
						<button class="gold_btn" id="servicer">请联系客服</button>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
<script type="text/javascript">
	var curPageNo=1;
	var pageCount=1;
	var count=0;
	var contextPath='${contextPath}'
    var textvl = "5G";
	$(function(){
	    $(".close_btn").click(function(){
	        $(this).parent().parent().hide();
        })
        $("#select").change(function(){
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
	    var searchtxt = $("#select").val();
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
	            			analysisReportListStr+='<li onclick="gotoAnalysisReportDetail(\''+analysisReportList[i].id+'\',\''+analysisReportList[i].isCharge+'\')"> '+
                         '      <a class="list01" href="javascript:;">'+
                         '      <strong>'+analysisReportList[i].title+'</strong>'+
                         ' <p>'+contentText +'</p>'+
                         ' </a>'+
                         ' <p class="list02">'+
                         '     <span>'+analysisReportList[i].createDate+'</span>|<span>来源：'+analysisReportList[i].source+'</span>'+
                         ' </p>'+
                         ' </li>';
	            		}
	            		
	            		$("#analysisReportList").html(analysisReportListStr);
	            	}
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
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
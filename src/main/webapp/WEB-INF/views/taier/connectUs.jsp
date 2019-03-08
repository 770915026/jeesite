<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/taier/include.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="toTop" content="true">

<!-- <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=U1123BKbcWj9PqbGHUDaOYuC98EsT8sA"></script> -->
<link rel="stylesheet" href="${ctxStatic}/taier/css/style.css">
<script type="text/javascript">
	var markers1=[];
	var lngData1;
	var latData1;
	$(document).ready(function(){
		var lngData=$("#longitude").val();
		var latData=$("#latitude").val();
		if(!lngData || lngData==null){
			lngData=116.397477;
		}
		if(!latData || latData==null){
			latData=39.908692;
		}
		map1 = new AMap.Map('container1', {
            resizeEnable: true,
            zoom: 15,
            center: [lngData,latData]
        });
    	
    	
        AMap.service('AMap.Geocoder',function(){
            geocoder1 = new AMap.Geocoder({
                city: "010"//城市，默认：“全国”
            });
        })
        //标记位置
        markAddress1(lngData, latData);
	})
	function markAddress1(lngData, latData){
			lnglatXY1 = [lngData, latData];
	        geocoder1.getAddress(lnglatXY1, function (status, result) {
                if (status === 'complete' && result.info === 'OK') {
                    address1 = result.regeocode.formattedAddress;
                    map1.remove(markers1);
                    marker1 = new AMap.Marker({
                        position: lnglatXY,
                        title: address,
                        map: map1,
                    });
                    marker1.setMap(map1);
                    markers.push(marker1);
                    map1.setCenter(lnglatXY1);
                    $("#location-p").html(address1);
                } else {
                }
            });
		}

</script>
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
				<dd>
					<a href="${contextPath}/taier/jump/gotoAboutUs" menu="9">关于我们</a>
				</dd>
				<dd class="current">
					<a href="${contextPath}/taier/jump/gotoConnectUs" menu="10">联系我们</a>
				</dd>
			</dl>
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
		<section class="contact_box">
			<div class="w1200">
				<div class="contact_list">
					<h1 class="contact_title">
						<span>1</span>地址展示
					</h1>
					<div style="border: 1px solid #F2F2F2; padding: 10px;">
						<div id=container1 style="height: 365px; width: 100%;"></div>
					</div>
					<input type="hidden" value="${aboutUs.longitude }" id="longitude">
					<input type="hidden" value="${aboutUs.latitude }" id="latitude">
				</div>
				<div class="contact_list">
					<h1 class="contact_title">
						<span>2</span>联系方式
					</h1>
					<div class="list_contact">
						<dl class="contact_lists" style="margin-right: 14%;">
							<dt>
								<i class="icon iconfont icon-didian"></i>
							</dt>
							<dd>公司地址</dd>
							<dd>
								<small>${aboutUs.address }</small>
							</dd>
						</dl>
						<dl class="contact_lists" style="margin-right: 14%;">
							<dt>
								<i class="icon iconfont icon-tel"></i>
							</dt>
							<dd>联系方式</dd>
							<dd>
								<small>${aboutUs.phone }</small>
							</dd>
						</dl>
						<dl class="contact_lists">
							<dt>
								<i
									class="icon iconfont icon-xinxiduanxinxiaoxitixingyoujiansixinyouxiang"></i>
							</dt>
							<dd>泰尔视角邮箱</dd>
							<dd>
								<small>${aboutUs.email }</small>
							</dd>
						</dl>
						<%--<dl class="contact_lists">--%>
						<%--<dt><i class="icon iconfont icon-qie"></i></dt>--%>
						<%--<dd>联系QQ群</dd>--%>
						<%--<dd><small>${aboutUs.qqgroup }</small></dd>--%>
						<%--</dl>--%>
					</div>
				</div>
			</div>
		</section>
		<br>
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
<script type="text/javascript">
	$(function(){
		var saveFlag=true;
		$("#submitBtn").click(function(){
			if(!saveFlag){
				return false;
			}
			
			var name=$("#name").val().trim();
			if(name==null || name==""){
				alert("请填写您的姓名！");
				$("#name").focus();
				return false;
			}else if(name.length>50){
				alert("请输入50个字符以内的名字！");
				$("#name").focus();
				return false;
			}
			var phone=$("#phone").val().trim();
			if(null==phone || phone==""){
				alert("请输入手机号！");
				$("#phone").focus();
				return false;
				
			}else if(!isPhoneNo(phone)){
				alert("请输入正确的手机号！");
				$("#phone").focus();
				return false;
			}
			var email=$("#email").val().trim();
			if(null==email || email==""){
				alert("请输入邮箱！");
				$("#email").focus();
				return false;
				
			}else if(!isEmail(email)){
				alert("请输入正确的邮箱！");
				$("#email").focus();
				return false;
			}
			var content=$("#content").val().trim();
			if(content==null || content==""){
				alert("请输入留言内容！");
				$("#content").focus();
				return false;
			}else if(content.length>200){
				alert("留言内容不能超过200个字符！");
				$("#content").focus();
				return false;
			}
			saveFlag=false;
			//$('#leaveWordForm').submit();
			$.ajax({
		        url: "${contextPath}/taier/leaveWord/saveLeaveWord",
		        type:"post",
		        dataType:"json",
		        data: {"name":name,
		        	   "phone":phone,
		        	   "email":email,
		        	   "content":content
		        },
		        success: function (data){
		            saveFlag=true;
		            if(data.code==200){
		            	alert(data.hashMap.msg);
			            clearForm();
		            }else{
		            	alert("留言失败！");
		            }
		            
		        },
		        error:function(){
		        	saveFlag=true;
		        	alert("添加失败")
		        }
		    });

		})
        /* var iframe=parent.document.getElementById("mainFrame");
		var height=$(".contact_box").height()+40;
		iframe.style.height=height+"px"; */
		if(window.parent.refreshHeight){
            window.parent.refreshHeight();
        }
	})
	
	function isPhoneNo(phone) {
	    var pattern = /^[1][3,4,5,7,8][0-9]{9}$/
	    return pattern.test(phone);
	}
	function isEmail(email) {
		var emailreg = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
		return emailreg.test(email)
		
    }
	function clearForm(){
		$("#name").val("");
		$("#phone").val("");
		$("#email").val("");
		$("#content").val("");
	}
</script>
</html>
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

<!-- <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=U1123BKbcWj9PqbGHUDaOYuC98EsT8sA"></script> -->
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/newtaiermobile/css/index.css">
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

		<div class="abotUs-container zcdiv">
			<!--联系我们-->
			<div class="taier-visual-text">
				<h3 class="title">联系我们</h3>
				<div class="contact-text">
					<p>
						公司地址: <span id="address"></span><br />联系电话：<span id="phone"></span><br />泰尔邮箱：<span
							id="email"></span>
					</p>
				</div>
				<h3 class="title mt70">关注泰尔视角</h3>
				<div class="follow-ｂg"></div>
				<h3 class="title mt70">在线留言</h3>
				<div class="tontact-us-form">
					<span class="input-box"> <input class="input" type=""
						name="lyname" id="lyname" placeholder="姓名">
					</ins>
					</span> <span class="input-box"> <input class="input" type=""
						name="lyphone" id="lyphone" placeholder="电话">
					</ins>
					</span> <span class="input-box"> <input class="input" type=""
						name="lyemail" id="lyemail" placeholder="邮箱">
					</ins>
					</span> <span class="textarea-box"> <textarea class="textarea"
							id="lycontent" placeholder=""></textarea>
					</span> <br> <a class="submit-btn" href="javascript:;" id="lyBtn">发送</a>
				</div>
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
	</section>
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
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
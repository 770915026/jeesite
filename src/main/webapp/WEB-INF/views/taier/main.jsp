<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="toTop" content="true">
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/newtaier/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/newtaier/css/login.css">
<script type="text/javascript"
	src="${ctxStatic}/taier/js/jquery-3.1.1.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/taier/view/js/main.js?version=<%=Math.random()%>"></script>
<script type="text/javascript"
	src="http://webapi.amap.com/maps?v=1.4.4&key=8e2c24150d9743810be9ae4fa2461da5"></script>
<script>
        function showwxqr(obj){
            if($("#qrwxdiv").length > 0){
                $("#qrwxdiv").css("top",$(obj).offset().top+38);
                $("#qrwxdiv").css("left",$(obj).offset().left-90);
                $("#qrwxdiv").show();
            }
        }
        function closewxqr(obj){
            if($("#qrwxdiv").length > 0){
                $("#qrwxdiv").hide();
            }
        }
        function showwbqr(obj){
            if($("#qrwbdiv").length > 0){
                $("#qrwbdiv").css("top",$(obj).offset().top+38);
                $("#qrwbdiv").css("left",$(obj).offset().left-90);
                $("#qrwbdiv").show();
            }
        }
        function closewbqr(obj){
            if($("#qrwbdiv").length > 0){
                $("#qrwbdiv").hide();
            }
        }
    </script>
</head>
<body>
	<div class="container">
		<!--右侧滚动导航-->
		<div class="taier-tips">
			<dl>
				<dd class="list">
					<a href="javascript:;">在线业务</a>
				</dd>
				<dd>
					<a href="javascript:;">CCC<br />业务
					</a>
				</dd>
				<dd>
					<a href="javascript:;">进网<br />业务
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
					<a href="javascript:;">客服<br />中心
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
					<a href="javascript:void(0);"
						rel="${contextPath}/taier/jump/gotoFirstPage" menu="1">首页</a>
				</dd>
				<dd>
					<a href="javascript:void(0);"
						rel="${contextPath}/taier/jump/gotoNews" menu="2">新闻动态</a>
				</dd>
				<dd id="businessBar">
					<a href="javascript:void(0);" menu="3">业务办理</a>
				</dd>
				<dd>
					<a href="javascript:void(0);"
						rel="${contextPath}/taier/jump/gotoFirstPage#tezs" menu="30">泰尔证书</a>
				</dd>
				<dd>
					<a href="javascript:void(0);"
						rel="${contextPath}/taier/jump/unionInfoListUSer" menu="4">信息发布</a>
				</dd>
				<dd>
					<a href="javascript:void(0);"
						rel="${contextPath}/taier/jump/preSetAppListUSer" menu="5">应用公示</a>
				</dd>
				<dd>
					<a href="javascript:void(0);"
						rel="${contextPath}/taier/analysisReportFront/gotoAnalysisReport"
						menu="6">行业分析报告</a>
				</dd>
				<dd>
					<a href="javascript:void(0);"
						rel="${contextPath}/taier/activityFront/gotoActivity" menu="7">小泰说</a>
				</dd>
				<dd>
					<a href="javascript:void(0);"
						rel="${contextPath}/taier/policyFront/gotoPolicy" menu="8">政策</a>
				</dd>
				<dd>
					<a href="javascript:void(0);"
						rel="${contextPath}/taier/jump/gotoAboutUs" menu="9">关于我们</a>
				</dd>
				<dd>
					<a href="javascript:void(0);"
						rel="${contextPath}/taier/jump/gotoConnectUs" menu="10">联系我们</a>
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
					<a class="input-btn" href="${contextPath}/taier/jump/main?type=zc">注册</a>
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
		<div>
			<iframe id="mainFrame" scrolling="no" frameborder="0"
				style="width: 100%; height: 100%; border: 0;"></iframe>
		</div>
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
								name="lyname" type="text" placeholder="姓名"> <input
								class="input" name="lyphone" type="tel" placeholder="电话">
								<input class="input" name="lyemail" type="email"
								placeholder="邮箱">
							</span>
							<div class="textarea-box">
								<span class="textarea-div"> <textarea class="textarea"
										placeholder="" id="lycontent"></textarea>
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
<script type="text/javascript">
	var contextPath="${contextPath}";
    var usertype = "${fns:getUser().userType}";
    var t="${param.t}";
    function show(url){
        $(".nav_list").find(".active_li").removeClass("active_li");
        $("#mainFrame").attr("src",url);
    }
    function selectmaintab(idx){
        $(".nav_list").find(".active_li").removeClass("active_li");
        $(".nav_list").children().eq(idx).addClass("active_li");
    }
    function showuserinfo(obj){
    	addThisOperateRecords(obj);
        $(".nav_list").find(".active_li").removeClass("active_li");
        if(usertype == "2") {
            $("#mainFrame").attr("src",'${ctx}/taier/user/userinfoyh');
        } else {
            $("#mainFrame").attr("src",'${ctx}/taier/tlCompanyInfo/view');
        }

    }
    function addThisOperateRecords(obj){
    	var menu=$(obj).attr("menu");
		var menuName="厂家基本信息表";
		
		$.ajax({
	        url: contextPath+"/taier/operateRecords/save",
	        type:"post",
	        dataType:"json",
	        data: {
	        	"menu":menu,
	        	 "menuName":menuName,
	        	 "operateType":"1"
	        },
	        success: function (data){
	            if(data.code==200){
	            	
	            }
	        }
		});
    }
    var lngData="";
    var latData="";
    var markers=[];
    $(function(){
        if(t=="1") {
            $("#headmenu").children().hide();
        }
        var type="${type}";
        if(usertype == "" && type == "") {
            $("#mainFrame").attr("src",contextPath+"/taier/jump/gotoFirstPage");
        } else {
            if(type=="zc"){
                $("#mainFrame").attr("src",contextPath+"/taier/jump/register1");
            } else if(type=="wjmm"){
                $("#mainFrame").attr("src",contextPath+"/taier/jump/forgetPassword");
            } else {

                if(usertype == "2") {
                    $("#mainFrame").attr("src",contextPath+"/taier/jump/gotoFirstPage");
                } else {
                    var release = "${fns:getUser().release}";
                    if(release == "0") {
                        $("#mainFrame").attr("src",contextPath+"/taier/jump/agreementCompany");
                    } else {
                        $("#mainFrame").attr("src","${ctx}/taier/tlCompanyInfo/view");
                    }
                }

            }
        }

        $.ajax({
            type:"post",
            url:"${contextPath}/taier/jump/qryQrCode",
            dataType:"json",
            success: function (e) {
                var tlqrcode = e.hashMap.tlQrcode;
                if(tlqrcode.id){
                    $("#qrwximg").attr("src",tlqrcode.weixinurl);
                    $("#qrwbimg").attr("src",tlqrcode.weibourl);
                } else {
                    $("#qrwxdiv").remove();
                    $("#qrwbdiv").remove();
                }
            }
        })

        $.ajax({
            type:"post",
            url:"${contextPath}/taier/jump/qryConnectUs",
            dataType:"json",
            async:false,
            success: function (e) {
                var aboutUs = e.hashMap.aboutUs;
                lngData=aboutUs.longitude;
                latData=aboutUs.latitude;
                $("#address").html(aboutUs.address);
                $("#email").html(aboutUs.email);
                $("#phone").html(aboutUs.phone);
            }
        })

        map = new AMap.Map('container', {
            resizeEnable: true,
            zoom: 15,
            center: [lngData,latData]
        });


        AMap.service('AMap.Geocoder',function(){
            geocoder = new AMap.Geocoder({
                city: "010"//城市，默认：“全国”
            });
        })
        //标记位置
        markAddress(lngData, latData);


        var saveFlag=true;
        $("#lyBtn").click(function(){
            if(!saveFlag){
                return false;
            }

            var name=$("#lyname").val().trim();
            if(name==null || name==""){
                alert("请填写您的姓名！");
                $("#lyname").focus();
                return false;
            }else if(name.length>50){
                alert("请输入50个字符以内的名字！");
                $("#lyname").focus();
                return false;
            }
            var phone=$("#lyphone").val().trim();
            if(null==phone || phone==""){
                alert("请输入手机号！");
                $("#lyphone").focus();
                return false;

            }else if(!isPhoneNo(phone)){
                alert("请输入正确的手机号！");
                $("#lyphone").focus();
                return false;
            }
            var email=$("#lyemail").val().trim();
            if(null==email || email==""){
                alert("请输入邮箱！");
                $("#lyemail").focus();
                return false;

            }else if(!isEmail(email)){
                alert("请输入正确的邮箱！");
                $("#lyemail").focus();
                return false;
            }
            var content=$("#lycontent").val().trim();
            if(content==null || content==""){
                alert("请输入留言内容！");
                $("#lycontent").focus();
                return false;
            }else if(content.length>200){
                alert("留言内容不能超过200个字符！");
                $("#lycontent").focus();
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
    function markAddress(lngData, latData){
        lnglatXY = [lngData, latData];
        geocoder.getAddress(lnglatXY, function (status, result) {
            if (status === 'complete' && result.info === 'OK') {
                address = result.regeocode.formattedAddress;
                map.remove(markers);
                marker = new AMap.Marker({
                    position: lnglatXY,
                    title: address,
                    map: map,
                });
                marker.setMap(map);
                markers.push(marker);
                map.setCenter(lnglatXY);
                $("#location-p").html(address);
            } else {
            }
        });
    }
    function search(){
        var searchkey = $("#searchkey").val();

        $("#mainFrame").attr("src","${contextPath}/taier/analysisReportFront/gotoAnalysisReport?title="+searchkey);
    }
</script>
</html>
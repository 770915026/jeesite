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
	href="${ctxStatic}/newtaier/css/informationdDelivery.css">
<style>
a:hover {
	text-decoration: none;
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
<body>
	<!--右侧滚动导航-->
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
				<dd class="current">
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
		<div class="taier-information-wrap">
			<!--顶部-->
			<div class="information-header">
				<div class="taier-container-outer">
					<span class="informationd-tit  informationd-tit2">预置APP公示</span>
					<div class="informationd-form">
						<div class="selectBox">
							<select id="select" name="select" style="line-height: 46px;">
								<option value="">产品名称</option>
							</select>
						</div>
						<div class="inputBox">
							<input class="input" type="" name="" value="${text}" id="title"
								style="line-height: 30px;" placeholder="品牌名称、型号、获证情况">
						</div>
						<a class="search" style="margin-right: 0px;" href="javascript:;"
							onclick="qry(1,1)"></a>
					</div>
				</div>
			</div>
			<!--顶部 end-->
			<!--产品相关-->
			<div class="taier-container-outer">
				<div class="informationd-selector">
					<!--品牌-->
					<div class="selector-brand-box lines clearfix">
						<h4 class="selector-brand-tit">品牌:</h4>
						<dl class="selector-brand-dl">
							<dd pp="华为" onclick="qry(1,2,'华为',this)">
								<a href="javascript:;"> <span class="img"><img
										src="${ctxStatic}/newtaier/images/informationdDelivery/info-ico04.jpg"></span>
									<p class="text">华为</p>
								</a>
							</dd>
							<dd pp="小米" onclick="qry(1,2,'小米',this)">
								<a href="javascript:;"> <span class="img"><img
										src="${ctxStatic}/newtaier/images/informationdDelivery/info-ico06.jpg"></span>
									<p class="text">小米</p>
								</a>
							</dd>
							<dd pp="OPPO" onclick="qry(1,2,'OPPO',this)">
								<a href="javascript:;"> <span class="img"><img
										src="${ctxStatic}/newtaier/images/informationdDelivery/info-ico07.jpg"></span>
									<p class="text">OPPO</p>
								</a>
							</dd>
							<dd pp="VIVO" onclick="qry(1,2,'VIVO',this)">
								<a href="javascript:;"> <span class="img"><img
										src="${ctxStatic}/newtaier/images/informationdDelivery/info-ico09.jpg"></span>
									<p class="text">VIVO</p>
								</a>
							</dd>
							<dd pp="魅族" onclick="qry(1,2,'魅族',this)">
								<a href="javascript:;"> <span class="img"><img
										src="${ctxStatic}/newtaier/images/informationdDelivery/info-ico10.jpg"></span>
									<p class="text">魅族</p>
								</a>
							</dd>
							<dd pp="三星" onclick="qry(1,2,'三星',this)">
								<a href="javascript:;"> <span class="img"><img
										src="${ctxStatic}/newtaier/images/informationdDelivery/info-ico08.jpg"></span>
									<p class="text">三星</p>
								</a>
							</dd>
							<dd pp="诺基亚" onclick="qry(1,2,'诺基亚',this)">
								<a href="javascript:;"> <span class="img"><img
										src="${ctxStatic}/newtaier/images/informationdDelivery/info-ico05.jpg"></span>
									<p class="text">诺基亚</p>
								</a>
							</dd>
							<dd pp="联想" onclick="qry(1,2,'联想',this)">
								<a href="javascript:;"> <span class="img"><img
										src="${ctxStatic}/newtaier/images/informationdDelivery/info-ico11.jpg"></span>
									<p class="text">联想</p>
								</a>
							</dd>
							<dd pp="中兴" onclick="qry(1,2,'中兴',this)">
								<a href="javascript:;"> <span class="img"><img
										src="${ctxStatic}/newtaier/images/informationdDelivery/info-ico12.jpg"></span>
									<p class="text">中兴</p>
								</a>
							</dd>
							<dd pp="一加" onclick="qry(1,2,'一加',this)">
								<a href="javascript:;"> <span class="img"><img
										src="${ctxStatic}/newtaier/images/informationdDelivery/info-ico13.jpg"></span>
									<p class="text">一加</p>
								</a>
							</dd>
						</dl>
						<div class="more">
							<!--收起箭头 style retract-->
							<span>更多</span>
						</div>
					</div>
					<!--品牌 end-->
					<!--内存-->
					<div class="memory lines clearfix">
						<h4 class="memory-tit">内存:</h4>
						<div class="memory-list">
							<a class="links nca" href="javascript:;" nc="521GB"
								onclick="qry(1,21,'521GB',this)">521GB</a> <a class="links nca"
								href="javascript:;" nc="256GB" onclick="qry(1,21,'256GB',this)">256GB</a>
							<a class="links nca" href="javascript:;" nc="128GB"
								onclick="qry(1,21,'128GB',this)">128GB</a> <a class="links nca"
								href="javascript:;" nc="64GB" onclick="qry(1,21,'64GB',this)">64GB</a>
							<a class="links nca" href="javascript:;" nc="32GB"
								onclick="qry(1,21,'32GB',this)">32GB</a> <a class="links nca"
								href="javascript:;" nc="16GB" onclick="qry(1,21,'16GB',this)">16GB</a>
							<a class="links nca" href="javascript:;" nc="8GB"
								onclick="qry(1,21,'8GB',this)">8GB</a> <a class="links nca"
								href="javascript:;" nc="8GB以下" onclick="qry(1,21,'8GB以下',this)">8GB以下</a>
							<a class="links nca" href="javascript:;" nc="支持内存卡"
								onclick="qry(1,21,'支持内存卡',this)">支持内存卡</a>
						</div>
					</div>
					<!--内存 end-->
					<!--尺寸-->
					<div class="memory clearfix">
						<h4 class="memory-tit">尺寸:</h4>
						<div class="memory-list">
							<a class="links cca" href="javascript:;" cc="3.0英寸及以下"
								onclick="qry(1,22,'3.0英寸及以下',this)">3.0英寸及以下</a> <a
								class="links cca" href="javascript:;" cc="4.5-3.1英寸"
								onclick="qry(1,22,'4.5-3.1英寸',this)">4.5-3.1英寸</a> <a
								class="links cca" href="javascript:;" cc="5.0-4.6英寸"
								onclick="qry(1,22,'5.0-4.6英寸',this)">5.0-4.6英寸</a> <a
								class="links cca" href="javascript:;" cc="5.5-5.1英寸"
								onclick="qry(1,22,'5.5-5.1英寸',this)">5.5-5.1英寸</a> <a
								class="links cca" href="javascript:;" cc="5.6英寸及以上"
								onclick="qry(1,22,'5.6英寸及以上',this)">5.6英寸及以上</a>
						</div>
					</div>
					<!--尺寸 end-->
				</div>
				<!--产品配置导航-->
				<div class="detailed-nav clearfix " id="dhl"></div>
				<!--产品配置导航 end-->
			</div>
			<!--产品相关 end-->
			<!--配置筛选-->
			<div class="taier-container">
				<div class="taier-sort-con">
					<div class="taier-sort-nav">
						<span class="sort-nav"> <a class="links current rmsj"
							href="javascript:;" onclick="qry(1,4,0,this)">热门</a> <a
							class="links rmsj" href="javascript:;" onclick="qry(1,4,1,this)">时间</a>
						</span> <span class="sort-number">共<em><span id="zgk">0</span></em>款
						</span>
					</div>
					<!--筛选产品展示-->
					<div class="sort-tab-list">
						<dl class="listBox" id="qiehuanlist">

						</dl>
						<!--翻页-->
						<div class="page-main" id="pagenumber"></div>
						<!--翻页 end-->
					</div>
					<!--筛选产品展示 end-->
				</div>
			</div>
			<!--配置筛选 end-->

		</div>

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
	<script>

    var pp = "${pp}";
    var nc = "${nc}";
    var cc = "${cc}";
    var textvl = "${text}"
    function createdhl(){
        var str = "";
        if(pp != ""){
            str+='<span style="cursor: pointer;" onclick="xxfb(\'\',\''+pp+'\',\'\',\'\')">'+pp+'></span>';
        }
        if(nc != ""){
            str+='<span style="cursor: pointer;" onclick="xxfb(\'\',\''+pp+'\',\''+nc+'\',\'\')">'+nc+'></span>';
        }
        if(cc != ""){
            str+='<span  style="cursor: pointer;" onclick="xxfb(\'\',\''+pp+'\',\''+nc+'\',\''+cc+'\')">'+cc+'></span>';
        }
        $("#dhl").html(str);
    }
    function xxfb(text,pp,nc,cc) {
        if(pp==""){
            text = $("#textinp").val();
            window.location.href="${contextPath}/taier/jump/unionInfoListUSer?text="+text;
        } else {
            window.location.href='${contextPath}/taier/jump/unionInfoListUSer?pp='+pp+'&nc='+nc+'&cc='+cc;
        }

    }
    $(function () {

    })
</script>
	<script type="text/javascript">
    var contextPath="${contextPath}";
    $('.qiehuan').click(function() {
        $('.qiehuan').removeClass('info_active');
        $(this).addClass('info_active');
        $('.qiehuanlist').eq($(this).index()).show().siblings().hide();
    });

    $(function(){

        $('.xfc_close').click(function() {
            $(this).parent().hide();
        });
        createdhl();
        qry1(1);

    })
    var px = 0;
    var idxz;
    var valz;
    function qry(currpage, idx, val, obj) {
        if(idx == 1) {
            textvl = $("#title").val();
        }
        if(idx == 2) {
            $(".selector-brand-dl dd").removeClass("current");
            $(obj).addClass("current");
            pp=$(obj).attr("pp");
            $(".nca").removeClass("current");
            $(".cca").removeClass("current");
            nc="";
            cc="";
            createdhl();
        }
        if(idx == 21) {
            $(".nca").removeClass("current");
            $(obj).addClass("current");
            nc=$(obj).attr("nc");

            $(".cca").removeClass("current");
            cc="";
            createdhl();
        }
        if(idx == 22) {
            $(".cca").removeClass("current");
            $(obj).addClass("current");
            cc=$(obj).attr("cc");
            createdhl();
        }
        if(idx == 4) {
            px = val;
            $(".rmsj").removeClass("current");
            $(obj).addClass("current");
        }
        qry1(currpage);
    }
    function qry1(currpage) {
        var data = {};
        data.title = textvl;
        data.px = px;
        data.pageNo=currpage;
        data.pageSize=8;
        data.pp = pp;
        data.nc = nc;
        data.cc = cc;


        ajax(contextPath+"/taier/jump/preSetAppListUSerQry",data,function (result) {
            var code  = result.code;
            $("#qiehuanlist").html("");
            if(code == 200) {
                var list = result.hashMap.page.list;
                for(var i=0;i<list.length;i++) {
                	var productName='';
                	if(list[i].productName && list[i].productName !=null){
                		productName=list[i].productName;
                	}
                    $("#qiehuanlist").append('<dd>'+
                    '     <a href="${contextPath}/taier/jump/preSetAppDetailUSer?id='+list[i].id+'" >'+
                    '     <span class="img-box">'+
                    '     <img src="'+list[i].img+'">'+
                    '     </span>'+
                    '     <p class="list-text">'+productName+'</p>'+
                    ' </a>'+
                    ' <p class="list-more">'+
                    '     <a class="links" href="${contextPath}/taier/jump/preSetAppDetailUSer?id='+list[i].id+'">查看详细</a>'+
                    '     </p>'+
                    '    </dd>');
                }

                buildPage("pagenumber",result.hashMap.page.pageNo,result.hashMap.page.pageCount,result.hashMap.page.count,"qry1","");
                $("#zgk").html(result.hashMap.page.count);
            } else {
                alert(result.hashMap.msg);
            }
        });


    }

</script>


</body>
</html>
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
</style>
</head>

<body>
	<section>
		<!--菜单弹层-->
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
		<div class="taierFormula-container">
			<!--搜索-->
			<div class="container-box">
				<h3 class="formula-tit">预置APP公示</h3>
				<div class="informationd-form">
					<div class="selectBox">
						<select id="select" name="select">
							<option value="">产品名称</option>
						</select>
					</div>
					<div class="inputBox">
						<input class="input" type="" name="" id="title"
							placeholder="品牌名称、型号、获证情况">
					</div>
					<a class="search" href="javascript:;" onclick="qry(1,1)"></a>
				</div>
			</div>
			<!--搜索 end-->
			<!--筛选条件-->
			<div class="rule-nav-box">
				<!--弹窗-->
				<div class="window-filter-box" style="position: relative;">
					<div class="window-filter-more">
						<!--导航-->
						<ul class="tab-nav">
							<li class="item cur"><a href="javascript:;"
								onclick="zs1(1,this)">品牌</a></li>
							<li class="item"><a href="javascript:;"
								onclick="zs1(2,this)">内存</a></li>
							<li class="item"><a href="javascript:;"
								onclick="zs1(3,this)">尺寸</a></li>
						</ul>
						<!--导航 end-->
						<!--品牌-->
						<div class="item-tablist item-tablist1">
							<ul class="item-options">
								<li onclick="qry(1,2,'华为',this)" class="ppli cur">华为（HUAWEI）</li>
								<li onclick="qry(1,2,'Apple',this)" class="ppli">Apple</li>
								<li onclick="qry(1,2,'红旗坡',this)" class="ppli">红旗坡（HONG QI
									PO）</li>
								<li onclick="qry(1,2,'农夫山泉',this)" class="ppli">农夫山泉</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">潘苹果（panpingguo）</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">京东生鲜</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">鼎端</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">马小二果园</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">华为（HUAWEI）</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">Apple</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">红旗坡（HONG QI
									PO）</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">农夫山泉</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">潘苹果（panpingguo）</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">京东生鲜</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">鼎端</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">马小二果园</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">华为（HUAWEI）</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">Apple</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">红旗坡（HONG QI
									PO）</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">农夫山泉</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">潘苹果（panpingguo）</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">京东生鲜</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">鼎端</li>
								<li onclick="qry(1,2,'华为',this)" class="ppli">马小二果园</li>
							</ul>
						</div>

						<div class="item-tablist item-tablist2" style="display: none;">
							<ul class="item-options">
								<li onclick="qry(1,21,'521GB',this)" class="ncli">521GB</li>
								<li onclick="qry(1,21,'256GB',this)" class="ncli">256GB</li>
								<li onclick="qry(1,21,'128GB',this)" class="ncli">128GB</li>
								<li onclick="qry(1,21,'64GB',this)" class="ncli">64GB</li>
								<li onclick="qry(1,21,'32GB',this)" class="ncli">32GB</li>
								<li onclick="qry(1,21,'16GB',this)" class="ncli">16GB</li>
								<li onclick="qry(1,21,'8GB',this)" class="ncli">8GB</li>
								<li onclick="qry(1,21,'8GB以下',this)" class="ncli">8GB以下</li>
								<li onclick="qry(1,21,'支持内存卡',this)" class="ncli">支持内存卡</li>

							</ul>
						</div>

						<div class="item-tablist item-tablist3" style="display: none;">
							<ul class="item-options">
								<li onclick="qry(1,22,'3.0英寸及以下',this)" class="ppli cur">3.0英寸及以下</li>
								<li onclick="qry(1,22,'4.5-3.1英寸',this)" class="ppli">4.5-3.1英寸</li>
								<li onclick="qry(1,22,'5.0-4.6英寸',this)" class="ppli">5.0-4.6英寸</li>
								<li onclick="qry(1,22,'5.5-5.1英寸',this)" class="ppli">5.5-5.1英寸</li>
								<li onclick="qry(1,22,'5.6英寸及以上',this)" class="ppli">5.6英寸及以上</li>
							</ul>
						</div>
						<!--品牌 end-->
						<!--重置-->
						<div class="submit-box">
							<a class="reset" href="javascript:;" onclick="cz()">重置</a> <a
								class="cancel" href="javascript:;">取消</a>
						</div>
						<!--重置 end-->
					</div>
				</div>
				<!--弹窗 end-->
			</div>
			<!--筛选条件 end-->
			<!--产品导航-->
			<div class="time-nav-box" id="dhl"></div>
			<!--产品导航 end-->
			<!--列表导航-->
			<div class="list-nav-box">
				<a class="list current" href="javascript:;"
					onclick="qry(1,4,0,this)">热&nbsp;点</a> <a class="list"
					href="javascript:;" onclick="qry(1,4,1,this)">时&nbsp;间</a>
			</div>
			<!--列表导航-->
			<!--热点-->
			<div class="foumula-tab-list clearfix">
				<ul class="foumula-list" id="qiehuanlist">

				</ul>
			</div>
			<!--热点 end-->

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
		<!--FOOTER END-->
	</section>

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
                    $("#qiehuanlist").append('<li>'+
                '      <img class="img" src="'+list[i].img+'" >'+
                '      <div class="list-text">'+
                '      <span class="text">'+productName+'</span>'+
                '  <a class="more" href="${contextPath}/taier/jump/preSetAppDetailUSer?id='+list[i].id+'">查看详情</a>'+
                '      </div>'+
                '     </li>');
                }

            } else {
                alert(result.hashMap.msg);
            }
        });


    }

</script>

</body>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
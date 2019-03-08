<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/taier/include.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="toTop" content="true">
<style>
.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

ul {
	margin-right: 0px;
	margin-left: 0px;
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
			</span> <a class="input-btn" href="${ctx}/logout">登录</a> <a
				class="input-btn" href="${contextPath}/taier/jump/register1">注册</a>
		</div>
		<!--SEARCH END-->

	</div>


	<section class="personal_cont">
		<div class="w1200">
			<div class="personal_left">
				<dl>
					<dt>
						<img src="${ctxStatic}/taier/images/avator.png"
							class="personal_avator">
					</dt>
					<dd>${fns:getUser().name}的账户</dd>
				</dl>
			</div>
			<div class="personal_right" id="datatable1">
				<p class="per_titless">
					<i class="icon iconfont icon-arrfill_u-copy"></i>消息中心
				</p>

				<ul class="pagination" id="pagenumber">
				</ul>
			</div>
		</div>
	</section>

	<script>
    $(function () {
        addmenu();
        $("#lm2").addClass("per_active");
        querydata(1);
    })

    function querydata(curpage){
        $.ajax({
            type:"post",
            url:"${ctx}/taier/tlMessage/getList",
            data:"currentPage=" + curpage,
            dataType:"json",
            success:function(msg){
                console.log(msg);
                var trs="";
                $(".datatr").remove();
                $.each(msg.list,function(i,info){
                    trs+='<dl class="per_list per_listab datatr">\n' +
                        '                <dd>\n' +
                        '                    <a href="${ctx}/taier/tlMessage/detailUSer?id='+info.tlMessage.id+'"> <span class="name_listper" style="color: #006EFF;">'+info.tlMessage.tittle+'</span></a>\n' +
                        '                    <span class="time_listper" style="float: right;padding-right: 10px;">'+info.createDate+'</span>\n' +
                        '                </dd>\n' +
                        '                <dd><a href="${ctx}/taier/tlMessage/detailCompany?id='+info.tlMessage.id+'"><span style="overflow:hidden">'+info.tlMessage.content+'</span></a></dd>\n' +
                        '            </dl>';

                });
                $("#datatable1").children().eq(0).after(trs);
                buildPage("pagenumber",msg.pageNo,msg.pageCount,msg.count,"querydata","");
            }
        })
    }
</script>
</body>
</html>
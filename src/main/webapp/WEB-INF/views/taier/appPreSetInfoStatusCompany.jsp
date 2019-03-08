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

	<!--中间部分-->
	<section class="qiye_cont w1200">
		<div class="qiye_left">
			<div class="qiye_lefttop">
				<span class="date_qiye"><img
					src="${ctxStatic}/taier/images/qiye_img1.png">2018-07-10到期</span> <span
					class="shenfen"><img
					src="${ctxStatic}/taier/images/qiye_img2.png" class="qiye_avator"><span
					class="dengji">v3</span></span> <span class="qiye_name">${fns:getUser().name}的账户</span>
			</div>
			<ul class="qiye_list">
			</ul>
		</div>
		<div class="qiye_right">
			<h3>
				<i class="icon iconfont icon-arrfill_u-copy"></i>预置应用公示
			</h3>
			<div class="status_info">
				状态: <span class="posi_select"> <select id="sta">
						<option value="">全部</option>
						<option value="0">已保存</option>
						<option value="1">待发布</option>
						<option value="2">已发布</option>
				</select> <span><img src="${ctxStatic}/taier/images/jiantou.png" /></span>
				</span> <span class="posi_select"> <input type="text"
					placeholder="请输入产品型号或关键词" id="title" class="model_input">
				</span> <a href="#" class="fabu_select" onclick="querydata(1)">查询</a>

			</div>
			<table class="table table-bordered fabu_table" id="datatable1">
				<tr class="theads">
					<td width="40%">预置应用公示名称</td>
					<td width="30%">状态</td>
					<td width="15%">提交日期</td>
					<td width="15%">操作</td>
				</tr>
			</table>
			<ul class="pagination" style="margin-top: 10px" id="pagenumber">
			</ul>

		</div>
	</section>

	<script>
    $(function(){
        addmenu();
        $("#lfywlist").show();
        $("#lflist2").show();
        $("#lm13").addClass("qiye_xuanzhong");
        querydata(1);
    })

    function querydata(curpage){
        var qrystat = $("#sta").val();
        var qrytitle = $("#title").val();
        $.ajax({
            type:"post",
            url:"${ctx}/taier/tlApppreset/checkStatusList",
            data:"currentPage=" + curpage + "&qrystat=" + qrystat + "&qrytitle=" + qrytitle,
            dataType:"json",
            success:function(msg){
                console.log(msg);
                var trs="";
                $(".datatr").remove();
                $.each(msg.list,function(i,info){
                    trs+='<tr class="datatr">\n' +
                        '                <td><a style="color:black;" href="${ctx}/taier/tlApppreset/viewTable?id='+info.id+'">'+info.tableName+'</a></td>\n';
                    var stahtml = "";
                    if(info.flag == "0"){
                        stahtml = '<td><span class="status_now status_geng"><i class="icon iconfont icon-jiantou"></i>可修改</span><span class="status_now"><i class="icon iconfont icon-jiantou"></i>待发布</span><span class="status_now"><i class="icon iconfont icon-jiantou"></i>已发布</span></td>';
                    } else if(info.flag == "1"){
                        stahtml = '<td><span class="status_now"><i class="icon iconfont icon-jiantou"></i>可修改</span><span class="status_now status_geng"><i class="icon iconfont icon-jiantou"></i>待发布</span><span class="status_now"><i class="icon iconfont icon-jiantou"></i>已发布</span></td>';
                    } else if(info.flag == "2"){
                        stahtml = '<td><span class="status_now"><i class="icon iconfont icon-jiantou"></i>可修改</span><span class="status_now"><i class="icon iconfont icon-jiantou"></i>待发布</span><span class="status_now status_geng"><i class="icon iconfont icon-jiantou"></i>已发布</span></td>';
                    }
                    trs+=stahtml;
                    trs+= '                <td>'+info.createDate+'</td>\n';
                    trs+= '<td>'+
                        '<a style="color:#2fa4e7;" href="${ctx}/taier/tlApppreset/viewTable?id='+info.id+'">编辑提交</a>&nbsp;'+
                        '<a style="color:#2fa4e7;" href="javaScript:void(0)" onclick="deleteappset(\''+info.id+'\')">删除</a>'+
                        '</td>'+
                        '</tr>';
                });
                $("#datatable1").append(trs);
                buildPage("pagenumber",msg.pageNo,msg.pageCount,msg.count,"querydata","");
            }
        })
    }
    function deleteappset(id){
        var r=confirm("确认要删除该预置应用信息吗?");
        if(r==true){
            $.ajax({
                type:"post",
                url:"${contextPath}/taier/tlApppreset/deleteAppSet",
                data:{"id":id},
                dataType:"json",
                success:function(data){
                    if(data.code=="200"){
                        alert("删除成功！");
                        location.href=location.href;
                    }

                }
            })
        }
    }
</script>
</body>
</html>
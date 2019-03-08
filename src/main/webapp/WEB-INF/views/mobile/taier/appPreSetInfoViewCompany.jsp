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

.dela {
	display: block;
	color: black;
	position: absolute;
	right: 0px;
	top: 0px;
	width: 20px;
	height: 20px;
	z-index: 1002;
	line-height: 20px;
}

.appli_file a {
	color: black !important;
}

.appli_file a:hover {
	color: black !important;
}
</style>
</head>
<body>

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
		<div class="qiye_right" style="height: auto">
			<h3>
				<i class="icon iconfont icon-arrfill_u-copy"></i>预置应用公示
			</h3>
			<p class="show_zhusi">
				注：仅不涉及手机信息安全的部分可以修订，如果涉及信息安全，请及时进行手机进网备案业务。<a href="#">https://home.firefoxchina.cn/</a>
			</p>
			<p class="upda_qiye">
				<span style="cursor: pointer;" onclick="showyl()"> <i
					class="icon iconfont icon-yanjing"></i> 预览提交
				</span> <span style="cursor: pointer;" onclick="modifyTable()"> <i
					class="icon iconfont icon-xiugai"></i>修改
				</span>
			</p>
			<table class="qiye_table table table-bordered">
				<tr>
					<td>进网型号</td>
					<td>${tlApppreset.productVersion}</td>
				</tr>
				<tr>
					<td>产品名称</td>
					<td>${tlApppreset.productName}</td>
				</tr>
				<tr>
					<td>手机大版本号</td>
					<td>${tlApppreset.phoneVersion}</td>
				</tr>
				<tr>
					<td>版本日期</td>
					<td>${tlApppreset.versionDate}</td>
				</tr>
				<tr>
					<td>预置应用卸载方法</td>
					<td>${tlApppreset.uninstallType}</td>
				</tr>
				<tr>
					<td>手机外观</td>
					<td><img style="height: 103px; width: 103px;"
						src="${tlApppreset.img}"></td>
				</tr>
			</table>
			<table class="show_table table table-bordered">
				<tr>
					<td>序号</td>
					<td>app名称</td>
					<td>开发者</td>
					<td>访问权限 <br>（可隐藏）
					</td>
					<td>功能描述<br>（可隐藏）
					</td>
				</tr>
				<c:forEach items="${applist}" var="app" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td style="word-wrap: break-word;">${app.name}<br></td>
						<td>${app.developer}</td>
						<td>${app.visitAuth}</td>
						<td>${app.description}</td>
					</tr>
				</c:forEach>
			</table>
			<input style="margin-left: 50%; margin-top: 20px;" id="btnCancel"
				class="btn" type="button" value="返 回" onclick="history.go(-1)" />
		</div>
	</section>

	<!--弹窗-->
	<div class="hang_tc" id="bkxg">
		<div class="tc_conts">
			<i class="icon iconfont icon-guanbi1"></i>
			<div class="tc_cont_er">
				<h1>修改申请</h1>
				<p>填写修改申请书需后台审核通过才能进行修改页面</p>
				<div class="upda_lists">
					任务编号<input type="text" readonly value="${tlApppreset.tableName}">
				</div>
				<div class="upda_lists">
					修改理由<input type="text" id="reason" value="">
				</div>
				<div class="last_btn">
					<button onclick="approveModify()">提交修改申请</button>
				</div>
			</div>
		</div>
	</div>

	<div class="hang_tc2" id="yldiv" style="display: none;">
		<div class="tc_table">
			<p class="know_name">
				<c:if test="${tlApppreset.flag eq '0'}">
					<span style="cursor: pointer;"
						onclick="submittable('${tlApppreset.id}')"><i
						class="icon iconfont icon-tijiao1"></i>提交发布申请</span>
				</c:if>
				<span style="cursor: pointer;" onclick="hideyl()"><i
					class="icon iconfont icon-guanbi1"></i>关闭</span>
			</p>
			<h1 class="know_title">${tlApppreset.productName}
				${tlApppreset.phoneVersion}</h1>
			<p class="know_time">2018-01-19</p>
			<table class="show_table table table-bordered table-striped">
				<tr>
					<td>序号</td>
					<td>app名称</td>
					<td>开发者</td>
					<td>访问权限 <br>（可隐藏）
					</td>
					<td>功能描述 <br>（可隐藏）
					</td>
				</tr>
				<c:forEach items="${applist}" var="app" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td style="word-wrap: break-word;">${app.name}<br></td>
						<td>${app.developer}</td>
						<td>${app.visitAuth}</td>
						<td>${app.description}</td>
					</tr>
				</c:forEach>

			</table>
		</div>
	</div>

	<script>
    $('.icon-xiugai').click(function(){
        $('.hang_tc').show();
    })
    $('.icon-guanbi1').click(function(){
        $('.hang_tc').hide();
    })

    $(function(){
        addmenu();
        $("#lfywlist").show();
        $("#lflist2").show();
        $("#lm13").addClass("qiye_xuanzhong");
        parent.window.refreshHeight();

    })

    function showyl(){
        $("#yldiv").show();
    }

    function hideyl(){
        $("#yldiv").hide();
    }

    function submittable(id){
        var data = {};
        data.id = id;
        ajax("${ctx}/taier/tlApppreset/submit",data,function (result) {
            var code  = result.code;
            if(code == 200) {
                alert("提交成功");
                window.location.href="${ctx}/taier/tlApppreset/checkStatus";
            } else {
                alert("提交失败");
            }
        });
    }

    function modifyTable(){
        var im = "${tlApppreset.modifiable}";
        if(im == "0"){
            $("#bkxg").show();
        } else {
            window.location.href='${ctx}/taier/tlApppreset/modifyTable?id=${tlApppreset.id}';
        }
    }

    function approveModify(){
        var data = {};
        data.id = "${tlApppreset.id}";
        data.reason = $("#reason").val();
        ajax("${ctx}/taier/tlApppreset/approveModify",data,function (result) {
            var code  = result.code;
            if(code == 200) {
                alert("提交成功");
                $("#bkxg").hide();
            } else {
                alert("提交失败");
            }
        });
    }
</script>


</body>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
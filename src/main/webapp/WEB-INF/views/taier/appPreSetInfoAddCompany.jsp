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

.cpxhsl {
	width: 384px;
	margin-left: 30px;
	height: 34px;
	line-height: 34px;
	padding-left: 10px;
	border: 1px solid #E6E6E6;
	border-radius: 5px;
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

input[type="file"] {
	border-width: 47px !important;
}

#showAppImportDiv {
	padding-right: 17px;
	margin-left: auto;
	margin-right: auto;
	width: 500px;
	height: 360px;
	padding: 0px;
	top: 28%;
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
		<div class="header"
			style="float: left; margin-left: 20px; box-shadow: 0 0 20px #ddd; padding-left: 10px; width: 79%;">
			<div id="messageBox"
				class="alert alert-error ${empty message ? 'hide' : ''}">
				<button data-dismiss="alert" class="close">×</button>
				<label id="loginError" class="error">${message}</label>
			</div>
		</div>
		<div class="qiye_right" style="height: auto;" id="step2">
			<h3>
				<i class="icon iconfont icon-arrfill_u-copy"></i>预置应用公示申请
			</h3>
			<p class="show_zhusi">
				注：仅不涉及手机信息安全的部分可以修订，如果涉及信息安全，请及时进行手机进网备案业务。<a href="#">https://home.firefoxchina.cn/</a>
			</p>
			<table class="qiye_table table table-bordered">
				<tr>
					<td>进网型号</td>
					<td><input id="cpxh" type="text" placeholder="内网数据（此部分不可修订）"></td>
				</tr>
				<tr>
					<td>产品名称</td>
					<td><input id="productName" type="text"></td>
				</tr>
				<tr>
					<td>手机大版本号</td>
					<td><input id="sjbb" type="text" placeholder="厂家输入（文字、数字）"></td>
				</tr>
				<tr>
					<td>版本日期</td>
					<td><input id="bbrq" type="text" placeholder="内网数据（格式年-月-日）"></td>
				</tr>
				<tr>
					<td>预置应用卸载方法</td>
					<td><input id="xzfs" type="text" placeholder="厂家输入"></td>
				</tr>
				<tr>
					<td>手机外观</td>
					<td>
						<div href="javascript:;" style="cursor: pointer;"
							class="appli_file">
							手机外观 <input type="file" name="" onchange="uploadImg(this)">
							<img src=""
								style="width: 100%; height: 100%; position: absolute; z-index: 1000; left: 0px; display: none;" />
							<a class="dela" style="display: none;" onclick="delimg(this)"
								href="javascript:void(0);">X</a> <input type="hidden" id="sctb"
								name="filevl">
						</div>
					</td>
				</tr>
			</table>
			<li class="btns" style="padding: 0 0 10px 10px;"><input
				id="btnImport" class="btn btn-primary" type="button" value="APP导入" />
			</li>

			<table class="show_table table table-bordered" id="apptb">
				<tr>
					<td></td>
					<td>序号</td>
					<td>app名称</td>
					<td>开发者</td>
					<td>访问权限 <br>（可隐藏）
					</td>
					<td>功能描述 <br>（可隐藏）
					</td>
					<td>验证</td>
				</tr>
				<c:forEach items="${applist}" var="app" varStatus="status">
					<tr class="appls">
						<td><input type="checkbox" name="box" class="paper"
							value="${app.id}"></td>
						<td>${status.index + 1}</td>
						<td style="word-wrap: break-word;">${app.name}</td>
						<td>${app.developer}</td>
						<td>${app.visitAuth}</td>
						<td>${app.description}</td>
						<td><c:if test="${app.verification eq '0'}">
								<span style="color: red;">未验证</span>
							</c:if> <c:if test="${app.verification eq '1'}">
								<span style="color: green;">已验证</span>
							</c:if></td>
					</tr>
				</c:forEach>

			</table>
			<p class="quanxuan">
				<input type="checkbox" class="paper qxan">全选
			</p>
			<p class="table_btn table_btn1">
				<button class="save" onclick="save()">保存</button>
				<button onclick="back()">返回</button>
			</p>

		</div>
		<%-- <div id="importBox" class="hide">
		<form id="importForm" action="${ctx}/sys/user/import" method="post" enctype="multipart/form-data"
			class="form-search" style="padding-left:20px;text-align:center;" onsubmit="loading('正在导入，请稍等...');"><br/>
			<input id="uploadFile" name="file" type="file" style="width:330px"/><br/><br/>　　
			<input id="btnImportSubmit" class="btn btn-primary" type="submit" value="   导    入   "/>
			<a href="${ctx}/sys/user/import/template">下载模板</a>
		</form>
	</div> --%>
		<div class="modal" id="showAppImportDiv"
			style="background-color: transparent; width: 603px; position: fixed;">
			<div class="modal-dialog" role="document" style="margin: 0px">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">批量导入</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form id="importForm"
						action="${contextPath}/taier/tlApppreset/import" method="post"
						enctype="multipart/form-data" class="form-search"
						style="padding-left: 20px; text-align: center;">
						<br /> <input id="uploadimportFile" name="file" type="file"
							style="width: 330px" /><br />
						<!-- <input id="btnImportSubmit" class="btn btn-primary" type="submit" value="   导    入   "/> -->
						<a href="${ctxStatic}/template/app.xlsx"
							style="color: #333; float: left;">下载模板</a>

						<div class="modal-footer">
							<input id="btnImportSubmit" class="btn btn-primary" type="button"
								onclick="uploadimportfile()" value="   导    入   " />
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">关闭</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</section>

	<script>
    var unionid = "";
    var versionnum = "";
    var unionproductName = "";
    $(function(){
        addmenu();
        $("#lfywlist").show();
        $("#lflist2").show();
        $("#lm12").addClass("qiye_xuanzhong");
        parent.window.refreshHeight();

        $(".qxan").click(function(){
            var uc=this.checked;
            //获取name=box的复选框 遍历输出复选框
            $("input[name=box]").each(function(){
                this.checked=uc;
            });
        });
        
        $("#btnImport").click(function(){
        	$('#showAppImportDiv').modal({backdrop: 'static', keyboard: false});
            $("#showAppImportDiv").css("top",400);
			$("#showAppImportDiv").modal('show');
		});
    })



    function next(){
        versionnum = $("#cpxhsl").val();
        if(versionnum == "") {
            alert("版本号不能为空");
            return;
        }
        $("#step1").hide();
        $("#step2").show();
        parent.window.refreshHeight();
        $("#cpxh").val(versionnum);
    }

    function back(){
        $("#step1").show();
        $("#step2").hide();
        parent.window.refreshHeight();

    }

    function uploadImg(obj){
        var file = $(obj)[0].files[0];
        if ($(obj).val() == "") {
        } else {
            var formData = new FormData();
            formData.append("fileArray", file);
            $.ajax({
                url: "${contextPath}/file/upload",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                success: function (e) {
                    $(obj).parent().children().eq(1).show();
                    $(obj).parent().children().eq(2).show();
                    $(obj).parent().children().eq(1).attr("src",e.fileUrl);
                    $(obj).parent().children().eq(3).val(e.fileUrl);
                }
            })
        }
    }
    function uploadimportfile(){
        var file = $("#uploadimportFile")[0].files[0];
        if ($("#uploadimportFile").val() == "") {
        } else {
            var formData = new FormData();
            formData.append("file", file);
            formData.append("cpxh", $("#cpxh").val());
            $.ajax({
                url: "${contextPath}/taier/tlApppreset/import",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                    if(data.code==200){
                        $("#showAppImportDiv").modal('hide');
                        $(".appls").remove();
                        var appdatalist = data.hashMap.applist;
                        if(appdatalist && appdatalist.length>0){
                            var apphtml = "";
                            for(var i=0;i<appdatalist.length;i++) {
                                var ver = "<span style='color: red;'>未验证</span>";
                                if(appdatalist[i].verification=='1') {
                                    ver = "<span style='color: green;'>已验证</span>";
                                }
                                apphtml += '<tr class="appls">\n' +
                                    '                    <td><input type="checkbox" name="box" class="paper" value="'+appdatalist[i].id+'"></td>\n' +
                                    '                    <td>'+(i+1)+'</td>\n' +
                                    '                    <td style="word-wrap: break-word;">'+appdatalist[i].name+'</td>\n' +
                                    '                    <td>'+appdatalist[i].developer+'</td>\n' +
                                    '                    <td>'+appdatalist[i].visitAuth+'</td>\n' +
                                    '                    <td>'+appdatalist[i].description+'</td>\n' +
                                    '                    <td>'+ver+'</td>\n' +
                                    '                </tr>';
                            }
                            $("#apptb").append(apphtml);
                            parent.window.refreshHeight();
                        }
                    }
                }
            })
        }
    }

    function delimg(obj){
        $(obj).parent().children().eq(1).hide();
        $(obj).parent().children().eq(2).hide();
        $(obj).parent().children().eq(1).attr("src","");
        $(obj).parent().children().eq(3).val("");
        $(obj).parent().children().eq(0).prop('outerHTML','<input type="file" name="" onchange="uploadImg(this)">');
    }

    function save(){
        var cpxh = $("#cpxh").val();
        var phoneVersion = $("#sjbb").val();
        var versionDate = $("#bbrq").val();
        var uninstallType = $("#xzfs").val();
        var img = $("#sctb").val();
        var productName = $("#productName").val();
        if(cpxh == "") {
            alert("进网型号不能为空");
            return;
        }
        if(productName == "") {
            alert("产品名称不能为空");
            return;
        }
        if(phoneVersion == "") {
            alert("手机大版本号不能为空");
            return;
        }
        if(versionDate == "") {
            alert("版本日期不能为空");
            return;
        }
        if(uninstallType == "") {
            alert("预置应用卸载方法不能为空");
            return;
        }
        if(img == "") {
            alert("手机外观不能为空");
            return;
        }
        var arrChk=$("input[name='box']:checked");
        var appsvlas = "";
        for(var i=0;i<arrChk.length;i++) {
            var objval = arrChk.eq(i).val();
            appsvlas += objval + "||";
        }

        var data = {};
        data.modifiable = "1";
        data.hotflag = "0";
        data.flag = "0";
        data.productVersion = cpxh;
        data.unionId = unionid;
        data.phoneVersion = phoneVersion;
        data.productName = unionproductName;
        data.versionDate = versionDate;
        data.uninstallType = uninstallType;
        data.productName = productName;
        data.img = img;
        data.apps = appsvlas;
        data.flag = "0";
        ajax("${ctx}/taier/tlApppreset/save" , data , function(result){
            var code  = result.code;
            if(code == 200) {
                alert("保存成功");
                window.location.href="${ctx}/taier/tlApppreset/checkStatus";
            } else {
                alert("保存失败");
            }
        });

    }


</script>
</body>
</html>
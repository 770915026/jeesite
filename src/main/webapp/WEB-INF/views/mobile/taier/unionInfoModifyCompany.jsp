<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/include/taglibmobile.jsp"%>
<%@ include file="/WEB-INF/views/mobile/taier/include.jsp"%>
<script type="text/javascript"
	src="${ctxStatic }/ueditor/ueditor.config.js"></script>
<script type="text/javascript"
	src="${ctxStatic }/ueditor/ueditor.all.js"></script>
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

input[type="file"] {
	border-width: 47px !important;
}

textarea {
	line-height: 1.5;
}

.edui-default .edui-editor-bottomContainer {
	display: none;
	overflow: hidden;
}

ul {
	margin-right: 0px;
	margin-left: 0px;
}
</style>
</head>
<body>
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
		<div class="qiye_right operation_box" id="operation_box">
			<h3>
				<i class="icon iconfont icon-arrfill_u-copy"></i>企业联合信息发布
			</h3>
			<p class="appli_name">申请表</p>
			<table class="qiye_table table table-bordered">
				<tr>
					<td>产品名称</td>
					<td><input type="text" name="productName"
						value="${tlCompanyUnionInfo.productName}"></td>
				</tr>
				<tr>
					<td>产品型号</td>
					<td><input type="text" name="productVersion"
						value="${tlCompanyUnionInfo.productVersion}"></td>
				</tr>
				<tr>
					<td>产品照片</td>
					<td class="cpzp" id="cpzp">
						<div href="javascript:;" class="appli_file">
							正面照片 <img src=""
								style="width: 100%; height: 100%; position: absolute; z-index: 1000; left: 0px; display: none;" />
							<a class="dela" style="display: none;" onclick="delimg2(this)"
								href="javascript:void(0);">X</a> <input type="file"
								multiple="multiple" onchange="uploadImg2(this)"> <input
								type="hidden" name="filevl">
						</div>
						<div href="javascript:;" class="appli_file">
							背面照片 <img src=""
								style="width: 100%; height: 100%; position: absolute; z-index: 1000; left: 0px; display: none;" />
							<a class="dela" style="display: none;" onclick="delimg2(this)"
								href="javascript:void(0);">X</a> <input type="file"
								multiple="multiple" name="" onchange="uploadImg2(this)">
							<input type="hidden" name="filevl">
						</div>
						<div href="javascript:;" class="appli_file">
							侧面照片 <img src=""
								style="width: 100%; height: 100%; position: absolute; z-index: 1000; left: 0px; display: none;" />
							<a class="dela" style="display: none;" onclick="delimg2(this)"
								href="javascript:void(0);">X</a> <input type="file"
								multiple="multiple" name="" onchange="uploadImg2(this)">
							<input type="hidden" name="filevl">
						</div>
						<div href="javascript:;" class="appli_file">
							备用照片 <img src=""
								style="width: 100%; height: 100%; position: absolute; z-index: 1000; left: 0px; display: none;" />
							<a class="dela" style="display: none;" onclick="delimg2(this)"
								href="javascript:void(0);">X</a> <input type="file"
								multiple="multiple" name="" onchange="uploadImg2(this)">
							<input type="hidden" name="filevl">
						</div>
						<div href="javascript:;" class="appli_file">
							备用照片 <img src=""
								style="width: 100%; height: 100%; position: absolute; z-index: 1000; left: 0px; display: none;" />
							<a class="dela" style="display: none;" onclick="delimg2(this)"
								href="javascript:void(0);">X</a> <input type="file"
								multiple="multiple" name="" onchange="uploadImg2(this)">
							<input type="hidden" name="filevl">
						</div>
						<div href="javascript:;" class="appli_file">
							备用照片 <img src=""
								style="width: 100%; height: 100%; position: absolute; z-index: 1000; left: 0px; display: none;" />
							<a class="dela" style="display: none;" onclick="delimg2(this)"
								href="javascript:void(0);">X</a> <input type="file"
								multiple="multiple" name="" onchange="uploadImg2(this)">
							<input type="hidden" name="filevl">
						</div> <span class="appli_span">上传图片为高清大图，尺寸不小于175×175像素，不大于20k</span>
					</td>
				</tr>
				<tr>
					<td>配置信息</td>
					<td class="pzxx" id="cpjs"></td>
				</tr>
				<tr>
					<td>产品介绍</td>
					<td class="pzxx" id="pzxx"><input type="radio" class="paper"
						name="a" value="0" checked>图文描述<br> <br> <a
						href="javascript:void(0);" class="add_appli1">添加</a><br> <input
						type="radio" class="paper" name="a" value="1">文字描述<br>
						<!-- <textarea class="pzxxwz" class="appli_text appli_text2" style="border: 1px solid #E6E6E6;width: 88%;height: 100px;"></textarea> -->
					</td>
				</tr>
				<tr>
					<td>国内证书信息</td>
					<td class="gnrz"><a href="javascript:void(0);"
						class="add_appli2">添加</a></td>
				</tr>
				<tr style="display: none;">
					<td>国际认证</td>
					<td class="njrz"><a href="javascript:void(0);"
						class="add_appli">添加</a></td>
				</tr>
				<tr>
					<td>泰尔证书信息</td>
					<td class="terz"><a href="javascript:void(0);"
						class="add_appli">添加</a></td>
				</tr>
			</table>
			<p class="table_btn">
				<button class="save" onclick="save(this)">保存</button>
				<input id="btnCancel" class="btn" type="button" value="返 回"
					onclick="history.go(-1)" />
			</p>
		</div>
	</section>
	<!--弹出层-->
	<div class="tcc_appli" id="ts">
		<div class="appli_white">
			<h1>温馨提示</h1>
			<span class="tc_cont">需联系在线客服解锁后发布信息</span> <span class="sure_btn">确定</span>
		</div>
	</div>
	<script>
	var pzxxEditorIdArr=new Array();
	var gnrzEditorIdArr=new Array();
	 var editorNum=1;
    $('.add_appli').click(function(){
        $(this).before('<span style="display: inline-block;width: 100%;position: relative;margin-bottom: 20px;"><div href="javascript:;" class="appli_file">备用照片<img src="" style="width: 100%; height: 100%; position: absolute; z-index: 1000; left: 0px;display: none;"/>\n' +
            '                        <a class="dela" style="display: none;" onclick="delimg(this)" href="javascript:void(0);">X</a>\n' +
            '                        <input type="file" name=""  onchange="uploadImg(this)">\n' +
            '                        <input type="hidden" name="filevl" ></div><textarea class="appli_text"></textarea><img src="${ctxStatic}/taier/images/sc.png" class="scadd" style="margin-bottom: unset;position: absolute;top: 14px;"/></span>');
        $('.scadd').click(function(){
            $(this).parent().remove()
        })
        parent.window.refreshHeight();
    })
    $('.add_appli2').click(function(){
    	$(this).before('<span style="margin-top: 20px;display: block;"><div href="javascript:;" class="appli_file pei_input">备用照片 <img src="" style="width: 100%; height: 100%; position: absolute; z-index: 1000; left: 0px;display: none;"/>\n' +
            '                        <a class="dela" style="display: none;" onclick="delimg(this)" href="javascript:void(0);">X</a>\n' +
            '                        <input type="file" name=""  onchange="uploadImg(this)">\n' +
            '                        <input type="hidden" name="filevl" ></div>'+
            '<div style="padding-top: 10px">'+
			'<textarea type="text/plain" id="ueditor'+editorNum+'" name="content" style="width:100%;height:300px;" required="true"></textarea>'+
			
			'<script type="text/javascript">'+
				'var editor = UE.getEditor("ueditor'+editorNum+'", {'+
					 'toolbars: ['+
					'],'+ 
			        'elementPathEnabled:false,'+
					'autoFloatEnable:false'+
			 	'})'+
			'<\/script>'+
		'</div>'+
            /* '<input type="text"  style="margin-top: 15px;" class="pzxxbt" placeholder="">'+ */
            '<img src="${ctxStatic}/taier/images/sc.png" class="scadd" editorId="ueditor'+editorNum+'" style="    margin-bottom: unset;"/>'+
            
            '</span>');
        $('.scadd').click(function(){
            $(this).parent().remove();
            var editorId=$(this).attr("editorId");
            if(pzxxEditorIdArr.indexOf(editorId)>-1){
            	pzxxEditorIdArr.splice(pzxxEditorIdArr.indexOf(editorId),1);
            }
            if(gnrzEditorIdArr.indexOf(editorId)>-1){
            	gnrzEditorIdArr.splice(gnrzEditorIdArr.indexOf(editorId),1);
            }
        })
        parent.window.refreshHeight();
        gnrzEditorIdArr.push("ueditor"+editorNum);
        editorNum++;
        
    })
    $('.add_appli1').click(function(){
    	$(this).before('<span style="margin-top: 20px;display: block;"><div href="javascript:;" class="appli_file pei_input">备用照片 <img src="" style="width: 100%; height: 100%; position: absolute; z-index: 1000; left: 0px;display: none;"/>\n' +
                '                        <a class="dela" style="display: none;" onclick="delimg(this)" href="javascript:void(0);">X</a>\n' +
                '                        <input type="file" name=""  onchange="uploadImg(this)">\n' +
                '                        <input type="hidden" name="filevl" ></div>'+
                '<div style="padding-top: 10px">'+
    			'<textarea type="text/plain" id="ueditor'+editorNum+'" name="content" style="width:100%;height:300px;" required="true"></textarea>'+
    			
    			'<script type="text/javascript">'+
    				'var editor = UE.getEditor("ueditor'+editorNum+'", {'+
    					 'toolbars: ['+
    					'],'+ 
    			        'elementPathEnabled:false,'+
    					'autoFloatEnable:false'+
    			 	'})'+
    			'<\/script>'+
    		'</div>'+
                /* '<input type="text"  style="margin-top: 15px;" class="pzxxbt" placeholder="">'+ */
                '<img src="${ctxStatic}/taier/images/sc.png" class="scadd" editorId="ueditor'+editorNum+'" style="    margin-bottom: unset;"/>'+
                
                '</span>');
        $('.scadd').click(function(){
            $(this).parent().remove();
            var editorId=$(this).attr("editorId");
            
            if(pzxxEditorIdArr.indexOf(editorId)>-1){
            	pzxxEditorIdArr.splice(pzxxEditorIdArr.indexOf(editorId),1);
            }
            if(gnrzEditorIdArr.indexOf(editorId)>-1){
            	gnrzEditorIdArr.splice(gnrzEditorIdArr.indexOf(editorId),1);
            }
        })
        pzxxEditorIdArr.push("ueditor"+editorNum);
        editorNum++;
        parent.window.refreshHeight();
    })
</script>
	<script>
	
    var clonetable="";
    $(function(){
        addmenu();
        $("#lfywlist").show();
        $("#lflist1").show();
        $("#lm7").addClass("qiye_xuanzhong");
        var flag = "${fns:getUser().flag}";
        if(flag == "1") {
            $("#ts").hide();
        }
        fillTable();
        clonetable = '<div class="qiye_right operation_box" style="float: right;margin-right: 16px;">'+$("#operation_box").html()+"</div>";
    })

    function fillTable(){
        //产品照片
        var cpzps = "${tlCompanyUnionInfo.productImgs}";
        var cpzpary = cpzps.split("||");
        var cpzphtml = "";
        for(var i=0;i<cpzpary.length-1;i++){
            if(cpzpary[i]) {
                $("#cpzp").find("img").eq(i).attr("src",cpzpary[i]);
                $("#cpzp").find("img").eq(i).show();
                $("#cpzp").find("a").eq(i).show();
                $("#cpzp").find("input[name='filevl']").eq(i).val(cpzpary[i]);
            }
        }
        //产品介绍
        var cpjsvalue = "${tlCompanyUnionInfo.productintro}";
        var cpjshtml = /* '<textarea class="appli_text appli_text1">'+pzxxnrvals[i]+'</textarea>\n' + */
            '<div style="padding-top: 10px">'+
            '<textarea type="text/plain" id="ueditorcpjs" name="content" style="width:100%;height:300px;" required="true"></textarea>'+

            '<script type="text/javascript">'+
            'var editor = UE.getEditor("ueditorcpjs", {'+
            'toolbars: ['+
            '],'+
            'elementPathEnabled:false,'+
            'autoFloatEnable:false'+
            '});'+
            'UE.getEditor("ueditorcpjs").ready(function() {'+
            'UE.getEditor("ueditorcpjs").setContent(\''+cpjsvalue+'\');'+
            '});'+
            '<\/script>'+
            '</div>'+
            ' </span>';
        $("#cpjs").append(cpjshtml);


        //配置信息
        var pzxxtype = "${tlCompanyUnionInfo.configureType}";
        var pzxxhtml = "";
        if(pzxxtype == "0") {
            $("#pzxx").find("input[name=a]").eq(0).attr("checked","checked");
            var pzxxtpfiles = "${tlCompanyUnionInfo.configureImg}".split("||");
            var pzxxbtvals = "${tlCompanyUnionInfo.configureTitle}".split("||");
            var pzxxnrvals = '${tlCompanyUnionInfo.configureContent}'.split("||");
            //配置信息图文 图片
            for(var i=0;i<pzxxtpfiles.length-1;i++){
                pzxxhtml += '<span class="pzxxtw" style="margin-top: 20px;display: block;"><div href="javascript:;" class="appli_file pei_input">备用照片\n' +
                    '                        <img src="'+pzxxtpfiles[i]+'" style="width: 100%; height: 100%; position: absolute; z-index: 1000; left: 0px;"/>\n' +
                    '                        <a class="dela" style="" onclick="delimg(this)" href="javascript:void(0);">X</a>\n' +
                    '                        <input type="file" name=""  onchange="uploadImg(this)">\n' +
                    '                        <input type="hidden" name="filevl" value="'+pzxxtpfiles[i]+'">\n' +
                    '                    </div>\n' ;
                    /* '                        <input type="text" class="pzxxbt" placeholder=""  style="margin-top: 15px;" class="appli_text" value="'+pzxxbtvals[i]+'">'; */
                    if(i>0) {
                        pzxxhtml += '<img src="${ctxStatic}/taier/images/sc.png" class="scadd" style="    margin-bottom: unset;"/>';
                    }
                    pzxxhtml += /* '<textarea class="appli_text appli_text1">'+pzxxnrvals[i]+'</textarea>\n' + */
                    	'<div style="padding-top: 10px">'+
            			'<textarea type="text/plain" id="ueditor'+editorNum+'" name="content" style="width:100%;height:300px;" required="true"></textarea>'+
            			
            			'<script type="text/javascript">'+
            				'var editor = UE.getEditor("ueditor'+editorNum+'", {'+
            					 'toolbars: ['+
            					'],'+ 
            			        'elementPathEnabled:false,'+
            					'autoFloatEnable:false'+
            			 	'});'+
            			 	'UE.getEditor("ueditor'+editorNum+'").ready(function() {'+
            					'UE.getEditor("ueditor'+editorNum+'").setContent(\''+pzxxnrvals[i]+'\');'+ 
            				'});'+

            			'<\/script>'+
            		'</div>'+	
                    '                    </span>';
                    pzxxEditorIdArr.push("ueditor"+editorNum);
                    editorNum++;
                    
            }
            $("#pzxx").children().eq(1).after(pzxxhtml);
        } else {
        	var pzxxwzHtml='<div style="padding-top: 10px">'+
								'<textarea type="text/plain" id="ueditor" name="content" style="width:100%;height:300px;" required="true"></textarea>'+
								
								'<script type="text/javascript">'+
									'var editor = UE.getEditor("ueditor", {'+
										 'toolbars: ['+
										'],'+ 
								        'elementPathEnabled:false,'+
										'autoFloatEnable:false'+
								 	'});'+
								 	'editor.ready(function() {'+
										'editor.setContent(\''+'${tlCompanyUnionInfo.configureContent}'+'\');'+ 
									'});'+
					
								'<\/script>'+
							'</div>';
            /* $("#pzxx").children().eq(-1).prop('outerHTML','<textarea class="pzxxwz" class="appli_text appli_text2" style="border: 1px solid #E6E6E6;width: 88%;height: 100px;">'+'${tlCompanyUnionInfo.configureContent}'.replace(/<br>/g,"\n")+'</textarea>'); */
            $("#pzxx").children().eq(-1).prop('outerHTML',pzxxwzHtml);
            $("#pzxx").find("input[name=a]").eq(1).attr("checked","checked");

        }

        //国内认证
        var auth1Img = "${tlCompanyUnionInfo.auth1Img}".split("||");
        var auth1Content = '${tlCompanyUnionInfo.auth1Content}'.split("||");
        var gnrzhtml = "";
        for(var i=0;i<auth1Img.length-1;i++){
            gnrzhtml += '<span style="position:  relative;"><div href="javascript:;" class="appli_file">备用照片\n' +
                '                        <img src="'+auth1Img[i]+'" style="width: 100%; height: 100%; position: absolute; z-index: 1000; left: 0px;"/>\n' +
                '                        <a class="dela" style="" onclick="delimg(this)" href="javascript:void(0);">X</a>\n' +
                '                        <input type="file" name=""  onchange="uploadImg(this)">\n' +
                '                        <input type="hidden" name="filevl" value="'+auth1Img[i]+'">\n' +
                '                    </div>'+
                /* '<textarea class="appli_text">'+auth1Content[i]+'</textarea>'; */
                '<div style="padding-top: 10px">'+
            			'<textarea type="text/plain" id="ueditor'+editorNum+'" name="content" style="width:100%;height:300px;" required="true"></textarea>'+
            			
            			'<script type="text/javascript">'+
            				'var editor1 = UE.getEditor("ueditor'+editorNum+'", {'+
            					 'toolbars: ['+
            					'],'+ 
            			        'elementPathEnabled:false,'+
            					'autoFloatEnable:false'+
            			 	'});'+
            			 	'UE.getEditor("ueditor'+editorNum+'").ready(function() {'+
	        					'UE.getEditor("ueditor'+editorNum+'").setContent(\''+auth1Content[i]+'\');'+ 
	        				'});'+
            			'<\/script>'+
            		'</div>';
            if(i>0) {
                gnrzhtml += '<img src="${ctxStatic}/taier/images/sc.png" class="scadd" style="margin-bottom: unset;position: absolute;top: -82px;"/>';
            }

            gnrzhtml += '</span>';
            gnrzEditorIdArr.push("ueditor"+editorNum);
            editorNum++;
        }
        $(".gnrz").prepend(gnrzhtml);


        //国际认证
        var auth2Img = "${tlCompanyUnionInfo.auth2Img}".split("||");
        var auth2Content = "${tlCompanyUnionInfo.auth2Content}".replace(/<br>/g,"\n").split("||");
        var gjrzhtml = "";
        for(var i=0;i<auth2Img.length-1;i++){
            gjrzhtml += '<span style="position:  relative;"><div href="javascript:;" class="appli_file">备用照片\n' +
                '                        <img src="'+auth2Img[i]+'" style="width: 100%; height: 100%; position: absolute; z-index: 1000; left: 0px;"/>\n' +
                '                        <a class="dela" style="" onclick="delimg(this)" href="javascript:void(0);">X</a>\n' +
                '                        <input type="file" name=""  onchange="uploadImg(this)">\n' +
                '                        <input type="hidden" name="filevl" value="'+auth2Img[i]+'">\n' +
                '                    </div> <textarea class="appli_text">'+auth2Content[i]+'</textarea>';
            if(i>0) {
                gjrzhtml += '<img src="${ctxStatic}/taier/images/sc.png" class="scadd" style="margin-bottom: unset;position: absolute;top: -82px;"/>';
            }

            gjrzhtml += '</span>';
        }
        $(".njrz").prepend(gjrzhtml);


        //泰尔认证
        var auth3Img = "${tlCompanyUnionInfo.auth3Img}".split("||");
        var auth3Content = "${tlCompanyUnionInfo.auth3Content}".replace(/<br>/g,"\n").split("||");
        var terzhtml = "";
        for(var i=0;i<auth3Img.length-1;i++){
            terzhtml += '<span style="position:  relative;"><div href="javascript:;" class="appli_file">备用照片\n' +
                '                        <img src="'+auth3Img[i]+'" style="width: 100%; height: 100%; position: absolute; z-index: 1000; left: 0px;"/>\n' +
                '                        <a class="dela" style="" onclick="delimg(this)" href="javascript:void(0);">X</a>\n' +
                '                        <input type="file" name=""  onchange="uploadImg(this)">\n' +
                '                        <input type="hidden" name="filevl" value="'+auth3Img[i]+'">\n' +
                '                    </div> <textarea class="appli_text">'+auth3Content[i]+'</textarea>';
            if(i>0) {
                terzhtml += '<img src="${ctxStatic}/taier/images/sc.png" class="scadd" style="margin-bottom: unset;position: absolute;top: -82px;"/>';
            }

            terzhtml += '</span>';
        }
        $(".terz").prepend(terzhtml);
        $('.scadd').click(function(){
            $(this).parent().remove()
        })
        parent.window.refreshHeight();
    }
    function addtable(obj){
        $(obj).parent().parent().parent().children().eq(-1).after(clonetable);
        parent.window.refreshHeight();
    }

    function save(obj){
    	
    	
    	regExp1 = new RegExp("\n", "g");
    	regExp2 = new RegExp("\"", "g");
        var id = "${tlCompanyUnionInfo.id}";
        var productName = "";//产品名称
        var productVersion = "";//产品型号
        var cpzpfilepaths = "";//产品照片

        var pzxxtype="";//配置信息展示类型0图文1文字
        var pzxxtpfilespaths = "";//配置信息图文 图片
        var pzxxbtvals = "";//配置信息图文 标题
        var pzxxnrvals = "";//配置信息图文 描述
        var pzxxwzval = "";//配置信息文字 描述

        var gnrztpfilespaths = "";//国内认证 图片
        var gnrznrvals = "";//国内认证 描述

        var gjrztpfilespaths = "";//国内认证 图片
        var gjrznrvals = "";//国内认证 描述

        var terztpfilespaths = "";//泰尔认证 图片
        var terznrvals = "";//泰尔认证 描述

        //申请表table
        var table = $(obj).parent().prev();
        //产品名称
        productName = table.find("input[name=productName]").val();
        if(productName == ""){
            alert("产品名称不能为空");
            return;
        }

        //产品型号
        productVersion = table.find("input[name=productVersion]").val();
        if(productVersion == ""){
            alert("产品型号不能为空");
            return;
        }

        //产品照片
        var cpzpfiles = table.find(".cpzp").find("input[name=filevl]");
        for(var i=0;i<cpzpfiles.length;i++){
            var cpzpfilepath = cpzpfiles.eq(i).val();
            cpzpfilepaths += cpzpfilepath + "||";
        }

        //配置信息
        var pzxxform = table.find(".pzxx");
        pzxxtype = pzxxform.find("input[name=a]:checked").val();
        if(pzxxtype == "0") {
            var pzxxtpfiles = pzxxform.find("input[name='filevl']");
            //配置信息图文 图片
            
            for(var i=0;i<pzxxtpfiles.length;i++){
                var pzxxtpfilespath = pzxxtpfiles.eq(i).val();
                pzxxtpfilespaths += pzxxtpfilespath + "||";
            }
           
            //配置信息图文 标题
           /*  var pzxxbts = pzxxform.find(".pzxxbt");
            for(var i=0;i<pzxxbts.length;i++){
                var pzxxbtval = pzxxbts.eq(i).val();
                pzxxbtvals += pzxxbtval + "||";
            } */
            for(var i=0;i<pzxxEditorIdArr.length;i++){
            	var editorId=pzxxEditorIdArr[i];
            	var editorContent=UE.getEditor(editorId).getContent();
            	pzxxnrvals += editorContent+ "||";
            }

            //配置信息图文 描述
           /*  var pzxxnrs = pzxxform.find(".appli_text1");
            for(var i=0;i<pzxxnrs.length;i++){
                var pzxxnrval = pzxxnrs.eq(i).val().replace(regExp1,"<br>").replace(regExp2,"\\\"");
                pzxxnrvals += pzxxnrval + "||";
            } */
        } else {
            //配置信息图文 描述
            /*  pzxxwzval = pzxxform.find(".pzxxwz").val().replace(regExp1,"<br>").replace(regExp2,"\\\""); */
        	var editorContent=UE.getEditor("ueditor").getContent();
        	pzxxwzval=editorContent;
        }

        //国内认证
        var gnrzform = table.find(".gnrz");
        var gnrztpfiles = gnrzform.find("input[name=filevl]");
        //国内认证 图片
        for(var i=0;i<gnrztpfiles.length;i++){
            var gnrztpfilespath = gnrztpfiles.eq(i).val();
            gnrztpfilespaths += gnrztpfilespath + "||";
        }

        //国内认证 描述
        /* var gnrznrs = gnrzform.find(".appli_text");
        for(var i=0;i<gnrznrs.length;i++){
            var gnrznrval = gnrznrs.eq(i).val().replace(regExp1,"<br>").replace(regExp2,"\\\"");
            gnrznrvals += gnrznrval + "||";
        } */
        for(var i=0;i<gnrzEditorIdArr.length;i++){
        	var editorId=gnrzEditorIdArr[i];
        	var editorContent=UE.getEditor(editorId).getContent();
        	gnrznrvals += editorContent+ "||";
        }

        //国际认证
        var gjrzform = table.find(".njrz");
        var gjrztpfiles = gjrzform.find("input[name=filevl]");
        //国际认证 图片
        for(var i=0;i<gjrztpfiles.length;i++){
            var gjrztpfilespath = gjrztpfiles.eq(i).val();
            gjrztpfilespaths += gjrztpfilespath + "||";
        }

        //国际认证 描述
        var gjrznrs = gjrzform.find(".appli_text");
        for(var i=0;i<gjrznrs.length;i++){
            var gjrznrval = gjrznrs.eq(i).val().replace(regExp1,"<br>").replace(regExp2,"\\\"");
            gjrznrvals += gjrznrval + "||";
        }

        //泰尔认证
        var terzform = table.find(".terz");
        var terztpfiles = terzform.find("input[name=filevl]");
        //泰尔认证 图片
        for(var i=0;i<terztpfiles.length;i++){
            var terztpfilespath = terztpfiles.eq(i).val();
            terztpfilespaths += terztpfilespath + "||";
        }

        //泰尔认证 描述
        var terznrs = terzform.find(".appli_text");
        for(var i=0;i<terznrs.length;i++){
            var terznrval = terznrs.eq(i).val().replace(regExp1,"<br>").replace(regExp2,"\\\"");
            terznrvals += terznrval + "||";
        }

        //提交
        var data = {};
        data.id = id;
        data.modifiable = "${tlCompanyUnionInfo.modifiable}";
        data.hotflag = "${tlCompanyUnionInfo.hotflag}";
        data.productName=productName;
        data.productVersion=productVersion;
        data.productImgs=cpzpfilepaths;
        data.configureType=pzxxtype;
        data.productintro = UE.getEditor("ueditorcpjs").getContent();
        if(pzxxtype=="0"){
            data.configureImg=pzxxtpfilespaths;
            data.configureTitle=pzxxbtvals;
            data.configureContent=pzxxnrvals;
        } else {
            data.configureContent=pzxxwzval;
        }

        data.auth1Img=gnrztpfilespaths;
        data.auth1Content=gnrznrvals;
        data.auth2Img=gjrztpfilespaths;
        data.auth2Content=gjrznrvals;
        data.auth3Img=terztpfilespaths;
        data.auth3Content=terznrvals;
        ajax("${ctx}/taier/tlCompanyUnionInfo/save" , data , function(result){
            var code  = result.code;
            if(code == 200) {
                alert("保存成功");
                window.location.href="${ctx}/taier/tlCompanyUnionInfo/checkStatus";
            } else {
                alert("保存失败");
            }
        });

    }

    function delimg(obj){
        $(obj).parent().children().eq(0).hide();
        $(obj).parent().children().eq(1).hide();
        $(obj).parent().children().eq(0).attr("src","");
        $(obj).parent().children().eq(3).val("");
        $(obj).parent().children().eq(2).prop('outerHTML','<input type="file" name="" onchange="uploadImg(this)">');
    }

    function delimg2(obj){
        $(obj).parent().children().eq(0).hide();
        $(obj).parent().children().eq(1).hide();
        $(obj).parent().children().eq(0).attr("src","");
        $(obj).parent().children().eq(3).val("");
        $(obj).parent().children().eq(2).prop('outerHTML','<input type="file" multiple="multiple" name="" onchange="uploadImg2(this)">');
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
                    $(obj).parent().children().eq(0).show();
                    $(obj).parent().children().eq(1).show();
                    $(obj).parent().children().eq(0).attr("src",e.fileUrl);
                    $(obj).parent().children().eq(3).val(e.fileUrl);
                }
            })
        }
    }
    //产品照片多选上传
    function uploadImg2(obj){

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
                async:false,
                success: function (e) {
                    $(obj).parent().children().eq(0).show();
                    $(obj).parent().children().eq(1).show();
                    $(obj).parent().children().eq(0).attr("src",e.fileUrl);
                    $(obj).parent().children().eq(3).val(e.fileUrl);
                }
            })
        }

        //申请表table
        var table = $(obj).parent().parent().parent().parent();
        var cpzphideimgs = table.find(".cpzp").find("img:hidden");

        var filenum = $(obj)[0].files.length;
        var hideimgnum = cpzphideimgs.length;
        if(filenum>1 && hideimgnum>0) {
            for(var i=0;i<filenum-1 && i<hideimgnum;i++){
                var file = $(obj)[0].files[i+1];
                var img = $(cpzphideimgs[i]);
                var formData = new FormData();
                formData.append("fileArray", file);
                $.ajax({
                    url: "${contextPath}/file/upload",
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    async:false,
                    success: function (e) {
                        img.parent().children().eq(0).show();
                        img.parent().children().eq(1).show();
                        img.parent().children().eq(0).attr("src",e.fileUrl);
                        img.parent().children().eq(3).val(e.fileUrl);
                    }
                })
            }
        }
    }
</script>
</body>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
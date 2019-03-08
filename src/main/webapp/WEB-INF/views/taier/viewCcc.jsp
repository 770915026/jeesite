<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/taier/include.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="toTop" content="true">
<script type="text/javascript" src="${ctxStatic}/taier/js/laydate.js"></script>
<style>
input {
	border: 1px solid #ddd;
	margin-left: 10px !important;
}

select, textarea {
	border: 1px solid #ddd;
	margin-left: 10px !important;
}

td {
	border: solid 1px #ddd;
}

table td {
	border: solid windowtext 1.0pt #ddd
}

#cf1 table td {
	white-space: nowrap;
}

#cf4 table td {
	height: 35px;
}

#sbjjTable td {
	height: 35px;
}

#cf5 table td {
	height: 32px;
}

.input-btnn {
	width: 80px;
}

#cf7 div {
	padding: 2px 0px
}

#bgzbtdy td {
	height: 32px;
}

#tby td {
	height: 32px;
}
</style>
<script>
		laydate.render({
	        elem: '#af_1_SQRQ' //指定元素
	    });
        function showyltb(obj, idx){
            $(".li_active0").removeClass("li_active0");
            $(obj).addClass("li_active0");
            $("#cf1").hide();$("#cf2").hide();$("#cf3").hide();$("#cf4").hide();$("#cf5").hide();$("#cf6").hide();$("#cf7").hide();
            $("#cf"+idx).show();
            if(window.parent.refreshHeight){
                window.parent.refreshHeight();
            }
        }
        function doChange(vAfId, vFldId,obj){
        	var value=$(obj).val();
        	var id=vAfId+"2_"+vFldId;
        	$("#"+id).val(value);
        }
	</script>
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
		<div class="qiye_right operation_box">
			<form:form id="form1" modelAttribute="TmcRwsqd"
				action="${ctx}/taier/tmcRwsqd/save" method="post"
				class="breadcrumb form-search">
				<div class="bgc" style="width: 100%;">
					<h1>${tlCompanyUnionInfo.productName}</h1>
					<div class="detailed_cont bgc" style="width: 100%;">
						<ul
							style="width: 100%; padding-left: 0%; margin-left: auto; margin-right: auto;">
							<li class="li_active0" onclick="showyltb(this,1)">任务申请单</li>
							<li onclick="showyltb(this,4)">电池</li>
							<li onclick="showyltb(this,2)">设备简介</li>
							<li onclick="showyltb(this,5)">EMC关键元器件列表</li>
							<li onclick="showyltb(this,6)">安全元器件列表</li>
							<li onclick="showyltb(this,3)">设备附件</li>
							<li onclick="showyltb(this,7)">变更确认表</li>
						</ul>
						<div>
							<div class="" id="cf1">
								<input type="hidden" id="pk1" name="pk1"
									value="${tmcRwsqd.pk1 }"> <input type="hidden" id="bh"
									name="bh" value="${tmcRwsqd.bh }"> <input type="hidden"
									id="type" name="type" value="2"> <input type="hidden"
									id="status" name="status" value="0">
								<div style="text-align: center; margin-top: 40px;">
									<span style='font-size: 22.0pt; font-family: 宋体'>测试登记表</span>
								</div>
								<table
									style="margin-left: auto; margin-right: auto; width: 680px;">
									<tr style='height: 23.2pt'>
									<tr style='height: 22.6pt'>
										<td style='height: 22.6pt' align=center>工单号</td>
										<td style='border-left: none; height: 22.6pt'><INPUT
											class=buyBox1 type=text id=af_1_GDH value="" size=25
											name="gdh" datafld="GDH" maxlength=100
											onchange="_doChange('af_1','GDH',this)" disabled
											validateType="ignore"></td>
										<td style='height: 22.6pt' align=center>报告号</td>
										<td style='border-left: none; height: 22.6pt'><INPUT
											class=buyBox1 type=text id=af_1_BGH value='' size=25
											name="bgh" maxlength=100 disabled validateType="ignore">
										</td>
									</tr>
									<tr>
										<td style='border-top: none; height: 23.2pt' align=center>
											任务类型</td>
										<td colspan=3
											style='border-top: none; border-left: none; height: 23.2pt'>
											<INPUT type=radio id=af_1_SFBM name="sfbm" value=01
											datafld="SFBM" ${tmcRwsqd.sfbm eq '01'?'checked':''}>有线任务
											<INPUT type=radio id=af_1_SFBM name="sfbm" value=02
											datafld="SFBM" ${tmcRwsqd.sfbm eq '02'?'checked':''}>无线任务

										</td>
									</tr>
									<tr style='height: 23.2pt'>
										<td style='border-top: none; height: 23.2pt' align=center>
											受检单位</td>
										<td colspan=3
											style='border-top: none; border-left: none; height: 23.2pt'>
											<INPUT style="width: 90%;" class=buyBox1 type=text
											id=af_1_SJDW value="${tlCompanyInfo.name}" size=100
											name="sjdw" datafld="SJDW" maxlength=100
											validateType="required"> <!-- <input id='popbu_af_1_SJDW' class="input-btn" type='button' value='..' onclick="__dynDisplayP('TMCKH','af_1','SJDW2',-100,10,true)" > -->

											<input type="hidden" name="sjdwjc" id="sjdwjc"> <Font
											color='red'>*</Font>
										</td>
									</tr>
									<tr style='height: 23.2pt'>
										<td style='border-top: none; height: 23.2pt' align=center>
											受检单位地址</td>
										<td colspan=3
											style='border-top: none; border-left: none; height: 23.2pt'>
											<INPUT style="width: 90%;" class=buyBox1 type=text
											id=af_1_SJDWDZ value="${tlCompanyInfo.address}" size=105
											name="sjdwdz" datafld="SJDWDZ" maxlength=100
											validateType="required" validateType="required"> <Font
											color='red'>*</Font>
										</td>
									</tr>
									<tr style='height: 22.55pt'>
										<td
											style='border-top: none; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.55pt'
											align=center>生产单位</td>
										<td colspan=3
											style='border-top: none; border-left: none; height: 22.55pt'>
											<INPUT style="width: 90%;" class=buyBox1 type=text
											id=af_1_SCC value="${tmcRwsqd.scc }" size=100 name="scc"
											datafld="SCC" maxlength=100
											onchange="_doChange('af_1','SCC',this)"
											validateType="required"> <!-- <input id='popbu_af_1_SCC' class="input-btn" type='button' value='..' onclick="__dynDisplayP('SCCVIEW','af_1','dsSCC',-100,10,true)" > -->
											<Font color='red'>*</Font>
										</td>
									</tr>
									<tr style='height: 23.2pt'>
										<td style='border-top: none; height: 23.2pt' align=center>
											生产单位地址</td>
										<td colspan=3
											style='border-top: none; border-left: none; height: 23.2pt'>
											<INPUT style="width: 90%;" class=buyBox1 type=text
											id=af_1_SCCDZ value="${tmcRwsqd.sccdz }" size=105
											name="sccdz" datafld="SCCDZ" maxlength=100
											onchange="_doChange('af_1','SCCDZ',this)"
											validateType="required"> <Font color='red'>*</Font>
										</td>
									</tr>
									<%-- <tr style='height:21.85pt'>
									<td style='border-top:none;height:21.85pt' align=center>
										制造商
									</td>
									<td colspan=3 style='border-top:none;border-left:none;height:21.85pt'>
										<INPUT style="width:90%;" class=buyBox1 type=text id=af_1_ZZSMC value="${tmcRwsqd.zzsmc }" size=100 name="zzsmc" datafld="ZZSMC"  maxlength=100  onchange="_doChange('af_1','ZZSMC',this)">
									</td>
								</tr>
								<tr style='height:23.7pt'>
									<td style='border-top:none;height:23.7pt' align=center>
										制造商地址
									</td>
									<td colspan=3 style='border-top:none;border-left:none;height:23.7pt'>
										<INPUT style="width:90%;" class=buyBox1 type=text id=af_1_ZZSDZ value="${tmcRwsqd.zzsdz }" size=105 name="zzsdz" datafld="ZZSDZ"  maxlength=100  onchange="_doChange('af_1','ZZSDZ',this)">
									</td>
								</tr> --%>
									<tr style='height: 22.55pt'>
										<td style='width: 77.4pt; border-top: none; height: 22.55pt'
											align=center>产地</td>
										<td colspan=3
											style='width: 348.7pt; border-top: none; border-left: none; height: 22.55pt'>
											<INPUT style="width: 90%;" class=buyBox1 type=text id=af_1_CD
											value="${tmcRwsqd.cd }" size=105 name="cd" datafld="CD"
											maxlength=100 onchange="_doChange('af_1','CD',this)"
											validateType="required"> <Font color='red'>*</Font>
										</td>
									</tr>
									<tr style='height: 21.85pt'>
										<td style='border-top: none; height: 21.85pt' align=center>
											代理商</td>
										<td colspan=3
											style='border-top: none; border-left: none; height: 21.85pt'>
											<INPUT style="width: 90%;" class=buyBox1 type=text
											id=af_1_DLS value="${tmcRwsqd.dls }" size=100 name="dls"
											datafld="DLS" maxlength=100
											onchange="_doChange('af_1','DLS',this)"
											validateType="required"> <Font color='red'>*</Font>
										</td>
									</tr>
									<tr style='height: 23.55pt'>
										<td style='width: 77.4pt; border-top: none; height: 23.55pt'
											align=center>联系人</td>
										<td
											style='width: 126.0pt; border-top: none; border-left: none; height: 23.55pt'>
											<INPUT class=buyBox1 type=text id=af_1_LXRMC
											value="${tmcRwsqd.lxrmc }" size=20 name="lxrmc"
											datafld="LXRMC" maxlength=100
											onchange="_doChange('af_1','LXRMC',this)" style="width: 65%;"
											validateType="required"> <Font color='red'>*</Font>
										</td>
										<td
											style='width: 99.0pt; border-top: none; border-left: none; height: 23.55pt'
											align=center>移动电话</td>
										<td
											style='width: 123.7pt; border-top: none; border-left: none; height: 23.55pt'>
											<INPUT class=buyBox1 type=text id=af_1_YDDH
											value="${tmcRwsqd.yddh }" size=20 name="yddh" datafld="YDDH"
											maxlength=100 onchange="_doChange('af_1','YDDH',this)"
											validateType="required"> <Font color='red'>*</Font>
										</td>
									</tr>
									<tr style='height: 21.75pt'>
										<td style='width: 77.4pt; border-top: none; height: 21.75pt'
											align=center>传真</td>
										<td
											style='width: 126.0pt; border-top: none; border-left: none; height: 21.75pt'>
											<INPUT class=buyBox1 type=text id=af_1_CZ
											value="${tmcRwsqd.cz }" size=20 name="cz" datafld="CZ"
											maxlength=100 onchange="_doChange('af_1','CZ',this)">
										</td>
										<td width=132
											style='width: 99.0pt; border-top: none; border-left: none; height: 21.75pt'
											align=center>E-mail</td>
										<td
											style='width: 123.7pt; border-top: none; border-left: none; height: 21.75pt'>
											<INPUT class=buyBox1 type=text id=af_1_email
											value="${tmcRwsqd.email }" size=20 name="email"
											datafld="email" maxlength=100
											onchange="_doChange('af_1','email',this)"
											validateType="required"> <Font color='red'>*</Font>
										</td>
									</tr>
									<tr style='height: 23.4pt'>
										<td style='width: 77.4pt; border-top: none; height: 23.4pt'
											align=center>设备型号</td>
										<td colspan=3
											style='width: 348.7pt; border-top: none; border-left: none; height: 23.4pt'>
											<INPUT class=buyBox1 type=text id=af_1_SBXH
											value="${tmcRwsqd.sbxh }" size=60 name="sbxh" datafld="SBXH"
											maxlength=500 onchange="doChange('af_1','SBXH',this)"
											validateType="required"> <Font color='red'>*</Font>
										</td>
									</tr>
									<tr style='height: 23.05pt'>
										<td style='width: 77.4pt; border-top: none; height: 23.05pt'
											align=center>设备名称</td>
										<td colspan=3
											style='width: 348.7pt; border-top: none; border-left: none; height: 23.05pt'>
											<INPUT class=buyBox1 type=text id=af_1_SBMC
											value="${tmcRwsqd.sbmc }" size=60 name="sbmc" datafld="SBMC"
											maxlength=100 onchange="doChange('af_1','SBMC',this)"
											validateType="required"> <Font color='red'>*</Font>
										</td>
									</tr>
									<!-- <tr style='height:23.05pt'>
									<td style='width:77.4pt;border-top:none;height:23.05pt' align=center>
										设备简称
									</td>
									<td colspan=3 style='width:348.7pt;border-top:none;border-left:none;height:23.05pt'>

										<INPUT class=buyBox1 type=text id=af_1_SBJC  value="" size=60 name="sbjc" datafld="SBJC"  maxlength=100  onchange="_doChange('af_1','SBJC',this)">
										<Font color='red'>*</Font>
										<input type="button" value="添加" onclick="_addsblx()" class="input-btn">
									</td>
								</tr> -->
									<tr style='height: 23.35pt'>
										<td style='border-top: none; height: 23.35pt' align=center>检测类别</td>
										<td colspan=3
											style='border-top: none; border-left: none; padding: 2px;'>
											<SELECT id='af_1_JCLB' style="" name='jclb' datafld='JCLB'
											onchange="refChange(this,'af_1_JCLB__SHOW__');_doChange('af_1','JCLB',this);"
											value="${tmcRwsqd.jclb }" validateType="required">
												<option value=''>--请选择--</option>
												<option value='进网' ${tmcRwsqd.jclb eq '进网'?'selected':''}>进网</option>
												<option value='CCC' ${tmcRwsqd.jclb eq 'CCC'?'selected':''}>CCC</option>
												<option value='委托' ${tmcRwsqd.jclb eq '委托'?'selected':''}>委托</option>
												<option value='监督' ${tmcRwsqd.jclb eq '监督'?'selected':''}>监督</option>
										</SELECT><Font color='red'>*</Font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type='hidden' id='af_1_JCLBO__AFV__' value='' /> <input
											type='hidden' id='af_1_JCLBO__WHERE__' value='' /> <SELECT
											id='popbu_af_1_JCLBO' style="" name='jclbo' datafld='JCLBO'
											value="${tmcRwsqd.jclbo }">
												<option value=''>--请选择--</option>
												<option value='办新证' ${tmcRwsqd.jclbo eq '办新证'?'selected':''}>办新证</option>
												<option value='备案' ${tmcRwsqd.jclbo eq '备案'?'selected':''}>备案</option>
												<option value='对比鉴定'
													${tmcRwsqd.jclbo eq '对比鉴定'?'selected':''}>对比鉴定</option>
												<option value='到期换证'
													${tmcRwsqd.jclbo eq '到期换证'?'selected':''}>到期换证</option>
												<option value='翻译' ${tmcRwsqd.jclbo eq '翻译'?'selected':''}>翻译</option>
												<option value='改报告' ${tmcRwsqd.jclbo eq '改报告'?'selected':''}>改报告</option>
												<option value='改型' ${tmcRwsqd.jclbo eq '改型'?'selected':''}>改型</option>
												<option value='改型鉴定'
													${tmcRwsqd.jclbo eq '改型鉴定'?'selected':''}>改型鉴定</option>
												<option value='换证' ${tmcRwsqd.jclbo eq '换证'?'selected':''}>换证</option>
												<option value='扩容换证'
													${tmcRwsqd.jclbo eq '扩容换证'?'selected':''}>扩容换证</option>
										</SELECT> <!-- <input id='popbu_af_1_JCLBO' class="input-btn" type='button' value='..' onclick="__dynDisplay('DIC','div_BZK111','BZK')" > -->
											<Font color='red'>*</Font> <!-- <TABLE style="width: 100%;">
											<TR>
												<TD style="height: 35px;">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<SELECT id='af_1_JCLB' style="" name='jclb' datafld='JCLB' onchange="refChange(this,'af_1_JCLB__SHOW__');_doChange('af_1','JCLB',this);" >
														<option value=''>--请选择--</option>
														<option value='进网'>进网</option>
														<option value='CCC'>CCC</option>
														<option value='委托'>委托</option>
														<option value='监督'>监督</option>
													</SELECT><Font color='red'>*</Font>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input type='hidden' id='af_1_JCLBO__AFV__' value=''/>
													<input type='hidden' id='af_1_JCLBO__WHERE__' value=''/>
													<SELECT id='popbu_af_1_JCLBO' style="" name='jclbo' datafld='JCLBO'>
														<option value=''>--请选择--</option>
														<option value='办新证'>办新证</option>
														<option value='备案'>备案</option>
														<option value='对比鉴定'>对比鉴定</option>
														<option value='到期换证'>到期换证</option>
														<option value='翻译'>翻译</option>
														<option value='改报告'>改报告</option>
														<option value='改型'>改型</option>
														<option value='改型鉴定'>改型鉴定</option>
														<option value='换证'>换证</option>
														<option value='扩容换证'>扩容换证</option>
													</SELECT>
													<input id='popbu_af_1_JCLBO' class="input-btn" type='button' value='..' onclick="__dynDisplay('DIC','div_BZK111','BZK')" >
													<Font color='red'>*</Font>
												</TD>
											</TR>
											
										</TABLE> -->
										</td>
									</tr>
									<tr style='height: 22.25pt'>
										<td style='width: 77.4pt; border-top: none; height: 22.25pt'
											align=center>测试依据</td>
										<td colspan=3
											style='width: 348.7pt; border-top: none; border-left: none; height: 22.25pt'>
											<INPUT class=buyBox1 type=text id=af_1_CSYJ
											value="${tmcRwsqd.csyj }" size=60 name="csyj" datafld="CSYJ"
											maxlength=100 onchange="_doChange('af_1','CSYJ',this)">
										</td>
									</tr>
									<tr style='height: 22.55pt'>
										<td style='width: 77.4pt; border-top: none; height: 22.55pt'
											align=center>报告类型</td>
										<td colspan=3
											style='width: 348.7pt; border-top: none; border-left: none; height: 22.55pt'>
											<SELECT id='af_1_BGLX' name='bglx' datafld='BGLX'
											onchange="refChange(this,'af_1_BGLX__SHOW__');_doChange('af_1','BGLX',this);">
												<option value=''>--------------请选择------------</option>
												<option value='英文报告'
													${tmcRwsqd.bglx eq '英文报告'?'selected':''}>英文报告</option>
												<option value='中文报告'
													${tmcRwsqd.bglx ne '英文报告'?'selected':''}>中文报告</option>
										</SELECT>
										</td>
									</tr>
									<tr style='height: 22.55pt'>
										<td style='width: 77.4pt; border-top: none; height: 22.55pt'
											align=center>是否测量WAPI:</td>
										<td colspan=3
											style='width: 348.7pt; border-top: none; border-left: none; height: 22.55pt'>
											<INPUT type=radio id=af_12_SFCWAPI name="sfcwapi"
											${tmcRwsqd.sfcwapi ne '否'?'checked':''} value='是'
											datafld="SFCWAPI"
											onclick="refRadioChange(this,'af_12_SFCWAPI__SHOW__')" />是 <INPUT
											type=radio id=af_12_SFCWAPI name="sfcwapi"
											${tmcRwsqd.sfcwapi eq '否'?'checked':''} value='否'
											datafld="SFCWAPI"
											onclick="refRadioChange(this,'af_12_SFCWAPI__SHOW__')" />否 <Font
											color='red'>*</Font>
										</td>
									</tr>
									<tr style='height: 23.4pt'>
										<td style='width: 77.4pt; border-top: none; height: 23.4pt'
											align=center>申请日期</td>
										<td colspan=3
											style='width: 348.7pt; border-top: none; border-left: none; height: 23.4pt'>
											<input type="text" class="buyBox1" placeholder=""
											id="af_1_SQRQ" name="sqrq" datafld="SQRQ" maxlength=100
											value="${tmcRwsqd.sqrq }" validateType="required"> <!-- <INPUT class=buyBox1 type=text id=af_1_SQRQ  value="" size=60 name="sqrq" datafld="SQRQ"  maxlength=100  onclick='PopCalendarDateOnly(this)'> -->
											<Font color='red'>*</Font>
										</td>
									</tr>
									<tr style='height: 46.7pt'>
										<td style='width: 77.4pt; border-top: none; height: 46.7pt'
											align=center>备注</td>
										<td colspan=4
											style='width: 340.9pt; border-top: none; border-left: none; height: 46.7pt; padding: 6px 2px;'>
											<textarea class=buyBox1 id=af_1_BZ name='bz' wrap="VIRTUAL"
												datafld="BZ" rows=4 cols=80
												onchange="_doChange('af_1','BZ',this)">${tmcRwsqd.bz }</textarea>
										</td>
									</tr>
								</table>
								<div align="center"
									style="text-align: center; margin-top: 25px;">
									<input type=button class="input-btnn" name=sb1 value="保存"
										onclick="MyTjsss()" />
									<c:if test="${tmcRwsqd.pk1 ne null }">
										<input type=button class="input-btnn" name=sb1 value="提交审核"
											onclick="submitTocheck()" />
									</c:if>

								</div>
							</div>
							<div class="" id="cf2" style="display: none;">
								<input type="hidden" name="tmcSbjjb.pk1"
									value="${tmcRwsqd.tmcSbjjb.pk1 }">
								<table width=800 id='af_12' style="margin-top: 40px;">
									<tr width=800>
										<td width=30% style="border: none;"></td>
										<td style="border: none; float: left;"><span
											style='font-size: 22.0pt; font-family: 宋体'>设备简介</span></td>
										<td width=30% style="border: none;">
											<div id='button_div' style="display: none;">
												<table>
													<tr>
														<td style="float: right; border: none;"><input
															type="button" class='btn3_mouseover' id="scc"
															value=" XML上传 " onclick="_shangchuan()"
															style="float: right;" /></td>
														<td style="border: none;"><INPUT TYPE="button"
															class="btn3_mouseover" VALUE="Excel上传"
															onClick="lookdiv()"></td>
														<td style="border: none;"><input type="button"
															class='btn3_mouseover' value="修改记录 " onclick="_history()" />
														</td>
														<td style="float: right; border: none;"><input
															type="button" class='btn3_mouseover' id="scc" value="打印"
															onclick="_printIe()" style="float: right;" /></td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</table>
								<table id="qymcTable">
									<tr style='height: 22.25pt'></tr>
									<tr>
										<td width="150" style="text-align: center;">企业名称</td>
										<td colspan="6"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_QYMC value="${tlCompanyInfo.name}"
											size=122 name="tmcSbjjb.qymc" datafld="QYMC" maxlength=100
											onchange="_doChange('af_12','QYMC',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;">设备名称</td>
										<td colspan="6"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_SBMC value="${tmcRwsqd.sbmc }" size=122
											name='tmcSbjjb.sbmc' datafld="SBMC" maxlength=100
											onchange="_doChange('af_12','SBMC',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;">设备型号</td>
										<td colspan="6"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_SBXH value="${tmcRwsqd.sbxh }" size=122
											name="tmcSbjjb.sbxh" datafld="SBXH" maxlength=100
											onchange="_doChange('af_12','SBXH',this)"></td>
									</tr>
									<tr>
										<td colspan="7"
											style="font-size: 16px; font-weight: bold; height: 35px;">&nbsp;&nbsp;NB-IoT终端技术规格</td>
									</tr>
									<tr>
										<td style="text-align: center;">NB-IoT版本</td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='NBIOTBB'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_NBIOTBB name="tmcSbjjb.nbiotbb"
														${fn:contains(tmcRwsqd.tmcSbjjb.nbiotbb, 'R13')?'checked':''}
														value='R13' datafld="cR13"
														onclick="refCheckChange(this,'af_12_NBIOTBB__SHOW__')" />R13
														<INPUT type=checkbox id=af_12_NBIOTBB
														name="tmcSbjjb.nbiotbb"
														${fn:contains(tmcRwsqd.tmcSbjjb.nbiotbb, 'R14')?'checked':''}
														value='R14' datafld="cR14"
														onclick="refCheckChange(this,'af_12_NBIOTBB__SHOW__')" />R14
													</TD>
												</TR>
											</table>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">NB-IoT频段</td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='NBIOTPD'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_NBIOTPD name="tmcSbjjb.nbiotpd" value=Band3
														${fn:contains(tmcRwsqd.tmcSbjjb.nbiotpd, 'Band3')?'checked':''}
														datafld='cBand3'
														onclick="refCheckChange(this,'af_12_NBIOTPD__SHOW__')">Band
														3 <INPUT type=checkbox id=af_12_NBIOTPD
														name="tmcSbjjb.nbiotpd" value=Band5
														${fn:contains(tmcRwsqd.tmcSbjjb.nbiotpd, 'Band5')?'checked':''}
														datafld='cBand5'
														onclick="refCheckChange(this,'af_12_NBIOTPD__SHOW__')">Band
														5 <INPUT type=checkbox id=af_12_NBIOTPD
														name="tmcSbjjb.nbiotpd" value=Band8
														${fn:contains(tmcRwsqd.tmcSbjjb.nbiotpd, 'Band8')?'checked':''}
														datafld='cBand8'
														onclick="refCheckChange(this,'af_12_NBIOTPD__SHOW__')">Band
														8</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">NB-IoT传输能力等级</td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='NBIOTCSNLDJ'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_NBIOTCSNLDJ name="tmcSbjjb.nbiotcsnldj"
														${fn:contains(tmcRwsqd.tmcSbjjb.nbiotcsnldj, 'NB1')?'checked':''}
														value=NB1 datafld='cNB1'
														onclick="refCheckChange(this,'af_12_NBIOTCSNLDJ__SHOW__')">NB1
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">物联网模组型号</td>
										<td colspan="2"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_WLWMZXH
											value="${tmcRwsqd.tmcSbjjb.wlwmzxh }" size=40
											name="tmcSbjjb.wlwmzxh" datafld="WLWMZXH" maxlength=100
											onchange="_doChange('af_12','WLWMZXH',this)"></td>
										<td style="text-align: center;">物联网模组供应商</td>
										<td width="131" colspan="3"><INPUT style="width: 90%;"
											class=buyBox1 type=text id=af_12_WLWMZGYS
											value="${tmcRwsqd.tmcSbjjb.wlwmzgys }" size=41
											name="tmcSbjjb.wlwmzgys" datafld="WLWMZGYS" maxlength=100
											onchange="_doChange('af_12','WLWMZGYS',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;">核心芯片（芯片组）供应商</td>
										<td colspan="2"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_NBHXXPGYS
											value="${tmcRwsqd.tmcSbjjb.nbhxxpgys }" size=40
											name="tmcSbjjb.nbhxxpgys" datafld="NBHXXPGYS" maxlength=100
											onchange="_doChange('af_12','NBHXXPGYS',this)"></td>
										<td style="text-align: center;">核心芯片（芯片组）型号</td>
										<td width="131" colspan="3"><INPUT style="width: 90%;"
											class=buyBox1 type=text id=af_12_NBHXXPXH
											value="${tmcRwsqd.tmcSbjjb.nbhxxpxh }" size=41
											name="tmcSbjjb.nbhxxpxh" datafld="NBHXXPXH" maxlength=100
											onchange="_doChange('af_12','NBHXXPXH',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;">基带芯片供应商</td>
										<td colspan="2"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_NBJDXPGYS
											value="${tmcRwsqd.tmcSbjjb.nbjdxpgys }" size=40
											name="tmcSbjjb.nbjdxpgys" datafld="NBJDXPGYS" maxlength=100
											onchange="_doChange('af_12','NBJDXPGYS',this)"></td>
										<td style="text-align: center;">基带芯片型号</td>
										<td colspan="3"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_NBJDXPXH
											value="${tmcRwsqd.tmcSbjjb.nbjdxpxh }" size=41
											name="tmcSbjjb.nbjdxpxh" datafld="NBJDXPXH" maxlength=100
											onchange="_doChange('af_12','NBJDXPXH',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;">射频芯片供应商</td>
										<td colspan="2"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_NBSPXPGYS
											value="${tmcRwsqd.tmcSbjjb.nbspxpgys }" size=40
											name="tmcSbjjb.nbspxpgys" datafld="NBSPXPGYS" maxlength=100
											onchange="_doChange('af_12','NBSPXPGYS',this)"></td>
										<td style="text-align: center;">射频芯片型号</td>
										<td colspan="3"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_NBSPXPXH
											value="${tmcRwsqd.tmcSbjjb.nbspxpxh }" size=41
											name="tmcSbjjb.nbspxpxh" datafld="NBSPXPXH" maxlength=100
											onchange="_doChange('af_12','NBSPXPXH',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;">NB-IoT业务</td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='NBIOTYW'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_NBIOTYW name="tmcSbjjb.nbiotyw" value=短消息业务
														${fn:contains(tmcRwsqd.tmcSbjjb.nbiotyw, '短消息业务')?'checked':''}
														datafld='c短消息业务'
														onclick="refCheckChange(this,'af_12_NBIOTYW__SHOW__')">短消息业务
														<INPUT type=checkbox id=af_12_NBIOTYW
														name="tmcSbjjb.nbiotyw" value=数据业务
														${fn:contains(tmcRwsqd.tmcSbjjb.nbiotyw, '数据业务')?'checked':''}
														datafld='c数据业务'
														onclick="refCheckChange(this,'af_12_NBIOTYW__SHOW__')">数据业务
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">是否已承载业务应用</td>
										<td><INPUT type=radio id=af_12_SFYCZYWYY
											name="tmcSbjjb.sfyczywyy" value='是'
											${tmcRwsqd.tmcSbjjb.sfyczywyy eq '是'?'checked':''}
											datafld="SFYCZYWYY"
											onclick="refRadioChange(this,'af_12_SFYCZYWYY__SHOW__')" />是
											<INPUT type=radio id=af_12_SFYCZYWYY
											name="tmcSbjjb.sfyczywyy" value='否'
											${tmcRwsqd.tmcSbjjb.sfyczywyy eq '否'?'checked':''}
											datafld="SFYCZYWYY"
											onclick="refRadioChange(this,'af_12_SFYCZYWYY__SHOW__')" />否
										</td>
										<td style="text-align: center;">是否承载可安装的业务应用程序</td>
										<td><INPUT type=radio id=af_12_SFCZKAZDYWYYCX
											name="tmcSbjjb.sfczkazdywyycx" value='是'
											${tmcRwsqd.tmcSbjjb.sfczkazdywyycx eq '是'?'checked':''}
											datafld="SFCZKAZDYWYYCX"
											onclick="refRadioChange(this,'af_12_SFCZKAZDYWYYCX__SHOW__')" />是
											<INPUT type=radio id=af_12_SFCZKAZDYWYYCX
											name="tmcSbjjb.sfczkazdywyycx" value='否'
											${tmcRwsqd.tmcSbjjb.sfczkazdywyycx eq '否'?'checked':''}
											datafld="SFCZKAZDYWYYCX"
											onclick="refRadioChange(this,'af_12_SFCZKAZDYWYYCX__SHOW__')" />否
										</td>
										<td style="text-align: center;">是否传输用户信息</td>
										<td colspan="3"><INPUT type=radio id=af_12_SFCSYHXX
											name="tmcSbjjb.sfcsyhxx" value='是'
											${tmcRwsqd.tmcSbjjb.sfcsyhxx eq '是'?'checked':''}
											datafld="SFCSYHXX"
											onclick="refRadioChange(this,'af_12_SFCSYHXX__SHOW__')" />是
											<INPUT type=radio id=af_12_SFCSYHXX name="tmcSbjjb.sfcsyhxx"
											value='否' ${tmcRwsqd.tmcSbjjb.sfcsyhxx eq '否'?'checked':''}
											datafld="SFCSYHXX"
											onclick="refRadioChange(this,'af_12_SFCSYHXX__SHOW__')" />否
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">是否支持其它蜂窝通信功能</td>
										<td colspan="6"><INPUT type=radio id=af_12_SFZCQTFWGN
											name="tmcSbjjb.sfzcqtfwgn" value='支持其它蜂窝通信功能'
											${tmcRwsqd.tmcSbjjb.sfzcqtfwgn eq '支持其它蜂窝通信功能'?'checked':''}
											datafld="SFZCQTFWGN"
											onclick="refRadioChange(this,'af_12_SFZCQTFWGN__SHOW__')" />支持其它蜂窝通信功能
											<INPUT type=radio id=af_12_SFZCQTFWGN
											name="tmcSbjjb.sfzcqtfwgn" value='不支持其它蜂通信窝功能'
											${tmcRwsqd.tmcSbjjb.sfzcqtfwgn eq '不支持其它蜂通信窝功能'?'checked':''}
											datafld="SFZCQTFWGN"
											onclick="refRadioChange(this,'af_12_SFZCQTFWGN__SHOW__')" />不支持其它蜂窝通信功能
										</td>
									</tr>
									<tr>
										<td colspan="7"
											style="font-size: 16px; font-weight: bold; height: 35px;">&nbsp;&nbsp;卫星移动终端技术规格</td>
									</tr>
									<tr>
										<td style="text-align: center;">使用频段</td>
										<td style="text-align: center;">天通一号</td>
										<td colspan="5">
											<table class=buyTitle datasrc='#ds12' datafld='TTYH'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_TTYH name="tmcSbjjb.ttyh" value='2010-2200MHz'
														${fn:contains(tmcRwsqd.tmcSbjjb.ttyh, '2010-2200MHz')?'checked':''}
														datafld='c2010-2200MHz'
														onclick="refCheckChange(this,'af_12_TTYH__SHOW__')">2010-2200MHz
													</td>
												</tr>

											</table>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">卫星业务</td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='WXYW'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_WXYW name="tmcSbjjb.wxyw" value='短信业务'
														${fn:contains(tmcRwsqd.tmcSbjjb.wxyw, '短信业务')?'checked':''}
														datafld='c短信业务'
														onclick="refCheckChange(this,'af_12_WXYW__SHOW__')">短信业务
													</td>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_WXYW name="tmcSbjjb.wxyw" value='语音业务'
														${fn:contains(tmcRwsqd.tmcSbjjb.wxyw, '语音业务')?'checked':''}
														datafld='c语音业务'
														onclick="refCheckChange(this,'af_12_WXYW__SHOW__')">语音业务
													</td>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_WXYW name="tmcSbjjb.wxyw" value='数据业务'
														${fn:contains(tmcRwsqd.tmcSbjjb.wxyw, '数据业务')?'checked':''}
														datafld='c数据业务'
														onclick="refCheckChange(this,'af_12_WXYW__SHOW__')">数据业务
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">卫星移动终端类别</td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='WXYDZDLB'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_WXYDZDLB name="tmcSbjjb.wxydzdlb" value='手持终端'
														${fn:contains(tmcRwsqd.tmcSbjjb.wxydzdlb, '手持终端')?'checked':''}
														datafld='c手持终端'
														onclick="refCheckChange(this,'af_12_WXYDZDLB__SHOW__')">手持终端
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">是否支持蜂窝功能</td>
										<td colspan="6"><INPUT type=radio id=af_12_SFZCFWGN
											name="tmcSbjjb.sfzcfwgn" value='支持蜂窝通信功能'
											${tmcRwsqd.tmcSbjjb.sfzcfwgn eq '支持蜂窝通信功能'?'checked':''}
											datafld="SFZCFWGN"
											onclick="refRadioChange(this,'af_12_SFZCFWGN__SHOW__')" />支持蜂窝通信功能
											<INPUT type=radio id=af_12_SFZCFWGN name="tmcSbjjb.sfzcfwgn"
											value='不支持蜂窝通信功能'
											${tmcRwsqd.tmcSbjjb.sfzcfwgn eq '不支持蜂窝通信功能'?'checked':''}
											datafld="SFZCFWGN"
											onclick="refRadioChange(this,'af_12_SFZCFWGN__SHOW__')" />不支持蜂窝通信功能
										</td>
									</tr>
									<tr>
										<td colspan="7"
											style="font-size: 16px; font-weight: bold; height: 35px;">&nbsp;&nbsp;技术规格</td>
									</tr>
									<tr>
										<td rowspan="7" style="text-align: center;">使用频段</td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='SYPDGSM'>
												<tr>
													<td style="border: none;">GSM: <INPUT type=checkbox
														id=af_12_SYPDGSM gsm="900MHz" name="tmcSbjjb.sypdgsm"
														value='900MHz'
														${fn:contains(tmcRwsqd.tmcSbjjb.sypdgsm, '900MHz')?'checked':''}
														datafld="c900MHz"
														onclick="refCheckChange(this,'af_12_SYPDGSM__SHOW__')" />900MHz
														<INPUT type=checkbox id=af_12_SYPDGSM gsm="1800MHz"
														name="tmcSbjjb.sypdgsm" value='1800MHz'
														${fn:contains(tmcRwsqd.tmcSbjjb.sypdgsm, '1800MHz')?'checked':''}
														datafld="c1800MHz"
														onclick="refCheckChange(this,'af_12_SYPDGSM__SHOW__')" />1800MHz
														<INPUT type=checkbox id=af_12_SYPDGSM gsm="850MHz"
														name="tmcSbjjb.sypdgsm" value='850MHz'
														${fn:contains(tmcRwsqd.tmcSbjjb.sypdgsm, '850MHz')?'checked':''}
														datafld="c850MHz"
														onclick="refCheckChange(this,'af_12_SYPDGSM__SHOW__')" />850MHz
														<INPUT type=checkbox id=af_12_SYPDGSM gsm="1900MHz"
														name="tmcSbjjb.sypdgsm" value='1900MHz'
														${fn:contains(tmcRwsqd.tmcSbjjb.sypdgsm, '1900MHz')?'checked':''}
														datafld="c1900MHz"
														onclick="refCheckChange(this,'af_12_SYPDGSM__SHOW__')" />1900MHz
													</TD>
												</TR>
											</table>
										</td>
									</tr>
									<tr>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='SYPDCDMA'>
												<tr>
													<td style="border: none;">CDMA: <INPUT type=checkbox
														id=af_12_SYPDCDMA name="tmcSbjjb.sypdcdma" value='800MHz'
														${fn:contains(tmcRwsqd.tmcSbjjb.sypdcdma, '800MHz')?'checked':''}
														datafld="c800MHz"
														onclick="refCheckChange(this,'af_12_SYPDCDMA__SHOW__')" />800MHz
														<INPUT type=checkbox id=af_12_SYPDCDMA
														name="tmcSbjjb.sypdcdma" value='1900MHz'
														${fn:contains(tmcRwsqd.tmcSbjjb.sypdcdma, '1900MHz')?'checked':''}
														datafld="c1900MHz"
														onclick="refCheckChange(this,'af_12_SYPDCDMA__SHOW__')" />1900MHz
													</TD>
												</TR>
											</table>
										</td>
									</tr>
									<tr>
										<td colspan="6">WCDMA: &nbsp;&nbsp; <!-- <input type='text' class=buyBox1 readOnly name="tmcSbjjb.sypdwcdma"  size=13 datafld='__SHOW__SYPDWCDMA'/> -->
											<SELECT style="" name='tmcSbjjb.sypdwcdma'
											datafld='__SHOW__SYPDWCDMA'>
												<option value=''>--请选择--</option>
												<option value='BandI'
													${tmcRwsqd.tmcSbjjb.sypdwcdma eq 'BandI'?'selected':''}>BandI</option>
												<option value='BandⅡ'
													${tmcRwsqd.tmcSbjjb.sypdwcdma eq 'BandⅡ'?'selected':''}>BandⅡ</option>
												<option value='BandⅢ'
													${tmcRwsqd.tmcSbjjb.sypdwcdma eq 'BandⅢ'?'selected':''}>BandⅢ</option>
												<option value='BandⅣ'
													${tmcRwsqd.tmcSbjjb.sypdwcdma eq 'BandⅣ'?'selected':''}>BandⅣ</option>
												<option value='BandⅨ'
													${tmcRwsqd.tmcSbjjb.sypdwcdma eq 'BandⅨ'?'selected':''}>BandⅨ</option>
												<option value='BandⅤ'
													${tmcRwsqd.tmcSbjjb.sypdwcdma eq 'BandⅤ'?'selected':''}>BandⅤ</option>
												<option value='BandⅥ'
													${tmcRwsqd.tmcSbjjb.sypdwcdma eq 'BandⅥ'?'selected':''}>BandⅥ</option>
												<option value='BandⅦ'
													${tmcRwsqd.tmcSbjjb.sypdwcdma eq 'BandⅦ'?'selected':''}>BandⅦ</option>
												<option value='BandⅧ'
													${tmcRwsqd.tmcSbjjb.sypdwcdma eq 'BandⅧ'?'selected':''}>BandⅧ</option>

										</SELECT> <!-- <input id='popbu_af_12_SYPDWCDMA' class="input-btn" type='button' value='..' onclick="__dynDisplay('DIC','af_12','SYPDWCDMA')" >
									&nbsp;&nbsp;&nbsp;&nbsp; --> <input type="radio"
											id="jhSYPDWCDMAQT" name="tmcSbjjb.jhSYPDWCDMAQT" value="其他"
											map="af_12_SYPDWCDMAQT" /> 其他：<INPUT class=buyBox1 type=text
											id=af_12_SYPDWCDMAQT
											value="${tmcRwsqd.tmcSbjjb.jhSYPDWCDMAQT }" size=15
											name="tmcSbjjb.sypdwcdmaqt" datafld="SYPDWCDMAQT"
											maxlength=100
											onchange="_doChange('af_12','SYPDWCDMAQT',this)">
										</td>
										<!--                             selectone -->
									</tr>
									<tr>
										<td colspan="6">cdma2000: <!-- <input type='text' class=buyBox1 readOnly name="tmcSbjjb.sypdcdma2000"  size=13 datafld='__SHOW__SYPDCDMA2000'/> -->
											<SELECT style="" name='tmcSbjjb.sypdcdma2000'
											datafld='__SHOW__SYPDCDMA2000'>
												<option value=''>--请选择--</option>
												<option value='BandClass0'
													${tmcRwsqd.tmcSbjjb.sypdcdma2000 eq 'BandClass0'?'selected':''}>BandClass0</option>
												<option value='BandClass1'
													${tmcRwsqd.tmcSbjjb.sypdcdma2000 eq 'BandClass1'?'selected':''}>BandClass1</option>
												<option value='BandClass2'
													${tmcRwsqd.tmcSbjjb.sypdcdma2000 eq 'BandClass2'?'selected':''}>BandClass2</option>
												<option value='BandClass3'
													${tmcRwsqd.tmcSbjjb.sypdcdma2000 eq 'BandClass3'?'selected':''}>BandClass3</option>
												<option value='BandClass4'
													${tmcRwsqd.tmcSbjjb.sypdcdma2000 eq 'BandClass4'?'selected':''}>BandClass4</option>
												<option value='BandClass5'
													${tmcRwsqd.tmcSbjjb.sypdcdma2000 eq 'BandClass5'?'selected':''}>BandClass5</option>
												<option value='BandClass6'
													${tmcRwsqd.tmcSbjjb.sypdcdma2000 eq 'BandClass6'?'selected':''}>BandClass6</option>
												<option value='BandClass7'
													${tmcRwsqd.tmcSbjjb.sypdcdma2000 eq 'BandClass7'?'selected':''}>BandClass7</option>
												<option value='BandClass8'
													${tmcRwsqd.tmcSbjjb.sypdcdma2000 eq 'BandClass8'?'selected':''}>BandClass8</option>
												<option value='BandClass9'
													${tmcRwsqd.tmcSbjjb.sypdcdma2000 eq 'BandClass9'?'selected':''}>BandClass9</option>
												<option value='BandClass10'
													${tmcRwsqd.tmcSbjjb.sypdcdma2000 eq 'BandClass10'?'selected':''}>BandClass10</option>

										</SELECT> <input id='popbu_af_12_SYPDCDMA2000' class="input-btn"
											type='button' value='..'
											onclick="__dynDisplay('DIC','af_12','SYPDCDMA2000')">
											&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
											id="jhSYPDCDMA2000QT" name="tmcSbjjb.jhSYPDCDMA2000QT"
											value="其他" map="af_12_SYPDCDMA2000QT" />其他：<INPUT
											class=buyBox1 type=text id=af_12_SYPDCDMA2000QT value=""
											size=15 name="tmcSbjjb.sypdcdma2000qt"
											datafld="SYPDCDMA2000QT" maxlength=100
											onchange="_doChange('af_12','SYPDCDMA2000QT',this)">
										</td>
										<!-- selectone -->
									</tr>
									<tr>
										<td colspan="6">
											<!-- 2014/5/7的版本 -->
											<table class=buyTitle datasrc='#ds12' datafld='SYPDTDSCDMA'>
												<tr>
													<td style="border: none;">TD-SCDMA: <INPUT
														type=checkbox id=af_12_SYPDTDSCDMA
														name="tmcSbjjb.sypdtdscdma" value=2GHz
														${fn:contains(tmcRwsqd.tmcSbjjb.sypdtdscdma, '2GHz')?'checked':''}
														datafld='c2GHz'
														onclick="refCheckChange(this,'af_12_SYPDTDSCDMA__SHOW__')">2GHz
														<INPUT type=checkbox id=af_12_SYPDTDSCDMA
														name="tmcSbjjb.sypdtdscdma" value=19GHz
														${fn:contains(tmcRwsqd.tmcSbjjb.sypdtdscdma, '19GHz')?'checked':''}
														datafld='c19GHz'
														onclick="refCheckChange(this,'af_12_SYPDTDSCDMA__SHOW__')">1.9GHz
														<INPUT type=checkbox id=af_12_SYPDTDSCDMA
														name="tmcSbjjb.sypdtdscdma" value=其他
														${fn:contains(tmcRwsqd.tmcSbjjb.sypdtdscdma, '其他')?'checked':''}
														datafld='c其他'
														onclick="refCheckChange(this,'af_12_SYPDTDSCDMA__SHOW__')">其他
														: <input type=text class=buyBox1 id='af_12_SYPDTDSCDMAQT'
														name="tmcSbjjb.sypdtdscdmaqt"
														value="${tmcRwsqd.tmcSbjjb.sypdtdscdmaqt }"
														datafld='SYPDTDSCDMAQT' />

													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='LTEFDD'>
												<tr>
													<td style="border: none;">LTE FDD: <INPUT
														type=checkbox id=af_12_LTEFDD name="tmcSbjjb.ltefdd"
														value=Band1
														${fn:contains(tmcRwsqd.tmcSbjjb.ltefdd, 'Band1')?'checked':''}
														datafld='cBand1'
														onclick="refCheckChange(this,'af_12_LTEFDD__SHOW__')">Band
														1 <INPUT type=checkbox id=af_12_LTEFDD
														name="tmcSbjjb.ltefdd" value=Band3
														${fn:contains(tmcRwsqd.tmcSbjjb.ltefdd, 'Band3')?'checked':''}
														datafld='cBand3'
														onclick="refCheckChange(this,'af_12_LTEFDD__SHOW__')">Band
														3
													</td>
												</tr>
											</table>
										</td>
									</tr>


									<tr>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='SYPDTDLTE'>
												<tr>
													<td style="border: none;">TD-LTE: <INPUT type=checkbox
														id=af_12_SYPDTDLTE name="tmcSbjjb.sypdtdlte"
														value='Band38'
														${fn:contains(tmcRwsqd.tmcSbjjb.sypdtdlte, 'Band38')?'checked':''}
														datafld="cBand38"
														onclick="refCheckChange(this,'af_12_SYPDTDLTE__SHOW__')" />Band
														38 <INPUT type=checkbox id=af_12_SYPDTDLTE
														name="tmcSbjjb.sypdtdlte" value='Band39'
														${fn:contains(tmcRwsqd.tmcSbjjb.sypdtdlte, 'Band39')?'checked':''}
														datafld="cBand39"
														onclick="refCheckChange(this,'af_12_SYPDTDLTE__SHOW__')" />Band
														39 <INPUT type=checkbox id=af_12_SYPDTDLTE
														name="tmcSbjjb.sypdtdlte" value='Band40'
														${fn:contains(tmcRwsqd.tmcSbjjb.sypdtdlte, 'Band40')?'checked':''}
														datafld="cBand40"
														onclick="refCheckChange(this,'af_12_SYPDTDLTE__SHOW__')" />Band
														40 <INPUT type=checkbox id=af_12_SYPDTDLTE
														name="tmcSbjjb.sypdtdlte" value='Band41'
														${fn:contains(tmcRwsqd.tmcSbjjb.sypdtdlte, 'Band41')?'checked':''}
														datafld="cBand41"
														onclick="refCheckChange(this,'af_12_SYPDTDLTE__SHOW__')" />Band
														41
													</TD>
												</TR>
											</table>
											<table class=buyTitle datasrc='#ds12' datafld='SYPDTDLTE41'>
												<tr>
													<td style="border: none;">（ <INPUT type=checkbox
														id=af_12_SYPDTDLTE41 name="tmcSbjjb.sypdtdlte41"
														value='25552575MHz'
														${fn:contains(tmcRwsqd.tmcSbjjb.sypdtdlte41, '25552575MHz')?'checked':''}
														datafld="c25552575MHz"
														onclick="refCheckChange(this,'af_12_SYPDTDLTE41__SHOW__')" />2555-2575
														MHz <INPUT type=checkbox id=af_12_SYPDTDLTE41
														name="tmcSbjjb.sypdtdlte41" value='25752635MHz'
														${fn:contains(tmcRwsqd.tmcSbjjb.sypdtdlte41, '25752635MHz')?'checked':''}
														datafld="c25752635MHz"
														onclick="refCheckChange(this,'af_12_SYPDTDLTE41__SHOW__')" />2575-2635
														MHz <INPUT type=checkbox id=af_12_SYPDTDLTE41
														name="tmcSbjjb.sypdtdlte41" value='26352655MHz'
														${fn:contains(tmcRwsqd.tmcSbjjb.sypdtdlte41, '26352655MHz')?'checked':''}
														datafld="c26352655MHz"
														onclick="refCheckChange(this,'af_12_SYPDTDLTE41__SHOW__')" />2635-2655
														MHz <INPUT type=checkbox id=af_12_SYPDTDLTE41
														name="tmcSbjjb.sypdtdlte41" value='25002690MHz'
														${fn:contains(tmcRwsqd.tmcSbjjb.sypdtdlte41, '25002690MHz')?'checked':''}
														datafld="c25002690MHz"
														onclick="refCheckChange(this,'af_12_SYPDTDLTE41__SHOW__')" />2500-2690
														MHz ）
													</TD>
												</TR>
											</table>
										</td>
									</tr>
									<tr>
										<td rowspan="3" style="text-align: center;">SIM/UIM卡槽和待机方式</td>
										<td height="25" colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='SIM'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_SIM name="tmcSbjjb.sim" value='单卡单待'
														${fn:contains(tmcRwsqd.tmcSbjjb.sim, '单卡单待')?'checked':''}
														datafld="c单卡单待"
														onclick="refCheckChange(this,'af_12_SIM__SHOW__')" />单卡单待
														<INPUT type=checkbox id=af_12_SIM name="tmcSbjjb.sim"
														value='单卡双待单通机'
														${fn:contains(tmcRwsqd.tmcSbjjb.sim, '单卡双待单通机')?'checked':''}
														datafld="c单卡双待单通机"
														onclick="refCheckChange(this,'af_12_SIM__SHOW__')" />单卡双待单通机
														<INPUT type=checkbox id=af_12_SIM name="tmcSbjjb.sim"
														value='单卡双通机type1'
														${fn:contains(tmcRwsqd.tmcSbjjb.sim, '单卡双通机type1')?'checked':''}
														datafld="c单卡双通机type1"
														onclick="refCheckChange(this,'af_12_SIM__SHOW__')" />单卡双通机type1
														<INPUT type=checkbox id=af_12_SIM name="tmcSbjjb.sim"
														value='eSIM'
														${fn:contains(tmcRwsqd.tmcSbjjb.sim, 'eSIM')?'checked':''}
														datafld="ceSIM"
														onclick="refCheckChange(this,'af_12_SIM__SHOW__')" />eSIM
													</td>

												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='UIMKC'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_UIMKC name="tmcSbjjb.uimkc" value="单卡双通机type2"
														${fn:contains(tmcRwsqd.tmcSbjjb.uimkc, '单卡双通机type2')?'checked':''}
														datafld='c单卡双通机type2'
														onclick="refCheckChange(this,'af_12_UIMKC__SHOW__'),kacao()" />单卡双通机type2
														（<INPUT type=checkbox id=af_12_UIMKC name="tmcSbjjb.uimkc"
														value="支持TDSCDMAGSM双模单待模式"
														${fn:contains(tmcRwsqd.tmcSbjjb.uimkc, '支持TDSCDMAGSM双模单待模式')?'checked':''}
														datafld='c支持TDSCDMAGSM双模单待模式'
														onclick="refCheckChange(this,'af_12_UIMKC__SHOW__')"
														disabled />支持TD-SCDMA/GSM双模单待模式 ）</td>
													<td align="right" style="border: none;">
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<div id='typeSubmit'>
															<input type=button class="btn3_mouseover" name=sb1
																value="Type确认" onclick="_typecancel()" />
														</div>
													</td>
												</tr>
											</table>

										</td>
									</tr>
									<tr>
										<td colspan="6"><INPUT type=radio id=af_12_DJFS
											name="tmcSbjjb.djfs" value='双卡单待机'
											${tmcRwsqd.tmcSbjjb.djfs eq '双卡单待机'?'checked':''}
											datafld="DJFS"
											onclick="refRadioChange(this,'af_12_DJFS__SHOW__')"
											map="af_12_DJFSQT" />双卡单待机 <INPUT type=radio id=af_12_DJFS
											name="tmcSbjjb.djfs" value='双卡双待机'
											${tmcRwsqd.tmcSbjjb.djfs eq '双卡双待机'?'checked':''}
											datafld="DJFS"
											onclick="refRadioChange(this,'af_12_DJFS__SHOW__')"
											map="af_12_DJFSQT" />双卡双待机 <INPUT type=radio id=af_12_DJFS
											name="tmcSbjjb.djfs" value="其他"
											${tmcRwsqd.tmcSbjjb.djfs eq '其他'?'checked':''} datafld="DJFS"
											onclick="refRadioChange(this,'af_12_DJFS__SHOW__')"
											map="af_12_DJFSQT" />其他： <INPUT class=buyBox1 type=text
											id=af_12_DJFSQT value="${tmcRwsqd.tmcSbjjb.djfsqt }" size=15
											name="tmcSbjjb.djfsqt" datafld="DJFSQT" maxlength=100
											onchange="_doChange('af_12','DJFSQT',this)"> <INPUT
											type=radio id=af_12_DJFS name="tmcSbjjb.djfs" value=''
											${tmcRwsqd.tmcSbjjb.djfs eq ''?'checked':''} datafld="DJFS"
											onclick="refRadioChange(this,'af_12_DJFS__SHOW__')"
											map="af_12_DJFSQT" />无</td>
									</tr>
									<tr>
										<td style="text-align: center;">核心芯片组数量</td>
										<td colspan="6"><INPUT type=radio id=af_12_HXXPZSL
											name="tmcSbjjb.hxxpzsl" value='单芯片组'
											${tmcRwsqd.tmcSbjjb.hxxpzsl eq '单芯片组'?'checked':''}
											datafld="HXXPZSL"
											onclick="refRadioChange(this,'af_12_HXXPZSL__SHOW__')" />单芯片组
											<INPUT type=radio id=af_12_HXXPZSL name="tmcSbjjb.hxxpzsl"
											value='双芯片组'
											${tmcRwsqd.tmcSbjjb.hxxpzsl eq '双芯片组'?'checked':''}
											datafld="HXXPZSL"
											onclick="refRadioChange(this,'af_12_HXXPZSL__SHOW__')" />双芯片组
											<span>&nbsp;&nbsp;&nbsp;&nbsp;</span> 双芯片组 <span>&nbsp;&nbsp;</span>
											是否支持同时发射： <INPUT type=radio id=af_12_SFZCTSFS
											name="tmcSbjjb.sfzctsfs" value='支持'
											${tmcRwsqd.tmcSbjjb.sfzctsfs eq '支持'?'checked':''}
											datafld="SFZCTSFS"
											onclick="refRadioChange(this,'af_12_SFZCTSFS__SHOW__')" />支持
											<INPUT type=radio id=af_12_SFZCTSFS name="tmcSbjjb.sfzctsfs"
											value='不支持'
											${tmcRwsqd.tmcSbjjb.sfzctsfs eq '不支持'?'checked':''}
											datafld="SFZCTSFS"
											onclick="refRadioChange(this,'af_12_SFZCTSFS__SHOW__')" />不支持
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">核心芯片（芯片组）供应商</td>
										<td colspan="2"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_HXXPGYS
											value="${tmcRwsqd.tmcSbjjb.hxxpgys }" size=40
											name="tmcSbjjb.hxxpgys" datafld="HXXPGYS" maxlength=100
											onchange="_doChange('af_12','HXXPGYS',this)"></td>
										<td style="text-align: center;">核心芯片（芯片组）型号</td>
										<td width="131" colspan="3"><INPUT style="width: 90%;"
											class=buyBox1 type=text id=af_12_HXXPXH
											value="${tmcRwsqd.tmcSbjjb.hxxpxh }" size=41
											name="tmcSbjjb.hxxpxh" datafld="HXXPXH" maxlength=100
											onchange="_doChange('af_12','HXXPXH',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;">基带芯片供应商</td>
										<td colspan="2"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_JDXPGYS
											value="${tmcRwsqd.tmcSbjjb.jdxpgys }" size=40
											name="tmcSbjjb.jdxpgys" datafld="JDXPGYS" maxlength=100
											onchange="_doChange('af_12','JDXPGYS',this)"></td>
										<td style="text-align: center;">基带芯片型号</td>
										<td colspan="3"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_JDXPXH value="${tmcRwsqd.tmcSbjjb.jdxpxh}"
											size=41 name="tmcSbjjb.jdxpxh" datafld="JDXPXH" maxlength=100
											onchange="_doChange('af_12','JDXPXH',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;">射频芯片供应商</td>
										<td colspan="2"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_SPXPGYS
											value="${tmcRwsqd.tmcSbjjb.spxpgys }" size=40
											name="tmcSbjjb.spxpgys" datafld="SPXPGYS" maxlength=100
											onchange="_doChange('af_12','SPXPGYS',this)"></td>
										<td style="text-align: center;">射频芯片型号</td>
										<td colspan="3"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_SPXPXH
											value="${tmcRwsqd.tmcSbjjb.spxpxh }" size=41
											name="tmcSbjjb.spxpxh" datafld="SPXPXH" maxlength=100
											onchange="_doChange('af_12','SPXPXH',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;">软件版本</td>
										<td><INPUT style="width: 90%;" class=buyBox1 type=text
											id=af_12_RJBB value="${tmcRwsqd.tmcSbjjb.rjbb }" size=25
											name="tmcSbjjb.rjbb" datafld="RJBB" maxlength=1000
											onchange="_doChange('af_12','RJBB',this)"></td>
										<td style="text-align: center;">查询指令</td>
										<td><INPUT style="width: 90%;" class=buyBox1 type=text
											id=af_12_RJBBCXZL value="${tmcRwsqd.tmcSbjjb.rjbbcxzl }"
											size=25 name="tmcSbjjb.rjbbcxzl" datafld="RJBBCXZL"
											maxlength=100 onchange="_doChange('af_12','RJBBCXZL',this)"></td>
										<td style="text-align: center;">软件开发商</td>
										<td colspan="2"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_RJKFS value="${tmcRwsqd.tmcSbjjb.rjkfs }"
											size=22 name="tmcSbjjb.rjkfs" datafld="RJKFS" maxlength=100
											onchange="_doChange('af_12','RJKFS',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;">硬件版本</td>
										<td colspan="2"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_YJBB value="${tmcRwsqd.tmcSbjjb.yjbb }"
											size=40 name="tmcSbjjb.yjbb" datafld="YJBB" maxlength=100
											onchange="_doChange('af_12','YJBB',this)"></td>
										<td style="text-align: center;">查询指令</td>
										<td colspan="3"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_YJBBCXZL
											value="${tmcRwsqd.tmcSbjjb.yjbbcxzl }" size=41
											name="tmcSbjjb.yjbbcxzl" datafld="YJBBCXZL" maxlength=100
											onchange="_doChange('af_12','YJBBCXZL',this)"></td>
									</tr>
									<!-- 终端款式，天线 -->
									<tr>
										<td style="text-align: center;">终端款式</td>
										<td colspan="6"><INPUT type=radio id=af_12_ZDKSQT
											name="tmcSbjjb.zdksqt" value="翻盖"
											${tmcRwsqd.tmcSbjjb.zdksqt eq '翻盖'?'checked':''}
											datafld="ZDKSQT"
											onclick="refRadioChange(this,'af_12_ZDKSQT__SHOW__')" />翻盖 <INPUT
											type=radio id=af_12_ZDKSQT name="tmcSbjjb.zdksqt" value="直板"
											${tmcRwsqd.tmcSbjjb.zdksqt eq '直板'?'checked':''}
											datafld="ZDKSQT"
											onclick="refRadioChange(this,'af_12_ZDKSQT__SHOW__')" />直板 <INPUT
											type=radio id=af_12_ZDKSQT name="tmcSbjjb.zdksqt" value="推拉"
											${tmcRwsqd.tmcSbjjb.zdksqt eq '推拉'?'checked':''}
											datafld="ZDKSQT"
											onclick="refRadioChange(this,'af_12_ZDKSQT__SHOW__')" />推拉 <INPUT
											type=radio id=af_12_ZDKSQT name="tmcSbjjb.zdksqt" value="折叠"
											${tmcRwsqd.tmcSbjjb.zdksqt eq '折叠'?'checked':''}
											datafld="ZDKSQT"
											onclick="refRadioChange(this,'af_12_ZDKSQT__SHOW__')" />折叠</td>
									</tr>
									<tr>
										<td style="text-align: center;">天线</td>
										<td colspan="6"><INPUT type=radio id=af_12_DTXCSMS
											name="tmcSbjjb.dtxcsms" value="外置"
											${fntmcRwsqd.tmcSbjjb.dtxcsms eq '外置'?'checked':''}
											datafld="DTXCSMS"
											onclick="refRadioChange(this,'af_12_DTXCSMS__SHOW__')" />外置
											<INPUT type=radio id=af_12_DTXCSMS name="tmcSbjjb.dtxcsms"
											value="内置" ${tmcRwsqd.tmcSbjjb.dtxcsms eq '内置'?'checked':''}
											datafld="DTXCSMS"
											onclick="refRadioChange(this,'af_12_DTXCSMS__SHOW__')" />内置
											<INPUT type=radio id=af_12_DTXCSMS name="tmcSbjjb.dtxcsms"
											value="拉杆天线"
											${tmcRwsqd.tmcSbjjb.dtxcsms eq '拉杆天线'?'checked':''}
											datafld="DTXCSMS"
											onclick="refRadioChange(this,'af_12_DTXCSMS__SHOW__')" />拉杆天线

										</td>
									</tr>
									<tr>
										<td rowspan="3" style="text-align: center;">预留芯片位置</td>
										<td colspan="6"><INPUT type=radio id=af_12_YLXPWZ
											name="tmcSbjjb.ylxpwz" value='有'
											${tmcRwsqd.tmcSbjjb.ylxpwz eq '有'?'checked':''}
											datafld="YLXPWZ"
											onclick="refRadioChange(this,'af_12_YLXPWZ__SHOW__'),_disa('1')" />有
											<INPUT type=radio id=af_12_YLXPWZ name="tmcSbjjb.ylxpwz"
											value='没有' ${tmcRwsqd.tmcSbjjb.ylxpwz eq '没有'?'checked':''}
											datafld="YLXPWZ"
											onclick="refRadioChange(this,'af_12_YLXPWZ__SHOW__'),_disa('2')" />没有
										</td>
									</tr>
									<tr>
										<td colspan="6">预留位芯片型号：<INPUT class=buyBox1 type=text
											id=af_12_YLWXPXH value="${tmcRwsqd.tmcSbjjb.ylwxpxh }"
											size=40 name="tmcSbjjb.ylwxpxh" datafld="YLWXPXH"
											maxlength=100 onchange="_doChange('af_12','YLWXPXH',this)"></td>
									</tr>
									<tr>
										<td colspan="6">预留位芯片功能：<INPUT class=buyBox1 type=text
											id=af_12_YLWXPGN value="${tmcRwsqd.tmcSbjjb.ylwxpgn }"
											size=40 name="tmcSbjjb.ylwxpgn" datafld="YLWXPGN"
											maxlength=100 onchange="_doChange('af_12','YLWXPGN',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;">CDMA版本</td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='CDMABB'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_CDMABB name="tmcSbjjb.cdmabb" value=Rel.0
														${fn:contains(tmcRwsqd.tmcSbjjb.cdmabb, 'Rel.0')?'checked':''}
														datafld='cRel.0'
														onclick="refCheckChange(this,'af_12_CDMABB__SHOW__')">Rel.0
														<INPUT type=checkbox id=af_12_CDMABB
														name="tmcSbjjb.cdmabb" value=Rel.A
														${fn:contains(tmcRwsqd.tmcSbjjb.cdmabb, 'Rel.A')?'checked':''}
														datafld='cRel.A'
														onclick="refCheckChange(this,'af_12_CDMABB__SHOW__')">Rel.A
														<INPUT type=checkbox id=af_12_CDMABB
														name="tmcSbjjb.cdmabb" value=Rel.B
														${fn:contains(tmcRwsqd.tmcSbjjb.cdmabb, 'Rel.B')?'checked':''}
														datafld='cRel.B'
														onclick="refCheckChange(this,'af_12_CDMABB__SHOW__')">Rel.B
														<INPUT type=checkbox id=af_12_CDMABB
														name="tmcSbjjb.cdmabb" value=其他
														${fn:contains(tmcRwsqd.tmcSbjjb.cdmabb, '其他')?'checked':''}
														datafld='c其他'
														onclick="refCheckChange(this,'af_12_CDMABB__SHOW__')">其他
														<INPUT class=buyBox1 type=text id=af_12_CDMABBQT
														value="${tmcRwsqd.tmcSbjjb.cdmabbqt }" size=15
														name="tmcSbjjb.cdmabbqt" datafld="CDMABBQT" maxlength=100
														onchange="_doChange('af_12','CDMABBQT',this)"></td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">cdma2000版本</td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='CDMA2000BB'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_CDMA2000BB name="tmcSbjjb.cdma2000bb" value=Rel.0
														${fn:contains(tmcRwsqd.tmcSbjjb.cdma2000bb, 'Rel.0')?'checked':''}
														datafld='cRev.0'
														onclick="refCheckChange(this,'af_12_CDMA2000BB__SHOW__')">Rev.0
														<INPUT type=checkbox id=af_12_CDMA2000BB
														name="tmcSbjjb.cdma2000bb" value=Rel.A
														${fn:contains(tmcRwsqd.tmcSbjjb.cdma2000bb, 'Rel.A')?'checked':''}
														datafld='cRev.A'
														onclick="refCheckChange(this,'af_12_CDMA2000BB__SHOW__')">Rev.A
														<INPUT type=checkbox id=af_12_CDMA2000BB
														name="tmcSbjjb.cdma2000bb" value=其他
														${fn:contains(tmcRwsqd.tmcSbjjb.cdma2000bb, '其他')?'checked':''}
														datafld='c其他'
														onclick="refCheckChange(this,'af_12_CDMA2000BB__SHOW__')">其他
														<INPUT class=buyBox1 type=text id=af_12_CDMA2000BBQT
														value="${tmcRwsqd.tmcSbjjb.cdma2000bbqt }" size=15
														name="tmcSbjjb.cdma2000bbqt" datafld="CDMA2000BBQT"
														maxlength=100
														onchange="_doChange('af_12','CDMA2000BBQT',this)">
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">WCDMA版本</td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='WCDMABB'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_WCDMABB name="tmcSbjjb.wcdmabb" value='R099'
														${fn:contains(tmcRwsqd.tmcSbjjb.wcdmabb, 'R099')?'checked':''}
														datafld="cR099"
														onclick="refCheckChange(this,'af_12_WCDMABB__SHOW__')" />R99
														<INPUT type=checkbox id=af_12_WCDMABB
														name="tmcSbjjb.wcdmabb" value='R5'
														${fn:contains(tmcRwsqd.tmcSbjjb.wcdmabb, 'R5')?'checked':''}
														datafld="cR5"
														onclick="refCheckChange(this,'af_12_WCDMABB__SHOW__')" />R5
														<INPUT type=checkbox id=af_12_WCDMABB
														name="tmcSbjjb.wcdmabb" value='R6'
														${fn:contains(tmcRwsqd.tmcSbjjb.wcdmabb, 'R6')?'checked':''}
														datafld="cR6"
														onclick="refCheckChange(this,'af_12_WCDMABB__SHOW__')" />R6
														<INPUT type=checkbox id=af_12_WCDMABB
														name="tmcSbjjb.wcdmabb" value='R7'
														${fn:contains(tmcRwsqd.tmcSbjjb.wcdmabb, 'R7')?'checked':''}
														datafld="cR7"
														onclick="refCheckChange(this,'af_12_WCDMABB__SHOW__')" />R7
														<INPUT type=checkbox id=af_12_WCDMABB
														name="tmcSbjjb.wcdmabb" value='R8'
														${fn:contains(tmcRwsqd.tmcSbjjb.wcdmabb, 'R8')?'checked':''}
														datafld="cR8"
														onclick="refCheckChange(this,'af_12_WCDMABB__SHOW__')" />R8
														<INPUT type=checkbox id=af_12_WCDMABB
														name="tmcSbjjb.wcdmabb" value='R9'
														${fn:contains(tmcRwsqd.tmcSbjjb.wcdmabb, 'R9')?'checked':''}
														datafld="cR9"
														onclick="refCheckChange(this,'af_12_WCDMABB__SHOW__')" />R9
														<INPUT type=checkbox id=af_12_WCDMABB
														name="tmcSbjjb.wcdmabb" value='R10'
														${fn:contains(tmcRwsqd.tmcSbjjb.wcdmabb, 'R10')?'checked':''}
														datafld="cR10"
														onclick="refCheckChange(this,'af_12_WCDMABB__SHOW__')" />R10
														<INPUT type=checkbox id=af_12_WCDMABB
														name="tmcSbjjb.wcdmabb" value='R11'
														${fn:contains(tmcRwsqd.tmcSbjjb.wcdmabb, 'R11')?'checked':''}
														datafld="cR11"
														onclick="refCheckChange(this,'af_12_WCDMABB__SHOW__')" />R11
													</TD>
												</TR>
											</TABLE>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">TD-SCDMA版本</td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='TDSCDMABB'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_TDSCDMABB name="tmcSbjjb.tdscdmabb" value='R4'
														${fn:contains(tmcRwsqd.tmcSbjjb.tdscdmabb, 'R4')?'checked':''}
														datafld="cR4"
														onclick="refCheckChange(this,'af_12_TDSCDMABB__SHOW__')" />R4
														<INPUT type=checkbox id=af_12_TDSCDMABB
														name="tmcSbjjb.tdscdmabb" value='R5'
														${fn:contains(tmcRwsqd.tmcSbjjb.tdscdmabb, 'R5')?'checked':''}
														datafld="cR5"
														onclick="refCheckChange(this,'af_12_TDSCDMABB__SHOW__')" />R5
														<INPUT type=checkbox id=af_12_TDSCDMABB
														name="tmcSbjjb.tdscdmabb" value='R6'
														${fn:contains(tmcRwsqd.tmcSbjjb.tdscdmabb, 'R6')?'checked':''}
														datafld="cR6"
														onclick="refCheckChange(this,'af_12_TDSCDMABB__SHOW__')" />R6
														<INPUT type=checkbox id=af_12_TDSCDMABB
														name="tmcSbjjb.tdscdmabb" value='R7'
														${fn:contains(tmcRwsqd.tmcSbjjb.tdscdmabb, 'R7')?'checked':''}
														datafld="cR7"
														onclick="refCheckChange(this,'af_12_TDSCDMABB__SHOW__')" />R7
														<INPUT type=checkbox id=af_12_TDSCDMABB
														name="tmcSbjjb.tdscdmabb" value='R8'
														${fn:contains(tmcRwsqd.tmcSbjjb.tdscdmabb, 'R8')?'checked':''}
														datafld="cR8"
														onclick="refCheckChange(this,'af_12_TDSCDMABB__SHOW__')" />R8
														<INPUT type=checkbox id=af_12_TDSCDMABB
														name="tmcSbjjb.tdscdmabb" value='R9'
														${fn:contains(tmcRwsqd.tmcSbjjb.tdscdmabb, 'R9')?'checked':''}
														datafld="cR9"
														onclick="refCheckChange(this,'af_12_TDSCDMABB__SHOW__')" />R9</TD>
												</TR>
											</TABLE>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">LTE FDD版本:</td>
										<td colspan='6'>
											<table class=buyTitle datasrc='#ds12' datafld='LTEFDDBB'>
												<tr>
													<td style='border: none'><INPUT type=checkbox
														id=af_12_LTEFDDBB name="tmcSbjjb.ltefddbb" value=R8
														${fn:contains(tmcRwsqd.tmcSbjjb.ltefddbb, 'R8')?'checked':''}
														datafld='cR8'
														onclick="refCheckChange(this,'af_12_LTEFDDBB__SHOW__')">R8
														<INPUT type=checkbox id=af_12_LTEFDDBB
														name="tmcSbjjb.ltefddbb" value=R9
														${fn:contains(tmcRwsqd.tmcSbjjb.ltefddbb, 'R9')?'checked':''}
														datafld='cR9'
														onclick="refCheckChange(this,'af_12_LTEFDDBB__SHOW__')">R9
														<INPUT type=checkbox id=af_12_LTEFDDBB
														name="tmcSbjjb.ltefddbb" value=R10
														${fn:contains(tmcRwsqd.tmcSbjjb.ltefddbb, 'R10')?'checked':''}
														datafld='cR10'
														onclick="refCheckChange(this,'af_12_LTEFDDBB__SHOW__')">R10
														<INPUT type=checkbox id=af_12_LTEFDDBB
														name="tmcSbjjb.ltefddbb" value=R11
														${fn:contains(tmcRwsqd.tmcSbjjb.ltefddbb, 'R11')?'checked':''}
														datafld='cR11'
														onclick="refCheckChange(this,'af_12_LTEFDDBB__SHOW__')">R11
														<INPUT type=checkbox id=af_12_LTEFDDBB
														name="tmcSbjjb.ltefddbb" value=R12
														${fn:contains(tmcRwsqd.tmcSbjjb.ltefddbb, 'R12')?'checked':''}
														datafld='cR12'
														onclick="refCheckChange(this,'af_12_LTEFDDBB__SHOW__')">R12
														<INPUT type=checkbox id=af_12_LTEFDDBB
														name="tmcSbjjb.ltefddbb" value=R13
														${fn:contains(tmcRwsqd.tmcSbjjb.ltefddbb, 'R13')?'checked':''}
														datafld='cR13'
														onclick="refCheckChange(this,'af_12_LTEFDDBB__SHOW__')">R13
													</td>
												</tr>
											</table>
										</td>
									</tr>

									<tr>
										<td style="text-align: center;">TD-LTE版本</td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='TDLTEBB'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_TDLTEBB name="tmcSbjjb.tdltebb" value='R8'
														${fn:contains(tmcRwsqd.tmcSbjjb.tdltebb, 'R8')?'checked':''}
														datafld="cR8"
														onclick="refCheckChange(this,'af_12_TDLTEBB__SHOW__')" />R8
														<INPUT type=checkbox id=af_12_TDLTEBB
														name="tmcSbjjb.tdltebb" value='R9'
														${fn:contains(tmcRwsqd.tmcSbjjb.tdltebb, 'R9')?'checked':''}
														datafld="cR9"
														onclick="refCheckChange(this,'af_12_TDLTEBB__SHOW__')">R9
														<INPUT type=checkbox id=af_12_TDLTEBB
														name="tmcSbjjb.tdltebb" value='R10'
														${fn:contains(tmcRwsqd.tmcSbjjb.tdltebb, 'R10')?'checked':''}
														datafld="cR10"
														onclick="refCheckChange(this,'af_12_TDLTEBB__SHOW__')" />R10
														<INPUT type=checkbox id=af_12_TDLTEBB
														name="tmcSbjjb.tdltebb" value='R11'
														${fn:contains(tmcRwsqd.tmcSbjjb.tdltebb, 'R11')?'checked':''}
														datafld="cR11"
														onclick="refCheckChange(this,'af_12_TDLTEBB__SHOW__')">R11
														<INPUT type=checkbox id=af_12_TDLTEBB
														name="tmcSbjjb.tdltebb" value='R12'
														${fn:contains(tmcRwsqd.tmcSbjjb.tdltebb, 'R12')?'checked':''}
														datafld="cR12"
														onclick="refCheckChange(this,'af_12_TDLTEBB__SHOW__')" />R12
														<INPUT type=checkbox id=af_12_TDLTEBB
														name="tmcSbjjb.tdltebb" value='R13'
														${fn:contains(tmcRwsqd.tmcSbjjb.tdltebb, 'R13')?'checked':''}
														datafld="cR13"
														onclick="refCheckChange(this,'af_12_TDLTEBB__SHOW__')" />R13
													</TD>
												</TR>
											</TABLE>
										</td>
									</tr>
									<tr>
										<td rowspan="2" style="text-align: center;"><p>操作系统</p></td>
										<td colspan="6">
											<div id="temp1">
												<INPUT type=radio id=af_12_CZXT name="tmcSbjjb.czxt"
													value="Android"
													${tmcRwsqd.tmcSbjjb.czxt eq 'Android'?'checked':''}
													datafld="CZXT"
													onclick="refRadioChange(this,'af_12_CZXT__SHOW__')" />Android
												<INPUT type=radio id=af_12_CZXT name="tmcSbjjb.czxt"
													value="Windows Mobile/Phone"
													${tmcRwsqd.tmcSbjjb.czxt eq 'Windows Mobile/Phone'?'checked':''}
													datafld="CZXT"
													onclick="refRadioChange(this,'af_12_CZXT__SHOW__')" />Windows
												Mobile/Phone <INPUT type=radio id=af_12_CZXT
													name="tmcSbjjb.czxt" value="Symbian"
													${tmcRwsqd.tmcSbjjb.czxt eq 'Symbian'?'checked':''}
													datafld="CZXT"
													onclick="refRadioChange(this,'af_12_CZXT__SHOW__')" />Symbian
												<INPUT type=radio id=af_12_CZXT name="tmcSbjjb.czxt"
													value="iOS" ${tmcRwsqd.tmcSbjjb.czxt eq 'iOS'?'checked':''}
													datafld="CZXT"
													onclick="refRadioChange(this,'af_12_CZXT__SHOW__')" />iOS
												<INPUT type=radio id=af_12_CZXT name="tmcSbjjb.czxt"
													value="RIM OS"
													${tmcRwsqd.tmcSbjjb.czxt eq 'RIM OS'?'checked':''}
													datafld="CZXT"
													onclick="refRadioChange(this,'af_12_CZXT__SHOW__')" />RIM
												OS <INPUT type=radio id=af_12_CZXT name="tmcSbjjb.czxt"
													value="Linux"
													${tmcRwsqd.tmcSbjjb.czxt eq 'Linux'?'checked':''}
													datafld="CZXT"
													onclick="refRadioChange(this,'af_12_CZXT__SHOW__')" />Linux
												<INPUT type=radio id=af_12_CZXT name="tmcSbjjb.czxt"
													value="WebOS"
													${tmcRwsqd.tmcSbjjb.czxt eq 'WebOS'?'checked':''}
													datafld="CZXT"
													onclick="refRadioChange(this,'af_12_CZXT__SHOW__')" />WebOS
												<INPUT type=radio id=af_12_CZXT name="tmcSbjjb.czxt"
													value="OMS" ${tmcRwsqd.tmcSbjjb.czxt eq 'OMS'?'checked':''}
													datafld="CZXT"
													onclick="refRadioChange(this,'af_12_CZXT__SHOW__')" />OMS
												<INPUT type=radio id=af_12_CZXT name="tmcSbjjb.czxt"
													value="Uniplus"
													${tmcRwsqd.tmcSbjjb.czxt eq 'Uniplus'?'checked':''}
													datafld="CZXT"
													onclick="refRadioChange(this,'af_12_CZXT__SHOW__')" />Uniplus
												<INPUT type=radio id=af_12_CZXT name="tmcSbjjb.czxt"
													value="LeOS"
													${tmcRwsqd.tmcSbjjb.czxt eq 'LeOS'?'checked':''}
													datafld="CZXT"
													onclick="refRadioChange(this,'af_12_CZXT__SHOW__')" />LeOS
												<INPUT type=radio id=af_12_CZXT name="tmcSbjjb.czxt"
													value="AliOS"
													${tmcRwsqd.tmcSbjjb.czxt eq 'AliOS'?'checked':''}
													datafld="CZXT"
													onclick="refRadioChange(this,'af_12_CZXT__SHOW__')" />AliOS
												<INPUT type=radio id=af_12_CZXT name="tmcSbjjb.czxt"
													value="其他" ${tmcRwsqd.tmcSbjjb.czxt eq '其他'?'checked':''}
													datafld="CZXT"
													onclick="refRadioChange(this,'af_12_CZXT__SHOW__')" />其他：
												<INPUT class=buyBox1 type=text id=af_12_CZXTQT
													value="${tmcRwsqd.tmcSbjjb.czxtqt }" size=15
													name="tmcSbjjb.czxtqt" datafld="CZXTQT" maxlength=100
													onchange="_doChange('af_12','CZXTQT',this)"> <INPUT
													type=radio id=af_12_CZXT name="tmcSbjjb.czxt" value=""
													${tmcRwsqd.tmcSbjjb.czxt eq ''?'checked':''} datafld="CZXT"
													onclick="refRadioChange(this,'af_12_CZXT__SHOW__')" />无
											</div>
										</td>
									</tr>
									<tr>
										<td>版本号</td>
										<td colspan="6">
											<div id="tempp1">
												<INPUT class=buyBox1 type=text id=af_12_BBH
													value="${tmcRwsqd.tmcSbjjb.bbh }" size=45
													name="tmcSbjjb.bbh" datafld="BBH" maxlength=100
													onchange="_doChange('af_12','BBH',this)">
											</div>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">是否智能终端</td>
										<td colspan="6">
											<div id="temppp1">
												<INPUT type=radio id=af_12_SFZNZD name="tmcSbjjb.sfznzd"
													value="支持" ${tmcRwsqd.tmcSbjjb.sfznzd eq '支持'?'checked':''}
													datafld="SFZNZD"
													onclick="refRadioChange(this,'af_12_SFZNZD__SHOW__')" />是（需填写《智能终端软件配置信息表》）
												<INPUT type=radio id=af_12_SFZNZD name="tmcSbjjb.sfznzd"
													value="不支持"
													${tmcRwsqd.tmcSbjjb.sfznzd eq '不支持'?'checked':''}
													datafld="SFZNZD"
													onclick="refRadioChange(this,'af_12_SFZNZD__SHOW__')" />否
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="7"
											style="font-size: 16px; font-weight: bold; height: 45px;">&nbsp;&nbsp;基本业务和功能</td>
									</tr>
									<tr>
										<td style="text-align: center;">GPRS功能</td>
										<td colspan="6"><INPUT type=radio id=af_12_GPRSGN
											name="tmcSbjjb.gprsgn" value="支持"
											${tmcRwsqd.tmcSbjjb.gprsgn eq '支持'?'checked':''}
											datafld="GPRSGN"
											onclick="refRadioChange(this,'af_12_GPRSGN__SHOW__')"
											map="af_12_GPRSGNCLASS" /> 支持 <INPUT type=radio
											id=af_12_GPRSGN name="tmcSbjjb.gprsgn" value="不支持"
											${tmcRwsqd.tmcSbjjb.gprsgn eq '不支持'?'checked':''}
											datafld="GPRSGN"
											onclick="refRadioChange(this,'af_12_GPRSGN__SHOW__')"
											map="af_12_GPRSGNCLASS" /> 不支持 <!-- <INPUT type=radio id=af_12_GPRSGN  name=af_12_GPRSGN  value="GPRS功能CLASS"  datafld="SFZNZD" onclick="refRadioChange(this,'af_12_GPRSGN__SHOW__')" map="af_12_GPRSGNCLASS"/> -->
											<span>&nbsp;&nbsp;</span>CLASS:<INPUT class=buyBox1 type=text
											id=af_12_GPRSGNCLASS value="" size=25
											name="tmcSbjjb.gprsgnclass" datafld="GPRSGNCLASS"
											maxlength=100
											onchange="_doChange('af_12','GPRSGNCLASS',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;"><p>HSDPA功能</p></td>
										<td colspan="6">WCDMA: <INPUT type=radio
											id=af_12_HSDPAGNWCDMA name="tmcSbjjb.hsdpagnwcdma" value="支持"
											${tmcRwsqd.tmcSbjjb.hsdpagnwcdma eq '支持'?'checked':''}
											datafld="HSDPAGNWCDMA"
											onclick="refRadioChange(this,'af_12_HSDPAGNWCDMA__SHOW__')"
											map="af_12_HSDPAGNWCDMAJRLB" /> 支持 <INPUT type=radio
											id=af_12_HSDPAGNWCDMA name="tmcSbjjb.hsdpagnwcdma"
											value="不支持"
											${tmcRwsqd.tmcSbjjb.hsdpagnwcdma eq '不支持'?'checked':''}
											datafld="HSDPAGNWCDMA"
											onclick="refRadioChange(this,'af_12_HSDPAGNWCDMA__SHOW__')"
											map="af_12_HSDPAGNWCDMAJRLB" /> 不支持 <!-- <INPUT type=radio id=af_12_HSDPAGNWCDMA  name=af_12_HSDPAGNWCDMA  value="HSDPA接入类别"  datafld="HSDPAGNWCDMA" onclick="refRadioChange(this,'af_12_HSDPAGNWCDMA__SHOW__')"  map="af_12_HSDPAGNWCDMAJRLB"/> -->&nbsp;HSDPA接入类别：<INPUT
											class=buyBox1 type=text id=af_12_HSDPAGNWCDMAJRLB value=""
											size=25 name="tmcSbjjb.hsdpagnwcdmajrlb"
											datafld="HSDPAGNWCDMAJRLB" maxlength=100
											onchange="_doChange('af_12','HSDPAGNWCDMAJRLB',this)">
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">&nbsp;</td>
										<td colspan="6">TD-SCDMA: <INPUT type=radio
											id=af_12_HSDPAGNTDSCDMA name="tmcSbjjb.hsdpagntdscdma"
											value="支持"
											${tmcRwsqd.tmcSbjjb.hsdpagntdscdma eq '支持'?'checked':''}
											datafld="HSDPAGNTDSCDMA"
											onclick="refRadioChange(this,'af_12_HSDPAGNTDSCDMA__SHOW__')"
											map="af_12_HSDPAGNTDSCDMAJRLB" /> 支持 <INPUT type=radio
											id=af_12_HSDPAGNTDSCDMA name="tmcSbjjb.hsdpagntdscdma"
											value="不支持"
											${tmcRwsqd.tmcSbjjb.hsdpagntdscdma eq '不支持'?'checked':''}
											datafld="HSDPAGNTDSCDMA"
											onclick="refRadioChange(this,'af_12_HSDPAGNTDSCDMA__SHOW__')"
											map="af_12_HSDPAGNTDSCDMAJRLB" /> 不支持 <!-- <INPUT type=radio id=af_12_HSDPAGNTDSCDMA  name=af_12_HSDPAGNTDSCDMA  value="HSDPA接入类别"  datafld="HSDPAGNTDSCDMA" onclick="refRadioChange(this,'af_12_HSDPAGNTDSCDMA__SHOW__')"  map="af_12_HSDPAGNTDSCDMAJRLB"/> -->
											&nbsp;HSDPA接入类别：<INPUT class=buyBox1 type=text
											id=af_12_HSDPAGNTDSCDMAJRLB value="" size=25
											name="tmcSbjjb.hsdpagntdscdmajrlb"
											datafld="HSDPAGNTDSCDMAJRLB" maxlength=100
											onchange="_doChange('af_12','HSDPAGNTDSCDMAJRLB',this)">
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">HSUPA功能</td>
										<td colspan="6">WCDMA: <INPUT type=radio
											id=af_12_HSUPAGNWCDMA name="tmcSbjjb.hsupagnwcdma" value="支持"
											${tmcRwsqd.tmcSbjjb.hsupagnwcdma eq '支持'?'checked':''}
											datafld="HSUPAGNWCDMA"
											onclick="refRadioChange(this,'af_12_HSUPAGNWCDMA__SHOW__')"
											map="af_12_HSUPAGNWCDMAJRLB" /> 支持 <INPUT type=radio
											id=af_12_HSUPAGNWCDMA name="tmcSbjjb.hsupagnwcdma"
											value="不支持"
											${tmcRwsqd.tmcSbjjb.hsupagnwcdma eq '不支持'?'checked':''}
											datafld="HSUPAGNWCDMA"
											onclick="refRadioChange(this,'af_12_HSUPAGNWCDMA__SHOW__')"
											map="af_12_HSUPAGNWCDMAJRLB" /> 不支持 <!-- <INPUT type=radio id=af_12_HSUPAGNWCDMA  name=af_12_HSUPAGNWCDMA  value="HSUPA接入类别"  datafld="HSUPAGNWCDMA" onclick="refRadioChange(this,'af_12_HSUPAGNWCDMA__SHOW__')"  map="af_12_HSUPAGNWCDMAJRLB"/> -->
											&nbsp;HSUPA接入类别：<INPUT class=buyBox1 type=text
											id=af_12_HSUPAGNWCDMAJRLB value="" size=25
											name="tmcSbjjb.hsupagnwcdmajrlb" datafld="HSUPAGNWCDMAJRLB"
											maxlength=100
											onchange="_doChange('af_12','HSUPAGNWCDMAJRLB',this)">
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">&nbsp;</td>
										<td colspan="6">TD-SCDMA: <INPUT type=radio
											id=af_12_HSUPAGNTDSCDMA name="tmcSbjjb.hsupagntdscdma"
											value="支持"
											${tmcRwsqd.tmcSbjjb.hsupagntdscdma eq '支持'?'checked':''}
											datafld="HSUPAGNTDSCDMA"
											onclick="refRadioChange(this,'af_12_HSUPAGNTDSCDMA__SHOW__')" />
											支持 <INPUT type=radio id=af_12_HSUPAGNTDSCDMA
											name="tmcSbjjb.hsupagntdscdma" value="不支持"
											${tmcRwsqd.tmcSbjjb.hsupagntdscdma eq '不支持'?'checked':''}
											datafld="HSUPAGNTDSCDMA"
											onclick="refRadioChange(this,'af_12_HSUPAGNTDSCDMA__SHOW__')" />
											不支持 HSUPA接入类别：<INPUT class=buyBox1 type=text
											id=af_12_HSUPAGNTDSCDMAJRLB
											value="${tmcRwsqd.tmcSbjjb.hsupagntdscdmajrlb }" size=25
											name="tmcSbjjb.hsupagntdscdmajrlb"
											datafld="HSUPAGNTDSCDMAJRLB" maxlength=100
											onchange="_doChange('af_12','HSUPAGNTDSCDMAJRLB',this)">
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">LTE传输能力</td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='LTECSNL'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_LTECSNL name="tmcSbjjb.ltecsnl" value="Cat1"
														${fn:contains(tmcRwsqd.tmcSbjjb.ltecsnl, 'Cat1')?'checked':''}
														datafld="cCat1"
														onclick="refCheckChange(this,'af_12_LTECSNL__SHOW__')" />
														Cat1 <INPUT type=checkbox id=af_12_LTECSNL
														name="tmcSbjjb.ltecsnl" value="Cat3"
														${fn:contains(tmcRwsqd.tmcSbjjb.ltecsnl, 'Cat3')?'checked':''}
														datafld="cCat3"
														onclick="refCheckChange(this,'af_12_LTECSNL__SHOW__')" />
														Cat3 <INPUT type=checkbox id=af_12_LTECSNL
														name="tmcSbjjb.ltecsnl" value="Cat4"
														${fn:contains(tmcRwsqd.tmcSbjjb.ltecsnl, 'Cat4')?'checked':''}
														datafld="cCat4"
														onclick="refCheckChange(this,'af_12_LTECSNL__SHOW__')" />
														Cat4 <INPUT type=checkbox id=af_12_LTECSNL
														name="tmcSbjjb.ltecsnl" value="Cat5"
														${fn:contains(tmcRwsqd.tmcSbjjb.ltecsnl, 'Cat5')?'checked':''}
														datafld="cCat5"
														onclick="refCheckChange(this,'af_12_LTECSNL__SHOW__')" />
														Cat5 <INPUT type=checkbox id=af_12_LTECSNL
														name="tmcSbjjb.ltecsnl" value="Cat6"
														${fn:contains(tmcRwsqd.tmcSbjjb.ltecsnl, 'Cat6')?'checked':''}
														datafld="cCat6"
														onclick="refCheckChange(this,'af_12_LTECSNL__SHOW__')" />
														Cat6 <INPUT type=checkbox id=af_12_LTECSNL
														name="tmcSbjjb.ltecsnl" value="Cat7"
														${fn:contains(tmcRwsqd.tmcSbjjb.ltecsnl, 'Cat7')?'checked':''}
														datafld="cCat7"
														onclick="refCheckChange(this,'af_12_LTECSNL__SHOW__')" />
														Cat7 <INPUT type=checkbox id=af_12_LTECSNL
														name="tmcSbjjb.ltecsnl" value="Cat8"
														${fn:contains(tmcRwsqd.tmcSbjjb.ltecsnl, 'Cat8')?'checked':''}
														datafld="cCat8"
														onclick="refCheckChange(this,'af_12_LTECSNL__SHOW__')" />
														Cat8 <INPUT type=checkbox id=af_12_LTECSNL
														name="tmcSbjjb.ltecsnl" value="Cat9"
														${fn:contains(tmcRwsqd.tmcSbjjb.ltecsnl, 'Cat9')?'checked':''}
														datafld="cCat9"
														onclick="refCheckChange(this,'af_12_LTECSNL__SHOW__')" />
														Cat9 <INPUT type=checkbox id=af_12_LTECSNL
														name="tmcSbjjb.ltecsnl" value="Cat010"
														${fn:contains(tmcRwsqd.tmcSbjjb.ltecsnl, 'Cat010')?'checked':''}
														datafld="cCat010"
														onclick="refCheckChange(this,'af_12_LTECSNL__SHOW__')" />
														Cat10 <INPUT type=checkbox id=af_12_LTECSNL
														name="tmcSbjjb.ltecsnl" value="Cat011"
														${fn:contains(tmcRwsqd.tmcSbjjb.ltecsnl, 'Cat011')?'checked':''}
														datafld="cCat011"
														onclick="refCheckChange(this,'af_12_LTECSNL__SHOW__')" />
														Cat11 <INPUT type=checkbox id=af_12_LTECSNL
														name="tmcSbjjb.ltecsnl" value="Cat012"
														${fn:contains(tmcRwsqd.tmcSbjjb.ltecsnl, 'Cat012')?'checked':''}
														datafld="cCat012"
														onclick="refCheckChange(this,'af_12_LTECSNL__SHOW__')" />
														Cat12</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">多天线传输模式</td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='SFZCTM5'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_SFZCTM5 name="tmcSbjjb.sfzctm5" value="05"
														${fn:contains(tmcRwsqd.tmcSbjjb.sfzctm5, '05')?'checked':''}
														datafld="c05"
														onclick="refCheckChange(this,'af_12_SFZCTM5__SHOW__')" />
														是否支持TM5 <INPUT type=checkbox id=af_12_SFZCTM5
														name="tmcSbjjb.sfzctm5" value="08"
														${fn:contains(tmcRwsqd.tmcSbjjb.sfzctm5, '08')?'checked':''}
														datafld="c08"
														onclick="refCheckChange(this,'af_12_SFZCTM5__SHOW__')" />
														是否支持TM8（双流beanforming）</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">LTE终端语音模式</td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='LTEZDYYMS'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_LTEZDYYMS name="tmcSbjjb.ltezdyyms"
														value=是否支持语音回落到TD-SCDMA
														${fn:contains(tmcRwsqd.tmcSbjjb.ltezdyyms, '是否支持语音回落到TD-SCDMA')?'checked':''}
														datafld='c是否支持语音回落到TD-SCDMA'
														onclick="refCheckChange(this,'af_12_LTEZDYYMS__SHOW__')">是否支持语音回落到TD-SCDMA
														<INPUT type=checkbox id=af_12_LTEZDYYMS
														name="tmcSbjjb.ltezdyyms" value=是否支持语音回落到GSM
														${fn:contains(tmcRwsqd.tmcSbjjb.ltezdyyms, '是否支持语音回落到GSM')?'checked':''}
														datafld='c是否支持语音回落到GSM'
														onclick="refCheckChange(this,'af_12_LTEZDYYMS__SHOW__')">是否支持语音回落到GSM
														<INPUT type=checkbox id=af_12_LTEZDYYMS
														name="tmcSbjjb.ltezdyyms" value=是否支持VoLTE
														${fn:contains(tmcRwsqd.tmcSbjjb.ltezdyyms, '是否支持VoLTE')?'checked':''}
														datafld='c是否支持VoLTE'
														onclick="refCheckChange(this,'af_12_LTEZDYYMS__SHOW__')">是否支持VoLTE
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">CDMA1X是否支持补充信道</td>
										<td colspan="3"><INPUT type=radio id=af_12_CDMA1XSFZCBCXD
											name="tmcSbjjb.cdma1xsfzcbcxd" value="是"
											${tmcRwsqd.tmcSbjjb.cdma1xsfzcbcxd eq '是'?'checked':''}
											datafld="CDMA1XSFZCBCXD"
											onclick="refRadioChange(this,'af_12_CDMA1XSFZCBCXD__SHOW__')" />
											是 <INPUT type=radio id=af_12_CDMA1XSFZCBCXD
											name="tmcSbjjb.cdma1xsfzcbcxd" value="否"
											${tmcRwsqd.tmcSbjjb.cdma1xsfzcbcxd eq '否'?'checked':''}
											datafld="CDMA1XSFZCBCXD"
											onclick="refRadioChange(this,'af_12_CDMA1XSFZCBCXD__SHOW__')" />
											否</td>
										<td style="text-align: center;">CDMA数据编码方式</td>
										<td colspan="3">
											<table class=buyTitle datasrc='#ds12' datafld='CDMASJBMFS'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_CDMASJBMFS name="tmcSbjjb.cdmasjbmfs" value="卷积码"
														${fn:contains(tmcRwsqd.tmcSbjjb.cdmasjbmfs, '卷积码')?'checked':''}
														datafld="c卷积码"
														onclick="refCheckChange(this,'af_12_CDMASJBMFS__SHOW__')" />
														卷积码 <INPUT type=checkbox id=af_12_CDMASJBMFS
														name="tmcSbjjb.cdmasjbmfs" value="Turbo码"
														${fn:contains(tmcRwsqd.tmcSbjjb.cdmasjbmfs, 'Turbo码')?'checked':''}
														datafld="cTurbo码"
														onclick="refCheckChange(this,'af_12_CDMASJBMFS__SHOW__')" />
														Turbo码</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;"><p>短信</p></td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='DX'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_DX name="tmcSbjjb.dx" value="普通文字短信"
														${fn:contains(tmcRwsqd.tmcSbjjb.dx, '普通文字短信')?'checked':''}
														datafld="c普通文字短信"
														onclick="refCheckChange(this,'af_12_DX__SHOW__')" />普通文字短信
														<INPUT type=checkbox id=af_12_DX name="tmcSbjjb.dx"
														value="MMS多媒体短信"
														${fn:contains(tmcRwsqd.tmcSbjjb.dx, 'MMS多媒体短信')?'checked':''}
														datafld="cMMS多媒体短信"
														onclick="refCheckChange(this,'af_12_DX__SHOW__')" />MMS多媒体短信
														<INPUT type=checkbox id=af_12_DX name="tmcSbjjb.dx"
														value="其他"
														${fn:contains(tmcRwsqd.tmcSbjjb.dx, '其他')?'checked':''}
														datafld="c其他"
														onclick="refCheckChange(this,'af_12_DX__SHOW__')" />其他 <INPUT
														class=buyBox1 type=text id=af_12_DXQT
														value="${tmcRwsqd.tmcSbjjb.dxqt }" size=15
														name="tmcSbjjb.dxqt" datafld="DXQT" maxlength=100
														onchange="_doChange('af_12','DXQT',this)"></td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;"><p>支持的补充的业务</p></td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='ZCDBCYW'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_ZCDBCYW name="tmcSbjjb.zcdbcyw" value="号码识别"
														${fn:contains(tmcRwsqd.tmcSbjjb.zcdbcyw, '号码识别')?'checked':''}
														datafld="c号码识别"
														onclick="refCheckChange(this,'af_12_ZCDBCYW__SHOW__')" />号码识别
														<INPUT type=checkbox id=af_12_ZCDBCYW
														name="tmcSbjjb.zcdbcyw" value="呼叫转移"
														${fn:contains(tmcRwsqd.tmcSbjjb.zcdbcyw, '呼叫转移')?'checked':''}
														datafld="c呼叫转移"
														onclick="refCheckChange(this,'af_12_ZCDBCYW__SHOW__')" />呼叫转移
														<INPUT type=checkbox id=af_12_ZCDBCYW
														name="tmcSbjjb.zcdbcyw" value="呼叫等待"
														${fn:contains(tmcRwsqd.tmcSbjjb.zcdbcyw, '呼叫等待')?'checked':''}
														datafld="c呼叫等待"
														onclick="refCheckChange(this,'af_12_ZCDBCYW__SHOW__')" />呼叫等待
														<INPUT type=checkbox id=af_12_ZCDBCYW
														name="tmcSbjjb.zcdbcyw" value="呼叫保持"
														${fn:contains(tmcRwsqd.tmcSbjjb.zcdbcyw, '呼叫保持')?'checked':''}
														datafld="c呼叫保持"
														onclick="refCheckChange(this,'af_12_ZCDBCYW__SHOW__')" />呼叫保持
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;"><p>支持的增值业务</p></td>
										<td colspan="6">
											<TABLE border=0>
												<TR>
													<TD style='border: none'>WCDMA及TD-SCDMA手机:<INPUT
														class=buyBox1 type=text id=af_12_ZCDZZYWWCDMASJ
														value="${tmcRwsqd.tmcSbjjb.zcdzzywwcdmasj }" size=25
														name="tmcSbjjb.zcdzzywwcdmasj" datafld="ZCDZZYWWCDMASJ"
														maxlength=100
														onchange="_doChange('af_12','ZCDZZYWWCDMASJ',this)">
													</TD>
													<TD style='border: none'>
														<table class=buyTitle datasrc='#ds12'
															datafld='ZCDZZYWWCDMAKSDH'>
															<tr>
																<td style='border: none'><INPUT type=checkbox
																	id=af_12_ZCDZZYWWCDMAKSDH
																	name="tmcSbjjb.zcdzzywwcdmaksdh" value=可视电话
																	${fn:contains(tmcRwsqd.tmcSbjjb.zcdzzywwcdmaksdh, '可视电话')?'checked':''}
																	datafld='c可视电话'
																	onclick="refCheckChange(this,'af_12_ZCDZZYWWCDMAKSDH__SHOW__')">可视电话
																</td>
															</tr>
														</table>
													</TD>
												</TR>
											</TABLE>
											<TABLE border=0>
												<TR>
													<TD width='80' style='border: none'>TD-SCDMA:</TD>
													<TD style='border: none'>
														<table class=buyTitle datasrc='#ds12'
															datafld='ZCDZZYWTDSCDMA'>
															<tr>
																<td style='border: none'><INPUT type=checkbox
																	id=af_12_ZCDZZYWTDSCDMA name="tmcSbjjb.zcdzzywtdscdma"
																	value=WAP
																	${fn:contains(tmcRwsqd.tmcSbjjb.zcdzzywtdscdma, 'WAP')?'checked':''}
																	datafld='cWAP'
																	onclick="refCheckChange(this,'af_12_ZCDZZYWTDSCDMA__SHOW__')">WAP
																	<INPUT type=checkbox id=af_12_ZCDZZYWTDSCDMA
																	name="tmcSbjjb.zcdzzywtdscdma" value=流媒体
																	${fn:contains(tmcRwsqd.tmcSbjjb.zcdzzywtdscdma, '流媒体')?'checked':''}
																	datafld='c流媒体'
																	onclick="refCheckChange(this,'af_12_ZCDZZYWTDSCDMA__SHOW__')">流媒体
																</td>
															</tr>
														</table>
													</TD>
												</TR>
											</TABLE>
										</td>
									</tr>


									<tr style='display: none'>
										<td style="text-align: center;"><p>支持的增值业务</p></td>
										<td colspan="3">WCDMA及TD-SCDMA手机: <INPUT class=buyBox1
											type=checkbox id=af_12_ZCDZZYW1 value="可视电话"
											${fn:contains(tmcRwsqd.tmcSbjjb.zcdzzyw1, '可视电话')?'checked':''}
											size=25 name="tmcSbjjb.zcdzzyw1" datafld="ZCDZZYW1"
											maxlength=100 onchange="_doChange('af_12','ZCDZZYW1',this)">可视电话
										</td>
										<td colspan="3">
											<table class=buyTitle datasrc='#ds12' datafld='ZCDZZYW2'>
												<tr>
													<td style="border: none;">TD-SCDMA: <INPUT
														type=checkbox id=af_12_ZCDZZYW2 name="tmcSbjjb.zcdzzyw2"
														value="TDSCDMAWAP"
														${fn:contains(tmcRwsqd.tmcSbjjb.zcdzzyw2, 'TDSCDMAWAP')?'checked':''}
														datafld="cTDSCDMAWAP"
														onclick="refCheckChange(this,'af_12_ZCDZZYW2__SHOW__')" />WAP
														<INPUT type=checkbox id=af_12_ZCDZZYW2
														name="tmcSbjjb.zcdzzyw2" value="TDSCDMA流媒体"
														${fn:contains(tmcRwsqd.tmcSbjjb.zcdzzyw2, 'TDSCDMA流媒体')?'checked':''}
														datafld="cTDSCDMA流媒体"
														onclick="refCheckChange(this,'af_12_ZCDZZYW2__SHOW__')" />流媒体
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;"><p>紧急呼叫</p></td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='JJHJ'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_JJHJ name="tmcSbjjb.jjhj" value="支持"
														${fn:contains(tmcRwsqd.tmcSbjjb.jjhj, '支持')?'checked':''}
														datafld="c支持"
														onclick="refCheckChange(this,'af_12_JJHJ__SHOW__')"
														map="af_12_JJHJQT" />支持 <INPUT type=checkbox id=af_12_JJHJ
														name="tmcSbjjb.jjhj" value="110"
														${fn:contains(tmcRwsqd.tmcSbjjb.jjhj, '110')?'checked':''}
														datafld="c110"
														onclick="refCheckChange(this,'af_12_JJHJ__SHOW__')"
														map="af_12_JJHJQT" />110 <INPUT type=checkbox
														id=af_12_JJHJ name="tmcSbjjb.jjhj" value="119"
														${fn:contains(tmcRwsqd.tmcSbjjb.jjhj, '119')?'checked':''}
														datafld="c119"
														onclick="refCheckChange(this,'af_12_JJHJ__SHOW__')"
														map="af_12_JJHJQT" />119 <INPUT type=checkbox
														id=af_12_JJHJ name="tmcSbjjb.jjhj" value="112"
														${fn:contains(tmcRwsqd.tmcSbjjb.jjhj, '112')?'checked':''}
														datafld="c112"
														onclick="refCheckChange(this,'af_12_JJHJ__SHOW__')"
														map="af_12_JJHJQT" />112 <INPUT type=checkbox
														id=af_12_JJHJ name="tmcSbjjb.jjhj" value="120"
														${fn:contains(tmcRwsqd.tmcSbjjb.jjhj, '120')?'checked':''}
														datafld="c120"
														onclick="refCheckChange(this,'af_12_JJHJ__SHOW__')"
														map="af_12_JJHJQT" />120 <INPUT type=checkbox
														id=af_12_JJHJ name="tmcSbjjb.jjhj" value="其他"
														${fn:contains(tmcRwsqd.tmcSbjjb.jjhj, '支持')?'checked':''}
														datafld="c其他"
														onclick="refCheckChange(this,'af_12_JJHJ__SHOW__')"
														map="af_12_JJHJQT" />其他： <INPUT class=buyBox1 type=text
														id=af_12_JJHJQT value="${tmcRwsqd.tmcSbjjb.jjhjqt }"
														size=15 name="tmcSbjjb.jjhjqt" datafld="JJHJQT"
														maxlength=100 onchange="_doChange('af_12','JJHJQT',this)">
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;"><p>IP协议</p></td>
										<td colspan="6"><INPUT type=radio id=af_12_IPXY
											name="tmcSbjjb.ipxy" value='IPv4/IPv6'
											${fn:contains(tmcRwsqd.tmcSbjjb.ipxy, 'IPv4/IPv6')?'checked':''}
											datafld="IPXY"
											onclick="refRadioChange(this,'af_12_IPXY__SHOW__')" />IPv4/IPv6
											<INPUT type=radio id=af_12_IPXY name="tmcSbjjb.ipxy"
											value='IPv6'
											${fn:contains(tmcRwsqd.tmcSbjjb.ipxy, 'IPv6')?'checked':''}
											datafld="IPXY"
											onclick="refRadioChange(this,'af_12_IPXY__SHOW__')" />IPv6 <INPUT
											type=radio id=af_12_IPXY name="tmcSbjjb.ipxy" value='IPv4'
											${fn:contains(tmcRwsqd.tmcSbjjb.ipxy, 'IPv4')?'checked':''}
											datafld="IPXY"
											onclick="refRadioChange(this,'af_12_IPXY__SHOW__')" />IPv4 <INPUT
											type=radio id=af_12_IPXY name="tmcSbjjb.ipxy" value='不支持'
											${fn:contains(tmcRwsqd.tmcSbjjb.ipxy, '不支持')?'checked':''}
											datafld="IPXY"
											onclick="refRadioChange(this,'af_12_IPXY__SHOW__')" />不支持</td>
									</tr>
									<tr>
										<td colspan="7"
											style="font-size: 16px; font-weight: bold; height: 35px;"><p>&nbsp;&nbsp;扩展功能</p></td>
									</tr>
									<tr>
										<td style="text-align: center;"><p>CMMB广播式手机电视</p></td>
										<td colspan="6"><INPUT type=radio id=af_12_CMMBGBSSJDS
											name="tmcSbjjb.cmmbgbssjds" value="支持"
											${tmcRwsqd.tmcSbjjb.cmmbgbssjds eq '支持'?'checked':'' }
											datafld="CMMBGBSSJDS"
											onclick="refRadioChange(this,'af_12_CMMBGBSSJDS__SHOW__')" />支持
											<INPUT type=radio id=af_12_CMMBGBSSJDS
											name="tmcSbjjb.cmmbgbssjds" value="不支持"
											${tmcRwsqd.tmcSbjjb.cmmbgbssjds eq '不支持'?'checked':'' }
											datafld="CMMBGBSSJDS"
											onclick="refRadioChange(this,'af_12_CMMBGBSSJDS__SHOW__')" />不支持
										</td>
									</tr>
									<!-- 本地连接方式，照相/摄像功能 -->
									<tr>
										<td style="text-align: center;">本地连接方式</td>
										<td colspan="6">
											<table class=buyTitle datasrc='#ds12' datafld='BDLJFS'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_BDLJFS name="tmcSbjjb.bdljfs" value="红外"
														${fn:contains(tmcRwsqd.tmcSbjjb.bdljfs, '红外')?'checked':''}
														datafld="c红外"
														onclick="refCheckChange(this,'af_12_BDLJFS_SHOW__')" />红外
														<INPUT type=checkbox id=af_12_BDLJFS
														name="tmcSbjjb.bdljfs" value="蓝牙"
														${fn:contains(tmcRwsqd.tmcSbjjb.bdljfs, '蓝牙')?'checked':''}
														datafld="c蓝牙"
														onclick="refCheckChange(this,'af_12_BDLJFS_SHOW__')" />蓝牙
														<INPUT type=checkbox id=af_12_BDLJFS
														name="tmcSbjjb.bdljfs" value="USB"
														${fn:contains(tmcRwsqd.tmcSbjjb.bdljfs, 'USB')?'checked':''}
														datafld="cUSB"
														onclick="refCheckChange(this,'af_12_BDLJFS_SHOW__')" />USB
														<INPUT type=checkbox id=af_12_BDLJFS
														name="tmcSbjjb.bdljfs" value="RS232"
														${fn:contains(tmcRwsqd.tmcSbjjb.bdljfs, 'RS232')?'checked':''}
														datafld="cRS232"
														onclick="refCheckChange(this,'af_12_BDLJFS_SHOW__')" />RS232
														<INPUT type=checkbox id=af_12_BDLJFS
														name="tmcSbjjb.bdljfs" value="PCMCIA"
														${fn:contains(tmcRwsqd.tmcSbjjb.bdljfs, 'PCMCIA')?'checked':''}
														datafld="cPCMCIA"
														onclick="refCheckChange(this,'af_12_BDLJFS_SHOW__')" />PCMCIA
														<INPUT type=checkbox id=af_12_BDLJFS
														name="tmcSbjjb.bdljfs" value="其他"
														${fn:contains(tmcRwsqd.tmcSbjjb.bdljfs, '其他')?'checked':''}
														datafld="c其他"
														onclick="refCheckChange(this,'af_12_BDLJFS_SHOW__')" />其他


														:<INPUT class=buyBox1 type=text id=af_12_BDLJFSQT value=""
														size=15 name="tmcSbjjb.bdljfsqt" datafld="BDLJFSQT"
														maxlength=100
														onchange="_doChange('af_12','BDLJFSQT',this)"></td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">照相/摄像功能</td>
										<td colspan="6"><INPUT type=radio id=af_12_ZXSXGN
											name="tmcSbjjb.zxsxgn" value="支持"
											${tmcRwsqd.tmcSbjjb.zxsxgn eq '支持'?'checked':'' }
											datafld="ZXSXGN"
											onclick="refRadioChange(this,'af_12_DTXCSMS__SHOW__')" />支持
											<INPUT type=radio id=af_12_ZXSXGN name="tmcSbjjb.zxsxgn"
											value="不支持"
											${tmcRwsqd.tmcSbjjb.zxsxgn eq '不支持'?'checked':'' }
											datafld="ZXSXGN"
											onclick="refRadioChange(this,'af_12_ZXSXGN__SHOW__')" />不支持
											摄像头数量：<input type=text class=buyBox1 id='af_12_ZXSXGNSL'
											name="tmcSbjjb.zxsxgnsl"
											value="${tmcRwsqd.tmcSbjjb.zxsxgnsl }" datafld='ZXSXGNSL' />
										</td>
									</tr>


									<tr>
										<td style="text-align: center;"><p>EDGE</p></td>
										<td colspan="6"><INPUT type=radio id=af_12_EDGE
											name="tmcSbjjb.edge" value="支持"
											${tmcRwsqd.tmcSbjjb.edge eq '支持'?'checked':'' }
											datafld="EDGE"
											onclick="refRadioChange(this,'af_12_EDGE__SHOW__')"
											map="af_12_EDGECLASS" />支持 <INPUT type=radio id=af_12_EDGE
											name="tmcSbjjb.edge" value="不支持"
											${tmcRwsqd.tmcSbjjb.edge eq '不支持'?'checked':'' }
											datafld="EDGE"
											onclick="refRadioChange(this,'af_12_EDGE__SHOW__')"
											map="af_12_EDGECLASS" />不支持 <!-- <INPUT type=radio id=af_12_EDGE  name=af_12_EDGE  value="EDGECLASS"  datafld="EDGE" onclick="refRadioChange(this,'af_12_EDGE__SHOW__')" map="af_12_EDGECLASS"/> -->
											<span>&nbsp;&nbsp;</span>CLASS：<INPUT class=buyBox1 type=text
											id=af_12_EDGECLASS value="" size=25 name="tmcSbjjb.edgeclass"
											datafld="EDGECLASS" maxlength=100
											onchange="_doChange('af_12','EDGECLASS',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;">
											<table class=buyTitle datasrc='#ds12' datafld='KZGN'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_KZGN name="tmcSbjjb.kzgn" value=GPS
														${fn:contains(tmcRwsqd.tmcSbjjb.kzgn, 'GPS')?'checked':''}
														gps="11" datafld='cGPS'
														onclick="refCheckChange(this,'af_12_KZGN__SHOW__')">GPS
													</td>
												</tr>
											</table>
										</td>
										<td style="text-align: center;">
											<table class=buyTitle datasrc='#ds12' datafld='KZGN'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_KZGN name="tmcSbjjb.kzgn" value=北斗卫星导航（CNSS）
														${fn:contains(tmcRwsqd.tmcSbjjb.kzgn, '北斗卫星导航（CNSS）')?'checked':''}
														datafld='c北斗卫星导航CNSS'
														onclick="refCheckChange(this,'af_12_KZGN__SHOW__')">北斗卫星导航（CNSS）
													</td>
												</tr>
											</table>
										</td>
										<td style="text-align: center;">
											<table class=buyTitle datasrc='#ds12' datafld='KZGN'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_KZGN name="tmcSbjjb.kzgn" value=AGPS
														datafld='cAGPS'
														${fn:contains(tmcRwsqd.tmcSbjjb.kzgn, 'AGPS')?'checked':''}
														onclick="refCheckChange(this,'af_12_KZGN__SHOW__')">AGPS
													</td>
												</tr>
											</table>
										</td>
										<td style="text-align: center;">
											<table class=buyTitle datasrc='#ds12' datafld='KZGN'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_KZGN name="tmcSbjjb.kzgn" value=WLAN
														${fn:contains(tmcRwsqd.tmcSbjjb.kzgn, 'WLAN')?'checked':''}
														datafld='cWLAN'
														onclick="refCheckChange(this,'af_12_KZGN__SHOW__')">WLAN
													</td>
												</tr>
											</table>
										</td>
										<td style="text-align: center;">
											<table class=buyTitle datasrc='#ds12' datafld='KZGN'>
												<tr>
													<td style="border: none;"><INPUT type=checkbox
														id=af_12_KZGN name="tmcSbjjb.kzgn" value=NFC
														${fn:contains(tmcRwsqd.tmcSbjjb.kzgn, 'NFC')?'checked':''}
														datafld='cNFC'
														onclick="refCheckChange(this,'af_12_KZGN__SHOW__')">NFC
													</td>
												</tr>
											</table>
										</td>
										<td colspan="2" style="text-align: center;">&nbsp; <%--<table class=buyTitle datasrc='#ds12' datafld='KZGN'><tr><td style="border:none;">--%>
											<%--<INPUT type=checkbox id=af_12_KZGN name=af_12_KZGN value=蓝牙 datafld='c蓝牙' onclick="refCheckChange(this,'af_12_KZGN__SHOW__')" >蓝牙--%>
											<%--</td></tr></table>--%>
										</td>
									</tr>
									<tr>
										<td colspan="7" style="font-size: 16px; font-weight: bold;"><p>&nbsp;&nbsp;配件</p></td>
									</tr>
									<tr>
										<td style="text-align: center;"><p>电池类型</p></td>
										<td colspan="2"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_DCLX value="${tmcRwsqd.tmcSbjjb.dclx }"
											size=40 name="tmcSbjjb.dclx" datafld="DCLX" maxlength=100
											onchange="_doChange('af_12','DCLX',this)"></td>
										<td style="text-align: center;">电池型号</td>
										<td colspan="3"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_DCXH value="${tmcRwsqd.tmcSbjjb.dcxh }"
											size=37 name="tmcSbjjb.dcxh" datafld="DCXH" maxlength=100
											onchange="_doChange('af_12','DCXH',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;"><p>电池额定容量</p></td>
										<td colspan="2"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_DCEDRL
											value="${tmcRwsqd.tmcSbjjb.dcedrl }" size=40
											name="tmcSbjjb.dcedrl" datafld="DCEDRL" maxlength=100
											onchange="_doChange('af_12','DCEDRL',this)"></td>
										<td style="text-align: center;">电池标称电压</td>
										<td colspan="3"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_DCBCDY
											value="${tmcRwsqd.tmcSbjjb.dcbcdy }" size=37
											name="tmcSbjjb.dcbcdy" datafld="DCBCDY" maxlength=100
											onchange="_doChange('af_12','DCBCDY',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;"><p>电池生产厂家</p></td>
										<td colspan="6"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_DCSCCJ
											value="${tmcRwsqd.tmcSbjjb.dcsccj }" size=122
											name="tmcSbjjb.dcsccj" datafld="DCSCCJ" maxlength=100
											onchange="_doChange('af_12','DCSCCJ',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;"><p>电池制造商</p></td>
										<td colspan="6"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_DCZZS value="${tmcRwsqd.tmcSbjjb.dczzs }"
											size=122 name="tmcSbjjb.dczzs" datafld="DCZZS" maxlength=100
											onchange="_doChange('af_12','DCZZS',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;"><p>其他配件</p></td>
										<td colspan="6"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_QTPJ value="${tmcRwsqd.tmcSbjjb.qtpj }"
											size=122 name="tmcSbjjb.qtpj" datafld="QTPJ" maxlength=100
											onchange="_doChange('af_12','QTPJ',this)"></td>
									</tr>
									<tr>
										<td rowspan="4" style="text-align: center;"><p>电源适配器/充电器</p>
										</td>
										<td style="text-align: center;">适配器是否标配</td>
										<td><INPUT type=radio id=af_12_DYSPQCDQSFBP
											name="tmcSbjjb.dyspqcdqsfbp" value="是"
											${tmcRwsqd.tmcSbjjb.dyspqcdqsfbp eq '是'?'checked':'' }
											datafld="DYSPQCDQSFBP"
											onclick="refRadioChange(this,'af_12_DYSPQCDQSFBP__SHOW__')" />是<INPUT
											type=radio id=af_12_DYSPQCDQSFBP name="tmcSbjjb.dyspqcdqsfbp"
											value="否" datafld="DYSPQCDQSFBP"
											onclick="refRadioChange(this,'af_12_DYSPQCDQSFBP__SHOW__')" />否<input
											type=button class="btn3_mouseover" name=sb1 value="清除"
											onclick="_myclear()" /></td>
										<td>&nbsp;&nbsp;型号&nbsp;&nbsp;<INPUT class=buyBox1
											type=text id=af_12_DYSPQCDQXH
											value="${tmcRwsqd.tmcSbjjb.dyspqcdqxh }" size=15
											name="tmcSbjjb.dyspqcdqxh" datafld="DYSPQCDQXH" maxlength=100
											onchange="_doChange('af_12','DYSPQCDQXH',this)"></td>
										<td style="text-align: center;">产地</td>
										<td><INPUT style="width: 90%;" class=buyBox1 type=text
											id=af_12_DYSPQCDQCD value="${tmcRwsqd.tmcSbjjb.dyspqcdqcd }"
											size=18 name="tmcSbjjb.dyspqcdqcd" datafld="DYSPQCDQCD"
											maxlength=100 onchange="_doChange('af_12','DYSPQCDQCD',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;">生产厂</td>
										<td colspan="5"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_DYSPQCDQSCC
											value="${tmcRwsqd.tmcSbjjb.dyspqcdqscc }" size=90
											name="tmcSbjjb.dyspqcdqscc" datafld="DYSPQCDQSCC"
											maxlength=100
											onchange="_doChange('af_12','DYSPQCDQSCC',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;">制造商</td>
										<td colspan="5"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_DYSPQCDQZZS
											value="${tmcRwsqd.tmcSbjjb.dyspqcdqzzs }" size=90
											name="tmcSbjjb.dyspqcdqzzs" datafld="DYSPQCDQZZS"
											maxlength=100
											onchange="_doChange('af_12','DYSPQCDQZZS',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;">CCC证书号</td>
										<td colspan="5"><INPUT style="width: 90%;" class=buyBox1
											type=text id=af_12_DYSPQCDQCCCZSH
											value="${tmcRwsqd.tmcSbjjb.dyspqcdqccczsh }" size=90
											name="tmcSbjjb.dyspqcdqccczsh" datafld="DYSPQCDQCCCZSH"
											maxlength=100
											onchange="_doChange('af_12','DYSPQCDQCCCZSH',this)"></td>
									</tr>
									<tr>
										<td style="text-align: center;"><p>备注</p></td>
										<td colspan="6" style="padding: 6px 0px"><textarea
												style="width: 90%;" id=af_12_BZ rows="3" cols="89"
												name="tmcSbjjb.bz" datafld="BZ"
												onchange="_doChange('af_12','BZ',this)">${tmcRwsqd.tmcSbjjb.bz }
								</textarea></td>
									</tr>
									<tr>
										<td colspan="7" style="border: none;"><br /> <!-- <span style="float:right;"><input type="button" class='btn3_mouseover' id="scc" value=" 上传附件 " onclick="_shangchuan()" /></span> -->
										</td>
									</tr>
								</table>
								<div id='submitButton' style="text-align: center;">
									<input type=button class="input-btnn" name=sb1 value="保存"
										onclick="MyTjsss()" /> <input type=button class="input-btnn"
										name=sb1 value="提交审核" onclick="submitTocheck()" />
								</div>
							</div>
							<div class="" id="cf3" style="display: none;">
								<div id='xz_div' style='width: 100%' align=center>
									<br>
									<br>
									<div style="width: 100%;">
										<div
											style="display: table; margin-left: auto; margin-right: auto;">
											<input id="file_upload" name="" type="file"
												onchange="addtr(this)" />
										</div>
									</div>
									<input type=hidden id='dtOldLine_dt10' value='' />
									<TABLE borderColor=#cccccc cellSpacing=0
										style="width: 90%; margin-left: auto; margin-top: 20px; margin-right: auto;"
										borderColorDark=#ffffff cellPadding=3 bgColor=#ffffff border=1
										onclick=selectrow( 'dt10') id=dt10 class='uiTable'
										datasrc='#ds10'>
										<THEAD>
											<TR bgcolor=#FFFFFF class=TitleColor id=header>
												<!--表列头-->
												<TD align=middle bgColor=#f2f2f2>创建人</TD>
												<TD align=middle bgColor=#f2f2f2>生成时间</TD>
												<TD align=middle bgColor=#f2f2f2>文件名</TD>
												<TD align=middle bgColor=#f2f2f2>&nbsp;</TD>
												<TD align=middle bgColor=#f2f2f2>&nbsp;</TD>
											</TR>
										</THEAD>
										<TBODY id="tby">

											<input type="hidden" id="tmcBbxzListLength"
												value="${fn:length(tmcRwsqd.tmcBbxzList)}">
											<c:forEach items="${tmcRwsqd.tmcBbxzList }" var="tmcBbxz"
												varStatus="status">
												<tr class="sbfjtr" bgcolor=white>
													<TD><input type="hidden"
														name="tmcBbxzList[${status.index}].pk1"
														value="${tmcBbxz.pk1 }"> &nbsp; <input
														name="tmcBbxzList[${status.index}].cjr"
														style="border: none;" readonly value="${tmcBbxz.cjr}" />
														<input type="hidden"
														name="tmcBbxzList[${ status.index}].wjlj"
														value="'+e.fileUrl+'"></TD>
													<TD>&nbsp;<input
														name="tmcBbxzList[${status.index}].scsj" readonly
														style="border: none;" value="${tmcBbxz.scsj }"></input>
													</TD>
													<TD>&nbsp;<input
														name="tmcBbxzList[${status.index}].wjm" readonly
														style="border: none;" value="${tmcBbxz.wjm }"></input></TD>
													<TD align='center'><a style="color: black;"
														vl="${tmcBbxz.scr }" href="${tmcBbxz.scr }"
														id='link_dt10_link_xiazai'>下载</a></TD>
													<td align='center'><IMG id=delItem_dt10 ALT=删除
														onclick=delItem(this)></td>
												</tr>
											</c:forEach>
										</TBODY>
									</TABLE>
								</div>
								<div align="center" style="width: 100%;">
									<div id='submitButton'
										style="margin-left: auto; margin-right: auto; display: table; margin-top: 40px;">
										<input type=button class="input-btnn" name=sb1 value="保存"
											onclick="MyTjsss()" /> <input type=button class="input-btnn"
											name=sb1 value="提交审核" onclick="submitTocheck()" />
									</div>

								</div>
							</div>
							<div class="" id="cf4" style="display: none; width: 100%;">
								<div style="width: 100%; padding: 1px 1px 1px 1px"
									display='none'>
									<BR>
									<div
										style='text-align: center; border: 1px solid #ddd; background-image: url(/plats/lms/jsp/images/table_bg.png); height: 27px; width: 100%; bottom: 0px;'
										align="center">
										<font
											style="FONT-FAMILY: 微软雅黑; color: #33597F; font-size: 14px">电源适配器/充电器</font>
									</div>
									<TABLE class='uiTable' borderColor="#00000" cellSpacing=0
										borderColorDark=#ffffff cellPadding=3 id='af_4' datasrc='#ds4'
										border=1 style="width: 100%;" ALIGN=CENTER>
										<input type="hidden" name="tmcDyspqcdq.pk1"
											value="${tmcRwsqd.tmcDyspqcdq.pk1 }">
										<TR>
											<TD style="PADDING-LEFT: 5px" width=70>型号</TD>
											<TD style="PADDING-LEFT: 5px"><INPUT class=buyBox1
												type=text id=dt4_XH value="${tmcRwsqd.tmcDyspqcdq.xh }"
												size=15 name="tmcDyspqcdq.xh" datafld="XH" maxlength=30
												onchange="_doChange('dt4','XH',this)"></TD>

											<TD style="PADDING-LEFT: 5px" width=70>产地</TD>
											<TD style="PADDING-LEFT: 5px"><INPUT class=buyBox1
												type=text id=dt4_CD value="${tmcRwsqd.tmcDyspqcdq.cd }"
												size=15 name="tmcDyspqcdq.cd" datafld="CD" maxlength=100
												onchange="_doChange('dt4','CD',this)"></TD>

											<TD style="PADDING-LEFT: 5px" width=70>CCC证书号</TD>
											<TD style="PADDING-LEFT: 5px"><INPUT class=buyBox1
												type=text id=dt4_ZSH value="${tmcRwsqd.tmcDyspqcdq.zsh }"
												size=25 name="tmcDyspqcdq.zsh" datafld="ZSH" maxlength=100
												onchange="_doChange('dt4','ZSH',this)"></TD>
										<TR>
											<TD style="PADDING-LEFT: 5px" width=70>生产厂</TD>
											<TD style="PADDING-LEFT: 5px"><INPUT style="width: 90%;"
												class=buyBox1 type=text id=dt4_SCC
												value="${tmcRwsqd.tmcDyspqcdq.scc }" size=30
												name="tmcDyspqcdq.scc" datafld="SCC" maxlength=100
												onchange="_doChange('dt4','SCC',this)"></TD>

											<TD style="PADDING-LEFT: 5px" width=70>制造商</TD>
											<TD style="PADDING-LEFT: 5px" colspan=3><INPUT
												class=buyBox1 type=text id=dt4_ZZS
												value="${tmcRwsqd.tmcDyspqcdq.zzs }" size=30
												name="tmcDyspqcdq.zzs" datafld="ZZS" maxlength=500
												onchange="_doChange('dt4','ZZS',this)"></TD>
										</TR>
									</TABLE>

									<div
										style='text-align: center; border: 1px solid #ddd; background-image: url(/plats/lms/jsp/images/table_bg.png); height: 27px; width: 100%; bottom: 0px;'
										align="center">
										<font
											style="FONT-FAMILY: 微软雅黑; color: #33597F; font-size: 14px">电池</font>
									</div>
									<TABLE class='uiTable' borderColor="#00000" cellSpacing=0
										borderColorDark=#ffffff cellPadding=3 id='af_5' datasrc='#ds5'
										border=1 style="width: 100%;" ALIGN=CENTER>
										<input type="hidden" name="tmcDc.pk1"
											value="${tmcRwsqd.tmcDc.pk1 }">
										<TR>
											<TD style='PADDING-LEFT: 5px' width=70>型号</TD>
											<TD style='PADDING-LEFT: 5px'><INPUT class=buyBox1
												type=text id=dt5_XH value="${tmcRwsqd.tmcDc.xh }" size=20
												name="tmcDc.xh" datafld="XH" maxlength=30
												onchange="_doChange('dt5','XH',this)"></TD>

											<TD style='PADDING-LEFT: 5px' width=70>产地</TD>
											<TD style='PADDING-LEFT: 5px'><INPUT class=buyBox1
												type=text id=dt5_CD value="${tmcRwsqd.tmcDc.cd }" size=20
												name="tmcDc.cd" datafld="CD" maxlength=100
												onchange="_doChange('dt5','CD',this)"></TD>
										</TR>

										<TR>
											<TD style='PADDING-LEFT: 5px' width=70>标称电压</TD>
											<TD style='PADDING-LEFT: 5px'><INPUT style="width: 90%;"
												class=buyBox1 type=text id=dt5_BCDY
												value="${tmcRwsqd.tmcDc.bcdy }" size=20 name="tmcDc.bcdy"
												datafld="BCDY" maxlength=100
												onchange="_doChange('dt5','BCDY',this)"></TD>

											<TD style='PADDING-LEFT: 5px' width=70>容量</TD>
											<TD style='PADDING-LEFT: 5px'><INPUT style="width: 90%;"
												class=buyBox1 type=text id=dt5_RL
												value="${tmcRwsqd.tmcDc.rl }" size=20 name="tmcDc.rl"
												datafld="RL" maxlength=30
												onchange="_doChange('dt5','RL',this)"></TD>
										</TR>

										<TR>
											<TD style='PADDING-LEFT: 5px' width=70>生产厂</TD>
											<TD style='PADDING-LEFT: 5px' colspan="3"><INPUT
												style="width: 90%;" class=buyBox1 type=text id=dt5_SCC
												value="${tmcRwsqd.tmcDc.scc }" size=105 name="tmcDc.scc"
												datafld="SCC" maxlength=100
												onchange="_doChange('dt5','SCC',this)"></TD>
										</TR>

										<TR>
											<TD style='PADDING-LEFT: 5px' width=70>制造商</TD>
											<TD style='PADDING-LEFT: 5px' colspan="3"><INPUT
												style="width: 90%;" class=buyBox1 type=text id=dt5_ZZS
												value="${tmcRwsqd.tmcDc.zzs }" size=105 name="tmcDc.zzs"
												datafld="ZZS" maxlength=500
												onchange="_doChange('dt5','ZZS',this)"></TD>
										</TR>
									</TABLE>
									<div
										style='text-align: center; border: 1px solid #ddd; background-image: url(/plats/lms/jsp/images/table_bg.png); height: 27px; width: 100%; bottom: 0px;'
										align="center">
										<font
											style="FONT-FAMILY: 微软雅黑; color: #33597F; font-size: 14px">版本信息</font>
									</div>
									<TABLE class='uiTable' borderColor="#00000" cellSpacing=0
										borderColorDark=#ffffff cellPadding=3 id='af_15'
										datasrc='#ds15' border=1 style="width: 100%;" ALIGN=CENTER>

										<input type="hidden" name="tmcBbxx.pk1"
											value="${tmcRwsqd.tmcBbxx.pk1 }">
										<TR>
											<TD style="PADDING-LEFT: 5px" width=70>查询方式</TD>
											<TD style="PADDING-LEFT: 5px"><INPUT class=buyBox1
												type=text id=dt15_CXFS value="${tmcRwsqd.tmcBbxx.cxfs }"
												size=40 name="tmcBbxx.cxfs" datafld="CXFS" maxlength=100
												onchange="_doChange('dt15','CXFS',this)"></TD>

											<TD style="PADDING-LEFT: 5px" width=70>软件版本号</TD>
											<TD style="PADDING-LEFT: 5px"><INPUT class=buyBox1
												type=text id=dt15_RJBBH value="${tmcRwsqd.tmcBbxx.rjbbh }"
												size=10 name="tmcBbxx.rjbbh" datafld="RJBBH" maxlength=100
												onchange="_doChange('dt15','RJBBH',this)"></TD>


											<TD style="PADDING-LEFT: 5px" width=70>硬件版本号</TD>
											<TD style="PADDING-LEFT: 5px"><INPUT class=buyBox1
												type=text id=dt15_YJBBH value="${tmcRwsqd.tmcBbxx.yjbbh }"
												size=10 name="tmcBbxx.yjbbh" datafld="YJBBH" maxlength=100
												onchange="_doChange('dt15','YJBBH',this)"></TD>
									</TABLE>
									<div
										style='text-align: center; border: 1px solid #ddd; background-image: url(/plats/lms/jsp/images/table_bg.png); height: 27px; width: 100%; bottom: 0px;'
										align="center">
										<font
											style="FONT-FAMILY: 微软雅黑; color: #33597F; font-size: 14px">详细信息</font>
									</div>
									<TABLE class='uiTable' borderColor="#00000" cellSpacing=0
										borderColorDark=#ffffff cellPadding=3 id='af_16'
										datasrc='#ds16' border=1 style="width: 100%;" ALIGN=CENTER>
										<input type="hidden" name="tmcXxxx.pk1"
											value="${tmcRwsqd.tmcXxxx.pk1 }">
										<TR>
											<TD style="PADDING-LEFT: 5px" width=70>待机方式</TD>
											<TD style="PADDING-LEFT: 5px" colspan=2><SELECT
												id='dt16_DK' name="tmcXxxx.dk" datafld='DK'
												onchange="refChange(this,'dt16_DK__SHOW__');_doChange('dt16','DK',this);">
													<option value=''>--请选择--</option>
													<option value='双卡单模组双待'
														${tmcRwsqd.tmcXxxx.dk eq '双卡单模组双待'?'selected':''}>双卡单模组双待</option>
													<option value='双卡单模组单待'
														${tmcRwsqd.tmcXxxx.dk eq '双卡单模组单待'?'selected':''}>双卡单模组单待</option>
													<option value='单卡'
														${tmcRwsqd.tmcXxxx.dk eq '单卡'?'selected':''}>单卡</option>
													<option value='双卡双模组双待单通信'
														${tmcRwsqd.tmcXxxx.dk eq '双卡双模组双待单通信'?'selected':''}>双卡双模组双待单通信</option>
													<option value='双卡双模组双待双通信'
														${tmcRwsqd.tmcXxxx.dk eq '双卡双模组双待双通信'?'selected':''}>双卡双模组双待双通信</option>
													<option value='双卡双模组单待'
														${tmcRwsqd.tmcXxxx.dk eq '双卡双模组单待'?'selected':''}>双卡双模组单待</option>
											</SELECT></TD>

											<TD style="PADDING-LEFT: 5px" width=70>耳机</TD>
											<TD style="PADDING-LEFT: 5px" colspan=2><SELECT
												id='dt16_EJ' name="tmcXxxx.ej" datafld='EJ'
												onchange="refChange(this,'dt16_EJ__SHOW__');_doChange('dt16','EJ',this);">
													<option value=''>--请选择--</option>
													<option value='耳机端口与充电器端口共用'
														${tmcRwsqd.tmcXxxx.ej eq '耳机端口与充电器端口共用'?'selected':''}>耳机端口与充电器端口共用</option>
													<option value='不可使用耳机'
														${tmcRwsqd.tmcXxxx.ej eq '不可使用耳机'?'selected':''}>不可使用耳机</option>
													<option value='独立耳机端口'
														${tmcRwsqd.tmcXxxx.ej eq '独立耳机端口'?'selected':''}>独立耳机端口</option>
											</SELECT></TD>
										<TR>
											<TD style="PADDING-LEFT: 5px" width=70>GPRS</TD>
											<TD style="PADDING-LEFT: 5px" colspan=2><SELECT
												id='dt16_GPRS' name="tmcXxxx.gprs" datafld='GPRS'
												onchange="refChange(this,'dt16_GPRS__SHOW__');_doChange('dt16','GPRS',this);">
													<option value=''>--请选择--</option>
													<option value='不支持GPRS功能'
														${tmcRwsqd.tmcXxxx.gprs eq '不支持GPRS功能'?'selected':''}>不支持GPRS功能</option>
													<option value='支持GPRS功能'
														${tmcRwsqd.tmcXxxx.gprs eq '支持GPRS功能'?'selected':''}>支持GPRS功能</option>
											</SELECT></TD>

											<TD style="PADDING-LEFT: 5px" width=70>GPRSCLASS</TD>
											<TD style="PADDING-LEFT: 5px" colspan=2><INPUT
												class=buyBox1 type=text id=dt16_GPRSCLASS
												value="${tmcRwsqd.tmcXxxx.gprsclass }" size=10
												name="tmcXxxx.gprsclass" datafld="GPRSCLASS" maxlength=100
												onchange="_doChange('dt16','GPRSCLASS',this)"></TD>
										<TR>
											<TD style="PADDING-LEFT: 5px" width=70>EGPRS</TD>
											<TD style="PADDING-LEFT: 5px" colspan=2><SELECT
												id='dt16_EGPRS' name="tmcXxxx.egprs" datafld='EGPRS'
												onchange="refChange(this,'dt16_EGPRS__SHOW__');_doChange('dt16','EGPRS',this);">
													<option value=''>--请选择--</option>
													<option value='不支持EGPRS功能'
														${tmcRwsqd.tmcXxxx.egprs eq '不支持EGPRS功能'?'selected':''}>不支持EGPRS功能</option>
													<option value='支持EGPRS功能'
														${tmcRwsqd.tmcXxxx.egprs eq '支持EGPRS功能'?'selected':''}>支持EGPRS功能</option>
											</SELECT></TD>

											<TD style="PADDING-LEFT: 5px" width=70>EGPRSCLASS</TD>
											<TD style="PADDING-LEFT: 5px" colspan=2><INPUT
												class=buyBox1 type=text id=dt16_EGPRSCLASS
												value="${tmcRwsqd.tmcXxxx.egprsclass }" size=10
												name="tmcXxxx.egprsclass" datafld="EGPRSCLASS" maxlength=100
												onchange="_doChange('dt16','EGPRSCLASS',this)"></TD>
										<TR>
											<TD style="PADDING-LEFT: 5px" width=70>WAPI</TD>
											<TD style="PADDING-LEFT: 5px" colspan=2><SELECT
												id='dt16_WAPI' name="tmcXxxx.wapi" datafld='WAPI'
												onchange="refChange(this,'dt16_WAPI__SHOW__');_doChange('dt16','WAPI',this);">
													<option value=''>--请选择--</option>
													<option value='不支持WAPI'
														${tmcRwsqd.tmcXxxx.wapi eq '不支持WAPI'?'selected':''}>不支持WAPI</option>
													<option value='支持WAPI'
														${tmcRwsqd.tmcXxxx.wapi eq '支持WAPI'?'selected':''}>支持WAPI</option>
											</SELECT></TD>

											<TD style="PADDING-LEFT: 5px" width=70>CMMB</TD>
											<TD style="PADDING-LEFT: 5px" colspan=2><SELECT
												id='dt16_CMMB' name="tmcXxxx.cmmb" datafld='CMMB'
												onchange="refChange(this,'dt16_CMMB__SHOW__');_doChange('dt16','CMMB',this);">
													<option value=''>--请选择--</option>
													<option value='不支持CMMB'
														${tmcRwsqd.tmcXxxx.cmmb eq '不支持CMMB'?'selected':''}>不支持CMMB</option>
													<option value='支持CMMB'
														${tmcRwsqd.tmcXxxx.cmmb eq '支持CMMB'?'selected':''}>支持CMMB</option>
											</SELECT></TD>
										</TR>


										<TR>
											<TD style="PADDING-LEFT: 5px" width=70>GPS</TD>
											<TD style="PADDING-LEFT: 5px"><SELECT id='dt16_GPS'
												name="tmcXxxx.gps" datafld='GPS'
												onchange="refChange(this,'dt16_GPS__SHOW__');_doChange('dt16','GPS',this);">
													<option value=''>--请选择--</option>
													<option value='不支持GPS功能'
														${tmcRwsqd.tmcXxxx.gps eq '不支持GPS功能'?'selected':''}>不支持GPS功能</option>
													<option value='支持GPS功能'
														${tmcRwsqd.tmcXxxx.gps eq '支持GPS功能'?'selected':''}>支持GPS功能</option>
											</SELECT></TD>

											<TD style="PADDING-LEFT: 5px" width=70>蓝牙</TD>
											<TD style="PADDING-LEFT: 5px"><SELECT id='dt16_LY'
												name="tmcXxxx.ly" datafld='LY'
												onchange="refChange(this,'dt16_LY__SHOW__');_doChange('dt16','LY',this);">
													<option value=''>--请选择--</option>
													<option value='不支持蓝牙功能'
														${tmcRwsqd.tmcXxxx.ly eq '不支持蓝牙功能'?'selected':''}>不支持蓝牙功能</option>
													<option value='支持蓝牙功能'
														${tmcRwsqd.tmcXxxx.ly eq '支持蓝牙功能'?'selected':''}>支持蓝牙功能</option>
											</SELECT></TD>

											<TD style="PADDING-LEFT: 5px" width=70>收音机</TD>
											<TD style="PADDING-LEFT: 5px"><SELECT id='dt16_SYJ'
												name="tmcXxxx.syj" datafld='SYJ'
												onchange="refChange(this,'dt16_SYJ__SHOW__');_doChange('dt16','SYJ',this);">
													<option value=''>--请选择--</option>
													<option value='不支持收音机功能'
														${tmcRwsqd.tmcXxxx.syj eq '不支持收音机功能'?'selected':''}>不支持收音机功能</option>
													<option value='支持收音机功能'
														${tmcRwsqd.tmcXxxx.syj eq '支持收音机功能'?'selected':''}>支持收音机功能</option>
											</SELECT></TD>
										</TR>

										<TR>
											<TD style="PADDING-LEFT: 5px" width=70>备注</TD>
											<TD style="PADDING-LEFT: 5px" colspan="5"><textarea
													style="width: 90%; padding: 6px 2px;" class=buyBox1
													id=dt16_BZ name="tmcXxxx.bz" wrap="VIRTUAL" datafld="BZ"
													rows=3 cols=130 onchange="_doChange('dt16','BZ',this)">${tmcRwsqd.tmcXxxx.bz }</textarea>
											</TD>
										</TR>
									</TABLE>
								</div>
								<div style="width: 100%;">
									<div
										style="display: table; margin-left: auto; margin-right: auto;">
										<input type=button class="input-btnn" value="保存"
											onclick="MyTjsss()" /> <input type=button class="input-btnn"
											name=sb1 value="提交审核" onclick="submitTocheck()" />
									</div>
								</div>
							</div>
							<div class="" id="cf5" style="display: none;">
								<div id='xz_div' style='width: 100%' align=center>
									<div style="width: 100%; margin: 10px 0;">
										<INPUT TYPE="button" class="btn3_mouseover"
											style="width: 50px; margin-left: 50% !important;"
											VALUE=" 添加 " onClick="addemc()">
									</div>
									<table style="width: 100%;">
										<thead>
											<td width="7%">关键件名称</td>
											<td width="5%">位号</td>
											<td width="15%">型号</td>
											<td width="15%">规格</td>
											<td width="7%">生产者/制造商</td>
											<td width="7%">生产厂/生产企业</td>
											<td width="5%">使用/备用</td>
											<td width="15%">备注</td>
											<td width="10%">emc备注</td>
											<td width="10%">类型</td>
											<td width="10%">&nbsp;</td>
										</thead>
										<tbody id="emctdy">
											<input type="hidden" id="emcgjyqjlbListLength"
												value="${fn:length(tmcRwsqd.emcgjyqjlbList)}">
											<c:forEach items="${tmcRwsqd.emcgjyqjlbList }"
												var="emcgjyqjlb" varStatus="status">
												<tr>
													<input type="hidden" name="emcgjyqjlb.pk1"
														value="${emcgjyqjlb.pk1 }">
													<td><input
														style="width: 100%; margin-left: 0px !important; border: 0px;"
														type="text" name="emcgjyqjlbList[${status.index }].gjjmc"
														value="${emcgjyqjlb.gjjmc }"></td>
													<td><input
														style="width: 100%; margin-left: 0px !important; border: 0px;"
														type="text" name="emcgjyqjlbList[${status.index }].wh"
														value="${emcgjyqjlb.wh}"></td>
													<td><input
														style="width: 100%; margin-left: 0px !important; border: 0px;"
														type="text" name="emcgjyqjlbList[${status.index }].xh"
														value="${emcgjyqjlb.xh}"></td>
													<td><input
														style="width: 100%; margin-left: 0px !important; border: 0px;"
														type="text" name="emcgjyqjlbList[${status.index }].gg"
														value="${emcgjyqjlb.gg}"></td>
													<td><input
														style="width: 100%; margin-left: 0px !important; border: 0px;"
														type="text" name="emcgjyqjlbList[${status.index }].zzs"
														value="${emcgjyqjlb.zzs}"></td>
													<td><input
														style="width: 100%; margin-left: 0px !important; border: 0px;"
														type="text" name="emcgjyqjlbList[${status.index }].scc"
														value="${emcgjyqjlb.scc}"></td>
													<td><input
														style="width: 100%; margin-left: 0px !important; border: 0px;"
														type="text" name="emcgjyqjlbList[${status.index }].sybz"
														value="${emcgjyqjlb.sybz}"></td>
													<td><input
														style="width: 100%; margin-left: 0px !important; border: 0px;"
														type="text" name="emcgjyqjlbList[${status.index }].bz"
														value="${emcgjyqjlb.bz}"></td>
													<td><input
														style="width: 100%; margin-left: 0px !important; border: 0px;"
														type="text" name="emcgjyqjlbList[${status.index }].sybz"
														value="${emcgjyqjlb.sybz}"></td>
													<td><input
														style="width: 100%; margin-left: 0px !important; border: 0px;"
														type="text" name="emcgjyqjlbList[${status.index }].lx"
														value="${emcgjyqjlb.lx}"></td>
													<td><a style="color: black; cursor: pointer;"
														onclick="delemc(this)">删除</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div style="width: 100%;">
										<div
											style="display: table; margin-left: auto; margin-right: auto;">
											<input type=button class="input-btnn" value="保存"
												onclick="MyTjsss()" /> <input type=button
												class="input-btnn" name=sb1 value="提交审核"
												onclick="submitTocheck()" />
										</div>
									</div>
								</div>
							</div>
							<div class="" id="cf6" style="display: none;">
								<div id='xz_div' style='width: 100%' align=center>
									<div style="width: 100%; margin: 10px 0;">
										<INPUT TYPE="button" class="btn3_mouseover"
											style="width: 50px; margin-left: 50% !important;"
											VALUE=" 添加 " onClick="addaqj()">
									</div>
									<table style="width: 100%;">
										<thead>
											<td width="7%">序号</td>
											<td width="5%">位号</td>
											<td width="15%">部件号</td>
											<td width="15%">关键件名称</td>
											<td width="7%">型号</td>
											<td width="7%">规格/材料</td>
											<td width="5%">生产者(制造商)</td>
											<td width="15%">生产企业</td>
											<td width="10%">认证标准</td>
											<td width="10%">备注</td>
											<td width="10%">&nbsp;</td>
										</thead>
										<tbody id="aqjtdy">
											<input type="hidden" id="aqyqjlbListLength"
												value="${fn:length(tmcRwsqd.aqyqjlbList)}">
											<c:forEach items="${tmcRwsqd.aqyqjlbList }" var="aqyqjlb"
												varStatus="status">
												<tr>
													<input type="hidden" name="aqyqjlb.pk1"
														value="${aqyqjlb.pk1 }">
													<td><input
														style="width: 100%; margin-left: 0px !important; border: 0px;"
														type="text" name="aqyqjlbList[${status.index }].xh "
														value="${aqyqjlb.xh }"></td>
													<td><input
														style="width: 100%; margin-left: 0px !important; border: 0px;"
														type="text" name="aqyqjlbList[${status.index }].wh "
														value="${aqyqjlb.wh }"></td>
													<td><input
														style="width: 100%; margin-left: 0px !important; border: 0px;"
														type="text" name="aqyqjlbList[${status.index }].bjh"
														value="${aqyqjlb.bjh}"></td>
													<td><input
														style="width: 100%; margin-left: 0px !important; border: 0px;"
														type="text" name="aqyqjlbList[${status.index }].mc"
														value="${aqyqjlb.mc}"></td>
													<td><input
														style="width: 100%; margin-left: 0px !important; border: 0px;"
														type="text" name="aqyqjlbList[${status.index }].xh"
														value="${aqyqjlb.xh}"></td>
													<td><textarea
															style="width: 100%; margin-left: 0px !important; border: 0px;"
															type="text" name="aqyqjlbList[${status.index }].clygg"
															value="${aqyqjlb.clygg}"></textarea></td>
													<td><textarea
															style="width: 100%; margin-left: 0px !important; border: 0px;"
															type="text" name="aqyqjlbList[${status.index }].zzs"
															value="${aqyqjlb.zzs}"></textarea></td>
													<td><textarea
															style="width: 100%; margin-left: 0px !important; border: 0px;"
															type="text" name="aqyqjlbList[${status.index }].scc"
															value="${aqyqjlb.scc}"></textarea></td>
													<td><input
														style="width: 100%; margin-left: 0px !important; border: 0px;"
														type="text" name="aqyqjlbList[${status.index }].rzxx"
														value="${aqyqjlb.rzxx}"></td>
													<td><textarea
															style="width: 100%; margin-left: 0px !important; border: 0px;"
															type="text" name="aqyqjlbList[${status.index }].bz"
															value="${aqyqjlb.bz}"></textarea></td>
													<td><a style="color: black; cursor: pointer;"
														onclick="delaqj(this)">删除</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div style="width: 100%;">
										<div
											style="display: table; margin-left: auto; margin-right: auto;">
											<input type=button class="input-btnn" value="保存"
												onclick="MyTjsss()" /> <input type=button
												class="input-btnn" name=sb1 value="提交审核"
												onclick="submitTocheck()" />
										</div>
									</div>
								</div>
							</div>
							<div class="" id="cf7" style="display: none;">
								<div id='xz_div' style='width: 100%; text-align: center'>
									<div style="width: 100%; padding: 1px 1px 1px 1px"
										display='none'>
										<input type="hidden" name="tmcRwsqd.pk1"
											value="${tmcRwsqd.tmcBgqrb.pk1 }"> <BR>
										<div
											style='text-align: center; border: 1px solid #ddd; background-image: url(/plats/lms/jsp/images/table_bg.png); height: 27px; width: 100%; bottom: 0px;'
											align="center">
											<font
												style="FONT-FAMILY: 微软雅黑; color: #33597F; font-size: 14px; text-align: center;">变更确认表</font>
										</div>
										<%--<div style="width: 100%;">--%>
										<%--<div style="display: table;margin-left: auto;margin-right: auto;">--%>
										<%--<INPUT TYPE="button" class="btn3_mouseover" VALUE="上传变更确认表" ONCLICK="lookdiv_bgb()" >--%>
										<%--</div>--%>
										<%--</div>--%>

										<div style="width: 100%;">
											<div style="width: 100%; float: left;">
												<div style="width: 20%; float: left;">申请单位</div>
												<div style="width: 30%; float: left;">
													<input type="text" id="SQDW" name="tmcBgqrb.sqdw"
														value="${tmcRwsqd.tmcBgqrb.sqdw }">
												</div>
												<div style="width: 20%; float: left;">申请型号</div>
												<div style="width: 30%; float: left;">
													<input type="text" id="SQXH" name="tmcBgqrb.sqxh"
														value="${tmcRwsqd.tmcBgqrb.sqxh }">
												</div>
											</div>
											<div style="width: 100%; float: left;">
												<div style="width: 20%; float: left;">申请编号</div>
												<div style="width: 30%; float: left;">
													<input type="text" id="SQBH" name="tmcBgqrb.sqbh"
														value="${tmcRwsqd.tmcBgqrb.sqxh }">
												</div>
												<div style="width: 20%; float: left;">原CCC证书号</div>
												<div style="width: 30%; float: left;">
													<input type="text" id="YCCCZSH" name="tmcBgqrb.yccczsh"
														value="${tmcRwsqd.tmcBgqrb.yccczsh }">
												</div>
											</div>
											<div style="width: 100%; float: left;">
												<div style="width: 20%; float: left;">原CCC报告号及申请号</div>
												<div style="width: 30%; float: left;">
													<input type="text" id="YCCCBGH" name="tmcBgqrb.ycccbgh"
														value="${tmcRwsqd.tmcBgqrb.ycccbgh }">
												</div>
											</div>
											<div style="width: 100%; float: left;">
												<div style="width: 20%; float: left;">变更结论</div>
												<div style="width: 80%; float: left;">
													<textarea style="width: 80%; float: left;" id="BGJL"
														name="tmcBgqrb.bgjl">${tmcRwsqd.tmcBgqrb.bgjl }</textarea>
												</div>
											</div>
											<div style="width: 100%; float: left;">
												<div style="width: 20%; float: left;">备注</div>
												<div style="width: 80%; float: left;">
													<textarea style="width: 80%; float: left;" id="BZ"
														name="tmcBgqrb.bz">${tmcRwsqd.tmcBgqrb.bz }</textarea>
												</div>
											</div>
										</div>
										<div style="width: 100%;">
											<div
												style="display: table; margin-left: auto; margin-right: auto;">
												<INPUT TYPE="button" class="btn3_mouseover" VALUE=" 新增 "
													ONCLICK="addbgzb()">
											</div>
										</div>
										<table style="width: 100%;">
											<thead>
												<td width="7%">序号</td>
												<td width="5%">是否入分报告</td>
												<td width="15%">名称</td>
												<td width="15%">变更前</td>
												<td width="7%">变更后</td>
												<td width="7%">部门</td>
												<td width="10%">&nbsp;</td>
											</thead>
											<tbody id="bgzbtdy">
												<input type="hidden" id="tmcBgqrzbListLength"
													value="${fn:length(tmcRwsqd.tmcBgqrzbList)}">
												<c:forEach items="${tmcRwsqd.tmcBgqrzbList }"
													var="tmcBgqrzb" varStatus="status">
													<tr>
														<input type="hidden"
															name="tmcBgqrzbList[${status.index}].pk1"
															value="${tmcBgqrzb.pk1 }">
														<td><input
															style="width: 100%; margin-left: 0px !important; border: 0px;"
															type="text" name="tmcBgqrzbList[${status.index}].xh "
															value="${tmcBgqrzb.xh }"></td>
														<td><input
															style="width: 100%; margin-left: 0px !important; border: 0px;"
															type="text" name="tmcBgqrzbList[${status.index}].lx"
															value="${tmcBgqrzb.lx }"></td>
														<td><input
															style="width: 100%; margin-left: 0px !important; border: 0px;"
															type="text" name="tmcBgqrzbList[${status.index}].mc"
															value="${tmcBgqrzb.mc }"></td>
														<td><input
															style="width: 100%; margin-left: 0px !important; border: 0px;"
															type="text" name="tmcBgqrzbList[${status.index}].bgq"
															value="${tmcBgqrzb.bgq }"></td>
														<td><input
															style="width: 100%; margin-left: 0px !important; border: 0px;"
															type="text" name="tmcBgqrzbList[${status.index}].bgh"
															value="${tmcBgqrzb.bgh }"></td>
														<td><input
															style="width: 100%; margin-left: 0px !important; border: 0px;"
															type="text" name="tmcBgqrzbList[${status.index}].bm"
															value="${tmcBgqrzb.bm }"></td>
														<td><a style="color: black; cursor: pointer;"
															onclick="delaqj(this)">删除</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

									</div>
									<input type=button class="input-btnn" name=sb1 value="保存"
										onclick="MyTjsss()" /> <input type=button class="input-btnn"
										name=sb1 value="提交审核" onclick="submitTocheck()" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</section>

	<script>
    $(function(){
        addmenu();
        $("#lfywlist").show();
        $("#lm4").addClass("qiye_xuanzhong");
        if(window.parent.refreshHeight){
            window.parent.refreshHeight();
        }
    })
    var filenum =parseInt($("#tmcBbxzListLength").val());
    function addtr(obj){
        
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
                    var newdate = new Date();
                    var datestr =newdate.getFullYear()+"-"+(newdate.getMonth()+1)+"-"+newdate.getDate();
                    var filename = e.fileUrl.substring(e.fileUrl.lastIndexOf("/")+1);
                    $("#tby").append('<tr class="sbfjtr" bgcolor=white>\n' +
                        '<TD>&nbsp;<input name="tmcBbxzList['+filenum+'].cjr" style="border: none;" readonly value="'+"${fns:getUser().name}"+'"></input>' +
                        //							'<input type="hidden" name="tmcBbxzList['+filenum+'].wjlj" value="'+e.fileUrl+'"></TD>\n' +
                        '<TD>&nbsp;<input name="tmcBbxzList['+filenum+'].scsj" readonly style="border: none;" value="'+datestr+'"></input></TD>\n' +
                        '<TD>&nbsp;<input name="tmcBbxzList['+filenum+'].wjm" readonly style="border: none;" value="'+filename+'"></input></TD>\n' +
                        '<TD align=\'center\'><a style="color: black;" vl="'+e.fileUrl+'" href="'+e.fileUrl+'"  id=\'link_dt10_link_xiazai\'>下载</a></TD>\n' +
                        '<td align=\'center\'> <IMG id=delItem_dt10 ALT=删除 onclick=delItem(this)></td>\n' +
                        '</tr>')
                        filenum++;
                }
            })
        }
       
    }

    function delItem(obj){
        $(obj).parent().parent().remove();
    }
    function MyTjsss(){
    	var validateFlag=validateInput();
		if(validateFlag){
			$("#form1").submit();
		}
        
    }
    function submitTocheck(){
    	window.location.href="${ctx}/taier/tmcRwsqd/updateStatus?pk1=${tmcRwsqd.pk1}&type=2&status=1";
    }
    //校验表单
    function validateInput(){
    	var validateFlag=true;
    	$('#cf1 input[type=text]').each(function(){
    		
    		var value=$(this).val();
    		var validateType=$(this).attr("validateType");
    		if(validateType=='required'){
    			if(value==null || value==''){
    				validateFlag=false;
        			$(this).focus();
        			var message=$(this).parent().prev().html().trim();
        			alert("请填写"+message);
        			return false;
        		}
    		}
    		
    	})
    	if(!validateFlag){
    		return validateFlag;
    	}
    	
    	$('#cf1 select').each(function(){
    		
    		var value=$(this).val();
    		var validateType=$(this).attr("validateType");
    		if(!validateType || validateType!='ignore'){
    			if(value==null || value==''){
    				validateFlag=false;
        			$(this).focus();
        			var message=$(this).parent().prev().html();
        			alert("请填写"+message);
        			return false;
        		}
    		}
    		
    	})
    	return validateFlag;
    }
    var emcnum = parseInt($("#emcgjyqjlbListLength").val());
    function addemc(){
        
        $("#emctdy").append('<tr>' +
			'<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="emcgjyqjlbList['+emcnum+'].gjjmc"></td>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="emcgjyqjlbList['+emcnum+'].wh"></td>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="emcgjyqjlbList['+emcnum+'].xh"></td>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="emcgjyqjlbList['+emcnum+'].gg"></td>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="emcgjyqjlbList['+emcnum+'].zzs"></td>' +
			'<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="emcgjyqjlbList['+emcnum+'].scc"></td>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="emcgjyqjlbList['+emcnum+'].sybz"></td>' +
			'<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="emcgjyqjlbList['+emcnum+'].bz"></td>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="emcgjyqjlbList['+emcnum+'].sybz"></td>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="emcgjyqjlbList['+emcnum+'].lx"></td>' +
            '<td><a style="color: black;cursor: pointer;" onclick="delemc(this)">删除</a></td>' +
			'</tr>');
        emcnum++;
	}
	function delemc(obj){
        $(obj).parent().parent().remove();
	}

	var aqjnum = parseInt($("#aqyqjlbListLength").val());
    function addaqj(){
        
        $("#aqjtdy").append('<tr>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="aqyqjlbList['+emcnum+'].xh"></td>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="aqyqjlbList['+emcnum+'].wh"></td>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="aqyqjlbList['+emcnum+'].bjh"></td>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="aqyqjlbList['+emcnum+'].mc"></td>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="aqyqjlbList['+emcnum+'].xh"></td>' +
            '<td><textarea style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="aqyqjlbList['+emcnum+'].clygg"></textarea></td>' +
            '<td><textarea style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="aqyqjlbList['+emcnum+'].zzs"></textarea></td>' +
            '<td><textarea style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="aqyqjlbList['+emcnum+'].scc"></textarea></td>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="aqyqjlbList['+emcnum+'].rzxx"></td>' +
            '<td><textarea style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="aqyqjlbList['+emcnum+'].bz"></textarea></td>' +
            '<td><a style="color: black;cursor: pointer;" onclick="delaqj(this)">删除</a></td>' +
            '</tr>');
        aqjnum++;
    }
    function delaqj(obj){
        $(obj).parent().parent().remove();
    }

    var bgzbnum=parseInt($("#tmcBgqrzbListLength").val());
    function addbgzb(){
        
        $("#bgzbtdy").append('<tr>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="tmcBgqrzbList['+bgzbnum+'].xh"></td>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="tmcBgqrzbList['+bgzbnum+'].lx"></td>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="tmcBgqrzbList['+bgzbnum+'].mc"></td>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="tmcBgqrzbList['+bgzbnum+'].bgq"></td>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="tmcBgqrzbList['+bgzbnum+'].bgh"></td>' +
            '<td><input style="width: 100%;margin-left: 0px !important;border: 0px;" type="text" name="tmcBgqrzbList['+bgzbnum+'].bm"></td>' +
            '<td><a style="color: black;cursor: pointer;" onclick="delaqj(this)">删除</a></td>' +
            '</tr>');
        bgzbnum++;
    }
</script>
</body>
</html>
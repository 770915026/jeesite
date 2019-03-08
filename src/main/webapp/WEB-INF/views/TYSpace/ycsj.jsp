<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.myDev.com/tags/ui-tags" prefix="ui" %>

<!--CKRWDD_GZJL_TAG-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>遥测数据</title>
<SCRIPT language=javascript src="/plats/js/laydate/laydate.js" charset="utf-8"></SCRIPT>
<SCRIPT language=javascript src="/plats/js/jquery-1.7.2.js"></SCRIPT>
<SCRIPT language=javascript src="/plats/js/json2.js"></SCRIPT>
<SCRIPT language=javascript src="/plats/js/autocomplete/jquery.autocomplete.min.js"></SCRIPT>
<link href="/plats/js/autocomplete/jquery.autocomplete.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
.uiTable td{
	 vertical-align:middle;
	 font: normal 13px "微软雅黑";
}
.ty_table td{
	 vertical-align:middle;
	 font: normal 13px "微软雅黑";
}
.picker {
	margin:0;
	padding:0;
	border:0;
	width:70px;
	height:20px;
	border-right:20px solid green;
	line-height:20px;
}
</style>
<link href="/plats/css/ui.css" rel="stylesheet" type="text/css">
</head>
<body  onload="__pageLoad()">
<ui:container>
<ui:tabset>
<ui:tab id='tab1' name="温度"  page='page1' active='true'/>
<ui:tab id='tab2' name="状态"  page='page2' active='false'/>
<ui:tab id='tab3' name="姿控"  page='page3' active='false'/>
<ui:tab id='tab4' name="姿控K"  page='page4' active='false'/>
<ui:tab id='tab5' name="GPS遥测"  page='page5' active='false'/>
<ui:tab id='tab6' name="X波段发射机"  page='page6' active='false'/>
<ui:tab id='tab7' name="接口板遥测"  page='page7' active='false'/>
<ui:tab id='tab8' name="天银星敏"  page='page8' active='false'/>
<ui:tab id='tab9' name="载荷计算机"  page='page9' active='false'/>
<ui:tab id='tab10' name="西工大飞轮及微推进器"  page='page10' active='false'/>
</ui:tabset>
<ui:page id='page1' active='true'>

<BR>
<div style="border: 1px solid #B7D9F5;padding:1px 1px 1px 1px;width:100%">
<TABLE cellpadding=0 cellspacing=0 style='width:1500px' align="center">
	<TR>
		<TD style='width:4px;height:29px;'><img src='/plats/platform/img/images/bg_top1.gif'></TD>
		<TD style='background: url(/plats/platform/img/images/bg_top2.gif);padding-left:5px'>
			<div style="float:left;width:53%;text-align:right"><font style='FONT-SIZE: 9pt; FONT-FAMILY: 微软雅黑; color:#33597F'>温度</a></font></div>
		</TD>
		<TD style='width:4px;height:29px'><img src='/plats/platform/img/images/bg_top3.gif'></TD>
	</TR>
</TABLE>

<div id="ds1value" name="ds1value" width="1300" align="center">
	<TABLE cellSpacing=0 width=1500 cellPadding=0 border=0 id=dt2 class='ty_table'>
		<THEAD>
			<TR class=table01 height='32px' id=header>
				<!--表列头-->
				<TD width=2 >&nbsp;</TD>
				<TD align=middle>序号</TD>
				<TD align=middle>卫星名称</TD>
				<TD align=middle>系统名称</TD>
				<TD align=middle>星上时间</TD>
				<TD align=middle>面板+X</TD>
				<TD align=middle>面板-Z</TD>
				<TD align=middle>面板-X</TD>
				<TD align=middle>面板+Y</TD>
				<TD align=middle>面板+Z</TD>
				<TD align=middle>走线侧面板-Y</TD>
				<TD align=middle>帆板背面+X</TD>
				<TD align=middle>飞轮X轴温度</TD>
				<TD align=middle>飞轮Y轴温度</TD>
				<TD align=middle>飞轮Z轴温度</TD>
				<TD align=middle>保留-斜装飞轮温度</TD>
				<TD align=middle>OBC温度1</TD>
				<TD align=middle>OBC温度2</TD>
				<TD align=middle>EPS温度1</TD>
				<TD align=middle>EPS温度2</TD>
				<TD align=middle>EPS温度3</TD>
			</TR>
		</THEAD>
		<TBODY>
			<TR class=table01 height='32px' id=header style="display:none">
				
			</TR>
			<%
				for(int i=1;i<=100;i++){
			%>
			<tr bgcolor=white>
				<TD width=20 align=center>
					<IMG id='imgDetail' SRC=images/c_edit.gif>
				</TD>
				<TD align='center'>
					<%=i%>
				</TD>
				<TD align='center'>
					TY2
				</TD>

				<TD align='center'>
					长沙-435
				</TD>

				<TD align='center'>
					2019-01-15 13:35:20
				</TD>

				<TD align='center'>
					1
				</TD>

				<TD align='center'>
					1
				</TD>

				<TD align='center'>
					1
				</TD>
				<TD align='center'>
					1
				</TD>

				<TD align='center'>
					1
				</TD>

				<TD align='center'>
					1
				</TD>
				<TD align='center'>
					1
				</TD>
				<TD align='center'>
					1
				</TD>

				<TD align='center'>
					1
				</TD>

				<TD align='center'>
					1
				</TD>
				<TD align='center'>
					1
				</TD>
				<TD align='center'>
					1
				</TD>

				<TD align='center'>
					1
				</TD>

				<TD align='center'>
					1
				</TD>
				<TD align='center'>
					1
				</TD>

				<TD align='center'>
					1
				</TD>
			</tr>
			<%}%>
		</TBODY>
	</TABLE>
</div>
<table  border="0" cellPadding="2" cellSpacing="1" class="sTitle" width="1500" align="center">
	<tr>
		<td bgColor="#fffffe" style="LINE-HEIGHT: 16px">
			<img name="Image7"  border="0" src="/plats/platform/img/first.gif"  alt="首页" onClick="first()" style="cursor:hand">
			<img name="Image7"  border="0" src="/plats/platform/img/forward.gif"  alt="上页" onClick="prev()" style="cursor:hand">
			<img name="Image8"  border="0" src="/plats/platform/img/back.gif"  alt="下页" onClick="next()" style="cursor:hand">
			<img name="Image9"  border="0" src="/plats/platform/img/last.gif"  alt="末页" onClick="last()" style="cursor:hand">
		</td>
		<td bgColor="#fffffe">
			<strong>转至第</strong><input type=text id=numPage2 class="input-text" value="" size="3" /><strong>页</strong>&nbsp;<strong>每页
			<input name="num" class="input-text" id="num" size=3>
			条 
			<input name="button" type=button class="input-btn" onClick="setPage()" value=设置 style="cursor:hand">
			共</strong><strong><span class='color-orange' id="totalpage"></span>页</strong><strong><span class='color-orange' id="totalcount" ></span>条记录&nbsp;&nbsp;第</strong><strong><span class='color-orange' id="currentpage"></span>页&nbsp; </strong>
		</td> 
	</tr>
</table>
<!--
<BR>
<TABLE style="width:100%;text-align:left;" class="uiTable" cellspacing=3 cellpadding=3>
<TR>
	<TD style="text-align:center">
	<input type=button class="tabbutton1" style="width:82px;height:25px;font:bold 14px '微软雅黑'" name=submit value="添加记录" onclick="_addjl()" />
	<input type=button class="tabbutton1" style="width:70px;height:25px;font:bold 14px '微软雅黑'" name=submit value="保存" onclick="_save()" />
	</TD>
</TR>
</TABLE>
<BR>
-->
</div>
</ui:page>

</ui:container>


<body>
</html>

<SCRIPT LANGUAGE="JavaScript">
var pagecount = "";//数据总条数
var currentpage = "1";//当前页
var num = "20";//每页显示几条
var totalpage = "";//总页数
var numPage2 = "";//转至页数
//给表单赋值
function getValue(){
	 $.ajax({
		type: 'POST',
		data:{"currentpage":currentpage,"num":num},
		url: "/plats/lms/jsp/load/CKRWDD_GZJL_LOAD.jsp",
		error: function () {
			//alert('请求失败');
		},  
		success:function(data){
			data = $.trim(data);
			$("#ds1value").html(data.split("counts")[0]);	
			getCount(data.split("counts")[1]);
			getxtzd();
			getwx();
			getzd();
		}
	 });
}
//所属系统站点的字典
function getxtzd(){
	$.ajax({
		 type: "POST",
		 contentType: "application/json",
		 url: "/plats/lms/jsp/CKRWDD_GETXTZD.jsp",
		 data: "",
		 async: false,
		 dataType: "json",
		 success: function (msg) {
			$('#dt2').find("[id^='dt2_XTMC_']").each(function(){					
				 $(this).autocomplete(msg, {
					 max: 30,
					 minChars:0,
					 matchContains: true,//从头开始匹配还是要在字符串内部查看匹配false为从开头匹配
					 formatItem: function (row, i, max) {
						 return  row.xtmc;
					 },
					 formatMatch: function(row, i, max){
						 return row.xtmc;
					 }
				 }).result(function(event, item) {
					  $(this).val(item.xtmc);
					  var pk1 = $(this).attr("id").substring(9);
					  $("#dt2_ZDMC_"+pk1).val(item.zdmc);
					  $("#dt2_XTPK1_"+pk1).val(item.pk1);
					  $("#dt2_ZDPK1_"+pk1).val(item.zdpk1);
					  
				 });	
			});
			$('#dt2').find("[id^='dt2_START_DATE_']").each(function(){
				  var pk1 = $(this).attr("id").substring(15);
				  laydate.render({
					  elem: '#dt2_START_DATE_'+pk1, //指定元素
					  type:'datetime'
				  });
				  laydate.render({
					  elem: '#dt2_END_DATE_'+pk1, //指定元素
					  type:'datetime'
				  });	
			});
		 },
		 error:function(data, textStatus){alert(data.message+'----'+textStatus);}
	 });
 }
//所属卫星的字典
function getwx(){
	$.ajax({
		 type: "POST",
		 contentType: "application/json",
		 url: "/plats/lms/jsp/CKRWDD_GETWXMC.jsp",
		 data: "",
		 async: false,
		 dataType: "json",
		 success: function (msg) {
			$('#dt2').find("[id^='dt2_WXMC_']").each(function(){					
				 $(this).autocomplete(msg, {
					 max: 30,
					 minChars:0,
					 matchContains: true,//从头开始匹配还是要在字符串内部查看匹配false为从开头匹配
					 formatItem: function (row, i, max) {
						 return  row.cn;
					 },
					 formatMatch: function(row, i, max){
						 return row.cn;
					 }
				 }).result(function(event, item) {
					  $(this).val(item.cn);
					  var pk1 = $(this).attr("id").substring(9);
					  $("#dt2_WXPK1_"+pk1).val(item.en);
				 });	
			}); 
		 },
		 error:function(data, textStatus){alert(data.message+'----'+textStatus);}
	 });
 }
 //系统所属站点的字典
 function getzd(){
	$.ajax({
		 type: "POST",
		 contentType: "application/json",
		 url: "/plats/lms/jsp/CKRWDD_GETZDMC.jsp",
		 data: "",
		 async: false,
		 dataType: "json",
		 success: function (msg) {
			$('#dt2').find("[id^='dt2_ZDMC_']").each(function(){					
				 $(this).autocomplete(msg, {
					 max: 30,
					 minChars:0,
					 matchContains: true,//从头开始匹配还是要在字符串内部查看匹配false为从开头匹配
					 formatItem: function (row, i, max) {
						 return  row.cn;
					 },
					 formatMatch: function(row, i, max){
						 return row.cn;
					 }
				 }).result(function(event, item) {
					  $(this).val(item.cn);
					  var pk1 = $(this).attr("id").substring(9);
					  $("#dt2_ZDPK1_"+pk1).val(item.en);
				 });	
			}); 
		 },
		 error:function(data, textStatus){alert(data.message+'----'+textStatus);}
	 });
 }
//加载方法
function  __pageLoad() {
	document.all['num'].value = "20";//默认每页显示20条
	document.all['currentpage'].innerHTML = "1";//打开页面显示第一页
	//getValue();
}
//首页
function first(){
	num = document.all['num'].value;
	currentpage = "1";
	document.all['currentpage'].innerHTML = "1";
	$.ajax({
		type: 'POST',
		data:{"currentpage":currentpage,"num":num},
		url: "/plats/lms/jsp/load/CKRWDD_GZJL_LOAD.jsp",
		error: function () {
			//alert('请求失败');
		},  
		success:function(data){
			data = $.trim(data);
			$("#ds1value").html(data.split("counts")[0]);	
			getCount(data.split("counts")[1]);
			getxtzd();
			getwx();
			getzd();
		}
	 });
}
//上一页
function prev(){
	num = document.all['num'].value;
	currentpage = document.all['currentpage'].innerHTML;
	if(currentpage==1){
		currentpage = currentpage;
	}else{
		currentpage = parseInt(currentpage)-1;
	}
	document.all['currentpage'].innerHTML = currentpage;
	$.ajax({
		type: 'POST',
		data:{"currentpage":currentpage,"num":num},
		url: "/plats/lms/jsp/load/CKRWDD_GZJL_LOAD.jsp",
		error: function () {
			//alert('请求失败');
		},  
		success:function(data){
			data = $.trim(data);
			$("#ds1value").html(data.split("counts")[0]);	
			getCount(data.split("counts")[1]);
			getxtzd();
			getwx();
			getzd();
		}
	});
}
//下一页
function next(){	
	num = document.all['num'].value;
	currentpage = document.all['currentpage'].innerHTML;
	if(currentpage==totalpage){
		currentpage = currentpage;
	}else{
		currentpage = parseInt(currentpage)+1;
	}
	document.all['currentpage'].innerHTML = currentpage;
	$.ajax({
		type: 'POST',
		data:{"currentpage":currentpage,"num":num},
		url: "/plats/lms/jsp/load/CKRWDD_GZJL_LOAD.jsp",
		error: function () {
			//alert('请求失败');
		},  
		success:function(data){
			data = $.trim(data);
			$("#ds1value").html(data.split("counts")[0]);	
			getCount(data.split("counts")[1]);
			getxtzd();
			getwx();
			getzd();
		}
	});
}
//最后一页
function last(){
	num = document.all['num'].value;
	currentpage = totalpage;
	document.all['currentpage'].innerHTML = currentpage;
	$.ajax({
		type: 'POST',
		data:{"currentpage":currentpage,"num":num},
		url: "/plats/lms/jsp/load/CKRWDD_GZJL_LOAD.jsp",
		error: function () {
			//alert('请求失败');
		},  
		success:function(data){
			data = $.trim(data);
			$("#ds1value").html(data.split("counts")[0]);	
			getCount(data.split("counts")[1]);
			getxtzd();
			getwx();
			getzd();
		}
	});
}
//设置
function setPage(){
	numPage2 = document.all['numPage2'].value;
	if(numPage2!=''){
		if(numPage2>totalpage){
			numPage2 = totalpage;
		}
		if(numPage2<=0){
			numPage2=1;
		}
		currentpage = numPage2;
	}else{
		currentpage = document.all['currentpage'].innerHTML;
	}	
	num = document.all['num'].value;
	if(num>pagecount){
		numPage2=1;
		currentpage=1;
	}
	document.all['numPage2'].value = numPage2;
	document.all['currentpage'].innerHTML = currentpage;
	$.ajax({
		type: 'POST',
		data:{"currentpage":currentpage,"num":num},
		url: "/plats/lms/jsp/load/CKRWDD_GZJL_LOAD.jsp",
		error: function () {
			alert('请求失败');
		},  
		success:function(data){
			data = $.trim(data);
			$("#ds1value").html(data.split("counts")[0]);	
			getCount(data.split("counts")[1]);
			getxtzd();
			getwx();
			getzd();
		}
	});
}
//回调函数 得到数据总条数
function getCount(v){
	document.all['totalcount'].innerHTML = v;
	num = document.all['num'].value;
	pagecount = v;
	totalpage = Math.ceil(pagecount/num);
	document.all['totalpage'].innerHTML = totalpage;
	if(document.all['totalcount'].innerHTML=="undefined"){
		document.all['totalcount'].innerHTML="0";
		document.all['totalpage'].innerHTML = "0";
	}
}

var list =  new Array();
//从表单取值
function setValue(){
	list =  new Array();
	$('#dt2 TBODY tr').each(function(i){	
		var map2 = {};
		if(i>0){
			$(this).find("[id^='dt2_']").each(function(){
				map2[$(this).attr("id").substring(4,$(this).attr("id").lastIndexOf("_"))] = $(this).val();
			});
			list.push(map2);
		}
	});
}

//保存方法
function _save(){
	setValue();	//获取值，获取后转成json
	var str = JSON.stringify(list);
	str=encodeURI(str);
	$.ajax({  
		type: 'POST',
		data:{"map":str},
		url: "/plats/lms/jsp/action/CKRWDD_GZJL_UAS.jsp",
		error: function () {
		//	alert('请求失败');
		},  
		success:function(data){
			alert('操作成功！');
		}
	});	
}

//添加过站记录
function _addjl(){
	var len = $ ("#dt2 TBODY tr").length;
	$("#dt2 TBODY tr").each(function(i){
		var nowTr=$(this);
		if(len==(i+1)){
			$.ajaxSettings.async = false;//在$.post()前把ajax设置为同步：
			$.post("/plats/lms/jsp/action/CKRWDD_GZJL_SINGLEDATA.jsp?num="+len,{},function(data){
				data=$.trim(data);
				$(nowTr).after(data);
				getxtzd();
				getwx();
				getzd();
			})			
		}
	});	
}
//删除过站记录
function _del(pk,obj){
	if(confirm("确定删除？")){
		$.ajax({  
			type: 'POST',
			data:{"pk1":pk},
			url: "/plats/lms/jsp/action/CKRWDD_GZJL_DEL.jsp",
			error: function () {
				//alert('请求失败');
			},  
			success:function(data){
				$(obj).parent().parent().remove();
				alert("删除成功");
				
			}
		});
	}
}

</SCRIPT>
<%!
	private String getDic(CMDUniOperation del,String type1,String enname)throws Exception{
        String result= "";
        Collection holiColl=del.loadBySQLStatementAndReturnFields("S_DIC", "SELECT CNNAME FROM S_DIC WHERE TYPE1='"+type1+"'" + " AND ENNAME='"+enname+"'", new String[]{"CNNAME"});
        if(holiColl!=null&&holiColl.size()>0){
            UniversalValueObject hUvo=(UniversalValueObject)holiColl.iterator().next();
            result=hUvo.getString("CNNAME", "");
        }
        return result;
    }
%>
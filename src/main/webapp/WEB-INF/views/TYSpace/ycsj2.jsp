<%@ page contentType="text/html; charset=GBK"
    import="
            java.sql.*,
            java.lang.*,
            java.util.*,
            com.easycon.platform.frame.dao.DAOUniversal,
            com.easycon.platform.po.UniversalValueObject,
            com.easycon.credit.contract.delegate.DELContract,
            com.easycon.credit.contract.view.CRDContractMainView,
            com.easycon.platform.system.db.DBTransaction,
			com.easycon.platform.system.dao.*,
			com.easycon.platform.db.*,
			com.easycon.platform.frame.CMDUniOperation,
			java.util.Collections
			"%>
<%@ page import="com.easycon.platform.frame.delegate.DELUniAutoCode"%>
<%@ page import="com.easycon.platform.util.UuidGenerator"%>
<%@ page import ="java.util.*,com.easycon.platform.system.po.*"%>
<%@ page import ="com.easycon.platform.system.util.UTILSystemProperty" %>
<%@ page import ="java.text.SimpleDateFormat,java.text.DateFormat" %>
<%@ taglib uri="http://www.myDev.com/tags/ui-tags" prefix="ui" %>
<%
	UniversalValueObject uvo = null;
	String pk1 = "";
	if(null != request.getParameter("pk1")){
		pk1 = (String)request.getParameter("pk1");
	}
	String type = "";
	if(null != request.getParameter("type")){
		type = (String)request.getParameter("type");
	}
	DELUniAutoCode autoCode = new DELUniAutoCode();
	String setpk1 = UuidGenerator.generate("");
	String logUserCodecn = "simon";
    if (request.getSession().getAttribute(UTILSystemProperty.CURRENTPOSUSER) != null) {
	    logUserCodecn = ( (POSUser) request.getSession().getAttribute(UTILSystemProperty.CURRENTPOSUSER)).getCnname();
    }
	String logBm = "simon";
    if (request.getSession().getAttribute(UTILSystemProperty.CURRENTPOSDEPT) != null) {
		logBm = ( (POSDept) request.getSession().getAttribute(UTILSystemProperty.CURRENTPOSDEPT)).getCnname();
    }
	DateFormat shortDf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Calendar calendar = Calendar.getInstance();
	String time=shortDf.format(calendar.getTime());
%>
<!--CKRWDD_GZJL_TAG-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>ң������</title>
<SCRIPT language=javascript src="/plats/js/laydate/laydate.js" charset="utf-8"></SCRIPT>
<SCRIPT language=javascript src="/plats/js/jquery-1.7.2.js"></SCRIPT>
<SCRIPT language=javascript src="/plats/js/json2.js"></SCRIPT>
<SCRIPT language=javascript src="/plats/js/autocomplete/jquery.autocomplete.min.js"></SCRIPT>
<link href="/plats/js/autocomplete/jquery.autocomplete.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
.uiTable td{
	 vertical-align:middle;
	 font: normal 13px "΢���ź�";
}
.ty_table td{
	 vertical-align:middle;
	 font: normal 13px "΢���ź�";
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
<ui:page id='page1' active='true'>

<BR>
<div style="border: 1px solid #B7D9F5;padding:1px 1px 1px 1px;width:100%">
<TABLE cellpadding=0 cellspacing=0 style='width:1500px' align="center">
	<TR>
		<TD style='width:4px;height:29px;'><img src='/plats/platform/img/images/bg_top1.gif'></TD>
		<TD style='background: url(/plats/platform/img/images/bg_top2.gif);padding-left:5px'>
			<div style="float:left;width:53%;text-align:right"><font style='FONT-SIZE: 9pt; FONT-FAMILY: ΢���ź�; color:#33597F'>����ң������</a></font></div>
		</TD>
		<TD style='width:4px;height:29px'><img src='/plats/platform/img/images/bg_top3.gif'></TD>
	</TR>
</TABLE>


<div id="ds1value" name="ds1value" width="1300" align="center">
	<TABLE cellSpacing=0 width=1500 cellPadding=0 border=0 id=dt2 class='ty_table'>
		<THEAD>
			<TR class=table01 height='32px' id=header>
				<!--����ͷ-->
				<TD align=middle>�¶�</TD>
				<TD align=middle>״̬</TD>
				<TD align=middle>�˿�</TD>
				<TD align=middle>�˿�K</TD>
				<TD align=middle>GPSң��</TD>
				<TD align=middle>X���η����</TD>
				<TD align=middle>�ӿڰ�ң��</TD>
				<TD align=middle>��������</TD>
				<TD align=middle>�غɼ����</TD>
				<TD align=middle>��������ּ�΢�ƽ���</TD>
			</TR>
		</THEAD>
		<TBODY>
			<tr bgcolor=white>
				<TD width=20 align=center valign="top">
					<div style="height:800px;overflow-y:auto;">
						<TABLE cellSpacing=0 width="125px" cellPadding=0 border=0 id=dt2 class='ty_table'>
							<THEAD>
								<TR class=table01 height='32px' id=header>
									<!--����ͷ-->
									<TD align=middle>����</TD>
									<TD align=middle>ֵ</TD>
								</TR>
							</THEAD>
							<TBODY>
							<%for(int i=0;i<40;i++){%>
								<tr bgcolor=white>
									<TD align='center'>
										OBC�¶�1
									</TD>
									<TD align='center'>
										10
									</TD>
								</tr>
							<%}%>
							</TBODY>
						</TABLE>
					</div>
				</TD>
				<TD align='center' valign="top">
					<div style="height:800px;overflow-y:auto;">
						<TABLE cellSpacing=0 width="125px" cellPadding=0 border=0 id=dt2 class='ty_table' align='center'>
							<THEAD>
								<TR class=table01 height='32px' id=header>
									<!--����ͷ-->
									<TD align=middle>����</TD>
									<TD align=middle>ֵ</TD>
								</TR>
							</THEAD>
							<TBODY>
							<%for(int i=0;i<26;i++){%>
								<tr bgcolor=white>
									<TD align='center'>
										p1
									</TD>
									<TD align='center'>
										TY2
									</TD>
								</tr>
							<%}%>
							</TBODY>
						</TABLE>
					</div>
				</TD>
				<TD align='center' valign="top">
					<div style="height:800px;overflow-y:auto;">
						<TABLE cellSpacing=0 width="125px" cellPadding=0 border=0 id=dt2 class='ty_table'>
							<THEAD>
								<TR class=table01 height='32px' id=header>
									<!--����ͷ-->
									<TD align=middle>����</TD>
									<TD align=middle>ֵ</TD>
								</TR>
							</THEAD>
							<TBODY>
							<%for(int i=0;i<18;i++){%>
								<tr bgcolor=white>
									<TD align='center'>
										p1
									</TD>
									<TD align='center'>
										TY2
									</TD>
								</tr>
							<%}%>
							</TBODY>
						</TABLE>
					</div>
				</TD>

				<TD align='center' valign="top">
					<div style="height:800px;overflow-y:auto;">
						<TABLE cellSpacing=0 width="125px" cellPadding=0 border=0 id=dt2 class='ty_table'>
							<THEAD>
								<TR class=table01 height='32px' id=header>
									<!--����ͷ-->
									<TD align=middle>����</TD>
									<TD align=middle>ֵ</TD>
								</TR>
							</THEAD>
							<TBODY>
							<%for(int i=0;i<16;i++){%>
								<tr bgcolor=white>
									<TD align='center'>
										p1
									</TD>
									<TD align='center'>
										TY2
									</TD>
								</tr>
							<%}%>
							</TBODY>
						</TABLE>
					</div>
				</TD>

				<TD align='center' valign="top">
					<div style="height:800px;overflow-y:auto;">
						<TABLE cellSpacing=0 width="125px" cellPadding=0 border=0 id=dt2 class='ty_table'>
							<THEAD>
								<TR class=table01 height='32px' id=header>
									<!--����ͷ-->
									<TD align=middle>����</TD>
									<TD align=middle>ֵ</TD>
								</TR>
							</THEAD>
							<TBODY>
							<%for(int i=0;i<23;i++){%>
								<tr bgcolor=white>
									<TD align='center'>
										p1
									</TD>
									<TD align='center'>
										TY2
									</TD>
								</tr>
							<%}%>
							</TBODY>
						</TABLE>
					</div>
				</TD>

				<TD align='center' valign="top">
					<div style="height:800px;overflow-y:auto;">
						<TABLE cellSpacing=0 width="125px" cellPadding=0 border=0 id=dt2 class='ty_table'>
							<THEAD>
								<TR class=table01 height='32px' id=header>
									<!--����ͷ-->
									<TD align=middle>����</TD>
									<TD align=middle>ֵ</TD>
								</TR>
							</THEAD>
							<TBODY>
							<%for(int i=0;i<22;i++){%>
								<tr bgcolor=white>
									<TD align='center'>
										p1
									</TD>
									<TD align='center'>
										TY2
									</TD>
								</tr>
							<%}%>
							</TBODY>
						</TABLE>
					</div>
				</TD>

				<TD align='center' valign="top">
					<div style="height:800px;overflow-y:auto;">
						<TABLE cellSpacing=0 width="125px" cellPadding=0 border=0 id=dt2 class='ty_table'>
							<THEAD>
								<TR class=table01 height='32px' id=header>
									<!--����ͷ-->
									<TD align=middle>����</TD>
									<TD align=middle>ֵ</TD>
								</TR>
							</THEAD>
							<TBODY>
							<%for(int i=0;i<30;i++){%>
								<tr bgcolor=white>
									<TD align='center'>
										p1
									</TD>
									<TD align='center'>
										TY2
									</TD>
								</tr>
							<%}%>
							</TBODY>
						</TABLE>
					</div>
				</TD>

				<TD align='center' valign="top">
					<div style="height:800px;overflow-y:auto;">
						<TABLE cellSpacing=0 width="125px" cellPadding=0 border=0 id=dt2 class='ty_table'>
							<THEAD>
								<TR class=table01 height='32px' id=header>
									<!--����ͷ-->
									<TD align=middle>����</TD>
									<TD align=middle>ֵ</TD>
								</TR>
							</THEAD>
							<TBODY>
							<%for(int i=0;i<10;i++){%>
								<tr bgcolor=white>
									<TD align='center'>
										p1
									</TD>
									<TD align='center'>
										TY2
									</TD>
								</tr>
							<%}%>
							</TBODY>
						</TABLE>
					</div>
				</TD>
				<TD align='center' valign="top">
					<div style="height:800px;overflow-y:auto;">
						<TABLE cellSpacing=0 width="125px" cellPadding=0 border=0 id=dt2 class='ty_table'>
							<THEAD>
								<TR class=table01 height='32px' id=header>
									<!--����ͷ-->
									<TD align=middle>����</TD>
									<TD align=middle>ֵ</TD>
								</TR>
							</THEAD>
							<TBODY>
							<%for(int i=0;i<20;i++){%>
								<tr bgcolor=white>
									<TD align='center' align='center'>
										p1
									</TD>
									<TD align='center' align='center'>
										TY2
									</TD>
								</tr>
							<%}%>
							</TBODY>
						</TABLE>
					</div>
				</TD>
				<TD align='center' valign="top">
					<div style="height:800px;overflow-y:auto;">
						<TABLE cellSpacing=0 width="125px" cellPadding=0 border=0 id=dt2 class='ty_table'>
							<THEAD>
								<TR class=table01 height='32px' id=header>
									<!--����ͷ-->
									<TD align=middle>����</TD>
									<TD align=middle>ֵ</TD>
								</TR>
							</THEAD>
							<TBODY>
							<%for(int i=0;i<20;i++){%>
								<tr bgcolor=white>
									<TD align='center'>
										p1
									</TD>
									<TD align='center'>
										TY2
									</TD>
								</tr>
							<%}%>
							</TBODY>
						</TABLE>
					</div>
				</TD>
			</tr>
		</TBODY>
	</TABLE>
</div>

<BR>
<!--
<TABLE style="width:100%;text-align:left;" class="uiTable" cellspacing=3 cellpadding=3>
<TR>
	<TD style="text-align:center">
	<input type=button class="tabbutton1" style="width:82px;height:25px;font:bold 14px '΢���ź�'" name=submit value="��Ӽ�¼" onclick="_addjl()" />
	<input type=button class="tabbutton1" style="width:70px;height:25px;font:bold 14px '΢���ź�'" name=submit value="����" onclick="_save()" />
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
var pagecount = "";//����������
var currentpage = "1";//��ǰҳ
var num = "20";//ÿҳ��ʾ����
var totalpage = "";//��ҳ��
var numPage2 = "";//ת��ҳ��
//������ֵ
function getValue(){
	 $.ajax({
		type: 'POST',
		data:{"currentpage":currentpage,"num":num},
		url: "/plats/lms/jsp/load/CKRWDD_GZJL_LOAD.jsp",
		error: function () {
			//alert('����ʧ��');
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
//����ϵͳվ����ֵ�
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
					 matchContains: true,//��ͷ��ʼƥ�仹��Ҫ���ַ����ڲ��鿴ƥ��falseΪ�ӿ�ͷƥ��
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
					  elem: '#dt2_START_DATE_'+pk1, //ָ��Ԫ��
					  type:'datetime'
				  });
				  laydate.render({
					  elem: '#dt2_END_DATE_'+pk1, //ָ��Ԫ��
					  type:'datetime'
				  });	
			});
		 },
		 error:function(data, textStatus){alert(data.message+'----'+textStatus);}
	 });
 }
//�������ǵ��ֵ�
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
					 matchContains: true,//��ͷ��ʼƥ�仹��Ҫ���ַ����ڲ��鿴ƥ��falseΪ�ӿ�ͷƥ��
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
 //ϵͳ����վ����ֵ�
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
					 matchContains: true,//��ͷ��ʼƥ�仹��Ҫ���ַ����ڲ��鿴ƥ��falseΪ�ӿ�ͷƥ��
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
//���ط���
function  __pageLoad() {
	//document.all['num'].value = "20";//Ĭ��ÿҳ��ʾ20��
	//document.all['currentpage'].innerHTML = "1";//��ҳ����ʾ��һҳ
	//getValue();
}
//��ҳ
function first(){
	num = document.all['num'].value;
	currentpage = "1";
	document.all['currentpage'].innerHTML = "1";
	$.ajax({
		type: 'POST',
		data:{"currentpage":currentpage,"num":num},
		url: "/plats/lms/jsp/load/CKRWDD_GZJL_LOAD.jsp",
		error: function () {
			//alert('����ʧ��');
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
//��һҳ
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
			//alert('����ʧ��');
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
//��һҳ
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
			//alert('����ʧ��');
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
//���һҳ
function last(){
	num = document.all['num'].value;
	currentpage = totalpage;
	document.all['currentpage'].innerHTML = currentpage;
	$.ajax({
		type: 'POST',
		data:{"currentpage":currentpage,"num":num},
		url: "/plats/lms/jsp/load/CKRWDD_GZJL_LOAD.jsp",
		error: function () {
			//alert('����ʧ��');
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
//����
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
			alert('����ʧ��');
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
//�ص����� �õ�����������
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
//�ӱ�ȡֵ
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

//���淽��
function _save(){
	setValue();	//��ȡֵ����ȡ��ת��json
	var str = JSON.stringify(list);
	str=encodeURI(str);
	$.ajax({  
		type: 'POST',
		data:{"map":str},
		url: "/plats/lms/jsp/action/CKRWDD_GZJL_UAS.jsp",
		error: function () {
		//	alert('����ʧ��');
		},  
		success:function(data){
			alert('�����ɹ���');
		}
	});	
}

//��ӹ�վ��¼
function _addjl(){
	var len = $ ("#dt2 TBODY tr").length;
	$("#dt2 TBODY tr").each(function(i){
		var nowTr=$(this);
		if(len==(i+1)){
			$.ajaxSettings.async = false;//��$.post()ǰ��ajax����Ϊͬ����
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
//ɾ����վ��¼
function _del(pk,obj){
	if(confirm("ȷ��ɾ����")){
		$.ajax({  
			type: 'POST',
			data:{"pk1":pk},
			url: "/plats/lms/jsp/action/CKRWDD_GZJL_DEL.jsp",
			error: function () {
				//alert('����ʧ��');
			},  
			success:function(data){
				$(obj).parent().parent().remove();
				alert("ɾ���ɹ�");
				
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
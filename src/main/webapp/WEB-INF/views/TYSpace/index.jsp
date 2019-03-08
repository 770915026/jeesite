<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="renderer" content="webkit" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <title>监控系统</title>
    <link rel="stylesheet" href="${ctxStatic}/TYSpace/css/style.css">
    <script src="${ctxStatic}/TYSpace/js/jquery.min.js"></script>
    <script src="${ctxStatic}/TYSpace/js/echarts.min.js"></script>
    <script src="${ctxStatic}/TYSpace/js/div_resize.js"></script>
</head>
<body>
    <div class="hd-page">
        <h1 class="logo-text">天仪研究院卫星在轨实景教学教研系统</h1>
        <div class="hd-bar">
            <div class="time"><i class="g-icon"></i><span id="time"></span></div>
            <a class="btn download" href=""><i class="g-icon"></i>下载数据</a>
            <a class="btn exit" href=""><i class="g-icon"></i>退出</a>
        </div>
    </div>
    <div class="wrap-orgin">
        <div class="wrap-main">
            <div class="echarts-wrap">
                <div class="inner js_tab_window">
                    <div class="tabItem on">
                        <ul class="echarts-list">
                            <li>
                                <div class="item">
                                    <div class="bar">
                                        <h3>卫星姿态变化1</h3>
                                        <a href="javascript:;" class="btn g-icon"></a>
                                    </div>
                                    <div class="cont">
                                        <div id="echart1" class="g-echart"></div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="item">
                                    <div class="bar">
                                        <h3>卫星姿态变化2</h3>
                                        <a href="javascript:;" class="btn g-icon"></a>
                                    </div>
                                    <div class="cont">
                                        <div id="echart2" class="g-echart"></div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="item">
                                    <div class="bar">
                                        <h3>卫星姿态变化3</h3>
                                        <a href="javascript:;" class="btn g-icon"></a>
                                    </div>
                                    <div class="cont">
                                        <div id="echart3" class="g-echart"></div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="item">
                                    <div class="bar">
                                        <h3>卫星姿态变化4</h3>
                                        <a href="javascript:;" class="btn g-icon"></a>
                                    </div>
                                    <div class="cont">
                                        <div id="echart4" class="g-echart"></div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="tabItem">
                        <div class="map-bg">
                            <a href="javascript:;" class="camera"></a>
                            <div class="con"></div>
                        </div>
                    </div>
                    <div class="tabItem">
                        <div class="map-bg">
                            <a href="javascript:;" class="camera"></a>
                            <div class="con"></div>
                        </div>
                    </div>
                    <div class="tabItem">
                        <div class="map-bg">
                            <a href="javascript:;" class="camera"></a>
                            <div class="con"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="info-wrap">
                <div class="left">
                    <ul class="info-list">
                        <li>
                            <div class="hd"><a href="javascript:;" class="btn"></a><h3>卫星温度变化</h3></div>
                            <div class="cont">
                                <div class="info-item2">
                                    <div class="pic s2">
                                        <div id="svg1"></div>
                                    </div>
                                    <div class="txt" id="wdtxt">
                                        
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="hd"><a href="javascript:;" class="btn"></a><h3>输出电流</h3></div>
                            <div class="cont">
                                <div class="info-item1">
                                    <div class="pic" style="background-image:url('${ctxStatic}/TYSpace/images/pic-1-1.png');"></div>
                                    <div class="txt">
                                        <div class="lab">系统输出电流</div>
                                        <div class="val">32°C</div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="hd"><a href="javascript:;" class="btn"></a><h3>GPS遥测</h3></div>
                            <div class="cont">
                                <div class="info-item2">
                                    <div class="pic">
                                        <svg class="svg1" width="100" height="100">
                                            <defs>
                                                <linearGradient id="SVGID_1_" gradientUnits="userSpaceOnUse" x1="10" y1="10" x2="90" y2="90">
                                                    <stop offset="0" style="stop-color:#5F4CFE" />
                                                    <stop offset="1" style="stop-color:#0DD5FA" />
                                                </linearGradient>
                                                <linearGradient id="SVGID_2_" gradientUnits="userSpaceOnUse" x1="10" y1="10" x2="90" y2="90">
                                                    <stop offset="0" style="stop-color:#FFE456" />
                                                    <stop offset="1" style="stop-color:#0DFAC8" />
                                                </linearGradient>
                                            </defs>
                                            <circle fill="none" stroke="url(#SVGID_1_)" stroke-width="5" cx="50" cy="50" r="42"/>
                                            <circle fill="none" stroke="url(#SVGID_2_)" stroke-width="10" cx="50" cy="50" r="42" stroke-dasharray="135 270" transform="rotate(210, 50, 50)" />
                                        </svg>
                                    </div>
                                    <div class="txt">
                                        <div class="item"><i class="icon s1"></i>定位星数<span>12</span></div>
                                        <div class="item"><i class="icon s2"></i>跟踪星数<span>36</span></div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="hd"><a href="javascript:;" class="btn"></a><h3>陀螺仪角速度</h3></div>
                            <div class="cont">
                                <div class="info-item1 s2">
                                    <div class="pic" style="background-image:url('${ctxStatic}/TYSpace/images/pic-1-2.png');"></div>
                                    <div class="txt">
                                        <div class="lab">OBC陀螺仪X轴角速度</div>
                                        <div class="val">23°/s</div>
                                        <div class="lab">OBC陀螺仪Y轴角速度</div>
                                        <div class="val">23°/s</div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="hd"><a href="javascript:;" class="btn"></a><h3>当前运行模式<span class="sub">最小系统</span></h3></div>
                            <div class="cont">
                                <div class="info-item4">
                                    <div class="item">
                                        <div class="icon s1"></div>
                                        <div class="txt">
                                            <p>主备份状态</p>
                                            <p>GPS<span class="strong">启动</span></p>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="icon s2"></div>
                                        <div class="txt">
                                            <p>太敏1<span class="strong">角度计算成功</span></p>
                                            <p>太敏2<span class="strong">地区反照</span></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="hd"><a href="javascript:;" class="btn"></a><h3>卫星部件开关状态</h3></div>
                            <div class="cont">
                                <div class="info-item5">
                                    <div class="item">
                                        <div class="inner">
                                            <div class="name">接口板1路</div>
                                            <label class="g-switch"><input type="checkbox" name="switch" checked="checked"></label>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="inner">
                                            <div class="name">接口板2路</div>
                                            <label class="g-switch"><input type="checkbox" name="switch"></label>
                                            <div class="sub">星敏</div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="inner">
                                            <div class="name">接口板3路</div>
                                            <label class="g-switch"><input type="checkbox" name="switch"></label>
                                            <div class="sub">载荷计算机</div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="inner">
                                            <div class="name">接口板4路</div>
                                            <label class="g-switch"><input type="checkbox" name="switch" checked="checked"></label>
                                            <div class="sub">GPS</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="right">
                    <div class="tab-list" id="ycpzb">
                        <ul class="list">
                        </ul>
                        <div class="omit"><ul class="list2"></ul></div>
                    </div>
                    <ul class="list-h1" id="ycData">
                        
                    </ul>
                </div>
            </div>
        </div>
        <div class="wrap-aside">
            <div class="aside-tit"><a class="btn js_hide_aside" href="javascript:;"></a>操作区域</div>
            <div class="star-info">
                <div class="star-sel">
                    当前卫星
                    <select class="select" name="" id="star_select">
                    </select>
                </div>
                <div id="starInfo" class="info" style="background-image: url('${ctxStatic}/TYSpace/images/pic-2-1.png')">
                    <div class="item"><div class="lab">卫星名称：</div><div class="val name" id="wxmc"></div></div>
                    <div class="item"><div class="lab">轨道信息：</div><div class="val name">低轨道，高度12510m</div></div>
                    <div class="item"><div class="lab">当前遥测地面站：</div><div class="val addr">酒泉遥测站</div></div>
                    <div class="item"><div class="lab">当前在轨时间：</div><div class="val addr">09:12:55-09:22:01</div></div>
                    <div class="item"><div class="lab">下次遥测地面站：</div><div class="val addr">新疆遥测站</div></div>
                    <div class="item"><div class="lab">下次遥测时间：</div><div class="val addr">10:21:55-10:20:32</div></div>
                </div>
            </div>
            <div class="view-items">
                <div class="title">视图类型</div>
                <ul class="list js_tab_tit">
                    <li class="s1 on"><a href="javascript:;"></a></li>
                    <li class="s2"><a href="javascript:;"></a></li>
                    <li class="s3"><a href="javascript:;"></a></li>
                    <li class="s4"><a href="javascript:;"></a></li>
                </ul>
            </div>
            <div class="remote-command">
                <div class="title">遥控指令</div>
                <div class="tab-list">
                    <ul class="list">
                        <li><a href="javascript:;">TY3</a></li>
                        <li><a href="javascript:;">TY5-1</a></li>
                        <li><a href="javascript:;">TY5-2</a></li>
                        <li><a href="javascript:;">TY9</a></li>
                    </ul>
                    <div class="omit"><ul class="list2"></ul></div>
                </div>
                <div class="list-command">
                    <ul class="list">
                        <li>
                            <div class="sum">1</div>
                            <a class="btn" href="javascript:;"></a>
                            <div class="cont">TY3-OBC(old) // 启动测试模式&nbsp;&nbsp;&nbsp;&nbsp;<img alt="已执行" src="${ctxStatic}/TYSpace/images/pic-dj.png">&nbsp;&nbsp;&nbsp;&nbsp;2019-03-01&nbsp;16:22:56&nbsp;&nbsp;&nbsp;&nbsp;张三</div>
                        </li>
                        <li>
                            <div class="sum">2</div>
                            <a class="btn" href="javascript:;"></a>
                            <div class="cont">TY3-OBC(old) // 启动测试模式&nbsp;&nbsp;&nbsp;&nbsp;<img alt="已执行" src="${ctxStatic}/TYSpace/images/pic-dj.png">&nbsp;&nbsp;&nbsp;&nbsp;2019-03-01&nbsp;16:22:56&nbsp;&nbsp;&nbsp;&nbsp;张三</div>
                        </li>
                        <li>
                            <div class="sum">3</div>
                            <a class="btn" href="javascript:;"></a>
                            <div class="cont">TY3-OBC(old) // 启动测试模式&nbsp;&nbsp;&nbsp;&nbsp;<img alt="已执行" src="${ctxStatic}/TYSpace/images/pic-dj.png">&nbsp;&nbsp;&nbsp;&nbsp;2019-03-01&nbsp;16:22:56&nbsp;&nbsp;&nbsp;&nbsp;张三</div>
                        </li>
                        <li>
                            <div class="sum">4</div>
                            <a class="btn" href="javascript:;"></a>
                            <div class="cont">TY3-OBC(old) // 启动测试模式&nbsp;&nbsp;&nbsp;&nbsp;<img alt="已执行" src="${ctxStatic}/TYSpace/images/pic-dj.png">&nbsp;&nbsp;&nbsp;&nbsp;2019-03-01&nbsp;16:22:56&nbsp;&nbsp;&nbsp;&nbsp;张三</div>
                        </li>
                        <li>
                            <div class="sum">5</div>
                            <a class="btn" href="javascript:;"></a>
                            <div class="cont">TY3-OBC(old) // 启动测试模式</div>
                        </li>
                        <li>
                            <div class="sum">6</div>
                            <a class="btn" href="javascript:;"></a>
                            <div class="cont">TY3-OBC(old) // 启动测试模式</div>
                        </li>
                        <li>
                            <div class="sum">7</div>
                            <a class="btn" href="javascript:;"></a>
                            <div class="cont">TY10-OBC(old) // 启动测试模式</div>
                        </li>
                        <li>
                            <div class="sum">8</div>
                            <a class="btn" href="javascript:;"></a>
                            <div class="cont">TY3-OBC(old) // 启动测试模式</div>
                        </li>
                        <li>
                            <div class="sum">9</div>
                            <a class="btn" href="javascript:;"></a>
                            <div class="cont">TY3-OBC(old) // 启动测试模式</div>
                        </li>
                        <li>
                            <div class="sum">10</div>
                            <a class="btn" href="javascript:;"></a>
                            <div class="cont">TY3-OBC(old) // 启动测试模式</div>
                        </li>
                        <li>
                            <div class="sum">11</div>
                            <a class="btn" href="javascript:;"></a>
                            <div class="cont">TY3-OBC(old) // 启动测试模式</div>
                        </li>
                        <li>
                            <div class="sum">12</div>
                            <a class="btn" href="javascript:;"></a>
                            <div class="cont">TY3-OBC(old) // 启动测试模式</div>
                        </li>
                        <li>
                            <div class="sum">13</div>
                            <a class="btn" href="javascript:;"></a>
                            <div class="cont">TY3-OBC(old) // 启动测试模式</div>
                        </li>
                    </ul>
                </div>
                <a href="" class="btn-h1">执行命令</a>
            </div>
        </div>
    </div>
    <a href="javascript:;" class="show-aside js_show_aside"></a>

    <svg class="svg_hide" version="1.1">
        <defs>
            <lineargradient id="SVGID_3">
                <stop offset="0" stop-color="#FFE456">
                </stop>
                <stop offset="1" stop-color="#FF5257">
                </stop>
            </lineargradient>
            <lineargradient id="SVGID_4">
                <stop offset="0" stop-color="#5F4CFE">
                </stop>
                <stop offset="1" stop-color="#0DD5FA">
                </stop>
            </lineargradient>
        </defs>
    </svg>

    <script src="${ctxStatic}/TYSpace/js/tools.js"></script>
    <script src="${ctxStatic}/TYSpace/js/index.js"></script>

</body>
</html>
<script type="text/javascript">
var contextPath="${contextPath}";
$("#star_select").change(function(e){
	$("#wxmc").html($("#star_select  option:selected").text());
});
$(function() {
	tick();//时间显示
	//卫星
	$.ajax({
        url: contextPath+"/TYSpace/wx/getWxmcAll",
        type:"post",
        dataType:"json",
        success: function (data){
            if(data.code==200){
                var wxList=data.hashMap.wxList;
                for(var i=0;i<wxList.length;i++){
                	if(i==0){
                		$("#wxmc").html(wxList[i].wxmc);
                	}
                	$("#star_select").append("<option value='"+wxList[i].wxmc+"'>"+wxList[i].wxmc+"</option>");
                }
            }
        }
    });
	//遥测数据表
	$.ajax({
        url: contextPath+"/TYSpace/ycpzb/getTableName",
        type:"post",
        dataType:"json",
        success: function (data){
            if(data.code==200){
                var ycpzblist=data.hashMap.ycpzblist;
                var ycpz = "<ul class='list'>";
                for(var i=0;i<ycpzblist.length;i++){
                	if(i==0){
                		ycpz += "<li class='on'><a href='javascript:void(0);' onclick='getYcData(\""+ycpzblist[i].tablenameen+"\");'>"+ycpzblist[i].tablenamecn+"</a></li>";
                		getYcData(ycpzblist[i].tablenameen);
                	}else{
                		ycpz += "<li><a href='javascript:void(0);' onclick='getYcData(\""+ycpzblist[i].tablenameen+"\");'>"+ycpzblist[i].tablenamecn+"</a></li>";
                	}
                }
                ycpz += "</ul><div class='omit'><ul class='list2'></ul>1111</div>";
                $("#ycpzb").html(ycpz);
            }
        }
    });
	
	//温度
	$.ajax({
        url: contextPath+"/TYSpace/ycpzb/getWd",
        type:"post",
        dataType:"json",
        success: function (data){
            if(data.code==200){
            	var ztlist = data.hashMap.ztlist;
            	list_wd = data.hashMap.ztlist;
            	var wdli = "";
            	for(var i=0;i < field_en.length;i++){
                    for(var j=0;j<1;j++){
                    	wdli += "<div class='item'><i class='icon s3'></i>"+field_cn[i]+"<span>"+ztlist[j][field_en[i]]+"</span></div>";
                    } 
                }
            	$("#wdtxt").html(wdli);
            }
        }
	});
	var wdtxt = setInterval(function () {
		if(index_wd<(list_wd.length-1)){
			index_wd++;
		}else{
			clearInterval(wdtxt);
		}
		var wdli = "";
    	for(var i=0;i < field_en.length;i++){
            for(var j=index_wd;j<(index_wd+1);j++){
            	wdli += "<div class='item'><i class='icon s3'></i>"+field_cn[i]+"<span>"+list_wd[j][field_en[i]]+"</span></div>";
            } 
        }
    	$("#wdtxt").html(wdli);
	}, 1000);
})
var index_wd = -1;
var list_wd;
//var field_cn = ['面板+X','面板-Z','面板-X','面板+Y','面板+Z','帆板背面+X'];
//var field_en = ['vp','vq','vr','vs','vt','vx'];
var field_cn = ['面板+X','面板-Z','面板-X'];
var field_en = ['vp','vq','vr'];
//获取遥测数据表
function getYcData(tableName){
	console.log(tableName);
	$.ajax({
        url: contextPath+"/TYSpace/ycpzb/getYcData",
        type:"post",
        dataType:"json",
        data:{"tableName":tableName},
        success: function (data){
            if(data.code==200){
            	var ycData = "";
            	var pzlist=data.hashMap.pzlist;
            	var ztlist=data.hashMap.ztlist;
            	for(var i=0;i<pzlist.length;i++){
            		var field_cn = pzlist[i].fieldcn;
            		var field_en = pzlist[i].fielden.replace("_","").toLowerCase();
            		var value = ztlist[0][field_en];
            		if(value==undefined){
            			value = "NULL";
            		}
            		ycData += "<li><div class='right'>"+value+"</div><div class='left'>"+field_cn+"</div></li>";
            	}
                //console.log(ycData);
                $("#ycData").html(ycData);
            }
        }
    });
}
//获取时间
function showLocale(objD){
		var str,colorhead,colorfoot;
		var yy = objD.getYear();
		if(yy<1900) yy = yy+1900;
		var MM = objD.getMonth()+1;
		if(MM<10) MM = '0' + MM;
		var dd = objD.getDate();
		if(dd<10) dd = '0' + dd;
		var hh = objD.getHours();
		if(hh<10) hh = '0' + hh;
		var mm = objD.getMinutes();
		if(mm<10) mm = '0' + mm;
		var ss = objD.getSeconds();
		if(ss<10) ss = '0' + ss;
		str = yy + "-" + MM + "-" + dd + " " + hh + ":" + mm + ":" + ss;
		return(str);
}
//刷新时间
function tick(){
	var today = new Date();
	$("#time").html(showLocale(today));
	window.setTimeout("tick()", 1000);
}
</script>
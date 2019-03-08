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
		<div class="qiye_right">
			<h3>
				<i class="icon iconfont icon-arrfill_u-copy"></i>进网
			</h3>
			<%-- <div class="status_info">
            	状态:
            <span class="posi_select">
                <select id="sta">
                    <option value="">全部</option>
                    <option value="0">已保存</option>
                    <option value="1">待发布</option>
                    <option value="2">已发布</option>
                </select>
                <span><img src="${ctxStatic}/taier/images/jiantou.png" /></span>
            </span>
            <span class="faburight_search" style="margin-top: 18px;">
                <input type="text" placeholder="输入产品任务编号或关键词" id="title"><a href="javascript:void(0);" onclick="querydata(1)" class="fabu_select">搜索</a>
            </span>
        </div> --%>
			<table class="table table-bordered fabu_table" id="datatable1">
				<tr class="theads">
					<td>设备名称</td>
					<td>设备型号</td>
					<td>状态</td>
					<td>申请日期</td>
					<td>打回意见</td>
					<td>操作</td>
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
        $("#lflist1").show();
        $("#lm8").addClass("qiye_xuanzhong");
        querydata(1);
    })

    function querydata(curpage){
        var qrystat = $("#sta").val();
        var qrytitle = $("#title").val();
        $.ajax({
            type:"post",
            url:"${ctx}/taier/tmcRwsqd/tmcRwsqdList",
            data:"pageNo=" + curpage + "&type=1" ,
            dataType:"json",
            success:function(msg){
                console.log(msg);
                var trs="";
                $(".datatr").remove();
                $.each(msg.list,function(i,info){
                	var dhyj=info.dhyj;
                	if(!dhyj){
                		dhyj="";
                	}
                	var status=info.status;
                	var operate="";
                	if(status=="0"){
                		status="已保存";
                		operate+='<a style="color:#2fa4e7;" href="${ctx}/taier/tmcRwsqd/viewEnterNet?pk1='+info.pk1+'&bh='+info.bh+'">编辑提交</a>&nbsp;';
                	}
                	if(status=="1"){
                		status="已提交";
                	}
                	if(status=="2"){
                		status="已通过";
                	}
                	if(status=="3"){
                		status="已打回";
                	}
                	operate+='<a style="color:#2fa4e7;" href="javaScript:void(0)" onclick="delTmcRwsqd(\''+info.pk1+'\',\''+info.bh+'\')">删除</a>';
                    trs+='<tr class="datatr">'+
                    		'<td>'+info.sbmc+'</td>\n'+
                    		'<td>'+info.sbxh+'</td>\n' +
                    		
                    		'<td>'+status+'</td>\n'+
                    		'<td>'+info.sqrq+'</td>\n' +
                    		'<td>'+dhyj+'</td>\n' +
                    		'<td>'+
                    			operate+
                    			
                    		'</td>'+
                        '</tr>';
                });
                $("#datatable1").append(trs);
                buildPage("pagenumber",msg.pageNo,msg.pageCount,msg.count,"querydata","");
            }
        })


    }
    
    function delTmcRwsqd(pk1,bh){
    	var r=confirm("确认要删除该企业联合信息吗?");
    	if(r==true){
    		$.ajax({
	            type:"post",
	            url:"${ctx}/taier/tmcRwsqd/delTmcRwsqd",
	            data:{"pk1":pk1,"bh":bh},
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
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
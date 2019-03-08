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
		<div class="qiye_right" id="datatable1">
			<h3>
				<i class="icon iconfont icon-arrfill_u-copy"></i>消息中心
			</h3>
			<ul class="pagination" id="pagenumber">
			</ul>
		</div>

	</section>
	<script>
    $(function(){
        addmenu();
        $("#lm15").addClass("qiye_xuanzhong");
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
                        '                    <a href="${ctx}/taier/tlMessage/detailCompany?id='+info.tlMessage.id+'"> <span class="name_listper" style="color: #006EFF;">'+info.tlMessage.tittle+'</span></a>\n' +
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
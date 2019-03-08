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
	<
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


	<section class="personal_cont">
		<div class="w1200">
			<div class="personal_left">
				<dl>
					<dt>
						<img src="${ctxStatic}/taier/images/avator.png"
							class="personal_avator">
					</dt>
					<dd>${fns:getUser().name}的账户</dd>
				</dl>
			</div>
			<div class="personal_right" id="datatable1">
				<p class="per_titless">
					<i class="icon iconfont icon-arrfill_u-copy"></i>消息中心
				</p>

				<ul class="pagination" id="pagenumber">
				</ul>
			</div>
		</div>
	</section>

	<script>
    $(function () {
        addmenu();
        $("#lm2").addClass("per_active");
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
                        '                    <a href="${ctx}/taier/tlMessage/detailUSer?id='+info.tlMessage.id+'"> <span class="name_listper" style="color: #006EFF;">'+info.tlMessage.tittle+'</span></a>\n' +
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
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
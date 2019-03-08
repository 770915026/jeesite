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
		<div class="qiye_right qiye_right1">
			<h3>
				<i class="icon iconfont icon-arrfill_u-copy"></i>企业联合信息发布
			</h3>
			<div class="fapiao1 fapiaos1">
				<div class="choose_paper">
					<input type="radio" class="paper" name="fapiao" value="fapiao1"
						checked>纸质发票
				</div>
				<div class="fapiao_sm">
					注：发票是指一切单位和个人在购销商品、提供或接受服务以及从事其他经营活动中，所开具和收取的业务凭证，是会计核算的原始依据，也是审计机关、税务机关执法检查的重要依据。收据才是收付款凭证，发票只能证明业务发生了，不能证明款项是否收付。
				</div>
				<section class="fapiao_info">
					<h4>发票抬头</h4>
					<p>
						<input type="radio" class="paper" name="zzt" value="0" checked>企业
						<input type="radio" class="paper" name="zzt" value="1">个人
					</p>
					<p class="fapiao_list">
						<label>名称</label><input id="invoiceName1" type="text"
							placeholder="请输入抬头名称 或 极速开票六位外码">
					</p>
					<p class="fapiao_list">
						<label>税号</label><input id="taxNumber1" type="text"
							placeholder="请输入纳税人识别号 或 社会统一征信代码">
					</p>
				</section>
				<section class="fapiao_info">
					<h4>发票地址</h4>
					<p>
						<input type="radio" name="yjt" class="paper" value="0" checked>自取
						<input type="radio" name="yjt" class="paper" value="1">邮寄
					</p>
					<p class="fapiao_list">
						<label>邮寄地址</label><input id="receiveAddress1" type="text"
							placeholder="请输入发票邮寄地址">
					</p>
				</section>
			</div>
			<div class="fapiao1 fapiaos2 dis_fapiao">
				<div class="choose_paper">
					<input type="radio" class="paper" name="fapiao" value="fapiao2">电子发票
				</div>
				<div class="fapiao_sm">
					注：发票是指一切单位和个人在购销商品、提供或接受服务以及从事其他经营活动中，所开具和收取的业务凭证，是会计核算的原始依据，也是审计机关、税务机关执法检查的重要依据。收据才是收付款凭证，发票只能证明业务发生了，不能证明款项是否收付。
				</div>
				<section class="fapiao_info">
					<h4>发票抬头</h4>
					<p>
						<input type="radio" class="paper" name="dzt" checked>企业 <input
							type="radio" class="paper" name="dzt">个人
					</p>
					<p class="fapiao_list">
						<label>名称</label><input id="invoiceName2" type="text"
							placeholder="请输入抬头名称 或 极速开票六位外码">
					</p>
					<p class="fapiao_list">
						<label>税号</label><input id="taxNumber2" type="text"
							placeholder="请输入纳税人识别号 或 社会统一征信代码">
					</p>
				</section>
				<section class="fapiao_info">
					<h4>收票人信息</h4>
					<p class="fapiao_list">
						<label>收票人手机</label><input id="receivePhone2" type="text"
							placeholder="请输入发票收票人手机号码">
					</p>
					<p class="fapiao_list">
						<label>收票人邮箱</label><input id="receiveEmail2" type="text"
							placeholder="请输入发票收票人邮箱">
					</p>
				</section>
			</div>
			<div class="fapiao1 fapiaos3 dis_fapiao">
				<div class="choose_paper">
					<input type="radio" class="paper" name="fapiao" value="fapiao3">不开发票
				</div>

			</div>
			<p class="table_btn fapiao_btn">
				<button class="save" onclick="submitdata()">保存</button>
			</p>

		</div>
	</section>

	<script>
    $('input[name="fapiao"]').click(function(){
        var val = $('input[name="fapiao"]:checked').attr('value');
        if(val == 'fapiao1'){
            $('.fapiaos2').addClass('dis_fapiao')
            $('.fapiaos3').addClass('dis_fapiao')
            $('.fapiaos1').removeClass('dis_fapiao')
        }
        if(val == 'fapiao2'){
            $('.fapiaos1').addClass('dis_fapiao')
            $('.fapiaos3').addClass('dis_fapiao')
            $('.fapiaos2').removeClass('dis_fapiao')
        }
        if(val == 'fapiao3'){
            $('.fapiaos1').addClass('dis_fapiao')
            $('.fapiaos2').addClass('dis_fapiao')
            $('.fapiaos3').removeClass('dis_fapiao')
        }
    })

    $(function(){
        addmenu();
        $("#lfywlist").show();
        $("#lm20").addClass("qiye_xuanzhong");
    })

    function submitdata(){
        var type = 0;
        var invoiceName;
        var taxNumber;
        var receiveType;
        var receiveAddress;
        var receivePhone;
        var receiveEmail;
        var type2 = 0;
        var val = $('input[name="fapiao"]:checked').attr('value');
        if(val == 'fapiao1'){
            type = 0;
            invoiceName = $("#invoiceName1").val();
            taxNumber = $("#taxNumber1").val();
            receiveType = $('input[name="yjt"]:checked').attr('value');
            receiveAddress = $("#receiveAddress1").val();
            receivePhone = "";
            receiveEmail = "";
            type2 = $('input[name="zzt"]:checked').attr('value');
        }
        if(val == 'fapiao2'){
            type = 1;
            invoiceName = $("#invoiceName12").val();
            taxNumber = $("#taxNumber2").val();
            receiveType = "";
            receiveAddress = "";
            receivePhone = $("#receivePhone2").val();
            receiveEmail = $("#receiveEmail2").val();
            type2 = $('input[name="dzt"]:checked').attr('value');
        }
        if(val == 'fapiao3'){
            type = 2;
            invoiceName = "";
            taxNumber = "";
            receiveType = "";
            receiveAddress = "";
            receivePhone = "";
            receiveEmail = "";
            type2 = "";
        }

        $.ajax({
            url: "${ctx}/taier/tlInvoice/save",
            type:"post",
            dataType:"json",
            data: {
                "type":type,
                "invoiceName":invoiceName,
                "taxNumber":taxNumber,
                "receiveType":receiveType,
                "receiveAddress":receiveAddress,
                "receivePhone":receivePhone,
                "receiveEmail":receiveEmail,
                "type2":type2
            },
            success: function (data){
                saveFlag=true;
                if(data.code==200){
                    alert(data.hashMap.msg);
                    window.location.href='${ctx}/taier/tlInvoice/form';
                }else{
                    alert("保存失败！");
                }

            }
        });
    }
</script>

</body>
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
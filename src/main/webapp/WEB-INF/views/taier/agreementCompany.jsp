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
				<li><a href="#"><i class="icon iconfont icon-xinxi"></i>厂家基本信息表</a></li>
				<li class="listtwo"><a href="#"><i
						class="icon iconfont icon-yewu"></i>业务</a>
					<ul class="qiyelist1">
						<li><a href="#">开票</a></li>
						<li><a href="#">缴费</a></li>
						<li><a href="#">进网</a></li>
						<li><a href="#">CCC</a></li>
						<li><a href="#" class="qiye_xuanzhong">企业联合信息发布 <img
								src="images/jiantou.png" class="zhankai"></a>
							<ul class="qiye_list2" style="display: none">
								<li><a href="#">业务流程及说明</a></li>
								<li><a href="#">业务申请</a></li>
								<li><a href="#">业务办理及状态查询</a></li>
								<li><a href="#">历史任务</a></li>
							</ul></li>
						<li><a href="#">预置应用列表 <img src="images/jiantou.png"
								class="zhankai"></a>
							<ul class="qiye_list2">
								<li><a href="#">业务流程及说明</a></li>
								<li><a href="#">业务申请</a></li>
								<li><a href="#">业务办理及状态查询</a></li>
								<li><a href="#">历史任务</a></li>
							</ul></li>
					</ul></li>
				<li><a href="#"><i class="icon iconfont icon-xiaoxi"></i></i>新消息</a></li>
				<li><a href="#"><i class="icon iconfont icon-mima"></i>修改密码</a></li>
				<li><a href="#"><i class="icon iconfont icon-praise-copy"></i>我的关注</a></li>
				<li><a href="#"><i class="icon iconfont icon-shoucang"></i>我的收藏</a></li>
			</ul>
		</div>
		<div class="qiye_right">
			<form id="dataform">
				<h3>
					<i class="icon iconfont icon-arrfill_u-copy"></i>泰尔视角用户服务协议
				</h3>
				<h2 class="agreement_title">泰尔视角用户服务协议</h2>
				<div class="agreement">
					第六条 用户的意见、代理人的作用<br> 代理人有权接受用户对产品的意见和申诉，及时通知制造商并关注制造商的切身利益为宜。<br>
					<br>
					<br> 第七条 向制造商不断提供信息<br>
					代理人应尽力向制造商提供商品的市场和竞争等方面的信息，每4个月需向制造商寄送工作报告。<br>
					<br>
					<br> 第八条 保证不竞争<br>
					代理人不应与制造商或帮助他人与制造商竞争，代理人更不应制造代理产品或类似于代销的产品，也不应从与制造商竞争的任何企业中获利。同时，代理人不应代理或销售与代理产品相同或类似的（不论是新的或旧的）任何产品。<br>
					此合约一经生效，代理人应将与其他企业签订有约束性的协议告知制造商。不论是作为代理的或经销的，此后再签订的任何协议均应告知制造商，代理人在进行其他活动时，决不能忽视其对制造商承担的义务而影响任务的完成。<br>
					<br>
					<br>

					本协议规定在此协议终止后的5年内，代理人不能生产和销售同类产品予以竞争，本协议终止后的1年内，代理人也不能代理其他类似产品，予以竞争。所有产品设计和说明均属制造商所有，代理人应在协议终止时归还给制造商。<br>
				</div>
				<div class="agree_agreement">
					<input type="checkbox" class="paper" id="ck">我已阅读泰尔视角用户服务协议
				</div>
				<div class="agree_sub">
					<button type="button" onclick="submit1()">同意并提交</button>
				</div>
			</form>
		</div>
	</section>
	<script>
    function submit1(){
        if($("#ck").is(':checked')){
            $("#dataform").attr("action","${ctx}/taier/user/releaseCompany");
            $("#dataform").submit();
        } else {
            alert("请先阅读并确定接受协议");
        }
    }

    $(function(){
        if(window.parent.refreshHeight){
            window.parent.refreshHeight();
        }
    })
</script>

</body>
</html>
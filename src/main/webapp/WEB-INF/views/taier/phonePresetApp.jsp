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
				<span class="date_qiye"><img src="images/qiye_img1.png">2018-07-10到期</span>
				<span class="shenfen"><img src="images/qiye_img2.png"
					class="qiye_avator"><span class="dengji">v3</span></span> <span
					class="qiye_name">张三三的账户</span>
			</div>
			<ul class="qiye_list">
				<li><a href="#"><i class="icon iconfont icon-xinxi"></i>厂家基本信息表</a></li>
				<li class="listtwo"><a href="#"><i
						class="icon iconfont icon-yewu"></i>业务</a>
					<ul class="qiyelist1">
						<li><a href="#">进网</a></li>
						<li><a href="#">CCC</a></li>
						<li><a href="#">企业联合信息发布 <img src="images/jiantou.png"
								class="zhankai"></a>
							<ul class="qiye_list2" style="display: none">
								<li><a href="#">业务流程及说明</a></li>
								<li><a href="#">业务申请</a></li>
								<li><a href="#">业务办理及状态查询</a></li>
								<li><a href="#">历史任务</a></li>
							</ul></li>
						<li><a href="#" class="qiye_xuanzhong">预置应用列表 <img
								src="images/jiantou.png" class="zhankai"></a>
							<ul class="qiye_list2">
								<li><a href="#" class="qiye_xuanzhong">业务流程及说明</a></li>
								<li><a href="#">业务申请</a></li>
								<li><a href="#">业务办理及状态查询</a></li>
								<li><a href="#">历史任务</a></li>
							</ul></li>
					</ul></li>
				<li><a href="#"><i class="icon iconfont icon-xiaoxi"></i></i>新消息</a></li>
				<li><a href="#"><i class="icon iconfont icon-mima"></i>修改密码</a></li>
				<li><a href="#"><i class="icon iconfont icon-praise-copy"></i>我的关注></a></li>
				<li><a href="#"><i class="icon iconfont icon-shoucang"></i>我的收藏</a></li>
				<li><a href="#"><i class="icon iconfont icon-guanli"></i>账户管理</a></li>
			</ul>
		</div>
		<div class="qiye_right operation_box">
			<h3>
				<i class="icon iconfont icon-arrfill_u-copy"></i>厂家基本信息表
			</h3>
			<div class="operation">
				<h5 class="operation_title">业务流程和说明</h5>
				<div class="operation_cont">
					--点击新办，可增加信息表。<br>
					--点击保存，保存已填好的信息表。保存后的信息表会自动生成以“任务号+产品名称+型号+信息发布表”为命名的列表，在下一个栏目“状
					态查询及修改”内可以点击看到完整信息，并可进行在线修改。
					--点击提交，将保存好的信息表提交到内部管理员。同时弹出缴费提示信息，预览发布。内部管理员收到提示有待审核业务信息。
				</div>
			</div>
			<h1 class="operation_title1">新申请任务的发布流程</h1>
			<div class="operation_shu">
				<img src="images/shu.png">
			</div>
			<h1 class="operation_title1">已发布的任务的修改流程</h1>
			<div class="operation_shu">
				<img src="images/shu2.png">
			</div>
			<h1 class="operation_title1">已发布的任务的修改流程</h1>
			<div class="operation_shu">
				<img src="images/shu3.png">
			</div>
		</div>
	</section>

</body>
</html>
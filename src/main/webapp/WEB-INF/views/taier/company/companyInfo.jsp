<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="toTop" content="true">
<!--bootstrap框架↓-->
<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="bootstrap-3.3.7-dist/css/bootstrap-theme.css"
	rel="stylesheet" type="text/css" />
<link href="css/swiper.min.css" rel="stylesheet" type="text/css">
<!--本页面CSS↓-->
<link rel="stylesheet" href="css/style.css">

<!--字体图标css-->
<link rel="stylesheet" href="font/demo.css">
<link rel="stylesheet" href="font/iconfont.css">
<!--bootstrap框架↓-->
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
<script type="text/javascript"
	src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="js/swiper.min.js"></script>
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
	<!--头部开始-->

	<section class="personal_box">
		<header class="head">
			<img src="images/logo.png"> <span class="righttop"> <span
				class="search"><input type="text" placeholder="请输入关键词"
					class="searchinput"><i class="icon iconfont icon-sousuo"></i></span>
				<span class="loginicon"><a href="#"><i
						class="icon iconfont icon-denglu"></i>登录</a></span> <span class="loginicon"><a
					href="#"><i class="icon iconfont icon-suo-copy"></i>注册</a></span>
			</span>
		</header>
		<nav>
			<ul class="nav_list">
				<li><a href="#">首页</a></li>
				<li><a href="#">新闻</a></li>
				<li><a href="#">在线业务办理</a></li>
				<li><a href="#">企业产品信息联合发布</a></li>
				<li><a href="#">行业分析报告</a></li>
				<li><a href="#" class="news_top1">最新活动<img
						src="images/hot.png" class="hot"></a></li>
				<li><a href="#">用户调查</a></li>
				<li class="active_li"><a href="#">关于我们</a></li>
				<li><a href="#">联系我们</a></li>
			</ul>
			<button class="perbtn">在线业务办理</button>
		</nav>
	</section>

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
				<li class="li_active"><i class="icon iconfont icon-xinxi"></i>厂家基本信息表</li>
				<li><i class="icon iconfont icon-yewu"></i>业务
					<ul>
						<li>进网</li>
						<li>CCC</li>
						<li>企业联合信息发布
							<ul>
								<li>业务流程及说明</li>
								<li>业务申请</li>
								<li>业务办理及状态查询</li>
								<li>历史任务</li>
							</ul>
						</li>
					</ul></li>
				<li><i class="icon iconfont icon-xiaoxi"></i></i>新消息</li>
				<li><i class="icon iconfont icon-mima"></i>修改密码</li>
				<li><i class="icon iconfont icon-praise-copy"></i>我的关注</li>
				<li><i class="icon iconfont icon-shoucang"></i>我的收藏</li>
				<li><i class="icon iconfont icon-guanli"></i>账户管理</li>
			</ul>
		</div>
		<div class="qiye_right">
			<h3>
				<i class="icon iconfont icon-arrfill_u-copy"></i>厂家基本信息表
			</h3>
			<table class="qiye_table table table-bordered">
				<tr>
					<td>申请企业名称中文<sup>*</sup></td>
					<td>北京电子信息科技有限公司</td>
				</tr>
				<tr>
					<td>申请企业名称英文</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>地址<sup>*</sup></td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>邮政编码<sup>*</sup></td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>联系人姓名<sup>*</sup></td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>联系人电话<sup>*</sup></td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>邮箱<sup>*</sup></td>
					<td><input type="text"></td>
				</tr>
			</table>
			<p class="table_btn">
				<button class="save">保存</button>
				<button>返回</button>
			</p>
		</div>
	</section>


	<footer class="foot">
		<div class="w1200">
			<span class="hrefto">友情链接</span> <a href="#">中国信息通信研究院</a><a href="#">泰尔网</a><a
				href="#">南方分院(深圳)</a> <a href="#">华东分院(上海)</a><a href="#">西部分院(重庆)</a>
			<a href="#">中国信息通信研究院</a><a href="#">泰尔网</a><a href="#">南方分院(深圳)</a>
			<a href="#">华东分院(上海)</a><a href="#">西部分院(重庆)</a> <a href="#">中国信息通信研究院</a><a
				href="#">泰尔网</a><a href="#">南方分院(深圳)</a> <a href="#">华东分院(上海)</a><a
				href="#">西部分院(重庆)</a> <a href="#">中国信息通信研究院</a><a href="#">泰尔网</a><a
				href="#">南方分院(深圳)</a> <a href="#">华东分院(上海)</a><a href="#">西部分院(重庆)</a>
		</div>
	</footer>
	<footer class="foots">
		<div class="w1200">
			<span>版权所有 © ：中国信息通信研究院（工信部电信研究院）
				技术支持：中国信息通信研究院（工信部电信研究院）信息管理中心 京ICP备09013372号-25 联系我们</span>
		</div>
	</footer>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/include/taglibmobile.jsp"%>
<%@ include file="/WEB-INF/views/taier/include.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="toTop" content="true">
</head>
<body>
	<!--头部end-->
	<section class="index_box">
		<div class="swiper-container index_swiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="images/banner.png" class="index_ban">
				</div>
				<div class="swiper-slide">
					<img src="images/banner1.png" class="index_ban">
				</div>
				<div class="swiper-slide">
					<img src="images/banner2.png" class="index_ban">
				</div>
				<div class="swiper-slide">
					<img src="images/banner3.png" class="index_ban">
				</div>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination"></div>
			<!-- Add Arrows -->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
		<div class="ban_navs">
			<ul class="aboutban_list">
				<li class="activeabout"><a href="#new">新闻动态</a></li>
				<li><a href="#yewu">在线业务办理</a></li>
				<li><a href="#qiye">企业产品信息联合发布</a></li>
				<li><a href="#hangye">行业分析报告</a></li>
				<li><a href="#huodong">最新活动</a></li>
			</ul>
		</div>
		<div class="w1200">
			<div class="index_news" id="new">
				<h1 class="innew_til">
					<span class="innew_left"><img src="images/img1.png"></span> <span
						class="til_right"><a href="javascript:void(0);"
						class="innew_active">热点新闻</a> / <a href="javascript:void(0);">行业动态</a>
						/ <a href="javascript:void(0);">产品动态</a> / <a
						href="javascript:void(0);">泰尔快报</a> <a href="javascript:void(0);"
						class="innewmore">more</a></span>
				</h1>
				<div class="innew_cont">
					<div class="incon_left">
						<img src="images/con1.png">
						<div class="incon_con">
							<h5>“家族办公室”成为高净值人士的首选！</h5>
							<small>2018/06/05</small> <img src="images/con2.png"
								class="tojintou">
						</div>
					</div>
					<div class="incon_right">
						<dl class="innew_list">
							<a href="javascript:void(0);">
								<dt>广东水利电力职业技术学院电子信息综合实训室设备中标公告</dt>
								<dd>黑河—布拉戈维申斯克黑龙江(阿穆尔河)大桥，路线全长19.9公里，是我国北方高纬度寒冷地区第一座叠合梁矮塔斜拉桥，设计由中、俄双方合作完成。是中俄界河公路大桥...</dd>
								<dd class="dd_time">
									08<br>
									<small>2017/02</small>
								</dd>
							</a>
						</dl>
						<dl class="innew_list innewl_act">
							<a href="javascript:void(0);">
								<dt>广东水利电力职业技术学院电子信息综合实训室设备中标公告</dt>
								<dd>黑河—布拉戈维申斯克黑龙江(阿穆尔河)大桥，路线全长19.9公里，是我国北方高纬度寒冷地区第一座叠合梁矮塔斜拉桥，设计由中、俄双方合作完成。是中俄界河公路大桥...</dd>
								<dd class="dd_time">
									08<br>
									<small>2017/02</small>
								</dd>
							</a>
						</dl>
						<dl class="innew_list">
							<a href="javascript:void(0);">
								<dt>广东水利电力职业技术学院电子信息综合实训室设备中标公告</dt>
								<dd>黑河—布拉戈维申斯克黑龙江(阿穆尔河)大桥，路线全长19.9公里，是我国北方高纬度寒冷地区第一座叠合梁矮塔斜拉桥，设计由中、俄双方合作完成。是中俄界河公路大桥...</dd>
								<dd class="dd_time">
									08<br>
									<small>2017/02</small>
								</dd>
							</a>
						</dl>
					</div>
				</div>
			</div>
			<div class="yewu_index" id="yewu">
				<h1 class="yin_title">
					<img src="images/con3.png">
				</h1>
				<div class="yin_cont">
					<dl>
						<a href="javascript:void(0);"><dt>
								<img src="images/yw1.png">
							</dt>
							<dd>CCC业务</dd>
							<dd>中国强制产品认证制度</dd></a>
					</dl>
					<dl class="yin_active">
						<a href="javascript:void(0);"><dt>
								<img src="images/yw2.png">
							</dt>
							<dd>进网业务</dd>
							<dd>中国强制产品认证制度</dd></a>
					</dl>
					<dl>
						<a href="javascript:void(0);"><dt>
								<img src="images/yw3.png">
							</dt>
							<dd>国内委托业务</dd>
							<dd>中国强制产品认证制度</dd></a>
					</dl>
					<dl>
						<a href="javascript:void(0);"><dt>
								<img src="images/yw4.png">
							</dt>
							<dd>网站相关业务</dd>
							<dd>中国强制产品认证制度</dd></a>
					</dl>
				</div>
			</div>
		</div>
	</section>

	<section class="inqiye" id="qiye">
		<div class="w1200">
			<h1 class="inqiye_title">
				<img src="images/qiye2.png">
			</h1>
			<div class="inqiye_cont">
				信息产业图文通信设备质量监督检验中心的前身是邮电部电报通信产品质量监督检验测试中心，该中心于1991年6月14日以原邮电部邮部【1991】346号文授权成立。后于1993年6月以邮科标【1993】）93号文更名为邮电部图文通信设备质量监督检验中心。于1999年8月以原信息产业部信科【1999】100号文“关于对部属质量监督检验机构统一更名的通知”更名为信息产业部图文通信设备质量监督检验中心。
			</div>
			<div class="inyiyelist">
				<dl>
					<a href="javascript:void(0);"><dt>
							<img src="images/qiye3.png">
						</dt>
						<dd>
							<i>1.证书样式</i>
						</dd>
						<dd>中国强制性产品认证制度</dd></a>
				</dl>
				<dl class="inyiyeact">
					<a href="javascript:void(0);"><dt>
							<img src="images/qiye4.png">
						</dt>
						<dd>
							<i>2.认证标志</i>
						</dd>
						<dd>中国强制性产品认证制度</dd></a>
				</dl>
				<dl>
					<a href="javascript:void(0);"><dt>
							<img src="images/qiye5.png">
						</dt>
						<dd>
							<i>3.泰尔报告样式</i>
						</dd>
						<dd>中国强制性产品认证制度</dd></a>
				</dl>
				<div class="moreqiye">
					<a href="/taier/jump/unionInfoListUSer">查看更多手机产品展示</a>
				</div>
			</div>
		</div>
	</section>


	<section class="index_tel">
		<div class="w1200">
			<h1 class="intel_tit">
				<img src="images/im21.png">
			</h1>
			<div class="qiehuanbox">
				<div class="qiehuanlist1 ">
					<dl class="info_list1">
						<dt>
							<img src="images/xq_img9.png"> <span>华为P20
								Pro（全网通）4000万徕卡1</span>
						</dt>
					</dl>
					<dl class="info_list1">
						<dt>
							<img src="images/xq_img10.png"> <span>华为P20
								Pro（全网通）4000万徕卡1</span>
						</dt>
					</dl>
					<dl class="info_list1">
						<dt>
							<img src="images/xq_img11.png"> <span>华为P20
								Pro（全网通）4000万徕卡1</span>
						</dt>
					</dl>
					<dl class="info_list1">
						<dt>
							<img src="images/xq_img12.png"> <span>华为P20
								Pro（全网通）4000万徕卡1</span>
						</dt>
					</dl>
					<dl class="info_list1">
						<dt>
							<img src="images/xq_img13.png"> <span>华为P20
								Pro（全网通）4000万徕卡1</span>
						</dt>
					</dl>
					<dl class="info_list1">
						<dt>
							<img src="images/xq_img14.png"> <span>华为P20
								Pro（全网通）4000万徕卡1</span>
						</dt>
					</dl>
				</div>
				<div class="moreqiye">
					<a href="/taier/jump/preSetAppListUSer">查看更多应用公示</a>
				</div>

			</div>

		</div>
	</section>

	<section class="index_industry" id="hangye">
		<div class="w1200">
			<h1 class="industry_tit">
				<img src="images/img2.png">
			</h1>
			<div class="indus_cont">
				<ul>
					<li><a href="javascript:void(0);"><span class="indus_num">01</span><span
							class="indus_co">中国质量认证中心关于强制性产品认证标志加施要求的通知 <img
								src="images/hy2.png" class="indus_r"></span></a></li>
					<li><a href="javascript:void(0);"><span class="indus_num">02</span><span
							class="indus_co">中国质量认证中心关于强制性产品认证标志加施要求的通知 <img
								src="images/hy2.png" class="indus_r"></span></a></li>
					<li class="indus_active"><a href="javascript:void(0);"><span
							class="indus_num">03</span><span class="indus_co">中国质量认证中心关于强制性产品认证标志加施要求的通知
								<img src="images/hy2.png" class="indus_r">
						</span></a></li>
					<li><a href="javascript:void(0);"><span class="indus_num">04</span><span
							class="indus_co">中国质量认证中心关于强制性产品认证标志加施要求的通知 <img
								src="images/hy2.png" class="indus_r"></span></a></li>
					<li><a href="javascript:void(0);"><span class="indus_num">05</span><span
							class="indus_co">中国质量认证中心关于强制性产品认证标志加施要求的通知 <img
								src="images/hy2.png" class="indus_r"></span></a></li>
					<li><a href="javascript:void(0);"><span class="indus_num">06</span><span
							class="indus_co">中国质量认证中心关于强制性产品认证标志加施要求的通知 <img
								src="images/hy2.png" class="indus_r"></span></a></li>
				</ul>
				<div class="indus_more">
					<a href="javascript:void(0);">更多<img src="images/xjt.png"></a>
				</div>
			</div>
		</div>
	</section>

	<section class="new_act" id="huodong">
		<div class="w1200">
			<h1 class="act_tit">
				<img src="images/img3.png">
			</h1>
			<div class="newact_list">
				<div class="act_left">
					<dl class="act_dl">
						<a href="javascript:void(0);"><dt>OPPO+ 上线，便捷服务不止加一点！</dt>
							<dd>更便捷的智能搜索，更贴心的 9 大功能入口，更个性化的问题推送，足不出户就能解决手机疑难杂症啦！</dd>
							<dd>
								<a href="javascript:void(0);" class="look_ht">查看话题<img
									src="images/xjt.png"></a>
							</dd></a>
					</dl>
				</div>
				<div class="act_rig">
					<img src="images/hy3.png" class="act_img">
				</div>
			</div>
			<div class="newact_list">
				<div class="act_left">
					<img src="images/hy3.png" class="act_img">

				</div>
				<div class="act_rig">
					<dl class="act_dl">
						<a href="javascript:void(0);"><dt>OPPO+ 上线，便捷服务不止加一点！</dt>
							<dd>更便捷的智能搜索，更贴心的 9 大功能入口，更个性化的问题推送，足不出户就能解决手机疑难杂症啦！</dd>
							<dd>
								<a href="javascript:void(0);" class="look_ht">查看话题<img
									src="images/xjt.png"></a>
							</dd></a>
					</dl>
				</div>
			</div>
		</div>
	</section>


	<section class="index_about">
		<div class="w1200">
			<h1>
				<img src="images/img4.png">
			</h1>
			<div class="inab_co">中国泰尔实验室（China Telecommunication Technology
				Labs）始于1981年9月21日，其前身是中国电话参考当量检测中心，由原国家标准总局和原中华人民共和国邮电部经（1981）邮科字957号文联合批准成立。2000年1月20日由原国家质量技术监督局和中华人民共和国信息产业部联合批准，同意将中国电话参考当量检测中心更名为中国泰尔实验室（质技监局认函【2000】15号文）。
			</div>
		</div>
	</section>
	<script>
    var swiper = new Swiper('.swiper-container', {
        spaceBetween: 30,
        centeredSlides: true,
        loop:true,
//        autoplay: {
//            delay:5000,
//            disableOnInteraction: false
//        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev'
        }
    });
</script>


</body>
</html>
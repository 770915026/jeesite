<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="toTop" content="true">
<%@ include file="/WEB-INF/views/taier/include.jsp"%>
<script type="text/javascript"
	src="http://webapi.amap.com/maps?v=1.4.4&key=8e2c24150d9743810be9ae4fa2461da5"></script>
<script type="text/javascript"
	src="${ctxStatic}/taier/view/js/latestActivityDetail.js?version=<%=Math.random()%>"></script>
<link rel="stylesheet" href="${ctxStatic}/taier/css/share.css">
<link rel="stylesheet" href="${ctxStatic}/taier/css/style.css">
<script type="text/javascript" src="${ctxStatic}/taier/js/share.js"></script>
<style>
.ywbla {
	background-color: #7d7d7d;
}

.ywbla:hover {
	background-color: #4285ff;
}
</style>
<script type="text/javascript">
		var markers=[];
	    var lngData;
	    var latData;
		$(document).ready(function() {
			lngData=$("#longitude").val();
			latData=$("#latitude").val();
			if(!lngData || lngData==null){
				lngData=116.397477;
				$("#longitude").val(lngData);
			}
			if(!latData || latData==null){
				latData=39.908692;
				$("#latitude").val(latData)
			}
			map = new AMap.Map('container', {
	            resizeEnable: true,
	            zoom: 15,
	            center: [lngData,latData]
	        });
	    	
	    	
	        AMap.service('AMap.Geocoder',function(){
	            geocoder = new AMap.Geocoder({
	                city: "010"//城市，默认：“全国”
	            });
	        })
	        //标记位置
	        markAddress(lngData, latData);
		});
		function markAddress(lngData, latData){
			lnglatXY = [lngData, latData];
	        geocoder.getAddress(lnglatXY, function (status, result) {
                if (status === 'complete' && result.info === 'OK') {
                    address = result.regeocode.formattedAddress;
                    map.remove(markers);
                    marker = new AMap.Marker({
                        position: lnglatXY,
                        title: address,
                        map: map,
                    });
                    marker.setMap(map);
                    markers.push(marker);
                    map.setCenter(lnglatXY);
                    $("#location-p").html(address);
                } else {
                }
            });
		}
		
	</script>

</head>
<body>
	<div class="container" style="padding-left: 0px; padding-right: 0px;">
		<!--右侧滚动导航-->
		<div class="taier-tips">
			<dl>
				<dd class="list">
					<a href="javascript:;">在线业务</a>
				</dd>
				<dd>
					<a href="${ctx}/taier/theNet/gotoCCC">CCC<br />业务
					</a>
				</dd>
				<dd>
					<a href="${ctx}/taier/theNet/gotoTheNet">进网<br />业务
					</a>
				</dd>
				<dd>
					<a href="javascript:;">国内<br />委托
					</a>
				</dd>
				<dd>
					<a href="javascript:;">网站<br />业务
					</a>
				</dd>
				<dd>
					<a href="javascript:;" class="ketan">客服<br />中心
					</a>
				</dd>
			</dl>
		</div>
		<!--右侧滚动导航 end-->
		<!--头部-->
		<div class="header-box">
			<!--LOGO-->
			<div class="taier-logo fl">
				<img src="${ctxStatic}/newtaier/images/logo.jpg">
			</div>
			<!--LOGO END-->
			<!--TAB导航-->
			<dl class="public-nav">
				<dd>
					<a href="${contextPath}/taier/jump/gotoFirstPage" menu="1">首页</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/jump/gotoNews" menu="2">新闻动态</a>
				</dd>
				<dd id="businessBar">
					<a href="javascript:void(0);" menu="3">业务办理</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/jump/gotoFirstPage#tezs" menu="30">泰尔证书</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/jump/unionInfoListUSer" menu="4">信息发布</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/jump/preSetAppListUSer" menu="5">应用公示</a>
				</dd>
				<dd>
					<a
						href="${contextPath}/taier/analysisReportFront/gotoAnalysisReport"
						menu="6">行业分析报告</a>
				</dd>
				<dd class="current">
					<a href="${contextPath}/taier/activityFront/gotoActivity" menu="7">小泰说</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/policyFront/gotoPolicy" menu="8">政策</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/jump/gotoAboutUs" menu="9">关于我们</a>
				</dd>
				<dd>
					<a href="${contextPath}/taier/jump/gotoFirstPage#contactUs"
						menu="10">联系我们</a>
				</dd>
			</dl>
			<div class="public-nav public-nav02" id="businessIntro"
				style="display: none;">
				<span class="business-tit">业务办理</span>
				<div class="business-list">
					<a href="${ctx}/taier/theNet/gotoCCC" class="ywbla"><img
						src="${ctxStatic}/newtaier/images/index-bg07.jpg" /></a> <a
						href="${ctx}/taier/theNet/gotoTheNet" class="ywbla"><img
						src="${ctxStatic}/newtaier/images/index-bg08.jpg" /></a> <a
						href="javascript:;" class="ywbla"><img
						src="${ctxStatic}/newtaier/images/index-bg09.jpg" /></a> <a
						href="javascript:;" class="ywbla"><img
						src="${ctxStatic}/newtaier/images/index-bg10.jpg" /></a>
				</div>
			</div>
			<!--业务办理 end-->
			<script type="text/javascript">
            voteIco({
                "voteIco":"businessBar",//点击元素Id
                "voteContent":"businessIntro"//展现内容Id
            });
        </script>
			<!--TAB导航 END-->
			<!--SEARCH-->
			<div class="form-box fr">
				<span class="search-input"> <input class="input" type=""
					name="" id="searchkey"> <em class="search-btn"
					onclick="search()">搜索按钮</em>
				</span>


				<c:if test="${fns:getUser().name eq null}">
					<a class="input-btn" href="${ctx}/logout">登录</a>
					<a class="input-btn" href="${contextPath}/taier/jump/register1">注册</a>
				</c:if>
				<c:if test="${fns:getUser().name ne null}">
					<a class="input-btn" href="javascript:void(0);"
						onclick="showuserinfo(this)">${fns:getUser().name}</a>
					<a class="input-btn" href="javascript:void(0);"
						onclick="framelogout()">退出登陆</a>
				</c:if>
			</div>
			<!--SEARCH END-->
		</div>
		<section class="new_acbox">
			<div class="w1200" style="position: relative;">
				<h2 class="ac_xqtit">${activity.title }<br> <span>${activity.describe }</span>
				</h2>
				<input style="position: absolute; right: 0px; top: 0px;"
					id="btnCancel" class="btn" type="button" value="返 回"
					onclick="history.go(-1)" />
				<div class="hd_list">
					<dl class="shop_xx">
						<a href="javascript:void(0);"><dt>
								<img src="${activity.banner }">
							</dt>
							<dd>${activity.title }</dd></a>
					</dl>
					<a href="javascript:void(0);"><p class="jutia">
							时 间： <span> <fmt:formatDate value="${activity.starttime}"
									type="both" dateStyle="full" pattern="yyyy-MM-dd hh:HH:mm" />
								至<fmt:formatDate value="${activity.endtime}" type="both"
									dateStyle="full" pattern="yyyy-MM-dd hh:HH:mm" /></span>
						</p>
						<p class="jutia">
							性 质：<span>${activity.nature}</span>
						</p>
						<p class="jutia">
							参 与：<span>${activity.joinNum}</span>
						</p> </a>
					<p class="last_shop">
						<span class="shop_time remaintTime"
							endTime="<fmt:formatDate value="${activity.endtime}" type="both" dateStyle="full" pattern="yyyy/MM/dd hh:HH:mm" />">
							<img src="${ctxStatic}/taier/images/biao.png"> 剩余时间： <span>3</span>天
							<span>3</span> 时 <span>3</span>分 <span>3</span>秒
						</span> <a href="javascript:void(0)"
							onclick="joinActivity('${activity.id}')" class="my_bm"> <i
							class="icon iconfont icon-xiugai"></i> <span>我要报名</span>
						</a>
					</p>
				</div>
				<div class="now_zt">当前有 ${activity.clickNum }人感兴趣，${activity.joinNum }人报名参加此活动
				</div>
				<div class="hd_c">活动形式：${fns:getDictLabel(activity.type, 'activity_type', '')}</div>
				<div class="hd_c">
					活动时间：
					<fmt:formatDate value="${activity.starttime}" type="both"
						dateStyle="full" pattern="yyyy-MM-dd hh:HH" />
					（提前半小时开始签到）
				</div>
				<div class="hd_c">活动地点：${activity.address}</div>
				<div id="container"
					style="height: 365px; width: 100%; margin: 20px 0"></div>
				<input type="hidden" id="longitude" value="${activity.longitude }" />
				<input type="hidden" id="latitude" value="${activity.latitude }" />
				<div class="hd_c">活动描述：${activity.describe }</div>
				<div class="xq_btn">
					<button class="${iflike eq '0'?'':'xq_active'}"
						onclick="saveLike('${activity.id}')">
						<i class="icon iconfont icon-dianzan"></i>${activity.likeNum}</button>
					<button onclick="saveCollect('${activity.id}')"
						class="${ifcollect eq '0'?'':'xq_active'}">
						<i class="icon iconfont icon-i-xin"></i>收藏
					</button>
					<button id="socialShare">
						<i class="icon iconfont icon-zhuanfa"></i>转发
					</button>
				</div>
				<script>
            $(function() {

                $("#socialShare").socialShare({
                    content: '',
                    url:'',
                    titile:''
                });

            });

        </script>
				<div class="xq_title xq_title2">参与评论</div>
				<div class="writebox">
					<textarea placeholder="" class="writepl" id="content"></textarea>
					<input type="hidden" id="parentcommid">
					<div class="pltj">
						<c:if test="${fns:getUser().userType eq null}">
							<a href="javascript:void(0);" onclick="framelogout()">登录</a>后参与评论
                </c:if>
						<c:if test="${fns:getUser().userType ne null}">
							<button onclick="saveComments('${activity.id}')">提交评论</button>
						</c:if>
					</div>
				</div>
				<div class="xq_title xq_title2">最新评论</div>
				<div class="pl_lists" style="margin-bottom: 50px;">
					<div id="commentList"></div>

					<p class="rela_more">
						<a href="javascript:void(0);" id="getMoreComments"
							onclick="getMoreComments()">查看更多评论 >></a>
					</p>
				</div>
			</div>
		</section>
		<!--FOOTER-->
		<div class="footer-wrap" id="contactUs">
			<div class="footer-outer">
				<!--联系方式-->
				<div class="footer-container lines">
					<div class="enterprise-intro">
						<div class="maps fl">
							<div id=container style="height: 100%; width: 100%;"></div>
						</div>
						<div class="contact-us fr">
							<h3 class="title">联系我们</h3>
							<p class="text">
								公司地址: <span id="address"></span><br />联系电话：<span id="phone"></span><br />泰尔邮箱：<span
									id="email"></span>
							</p>
							<h3 class="title mt26">关注泰尔视角</h3>
							<p class="follow-us">
								<img id="qrwximg"
									src="${ctxStatic}/newtaier/images/taier-ico02.png"> <img
									id="qrwbimg" src="${ctxStatic}/newtaier/images/taier-ico03.png">
							</p>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<!--联系方式 end-->
				<!--在线留言-->
				<div class="footer-container">
					<div class="online-message">
						<h3 class="title">在线留言</h3>
						<div class="form-box">
							<span class="input-box"> <input class="input"
								style="width: 209px;" id="lyname" type="text" placeholder="姓名">
								<input class="input" style="width: 209px;" id="lyphone"
								type="tel" placeholder="电话"> <input class="input"
								style="width: 209px;" id="lyemail" type="email" placeholder="邮箱">
							</span>
							<div class="textarea-box">
								<span class="textarea-div" style="text-align: left;"> <textarea
										class="textarea" placeholder="" id="lycontent"
										style="width: 100%;"></textarea>
								</span>
							</div>
							<div style="margin-top: 15px; text-align: center;">
								<a class="input-btn" href="javascript:void(0);" id="lyBtn">留言</a>
							</div>

						</div>
					</div>
				</div>
				<!--在线留言 end-->
			</div>
			<!--友情链接-->
			<div class="footer-container">
				<div class="oem-wrap">
					<div class="oem-outer lines">
						<h3 class="title">友情链接</h3>
						<div class="oem-link">
							<c:forEach items="${linkList }" var="link">
								<a href="${link.linkUrl }" target="_blank">${link.title }&nbsp;&nbsp;|</a>
							</c:forEach>
						</div>
					</div>
					<div class="record-number">ICP备案号：京ICP备09013372号-25</div>
				</div>

			</div>
			<!--友情链接 end-->
		</div>
		<script>
    var contextPath="${contextPath}"
    var ctx="${ctx}";
	$('.return_pl').click(function(){
	    console.log('a')
	    console.log($(this).parent().parent().index());
	    if($(this).parent().parent().find('.add_pl12').css('display')=='none'){
	        $(this).parent().parent().find('.add_pl12').show();
	        $(this).parent().parent().siblings().find('.add_pl12').hide();
	    } else{
	        $(this).parent().parent().find('.add_pl12').hide();
	    }
	})
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
		<!-- <script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");    // 创建Map实例
    map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);  // 初始化地图,设置中心点坐标和地图级别
    //添加地图类型控件
    map.addControl(new BMap.MapTypeControl({
        mapTypes:[
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
        ]}));
    map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
</script> -->
		<!-- Initialize Swiper -->
		<script type="text/javascript">
	var contextPath="${contextPath}"
    var ctxOne="${ctxOne}";
    var user_id='${user.id}';
    var id='${activity.id}';
    $(function(){
    })

    function framelogout(){
        window.parent.location.href='${ctx}/logout';
    }
</script>
</body>
</html>
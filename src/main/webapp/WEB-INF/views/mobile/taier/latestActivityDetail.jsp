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
<script type="text/javascript"
	src="http://webapi.amap.com/maps?v=1.4.4&key=8e2c24150d9743810be9ae4fa2461da5"></script>
<script type="text/javascript"
	src="${ctxStatic}/taier/view/js/latestActivityDetail.js?version=<%=Math.random()%>"></script>
<link rel="stylesheet" href="${ctxStatic}/taier/css/share.css">
<link rel="stylesheet" href="${ctxStatic}/taier/css/style.css">
<script type="text/javascript" src="${ctxStatic}/taier/js/share.js"></script>
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

		<!--右侧滚动导航 end-->
		<!--头部-->
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
		<section class="new_acbox zcdiv">
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
		<div class="footer-wrap">
			<ul class="footer-nav-box clearfix">
				<li><a href="${contextPath}/taier/jump/gotoFirstPage">首页</a></li>
				<li><a href="${contextPath}/taier/jump/gotoTaierauth">泰尔证书</a>
				</li>
				<li><a href="${contextPath}/taier/jump/unionInfoListUSer">信息发布</a>
				</li>
				<li><a href="${contextPath}/taier/jump/preSetAppListUSer">预置应用公示</a>
				</li>
				<li><a
					href="${contextPath}/taier/analysisReportFront/gotoAnalysisReport">行业分析报告</a>
				</li>
				<li class="liList"><span> <a
						href="${contextPath}/taier/activityFront/gotoActivity">小泰说</a>
				</span> <span> <a href="${contextPath}/taier/policyFront/gotoPolicy">政策</a>
				</span> <span> <a href="${contextPath}/taier/jump/gotoAboutUs">关于我们</a>
				</span> <span> <a href="${contextPath}/taier/jump/gotoConnectUs">联系我们</a>
				</span></li>
			</ul>
			<ul class="friend-box clearfix">
				<h3 class="friend-tit">友情链接</h3>
				<li id="linksli"></li>
			</ul>
			<p class="record-text">ICP备案号：京ICP备09013372号-25</p>
		</div>
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
<script type="text/javascript"
	src="${ctxStatic}/newtaiermobile/js/scripts.js"></script>
</html>
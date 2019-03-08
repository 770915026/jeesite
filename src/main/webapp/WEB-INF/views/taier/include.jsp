<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!--bootstrap框架↓-->
<link href="${ctxStatic}/taier/bootstrap-3.3.7-dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link
	href="${ctxStatic}/taier/bootstrap-3.3.7-dist/css/bootstrap-theme.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${ctxStatic}/taier/css/style.css">

<script type="text/javascript" src="${ctxStatic}/taier/js/swiper.min.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/newtaier/js/c.jquery1.8.3.min.js"></script>
<script type="text/javascript"
	src="http://webapi.amap.com/maps?v=1.4.4&key=8e2c24150d9743810be9ae4fa2461da5"></script>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/newtaier/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/taier/css/jquery.step.css" />
<script src="${ctxStatic}/taier/js/jquery.step.min.js"></script>

<script type="text/javascript" src="${ctxStatic}/newtaier/js/taier.js"></script>
<style>
.pagenu {
	display: block;
	width: 19px;
	text-align: center;
	width: auto;
}
</style>
<script>
    function search(){
        var searchkey = $("#searchkey").val();

        window.location.href="${contextPath}/taier/analysisReportFront/gotoAnalysisReport?title="+searchkey;
    }
    var usertype = "${fns:getUser().userType}";
    function showuserinfo(obj){
        if(usertype == "2") {
            window.location.href='${ctx}/taier/user/userinfoyh';
        } else {
        window.location.href='${ctx}/taier/tlCompanyInfo/view';
        }

    }
    function addmenu(){
        var usertype = "${fns:getUser().userType}";
        if(usertype == "2") {
            $(".personal_left").append('<ul>\n' +
                '                <li id="lm1""><a href="${ctx}/taier/user/userinfoyh">编辑个人资料<i class="icon iconfont icon-mjiantou-copy"></i></a></li>\n' +
                '                <li id="lm2"><a  href="${ctx}/taier/user/userinfoyhMsg">消息中心<i class="icon iconfont icon-mjiantou-copy"></i></a></li>\n' +
                '                <li id="lm3"><a  href="${ctx}/taier/user/myCollectUSer">我的收藏<i class="icon iconfont icon-mjiantou-copy"></i></a></li>\n' +
                '            </ul>');
        } else {
            $(".qiye_list").html(
                '<li><a href="${ctx}/taier/tlCompanyInfo/view" id="lm1" menu="11" onclick="addOperateRecords(this)"><i class="icon iconfont icon-xinxi"></i>厂家基本信息表</a></li>\n' +
                '            <li class="listtwo">\n' +
                '                <a href="#" id="lm2"><i class="icon iconfont icon-yewu"></i>业务<img src="${ctxStatic}/taier/images/jiantou.png" class="zhankai"></a>\n' +
                '                <ul class="qiyelist1" id="lfywlist" style="display: none">\n' +
                <%--'                    <li><a href="${ctx}/taier/tlInvoice/view" id="lm20">开票</a></li>\n' +--%>
                <%--'                    <li><a href="${ctx}/taier/tlPaymentInfo/pay" id="lm21">缴费</a></li>\n' +--%>
                '                    <li><a href="#" id="lm19">进网　<img src="${ctxStatic}/taier/images/jiantou.png" class="zhankai"></a>\n' +
                '                        <ul class="qiye_list2" id="lflist3" style="display: none">\n' +
                '                            <li><a href="${ctx}/taier/theNet/gotoTheNet" id="lm22" menu="22" onclick="addOperateRecords(this)">进网申请</a></li>\n' +
                '                            <li><a href="${ctx}/taier/theNet/gotoTheNetList" id="lm23" menu="23" onclick="addOperateRecords(this)">进网列表</a></li>\n' +
                '                        </ul>\n' +
                '                    </li>\n' +
                '                    <li><a href="#" id="lm20">CCC　<img src="${ctxStatic}/taier/images/jiantou.png" class="zhankai"></a>\n' +
                '                        <ul class="qiye_list2" id="lflist4" style="display: none">\n' +
                '                            <li><a href="${ctx}/taier/theNet/gotoCCC" id="lm24" menu="24" onclick="addOperateRecords(this)">CCC申请</a></li>\n' +
                '                            <li><a href="${ctx}/taier/theNet/gotoCCCList" id="lm5" menu="25" onclick="addOperateRecords(this)">CCC列表</a></li>\n' +
                '                        </ul>\n' +
                '                    </li>\n' +
                
                '                    <li><a href="#" id="lm5">企业联合信息发布　<img src="${ctxStatic}/taier/images/jiantou.png" class="zhankai"></a>\n' +
                '                        <ul class="qiye_list2" id="lflist1" style="display: none">\n' +
                '                            <li><a href="${ctx}/taier/tlCompanyUnionInfo/introduce" id="lm6" menu="14" onclick="addOperateRecords(this)">业务流程及说明</a></li>\n' +
                '                            <li><a href="${ctx}/taier/tlCompanyUnionInfo/infoAdd" id="lm7" menu="15" onclick="addOperateRecords(this)">业务申请</a></li>\n' +
                '                            <li><a href="${ctx}/taier/tlCompanyUnionInfo/checkStatus" id="lm8" menu="16" onclick="addOperateRecords(this)">业务办理及状态查询</a></li>\n' +
                '                            <li><a href="${ctx}/taier/tlCompanyUnionInfo/checkHistoryStatus" id="lm9" menu="17" onclick="addOperateRecords(this)">历史任务</a></li>\n' +
                '                        </ul>\n' +
                '                    </li>\n' +
                '                    <li><a href="#" id="lm10">预置应用列表　<img src="${ctxStatic}/taier/images/jiantou.png"  class="zhankai"></a>\n' +
                '                        <ul class="qiye_list2"  id="lflist2"  style="display: none">\n' +
                '                            <li><a href="${ctx}/taier/tlApppreset/introduce" id="lm11" menu="18" onclick="addOperateRecords(this)">业务流程及说明</a></li>\n' +
                '                            <li><a href="${ctx}/taier/tlApppreset/infoAdd" id="lm12" menu="19" onclick="addOperateRecords(this)">业务申请</a></li>\n' +
                '                            <li><a href="${ctx}/taier/tlApppreset/checkStatus" id="lm13" menu="20" onclick="addOperateRecords(this)">业务办理及状态查询</a></li>\n' +
                '                            <li><a href="${ctx}/taier/tlApppreset/checkHistoryStatus" id="lm14" menu="21" onclick="addOperateRecords(this)">历史任务</a></li>\n' +
                '                        </ul>\n' +
                '                    </li>\n' +
                '                </ul>\n' +
                '            </li>\n' +
                '               <li class="listtwo"> <a href="#" id="lm2"><i class="icon iconfont  icon-caiwu"></i>财务<img src="${ctxStatic}/taier/images/jiantou.png" class="zhankai"></a>\n' +
                '                <ul class="qiyelist1" id="lfywlist1" style="display: none">\n' +
                '                            <li><a href="${ctx}/taier/tlPaymentInfo/pay" id="lm21" menu="22" onclick="addOperateRecords(this)">缴费</a></li>\n' +
                '                </ul>\n' +
                '            <li><a href="${ctx}/taier/tlMessage/msgCompany" id="lm15" menu="23" onclick="addOperateRecords(this)"><i class="icon iconfont icon-xiaoxi"></i>新消息</a></li>\n' +
                '            <li><a href="${ctx}/taier/user/modifyPasswordC" id="lm16" menu="24" onclick="addOperateRecords(this)"><i class="icon iconfont icon-mima"></i>修改密码</a></li>\n' +
                '            <li><a href="${ctx}/taier/activity/myCollectList" id="lm18" menu="25" onclick="addOperateRecords(this)"><i class="icon iconfont icon-shoucang"></i>我的收藏</a></li>\n'
            );
            $('.qiye_list li a').click(function(){
                $('.qiye_xuanzhong').removeClass('qiye_xuanzhong');
                $(this).addClass('qiye_xuanzhong');
                $(this).parent().find('ul').show();
                $(this).parent().siblings().find('ul').hide();
                $(this).parent().find('ul').find('ul').hide();
            })
        }
    }
    function addOperateRecords(obj){
    	var menu=$(obj).attr("menu");
    	var menuName=$(obj).html().replace(/<[^>]+>/g,"");
    	$.ajax({
            url:"${contextPath}/taier/operateRecords/ajaxsave",
            type:"post",
            dataType:"json",
            data: {
            	"menu":menu,
            	 "menuName":menuName,
            	 "operateType":"1"
            },
            success: function (data){
                if(data.code==200){
                	
                }
                
            }
    	});
    }
    function ajax(url,data,successCallback) {
        if (typeof data ==='object'){
            data = JSON.stringify(data)
        }
        $.ajax({
            type : 'POST',
            url : url,
            contentType: "application/json",
            async:true,
            data: data,
            success : function (result, status, xhr) {
                successCallback(result);
            },
            error:function () {
                alert('服务器错误，请稍后再试');
            }
        });
    }


    function buildPage(elem, currPage, totalPage, count, func, conditions){

        var pre = currPage<=1?-1:currPage-1;
        var next = currPage>=totalPage?-1:currPage+1;
        var p = "<span class='pagena leftArrow' id='"+elem+pre+"'></span>";
        if(pre == -1) {
            p = "<span class='pagena leftArrow' id='"+elem+"pren'></span>";
        }
        var startPage = currPage-2;
        if(startPage < 1){
            startPage = 1;
        }
        p += '<div class="page-box">';
        for (var i=startPage;i<=totalPage;i++){
            if (i == (startPage + 4) && i<totalPage){
               // p +="<li><a class='pagena pagenu' style='cursor:pointer;' id='"+elem+i+"'>...</a></li>"
            } else if(i>(startPage + 4) && i < totalPage){
                continue;
            } else{
                p += "<span class='pagena "+(i==currPage?'current':'')+"' id='"+elem+i+"'>"+i+"</span>"
            }
        }
        p += "</div>";
        var p2 = "<span class='pagena rightArrow' id='"+elem+next+"'></span>"
        if(next == -1) {
            p2 = "<span class='pagena rightArrow' id='"+elem+"nextn'></span>";
        }
        p += p2;
        $("#"+elem).html(p);
        if(pre == -1) {
            $("#"+elem+"pren").addClass("focus").css("pointer-events","none").css("background-image","url('${ctxStatic}/newtaier/images/news/ico05.jpg')");
        }
        if(next == -1){
            $("#"+elem+"nextn").addClass("focus").css("pointer-events","none").css("background-image","url('${ctxStatic}/newtaier/images/news/ico051.jpg')");
        }

        //注册点击分页事件
        $(".pagena").on("click",function(){
            var id = $(this).attr("id");
            eval(func + "(" + id.replace(elem,"") + ",'" + conditions + "')");
        });
    }

    function framelogout(){
            window.parent.location.href='${ctx}/logout';
    }

</script>

<script>
    var lngData="";
    var latData="";
    var markers=[];
    $(function(){
        $.ajax({
            type:"post",
            url:"${contextPath}/taier/jump/qryQrCode",
            dataType:"json",
            success: function (e) {
                var tlqrcode = e.hashMap.tlQrcode;
                if(tlqrcode.id){
                    $("#qrwximg").attr("src",tlqrcode.weixinurl);
                    $("#qrwbimg").attr("src",tlqrcode.weibourl);
                } else {
                    $("#qrwxdiv").remove();
                    $("#qrwbdiv").remove();
                }
            }
        })

        $.ajax({
            type:"post",
            url:"${contextPath}/taier/jump/qryConnectUs",
            dataType:"json",
            async:false,
            success: function (e) {
                var aboutUs = e.hashMap.aboutUs;
                lngData=aboutUs.longitude;
                latData=aboutUs.latitude;
                $("#address").html(aboutUs.address);
                $("#email").html(aboutUs.email);
                $("#phone").html(aboutUs.phone);
            }
        })
        if($("#container")[0]) {
            map = new AMap.Map('container', {
                resizeEnable: true,
                zoom: 15,
                center: [lngData, latData]
            });


            AMap.service('AMap.Geocoder', function () {
                geocoder = new AMap.Geocoder({
                    city: "010"//城市，默认：“全国”
                });
            })
            //标记位置
            markAddress(lngData, latData);
        }
        var saveFlag=true;
        $("#lyBtn").click(function(){
            if(!saveFlag){
                return false;
            }

            var name=$("#lyname").val().trim();
            if(name==null || name==""){
                alert("请填写您的姓名！");
                $("#lyname").focus();
                return false;
            }else if(name.length>50){
                alert("请输入50个字符以内的名字！");
                $("#lyname").focus();
                return false;
            }
            var phone=$("#lyphone").val().trim();
            if(null==phone || phone==""){
                alert("请输入手机号！");
                $("#lyphone").focus();
                return false;

            }else if(!isPhoneNo(phone)){
                alert("请输入正确的手机号！");
                $("#lyphone").focus();
                return false;
            }
            var email=$("#lyemail").val().trim();
            if(null==email || email==""){
                alert("请输入邮箱！");
                $("#lyemail").focus();
                return false;

            }else if(!isEmail(email)){
                alert("请输入正确的邮箱！");
                $("#lyemail").focus();
                return false;
            }
            var content=$("#lycontent").val().trim();
            if(content==null || content==""){
                alert("请输入留言内容！");
                $("#lycontent").focus();
                return false;
            }else if(content.length>200){
                alert("留言内容不能超过200个字符！");
                $("#lycontent").focus();
                return false;
            }
            saveFlag=false;
            //$('#leaveWordForm').submit();
            $.ajax({
                url: "${contextPath}/taier/leaveWord/saveLeaveWord",
                type:"post",
                dataType:"json",
                data: {"name":name,
                    "phone":phone,
                    "email":email,
                    "content":content
                },
                success: function (data){
                    saveFlag=true;
                    if(data.code==200){
                        alert(data.hashMap.msg);
                        clearForm();
                    }else{
                        alert("留言失败！");
                    }

                },
                error:function(){
                    saveFlag=true;
                    alert("添加失败")
                }
            });

        })
    })
    function isPhoneNo(phone) {
        var pattern = /^[1][3,4,5,7,8][0-9]{9}$/
        return pattern.test(phone);
    }
    function isEmail(email) {
        var emailreg = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
        return emailreg.test(email)

    }
    function clearForm(){
        $("#lyname").val("");
        $("#lyphone").val("");
        $("#lyemail").val("");
        $("#lycontent").val("");
    }
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


<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div class="half"></div>
<div class="dialog" style="position: fixed;">
	<dl class="dia_dl">
		<dt>
			<img src="${ctxStatic}/taier/images/rengong.png" /><span
				class="closees">关闭</span>
		</dt>
		<dd>
			<ul id="customerul">

			</ul>
		</dd>
	</dl>
</div>


<script>
    $(function(){
        $(".ketan").click(function(){
            var length=document.documentElement.scrollTop+200;
            $(".dialog").show().css("top",length+"px");
            $(".half").show().css("height",$(document).height());
        })
        $(".closees").click(function(){$(".dialog").hide();$(".half").hide();});
        $.ajax({
            url: "${contextPath}/taier/jump/getCustomer",
            type:"post",
            dataType:"json",
            success: function (data){
                if(data.code==200){
                    $("#customerul").html("");
                    if(data && data.hashMap && data.hashMap.customerServiceList){
                        var list = data.hashMap.customerServiceList;
                        for(var i=0;i<list.length;i++){
                            $("#customerul").append('<li style="display: table;width: 100%;">\n' +
                                '                        <span style="width: 40%;display: block;text-align: right;padding-right: 25px;float: left;">'+list[i].name +'</span>\n' +
                                '                        <div style="width: 59%;float: left;"><a style="text-align: center;margin-top: 12px;" href="http://wpa.qq.com/msgrd?v=3&uin='+list[i].qq+'&site=qq&menu=yes" target="_Blank">点击进入在线客服</a></div>\n' +
                                '                    </li>');
                        }
                    }
                }else{
                }

            },
            error:function(){
                saveFlag=true;
                alert("添加失败")
            }
        });

    })
</script>
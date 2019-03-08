<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="toTop" content="true">
<meta name="keywords" content="${policy.keyWord }">
<%@ include file="/WEB-INF/views/taier/include.jsp"%>
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

	<section class="policy_box">
		<div class="w1200">
			<div class="policy_left">
				<dl>
					<dt>
						<a href="javascript:void(0)">政策要求</a>
					</dt>
					<dd>
						<a href="javascript:void(0)" id="fl1"
							onclick="getPolicyByType(1,this)">政策文件</a>
					</dd>
					<dd>
						<a href="javascript:void(0)" id="flfg"
							onclick="getPolicyByType(2,this)">政策法规</a>
						<!-- <ul>
                        <li><a href="javascript:void(0)" id="fl2" onclick="getPolicyByType(2,this)">>> 法律</a></li>
                        <li><a href="javascript:void(0)" id="fl3" onclick="getPolicyByType(3,this)">>> 行政法规</a></li>
                        <li><a href="javascript:void(0)" id="fl4" onclick="getPolicyByType(4,this)">>> 部门规章</a></li>
                    </ul> -->
					</dd>
				</dl>
			</div>
			<div class="policy_right policyxq">
				<h1 class="policyxq_title">${policy.title }<br> <small>发布时间：<fmt:formatDate
							value="${policy.createDate }" pattern="yyyy-MM-dd HH:mm:ss" />
						来源：${policy.source } 访问次数：${policy.clickNum }${policy.keyWord }
					</small>
				</h1>
				<div>${policy.content }</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
    $(function(){
        parent.window.selectmaintab(8);
        var type = "${policy.type}";
        $("#fl"+type).addClass("dd_actives");
        if(type != 1) {
            $("#flfg").addClass("dd_actives");
        }
        if(window.parent.refreshHeight){
            window.parent.refreshHeight();
        }
    })
	function gotoPolicyList(type){
		window.location.href="${contextPath }/policyFront/gotoPolicy?type="+type;
	}
    function getPolicyByType(policyType, obj){
        $(".dd_actives").removeClass("dd_actives");
        $(obj).addClass("dd_actives");
        if(policyType != 1) {
            $("#flfg").addClass("dd_actives");
        }
        getPolicyListByType(curPageNo,policyType);
    }

    var getPolicyPageByTypeFlag=true;
    function getPolicyListByType(curPageNo,policyType){

        if(!getPolicyPageByTypeFlag){
            return false;
        }
        type=policyType;
        getPolicyPageByType=false;
        $.ajax({
            url:"${contextPath }/taier/policyFront/getPolicyPageByType",
            type:"post",
            dataType:"json",
            data: {"pageNo":curPageNo,
                "type":type
            },
            success: function (data){
                getPolicyPageByType=true;
                if(data.code==200){
                    $("#policyList").html("");
                    var policyPage=data.hashMap.policyPage;
                    curPageNo=policyPage.pageNo;
                    pageCount=policyPage.pageCount;
                    count=policyPage.count;
                    var policyList=policyPage.list;

                    if(policyList && policyList.length>0){
                        var policyListStr='';
                        for(var i=0;i<policyList.length;i++){
                            var policy=policyList[i];
                            policyListStr+='<a href="javascript:void(0)" onclick="policyDetail(\''+policy.id+'\')">'+
                                '<li>'+policy.title+
                                '<span>'+policy.createDate+'</span>'+
                                '</li>'+
                                '</a>';
                        }
                        $("#policyList").html(policyListStr);
                        if(window.parent.refreshHeight){
                            window.parent.refreshHeight();
                        }

                    }
                    buildPage("page", curPageNo, pageCount, count, "getPolicyListByType",type)

                }

            }
        });
    }

</script>
</body>

</html>
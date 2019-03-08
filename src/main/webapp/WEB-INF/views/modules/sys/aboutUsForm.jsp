<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>关于我们管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript"
	src="http://webapi.amap.com/maps?v=1.4.4&key=8e2c24150d9743810be9ae4fa2461da5"></script>
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
	        
	        map.on('click', function (e) {
	            lngData = e.lnglat.getLng();
	            latData = e.lnglat.getLat();
	            $("#longitude").val(lngData);
	            $("#latitude").val(latData);
	            markAddress(lngData, latData);
	            
        	});
	        
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
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
<style>
.input-xxlarge {
	display: none !important;
}
</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/taier/aboutUs/">关于我们列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/aboutUs/form?id=${aboutUs.id}">关于我们<shiro:hasPermission
					name="taier:aboutUs:edit">${not empty aboutUs.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="taier:aboutUs:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="aboutUs"
		action="${ctx}/taier/aboutUs/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">地址：</label>
			<div class="controls">
				<form:input path="address" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系电话：</label>
			<div class="controls">
				<form:input path="phone" htmlEscape="false" maxlength="20"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮箱：</label>
			<div class="controls">
				<form:input path="email" htmlEscape="false" maxlength="100"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">qq群：</label>
			<div class="controls">
				<form:input path="qqgroup" htmlEscape="false" maxlength="20"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">泰尔概况图片：</label>
			<div class="controls">
				<form:hidden id="situationImg" path="situationImg"
					htmlEscape="false" maxlength="200" class="input-xlarge" />
				<sys:ckfinder input="situationImg" type="files"
					uploadPath="/taier/tlAboutUs" selectMultiple="true" />
			</div>


			<%-- <div class="controls">
				<form:input path="situationImg" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div> --%>
		</div>
		<div class="control-group">
			<label class="control-label">泰尔概况：</label>
			<div class="controls">
				<form:textarea id="situationContent" htmlEscape="false"
					path="situationContent" rows="4" maxlength="200"
					class="input-xxlarge" />
				<sys:ckeditor replace="situationContent" uploadPath="/test/test" />
				<%-- <form:input path="situationContent" htmlEscape="false" class="input-xlarge "/> --%>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">机构设置图片：</label>
			<div class="controls">
				<form:hidden id="orgSetImg" path="orgSetImg" htmlEscape="false"
					maxlength="200" class="input-xlarge" />
				<sys:ckfinder input="orgSetImg" type="files"
					uploadPath="/taier/tlAboutUs" selectMultiple="true" />
			</div>
			<%-- <div class="controls">
				<form:input path="orgSetImg" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div> --%>
		</div>
		<div class="control-group">
			<label class="control-label">机构设置：</label>
			<div class="controls">
				<form:textarea id="orgSetContent" htmlEscape="false"
					path="orgSetContent" rows="4" maxlength="200" class="input-xxlarge" />
				<sys:ckeditor replace="orgSetContent" uploadPath="/test/test" />
				<%-- <form:input path="orgSetContent" htmlEscape="false" class="input-xlarge "/> --%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">行业组织图片：</label>
			<div class="controls">
				<form:hidden id="tradeImg" path="tradeImg" htmlEscape="false"
					maxlength="200" class="input-xlarge" />
				<sys:ckfinder input="tradeImg" type="files"
					uploadPath="/taier/tlAboutUs" selectMultiple="true" />
			</div>
			<%-- <div class="controls">
				<form:input path="tradeImg" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div> --%>
		</div>
		<div class="control-group">
			<label class="control-label">行业组织：</label>
			<div class="controls">
				<form:textarea id="tradeContent" htmlEscape="false"
					path="tradeContent" rows="4" maxlength="200" class="input-xxlarge" />
				<sys:ckeditor replace="tradeContent" uploadPath="/test/test" />
				<%-- <form:input path="tradeContent" htmlEscape="false" class="input-xlarge "/> --%>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">定位：</label>
			<div class="controls">
				<div style="height: 365px; width: 60%;" id="container" tabindex="0"
					name="container"></div>

			</div>
			<form:hidden path="longitude" id="longitude" />
			<form:hidden path="latitude" id="latitude" />
		</div>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit"
				value="保 存" />&nbsp; <input id="btnCancel" class="btn" type="button"
				value="返 回" onclick="history.go(-1)" />
		</div>
	</form:form>
</body>
</html>
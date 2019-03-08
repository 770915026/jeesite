<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>活动管理</title>
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
<script type="text/javascript">
		$(document).ready(function() {
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
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/taier/activity/">活动列表</a></li>
		<li class="active"><a
			href="${ctx}/taier/activity/form?id=${activity.id}">活动<shiro:hasPermission
					name="sys:activity:edit">${not empty activity.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="sys:activity:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="activity"
		action="${ctx}/taier/activity/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">活动标题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="200"
					class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">活动类型：</label>
			<div class="controls">
				<form:select path="type" class="input-medium">
					<form:options items="${fns:getDictList('activity_type')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
				<%-- <form:input path="type" htmlEscape="false" maxlength="4" class="input-xlarge required"/> --%>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">活动性质：</label>
			<div class="controls">
				<form:input path="nature" htmlEscape="false" maxlength="200"
					class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">活动描述：</label>
			<div class="controls">
				<form:textarea path="describe" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">活动封面图片：</label>
			<div class="controls">
				<form:hidden id="cover" path="cover" htmlEscape="false"
					maxlength="200" class="input-xlarge" />
				<sys:ckfinder input="cover" type="files"
					uploadPath="/taier/tlActivity" selectMultiple="true" />
				<%-- <form:input path="cover" htmlEscape="false" maxlength="200" class="input-xlarge required"/> --%>
				<span class="help-inline"><font color="red">*</font>
					(请上传小于10M的图片)</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">活动详情图片：</label>
			<div class="controls">
				<form:hidden id="banner" path="banner" htmlEscape="false"
					maxlength="200" class="input-xlarge" />
				<sys:ckfinder input="banner" type="files"
					uploadPath="/taier/tlActivity" selectMultiple="true" />
				<%-- <form:input path="cover" htmlEscape="false" maxlength="200" class="input-xlarge required"/> --%>
				<span class="help-inline"><font color="red">*</font>
					(请上传小于10M的图片,建议宽高比2:1)</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">开始时间：</label>
			<div class="controls">
				<input name="starttime" type="text" readonly="readonly"
					maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${activity.starttime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">结束时间：</label>
			<div class="controls">
				<input name="endtime" type="text" readonly="readonly" maxlength="20"
					class="input-medium Wdate required"
					value="<fmt:formatDate value="${activity.endtime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否发布到首页：</label>
			<div class="controls">
				<form:select path="isToFirstPage" class="input-medium">
					<form:options items="${fns:getDictList('yes_no')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
				<%-- <form:input path="isHot" htmlEscape="false" maxlength="4" class="input-xlarge "/> --%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">地点：</label>
			<div class="controls">
				<form:input path="address" htmlEscape="false" maxlength="200"
					class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
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
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="name" type="java.lang.String" required="true"
	description="验证码输入框名称"%>
<%@ attribute name="type" type="java.lang.String" required="false"
	description="验证码种类"%>
<%@ attribute name="inputCssStyle" type="java.lang.String"
	required="false" description="验证框样式"%>
<%@ attribute name="imageCssStyle" type="java.lang.String"
	required="false" description="验证码图片样式"%>
<%@ attribute name="buttonCssStyle" type="java.lang.String"
	required="false" description="看不清按钮样式"%>
<%@ attribute name="refreshtitle" type="java.lang.String"
	required="false" description="刷新按钮文本"%>
<%@ attribute name="showInput" type="java.lang.String" required="false"
	description="是否显示输入框"%>
<c:if test="${showInput ne 'false'}">
	<span class="input-box"> <input type="text" id="${name}"
		name="${name}" placeholder="验证码" maxlength="5"
		class="input txt required" style="${inputCssStyle}" />
	</span>
</c:if>
<span class="code-img-box"> <img
	src="${pageContext.request.contextPath}/servlet/validateCodeServlet?type=${type}"
	onclick="$('.${name}Refresh').click();" class="mid ${name}"
	style="${imageCssStyle}" /> <a href="javascript:"
	onclick="$('.${name}').attr('src','${pageContext.request.contextPath}/servlet/validateCodeServlet?'+new Date().getTime()+'&type=${type}');"
	class="mid ${name}Refresh" style="${buttonCssStyle}">${refreshtitle}</a>
</span>
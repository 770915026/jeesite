/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.security;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.thinkgem.jeesite.common.utils.Exceptions;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * 表单验证（包含验证码）过滤类
 * @author ThinkGem
 * @version 2014-5-19
 */
@Service
public class FormAuthenticationFilter extends org.apache.shiro.web.filter.authc.FormAuthenticationFilter {
	private static final Logger log = LoggerFactory.getLogger(org.apache.shiro.web.filter.authc.FormAuthenticationFilter.class);
	public static final String DEFAULT_CAPTCHA_PARAM = "validateCode";
	public static final String DEFAULT_MOBILE_PARAM = "mobileLogin";
	public static final String DEFAULT_MESSAGE_PARAM = "message";

	private String captchaParam = DEFAULT_CAPTCHA_PARAM;
	private String mobileLoginParam = DEFAULT_MOBILE_PARAM;
	private String messageParam = DEFAULT_MESSAGE_PARAM;

	protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
		String username = getUsername(request);
		String password = getPassword(request);
		if (password==null){
			password = "";
		}
		boolean rememberMe = isRememberMe(request);
		String host = StringUtils.getRemoteAddr((HttpServletRequest)request);
		String captcha = getCaptcha(request);
		boolean mobile = isMobileLogin(request);
		String l1 = request.getParameter("l1");
		return new UsernamePasswordToken(username, password.toCharArray(), rememberMe, host, captcha, mobile, l1);
	}
	
	/**
	 * 获取登录用户名
	 */
	protected String getUsername(ServletRequest request) {
		String username = super.getUsername(request);
		if (StringUtils.isBlank(username)){
			username = StringUtils.toString(request.getAttribute(getUsernameParam()), StringUtils.EMPTY);
		}
		return username;
	}
	
	/**
	 * 获取登录密码
	 */
	@Override
	protected String getPassword(ServletRequest request) {
		String password = super.getPassword(request);
		if (StringUtils.isBlank(password)){
			password = StringUtils.toString(request.getAttribute(getPasswordParam()), StringUtils.EMPTY);
		}
		return password;
	}
	
	/**
	 * 获取记住我
	 */
	@Override
	protected boolean isRememberMe(ServletRequest request) {
		String isRememberMe = WebUtils.getCleanParam(request, getRememberMeParam());
		if (StringUtils.isBlank(isRememberMe)){
			isRememberMe = StringUtils.toString(request.getAttribute(getRememberMeParam()), StringUtils.EMPTY);
		}
		return StringUtils.toBoolean(isRememberMe);
	}

	public String getCaptchaParam() {
		return captchaParam;
	}

	protected String getCaptcha(ServletRequest request) {
		return WebUtils.getCleanParam(request, getCaptchaParam());
	}

	public String getMobileLoginParam() {
		return mobileLoginParam;
	}
	
	protected boolean isMobileLogin(ServletRequest request) {
        return WebUtils.isTrue(request, getMobileLoginParam());
    }
	
	public String getMessageParam() {
		return messageParam;
	}
	
	/**
	 * 登录成功之后跳转URL
	 */
	public String getSuccessUrl() {
		return super.getSuccessUrl();
	}
	
	@Override
	protected void issueSuccessRedirect(ServletRequest request,
			ServletResponse response) throws Exception {
		SystemAuthorizingRealm.Principal p = UserUtils.getPrincipal();

		if(p!=null){
			String userType = p.getUserType();
			if("1".equals(userType)){
				WebUtils.issueRedirect(request, response, "/", null, true);
			} else if("2".equals(userType)){
				WebUtils.issueRedirect(request, response, "/taier/jump/gotoFirstPage", null, true);
			} else {
				String t = request.getParameter("t");
				if("".equals(t)) {
					WebUtils.issueRedirect(request, response, "/taier/jump/gotoFirstPage", null, true);
				} else {
					WebUtils.issueRedirect(request, response, "/taier/jump/gotoFirstPage", null, true);
				}

			}
		} else {
			super.issueSuccessRedirect(request, response);
		}
//		if (p != null && !p.isMobileLogin()){
//			 WebUtils.issueRedirect(request, response, getSuccessUrl(), null, true);
//		}else{
//			super.issueSuccessRedirect(request, response);
//		}
	}

	/**
	 * 登录失败调用事件
	 */
	@Override
	protected boolean onLoginFailure(AuthenticationToken token,
			AuthenticationException e, ServletRequest request, ServletResponse response) {
		String className = e.getClass().getName(), message = "";
		if (IncorrectCredentialsException.class.getName().equals(className)
				|| UnknownAccountException.class.getName().equals(className)){
			message = "用户或密码错误, 请重试.";
		}
		else if (e.getMessage() != null && StringUtils.startsWith(e.getMessage(), "msg:")){
			message = StringUtils.replace(e.getMessage(), "msg:", "");
		}
		else{
			message = "系统出现点问题，请稍后再试！";
			e.printStackTrace(); // 输出到控制台
		}
        request.setAttribute(getFailureKeyAttribute(), className);
        request.setAttribute(getMessageParam(), message);
        return true;
	}


	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		if (this.isLoginRequest(request, response)) {
			if (this.isLoginSubmission(request, response)) {
				if (log.isTraceEnabled()) {
					log.trace("Login submission detected.  Attempting to execute login.");
				}

				return this.executeLogin(request, response);
			} else {
				if (log.isTraceEnabled()) {
					log.trace("Login page view.");
				}

				return true;
			}
		} else {
			if (log.isTraceEnabled()) {
				log.trace("Attempting to access a path which requires authentication.  Forwarding to the Authentication url [" + this.getLoginUrl() + "]");
			}

			this.saveRequestAndRedirectToLogin(request, response);
			return false;
		}
	}

	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
		try {
			if (isLoginSubmission(request, response)) {
				if (log.isTraceEnabled()) {
					log.trace("Login submission detected.  Attempting to execute login.");
				}
				return false;
			}
		} catch (Exception e) {
			log.error(Exceptions.getStackTraceAsString(e));
		}
		return super.isAccessAllowed(request, response, mappedValue) || !this.isLoginRequest(request, response) && this.isPermissive(mappedValue);
	}
}
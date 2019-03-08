/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 二维码维护Entity
 * @author gy
 * @version 2018-10-23
 */
public class TlQrcode extends DataEntity<TlQrcode> {
	
	private static final long serialVersionUID = 1L;
	private String weixinurl;		// 微信公众号二维码
	private String weibourl;		// 微博二维码
	private String loginurl;

	public String getLoginurl() {
		return loginurl;
	}

	public void setLoginurl(String loginurl) {
		this.loginurl = loginurl;
	}

	public TlQrcode() {
		super();
	}

	public TlQrcode(String id){
		super(id);
	}

	@Length(min=0, max=200, message="微信公众号二维码长度必须介于 0 和 200 之间")
	public String getWeixinurl() {
		return weixinurl;
	}

	public void setWeixinurl(String weixinurl) {
		this.weixinurl = weixinurl;
	}
	
	@Length(min=0, max=200, message="微博二维码长度必须介于 0 和 200 之间")
	public String getWeibourl() {
		return weibourl;
	}

	public void setWeibourl(String weibourl) {
		this.weibourl = weibourl;
	}
	
}
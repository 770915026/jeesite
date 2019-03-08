/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 广告证书Entity
 * @author xuyongqiang
 * @version 2018-10-17
 */
public class AdCertificate extends DataEntity<AdCertificate> {
	
	private static final long serialVersionUID = 1L;
	private String imgUrl;		// 图片
	private String title;		// 标题
	private String buttonName;		// 按钮文字
	private String buttonHref;		// 按钮链接
	
	public AdCertificate() {
		super();
	}

	public AdCertificate(String id){
		super(id);
	}

	@Length(min=0, max=200, message="图片长度必须介于 0 和 200 之间")
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	@Length(min=0, max=200, message="标题长度必须介于 0 和 200 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=100, message="按钮文字长度必须介于 0 和 100 之间")
	public String getButtonName() {
		return buttonName;
	}

	public void setButtonName(String buttonName) {
		this.buttonName = buttonName;
	}
	
	@Length(min=0, max=200, message="按钮链接长度必须介于 0 和 200 之间")
	public String getButtonHref() {
		return buttonHref;
	}

	public void setButtonHref(String buttonHref) {
		this.buttonHref = buttonHref;
	}
	
}
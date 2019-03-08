/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 首页证书Entity
 * @author xuyongqiang
 * @version 2018-11-22
 */
public class CertificateFirstPage extends DataEntity<CertificateFirstPage> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private String img;		// 证书图片
	
	public CertificateFirstPage() {
		super();
	}

	public CertificateFirstPage(String id){
		super(id);
	}

	@Length(min=1, max=100, message="标题长度必须介于 1 和 100 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=200, message="证书图片长度必须介于 0 和 200 之间")
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
}
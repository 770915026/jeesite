/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 证书展示Entity
 * @author xuyongqiang
 * @version 2018-11-20
 */
public class CertificateShow extends DataEntity<CertificateShow> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 证书名称
	private String orderNo;		// order_no
	private String img;		// 证书图片
	
	public CertificateShow() {
		super();
	}

	public CertificateShow(String id){
		super(id);
	}

	@Length(min=1, max=100, message="证书名称长度必须介于 1 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=10, message="order_no长度必须介于 0 和 10 之间")
	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	
	@Length(min=0, max=200, message="证书图片长度必须介于 0 和 200 之间")
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
}
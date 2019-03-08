/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.apache.commons.lang3.StringEscapeUtils;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 泰尔证书Entity
 * @author xuyongqiang
 * @version 2018-11-08
 */
public class Certificate extends DataEntity<Certificate> {
	
	private static final long serialVersionUID = 1L;
	
	private String name;		// name
	private String content;		// content
	private String orderNo;		// order_no
	private String img;		// img
	
	public Certificate() {
		super();
	}

	public Certificate(String id){
		super(id);
	}

	@Length(min=0, max=100, message="name长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getContent() {
		return StringEscapeUtils.unescapeHtml4(content);
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=10, message="order_no长度必须介于 0 和 10 之间")
	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	
	@Length(min=0, max=200, message="img长度必须介于 0 和 200 之间")
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
}
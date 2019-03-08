/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 联系方式Entity
 * @author xuyongqiang
 * @version 2018-11-09
 */
public class Contact extends DataEntity<Contact> {
	
	private static final long serialVersionUID = 1L;
	private String address;		// 地址
	private String phone;		// 联系电话
	
	public Contact() {
		super();
	}

	public Contact(String id){
		super(id);
	}

	@Length(min=0, max=200, message="地址长度必须介于 0 和 200 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Length(min=0, max=20, message="联系电话长度必须介于 0 和 20 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
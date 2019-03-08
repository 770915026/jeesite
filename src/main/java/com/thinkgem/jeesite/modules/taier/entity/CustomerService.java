/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 客服Entity
 * @author xuyongqiang
 * @version 2018-09-28
 */
public class CustomerService extends DataEntity<CustomerService> {
	
	private static final long serialVersionUID = 1L;
	private String qq;		// qq
	private String name;		// name
	
	public CustomerService() {
		super();
	}

	public CustomerService(String id){
		super(id);
	}

	@Length(min=1, max=64, message="qq长度必须介于 1 和 64 之间")
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}
	
	@Length(min=0, max=50, message="name长度必须介于 0 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
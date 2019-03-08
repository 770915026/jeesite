/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 厂家管理Entity
 * @author gy
 * @version 2018-09-03
 */
public class TlFactory extends DataEntity<TlFactory> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// name
	
	public TlFactory() {
		super();
	}

	public TlFactory(String id){
		super(id);
	}

	@Length(min=0, max=200, message="name长度必须介于 0 和 200 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
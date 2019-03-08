/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 留言Entity
 * @author xuyongqiang
 * @version 2018-08-21
 */
public class LeaveWord extends DataEntity<LeaveWord> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 姓名
	private String phone;		// 电话
	private String email;		// 邮箱
	private String content;		// 内容
	
	public LeaveWord() {
		super();
	}

	public LeaveWord(String id){
		super(id);
	}

	@Length(min=1, max=100, message="姓名长度必须介于 1 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=20, message="电话长度必须介于 1 和 20 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Length(min=1, max=200, message="邮箱长度必须介于 1 和 200 之间")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Length(min=1, max=500, message="内容长度必须介于 1 和 500 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
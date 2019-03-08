/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 消息发送Entity
 * @author gy
 * @version 2018-08-22
 */
public class TlMessageSend extends DataEntity<TlMessageSend> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 接收人id
	private String messageid;		// 消息id
	private String isread;		// 是否已读0-未读 1-已读
	private TlMessage tlMessage;

	public TlMessageSend() {
		super();
	}

	public TlMessageSend(String id){
		super(id);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=0, max=64, message="消息id长度必须介于 0 和 64 之间")
	public String getMessageid() {
		return messageid;
	}

	public void setMessageid(String messageid) {
		this.messageid = messageid;
	}
	
	@Length(min=0, max=64, message="是否已读0-未读 1-已读长度必须介于 0 和 64 之间")
	public String getIsread() {
		return isread;
	}

	public void setIsread(String isread) {
		this.isread = isread;
	}

	public TlMessage getTlMessage() {
		return tlMessage;
	}

	public void setTlMessage(TlMessage tlMessage) {
		this.tlMessage = tlMessage;
	}
}
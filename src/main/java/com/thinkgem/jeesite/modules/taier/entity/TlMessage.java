/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.Collections3;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.OaNotifyRecord;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 消息Entity
 * @author gy
 * @version 2018-08-22
 */
public class TlMessage extends DataEntity<TlMessage> {
	
	private static final long serialVersionUID = 1L;
	private String type;		// 消息类型
	private String tittle;		// 标题
	private String content;		// 内容
	private List<TlMessageSend> messageSendList;
	
	
	public TlMessage() {
		super();
	}

	public TlMessage(String id){
		super(id);
	}

	@Length(min=1, max=4, message="消息类型长度必须介于 1 和 4 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=1, max=100, message="标题长度必须介于 1 和 100 之间")
	public String getTittle() {
		return tittle;
	}

	public void setTittle(String tittle) {
		this.tittle = tittle;
	}
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public List<TlMessageSend> getMessageSendList() {
		return messageSendList;
	}

	public void setMessageSendList(List<TlMessageSend> messageSendList) {
		this.messageSendList = messageSendList;
	}
	/**
	 * 获取通知发送记录用户ID
	 * @return
	 */
	public String getNotifyRecordIds() {
		if(messageSendList==null){
			return "";
		}else{
			return Collections3.extractToString(messageSendList, "user.id", ",");
		}
		
	}
	
	/**
	 * 设置通知发送记录用户ID
	 * @return
	 */
	public void setNotifyRecordIds(String notifyRecord) {
		this.messageSendList = Lists.newArrayList();
		for (String id : StringUtils.split(notifyRecord, ",")){
			TlMessageSend entity = new TlMessageSend();
			entity.setId(IdGen.uuid());
			entity.setMessageid(this.id);
			entity.setIsread("0");
			entity.setCreateDate(createDate);
			entity.setUpdateDate(updateDate);
			entity.setUser(new User(id));
			this.messageSendList.add(entity);
		}
	}
	/**
	 * 获取通知发送记录用户Name
	 * @return
	 */
	public String getNotifyRecordNames() {
		if(messageSendList==null){
			return "";
		}else{
			return Collections3.extractToString(messageSendList, "user.name", ",");
		}
	}
	
	/**
	 * 设置通知发送记录用户Name
	 * @return
	 */
	public void setNotifyRecordNames(String notifyRecord) {
		// 什么也不做
	}
}
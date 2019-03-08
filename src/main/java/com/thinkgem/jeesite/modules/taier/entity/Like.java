/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.User;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 点赞Entity
 * @author xuyongqiang
 * @version 2018-08-27
 */
public class Like extends DataEntity<Like> {
	
	private static final long serialVersionUID = 1L;
	private String activityId;		// 活动id
	private User user;		// 参加用户id
	
	public Like() {
		super();
	}

	public Like(String id){
		super(id);
	}

	@Length(min=0, max=64, message="活动id长度必须介于 0 和 64 之间")
	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
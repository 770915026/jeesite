/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.User;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 评论Entity
 * @author xuyongqiang
 * @version 2018-08-28
 */
public class Comments extends DataEntity<Comments> {
	
	private static final long serialVersionUID = 1L;
	private String activityId;		// 活动id
	private User user;		// 参加用户id
	private String content;		// 评论内容
	private String toUserId;		// 给谁回复
	private List<Comments> childrenCommentsList;
	private String parentid;
	
	public Comments() {
		super();
	}

	public Comments(String id){
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
	
	@Length(min=0, max=200, message="评论内容长度必须介于 0 和 200 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=64, message="给谁回复长度必须介于 0 和 64 之间")
	public String getToUserId() {
		return toUserId;
	}

	public void setToUserId(String toUserId) {
		this.toUserId = toUserId;
	}

	public List<Comments> getChildrenCommentsList() {
		return childrenCommentsList;
	}

	public void setChildrenCommentsList(List<Comments> childrenCommentsList) {
		this.childrenCommentsList = childrenCommentsList;
	}

	public String getParentid() {
		return parentid;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid;
	}
	
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 友情链接Entity
 * @author xuyongqiang
 * @version 2018-08-22
 */
public class TlLink extends DataEntity<TlLink> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 链接标题
	private String linkUrl;		// 链接路径
	private int sortNum;		// 排序
	
	public TlLink() {
		super();
	}

	public TlLink(String id){
		super(id);
	}

	@Length(min=0, max=200, message="链接标题长度必须介于 0 和 200 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=200, message="链接路径长度必须介于 0 和 200 之间")
	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	
	public int getSortNum() {
		return sortNum;
	}

	public void setSortNum(int sortNum) {
		this.sortNum = sortNum;
	}
	
}
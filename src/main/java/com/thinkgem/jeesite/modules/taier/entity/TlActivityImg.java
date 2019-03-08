/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 活动页banner图Entity
 * @author gy
 * @version 2018-10-24
 */
public class TlActivityImg extends DataEntity<TlActivityImg> {
	
	private static final long serialVersionUID = 1L;
	private String imgUrl;		// img_url
	private Long sort;		// sort
	
	public TlActivityImg() {
		super();
	}

	public TlActivityImg(String id){
		super(id);
	}

	@Length(min=0, max=200, message="img_url长度必须介于 0 和 200 之间")
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	public Long getSort() {
		return sort;
	}

	public void setSort(Long sort) {
		this.sort = sort;
	}
	
}
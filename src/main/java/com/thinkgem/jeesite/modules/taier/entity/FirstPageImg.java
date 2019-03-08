/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

/**
 * 首页图片Entity
 * @author xuyongqiang
 * @version 2018-08-30
 */
public class FirstPageImg extends DataEntity<FirstPageImg> {
	
	private static final long serialVersionUID = 1L;
	private String imgUrl;		// 图片地址
	private Long sort;		// 序号
	private String title;		// 大标题
	private String title1;		// 小标题
	
	public FirstPageImg() {
		super();
	}

	public FirstPageImg(String id){
		super(id);
	}

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
		this.sort = (sort==null?0:sort);
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle1() {
		return title1;
	}

	public void setTitle1(String title1) {
		this.title1 = title1;
	}
}
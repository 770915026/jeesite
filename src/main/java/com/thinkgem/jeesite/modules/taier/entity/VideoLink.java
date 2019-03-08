/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 视频链接Entity
 * @author xuyongqiang
 * @version 2018-11-07
 */
public class VideoLink extends DataEntity<VideoLink> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 链接标题
	private String linkUrl;		// 视频链接路径
	private Long sortNum;		// 排序
	private String faceImg;		// 视频封面图片
	
	public VideoLink() {
		super();
	}

	public VideoLink(String id){
		super(id);
	}

	@Length(min=0, max=200, message="链接标题长度必须介于 0 和 200 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=200, message="视频链接路径长度必须介于 0 和 200 之间")
	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	
	public Long getSortNum() {
		return sortNum;
	}

	public void setSortNum(Long sortNum) {
		this.sortNum = sortNum;
	}
	
	@Length(min=0, max=200, message="视频封面图片长度必须介于 0 和 200 之间")
	public String getFaceImg() {
		return faceImg;
	}

	public void setFaceImg(String faceImg) {
		this.faceImg = faceImg;
	}
	
}
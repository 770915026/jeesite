/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 活动Entity
 * @author xuyongqiang
 * @version 2018-08-27
 */
public class Activity extends DataEntity<Activity> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 活动标题
	private String cover;		// 活动封面图片
	private String describe;		// 活动描述
	private Date starttime;		// 开始时间
	private Date endtime;		// 结束时间
	private String address;		// 地点
	private String latitude;		// 经度
	private String longitude;		// 纬度
	private String type;		// 活动类型：1-线上；2-线下
	private String nature;		// 活动性质
	private int joinNum;
	private long clickNum;
	private long likeNum;
	private String isToFirstPage;
	private String banner; //作为banner图时展示
	
	public Activity() {
		super();
	}

	public Activity(String id){
		super(id);
	}

	@Length(min=1, max=200, message="活动标题长度必须介于 1 和 200 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=1, max=200, message="活动封面图片长度必须介于 1 和 200 之间")
	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}
	
	@Length(min=1, max=200, message="活动性质长度必须介于 1 和 200 之间")
	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="开始时间不能为空")
	public Date getStarttime() {
		return starttime;
	}

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="结束时间不能为空")
	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	
	@Length(min=1, max=200, message="地点长度必须介于 1 和 200 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	
	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	
	@Length(min=1, max=4, message="活动类型：1-线上；2-线下长度必须介于 1 和 4 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=200, message="活动性质长度必须介于 0 和 200 之间")
	public String getNature() {
		return nature;
	}

	public void setNature(String nature) {
		this.nature = nature;
	}

	public int getJoinNum() {
		return joinNum;
	}

	public void setJoinNum(int joinNum) {
		this.joinNum = joinNum;
	}

	public long getClickNum() {
		return clickNum;
	}

	public void setClickNum(long clickNum) {
		this.clickNum = clickNum;
	}

	public long getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(long likeNum) {
		this.likeNum = likeNum;
	}

	public String getIsToFirstPage() {
		return isToFirstPage;
	}

	public void setIsToFirstPage(String isToFirstPage) {
		this.isToFirstPage = isToFirstPage;
	}

	public String getBanner() {
		return banner;
	}

	public void setBanner(String banner) {
		this.banner = banner;
	}
}
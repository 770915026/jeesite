/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.apache.commons.lang3.StringEscapeUtils;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 关于我们Entity
 * @author xuyongqiang
 * @version 2018-08-22
 */
public class AboutUs extends DataEntity<AboutUs> {
	
	private static final long serialVersionUID = 1L;
	private String situationContent;		// 泰尔概况
	private String orgSetContent;		// 机构设置
	private String tradeContent;		// 行业组织
	private String address;		// 地址
	private String phone;		// 联系电话
	private String qqgroup;		// qq群
	private String email;		// 邮箱
	private String longitude;		// 经度
	private String latitude;		// 纬度
	private String situationImg;		// 泰尔概况图片
	private String orgSetImg;		// 机构设置图片
	private String tradeImg;		// 行业组织图片
	
	public AboutUs() {
		super();
	}

	public AboutUs(String id){
		super(id);
	}

	public String getSituationContent() {
		return StringEscapeUtils.unescapeHtml4(situationContent);
	}

	public void setSituationContent(String situationContent) {
		this.situationContent = situationContent;
	}
	
	public String getOrgSetContent() {
		return StringEscapeUtils.unescapeHtml4(orgSetContent);
	}

	public void setOrgSetContent(String orgSetContent) {
		this.orgSetContent = orgSetContent;
	}
	
	public String getTradeContent() {
		return StringEscapeUtils.unescapeHtml4(tradeContent);
	}

	public void setTradeContent(String tradeContent) {
		this.tradeContent = tradeContent;
	}
	
	@Length(min=0, max=200, message="地址长度必须介于 0 和 200 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Length(min=0, max=20, message="联系电话长度必须介于 0 和 20 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Length(min=0, max=20, message="qq群长度必须介于 0 和 20 之间")
	public String getQqgroup() {
		return qqgroup;
	}

	public void setQqgroup(String qqgroup) {
		this.qqgroup = qqgroup;
	}
	
	@Length(min=0, max=100, message="邮箱长度必须介于 0 和 100 之间")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	
	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	
	@Length(min=0, max=200, message="泰尔概况图片长度必须介于 0 和 200 之间")
	public String getSituationImg() {
		return situationImg;
	}

	public void setSituationImg(String situationImg) {
		this.situationImg = situationImg;
	}
	
	@Length(min=0, max=200, message="机构设置图片长度必须介于 0 和 200 之间")
	public String getOrgSetImg() {
		return orgSetImg;
	}

	public void setOrgSetImg(String orgSetImg) {
		this.orgSetImg = orgSetImg;
	}
	
	@Length(min=0, max=200, message="行业组织图片长度必须介于 0 和 200 之间")
	public String getTradeImg() {
		return tradeImg;
	}

	public void setTradeImg(String tradeImg) {
		this.tradeImg = tradeImg;
	}
}
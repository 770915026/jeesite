/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 厂家基本信息Entity
 * @author gy
 * @version 2018-08-20
 */
public class TlCompanyInfo extends DataEntity<TlCompanyInfo> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 企业名称
	private String nameEn;		// 企业英文名称
	private String address;		// 地址
	private String phone;		// 联系人电话
	private String email;		// 邮箱
	private String linkmanName;		// 联系人姓名
	private User user;		// 用户id
	private String zipCode;		// 邮编
    private TlFactory tlFactory;
    private String factoryName;
	
	public TlCompanyInfo() {
		super();
	}

	public TlCompanyInfo(String id){
		super(id);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getNameEn() {
		return nameEn;
	}

	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getLinkmanName() {
		return linkmanName;
	}

	public void setLinkmanName(String linkmanName) {
		this.linkmanName = linkmanName;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

    public TlFactory getTlFactory() {
        return tlFactory;
    }

    public void setTlFactory(TlFactory tlFactory) {
        this.tlFactory = tlFactory;
    }

	public String getFactoryName() {
		return factoryName;
	}

	public void setFactoryName(String factoryName) {
		this.factoryName = factoryName;
	}
    
}
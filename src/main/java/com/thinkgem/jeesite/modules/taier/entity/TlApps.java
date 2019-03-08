/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * appEntity
 * @author xuyongqiang
 * @version 2018-10-11
 */
public class TlApps extends DataEntity<TlApps> {
	
	private static final long serialVersionUID = 1L;
	private String orderNo;
	private String name;		// app名称
	private String developer;		// 开发者
	private String visitAuth;		// 访问权限
	private String companyId;		// 企业id
	private String description;		// 功能描述
	private String createUserId;		// 创建人
	private String verification;

	public String getVerification() {
		return verification;
	}

	public void setVerification(String verification) {
		this.verification = verification;
	}

	public TlApps() {
		super();
	}

	public TlApps(String id){
		super(id);
	}
	@ExcelField(title="序号", align=2, sort=20)
	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	@ExcelField(title="应用名称", align=2, sort=40)
	@Length(min=1, max=200, message="app名称长度必须介于 1 和 200 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@ExcelField(title="开发者信息", align=2, sort=80)
	@Length(min=0, max=200, message="开发者长度必须介于 0 和 200 之间")
	public String getDeveloper() {
		return developer;
	}

	public void setDeveloper(String developer) {
		this.developer = developer;
	}
	
	@ExcelField(title="权限列表", align=2, sort=100)
	@Length(min=0, max=500, message="访问权限长度必须介于 0 和 500 之间")
	public String getVisitAuth() {
		return visitAuth;
	}

	public void setVisitAuth(String visitAuth) {
		this.visitAuth = visitAuth;
	}
	
	@Length(min=0, max=64, message="企业id长度必须介于 0 和 64 之间")
	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	
	@ExcelField(title="功能描述", align=2, sort=60)
	@Length(min=0, max=500, message="功能描述长度必须介于 0 和 500 之间")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	@Length(min=0, max=64, message="创建人长度必须介于 0 和 64 之间")
	public String getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 发票Entity
 * @author gy
 * @version 2018-08-22
 */
public class TlInvoice extends DataEntity<TlInvoice> {
	
	private static final long serialVersionUID = 1L;
	private TlCompanyInfo company = new TlCompanyInfo();		// 厂家信息
	private String type;		// 发票类型：0-不开发票；1-纸质发票；2-电子发票
	private String invoiceName;		// 名称
	private String taxNumber;		// 税号
	private String receiveType;		// 纸质发票接收方式：0-自取；1-邮寄
	private String receiveAddress;		// 邮寄地址
	private String receivePhone;		// 收票人电话
	private String receiveEmail;		// 收票人邮箱
	private String type2;		// 企业或个人0-企业；1-个人
	private String flag;		// 完成标志0-申请；1-开票
	
	public TlInvoice() {
		super();
	}

	public TlInvoice(String id){
		super(id);
	}

	public TlCompanyInfo getCompany() {
		return company;
	}

	public void setCompany(TlCompanyInfo company) {
		this.company = company;
	}

	@Length(min=0, max=4, message="发票类型：0-不开发票；1-纸质发票；2-电子发票长度必须介于 0 和 4 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=100, message="名称长度必须介于 0 和 100 之间")
	public String getInvoiceName() {
		return invoiceName;
	}

	public void setInvoiceName(String invoiceName) {
		this.invoiceName = invoiceName;
	}
	
	@Length(min=0, max=100, message="税号长度必须介于 0 和 100 之间")
	public String getTaxNumber() {
		return taxNumber;
	}

	public void setTaxNumber(String taxNumber) {
		this.taxNumber = taxNumber;
	}
	
	@Length(min=0, max=4, message="纸质发票接收方式：0-自取；1-邮寄长度必须介于 0 和 4 之间")
	public String getReceiveType() {
		return receiveType;
	}

	public void setReceiveType(String receiveType) {
		this.receiveType = receiveType;
	}
	
	@Length(min=0, max=200, message="邮寄地址长度必须介于 0 和 200 之间")
	public String getReceiveAddress() {
		return receiveAddress;
	}

	public void setReceiveAddress(String receiveAddress) {
		this.receiveAddress = receiveAddress;
	}
	
	@Length(min=0, max=20, message="收票人电话长度必须介于 0 和 20 之间")
	public String getReceivePhone() {
		return receivePhone;
	}

	public void setReceivePhone(String receivePhone) {
		this.receivePhone = receivePhone;
	}
	
	@Length(min=0, max=200, message="收票人邮箱长度必须介于 0 和 200 之间")
	public String getReceiveEmail() {
		return receiveEmail;
	}

	public void setReceiveEmail(String receiveEmail) {
		this.receiveEmail = receiveEmail;
	}
	
	@Length(min=0, max=4, message="企业或个人0-企业；1-个人长度必须介于 0 和 4 之间")
	public String getType2() {
		return type2;
	}

	public void setType2(String type2) {
		this.type2 = type2;
	}
	
	@Length(min=0, max=1, message="完成标志0-申请；1-开票长度必须介于 0 和 1 之间")
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
}
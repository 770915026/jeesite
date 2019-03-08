/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 缴费信息Entity
 * @author gy
 * @version 2018-08-21
 */
public class TlPaymentInfo extends DataEntity<TlPaymentInfo> {
	
	private static final long serialVersionUID = 1L;
	private Double amount;		// 金额
	private String aliurl;		// 支付宝二维码url
	private String weixinurl;		// 微信二维码url
	private String baiduurl;		// 百度钱包二维码url
	private String bank;		// 开户行
	private String banknum;		// 银行账号
	private String dutynum;		// 税号
	private String remark;		// 备注
	
	public TlPaymentInfo() {
		super();
	}

	public TlPaymentInfo(String id){
		super(id);
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}
	
	@Length(min=0, max=200, message="支付宝二维码url长度必须介于 0 和 200 之间")
	public String getAliurl() {
		return aliurl;
	}

	public void setAliurl(String aliurl) {
		this.aliurl = aliurl;
	}
	
	@Length(min=0, max=200, message="微信二维码url长度必须介于 0 和 200 之间")
	public String getWeixinurl() {
		return weixinurl;
	}

	public void setWeixinurl(String weixinurl) {
		this.weixinurl = weixinurl;
	}
	
	@Length(min=0, max=200, message="百度钱包二维码url长度必须介于 0 和 200 之间")
	public String getBaiduurl() {
		return baiduurl;
	}

	public void setBaiduurl(String baiduurl) {
		this.baiduurl = baiduurl;
	}
	
	@Length(min=0, max=200, message="开户行长度必须介于 0 和 200 之间")
	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}
	
	@Length(min=0, max=200, message="银行账号长度必须介于 0 和 200 之间")
	public String getBanknum() {
		return banknum;
	}

	public void setBanknum(String banknum) {
		this.banknum = banknum;
	}
	
	@Length(min=0, max=200, message="税号长度必须介于 0 和 200 之间")
	public String getDutynum() {
		return dutynum;
	}

	public void setDutynum(String dutynum) {
		this.dutynum = dutynum;
	}
	
	@Length(min=0, max=200, message="备注长度必须介于 0 和 200 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
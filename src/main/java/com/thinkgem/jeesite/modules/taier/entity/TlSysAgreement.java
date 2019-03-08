/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;


import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 协议Entity
 * @author gy
 * @version 2018-08-24
 */
public class TlSysAgreement extends DataEntity<TlSysAgreement> {
	
	private static final long serialVersionUID = 1L;
	private String serviceAgreement;		// 泰尔视角服务协议
	private String serviceAgreement1;		// 泰尔视角服务条款
	private String serviceAgreement2;		// 法律声明和隐私政策条款
	
	public TlSysAgreement() {
		super();
	}

	public TlSysAgreement(String id){
		super(id);
	}

	public String getServiceAgreement() {
		return serviceAgreement;
	}

	public void setServiceAgreement(String serviceAgreement) {
		this.serviceAgreement = serviceAgreement;
	}
	
	public String getServiceAgreement1() {
		return serviceAgreement1;
	}

	public void setServiceAgreement1(String serviceAgreement1) {
		this.serviceAgreement1 = serviceAgreement1;
	}
	
	public String getServiceAgreement2() {
		return serviceAgreement2;
	}

	public void setServiceAgreement2(String serviceAgreement2) {
		this.serviceAgreement2 = serviceAgreement2;
	}
	
}
package com.thinkgem.jeesite.modules.tyspace.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;
/**
 * 
* Title: WX.java  
* Description:卫星实体类  
* Copyright: Copyright (c) 2019
* Company: 北京中锐识华信息科技有限公司
* @author Yuyanan  
* @date 2019年2月28日  
* @version 1.0
 */
public class WX extends DataEntity<WX> {
	
	private static final long serialVersionUID = 1L;
	private String id;
	private String wxmc;
	private String wxxh;
	private String wxpl;
	private String wxys;
	
	public WX(){
		super();
	}
	public WX(String id){
		super(id);
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWxmc() {
		return wxmc;
	}
	public void setWxmc(String wxmc) {
		this.wxmc = wxmc;
	}
	public String getWxxh() {
		return wxxh;
	}
	public void setWxxh(String wxxh) {
		this.wxxh = wxxh;
	}
	public String getWxpl() {
		return wxpl;
	}
	public void setWxpl(String wxpl) {
		this.wxpl = wxpl;
	}
	public String getWxys() {
		return wxys;
	}
	public void setWxys(String wxys) {
		this.wxys = wxys;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}	
}

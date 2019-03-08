/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 变更确认表主表Entity
 * @author gy
 * @version 2018-10-31
 */
public class TmcBgqrb extends DataEntity<TmcBgqrb> {
	
	private static final long serialVersionUID = 1L;
	private String bgjl;		// bgjl
	private String gdh;		// gdh
	private String reader;		// reader
	private String writer;		// writer
	private String pk1;		// pk1
	private String bm;		// bm
	private String sqdw;		// sqdw
	private String sqxh;		// sqxh
	private String sqbh;		// sqbh
	private String yccczsh;		// yccczsh
	private String ycccbgh;		// ycccbgh
	private String ycccsqh;		// ycccsqh
	private String bz;		// bz
	
	public TmcBgqrb() {
		super();
	}

	public TmcBgqrb(String id){
		super(id);
	}

	@Length(min=0, max=4000, message="bgjl长度必须介于 0 和 4000 之间")
	public String getBgjl() {
		return bgjl;
	}

	public void setBgjl(String bgjl) {
		this.bgjl = bgjl;
	}
	
	@Length(min=0, max=100, message="gdh长度必须介于 0 和 100 之间")
	public String getGdh() {
		return gdh;
	}

	public void setGdh(String gdh) {
		this.gdh = gdh;
	}
	
	@Length(min=0, max=2000, message="reader长度必须介于 0 和 2000 之间")
	public String getReader() {
		return reader;
	}

	public void setReader(String reader) {
		this.reader = reader;
	}
	
	@Length(min=0, max=2000, message="writer长度必须介于 0 和 2000 之间")
	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	@Length(min=0, max=100, message="pk1长度必须介于 0 和 100 之间")
	public String getPk1() {
		return pk1;
	}

	public void setPk1(String pk1) {
		this.pk1 = pk1;
	}
	
	@Length(min=0, max=100, message="bm长度必须介于 0 和 100 之间")
	public String getBm() {
		return bm;
	}

	public void setBm(String bm) {
		this.bm = bm;
	}
	
	@Length(min=0, max=1000, message="sqdw长度必须介于 0 和 1000 之间")
	public String getSqdw() {
		return sqdw;
	}

	public void setSqdw(String sqdw) {
		this.sqdw = sqdw;
	}
	
	@Length(min=0, max=1000, message="sqxh长度必须介于 0 和 1000 之间")
	public String getSqxh() {
		return sqxh;
	}

	public void setSqxh(String sqxh) {
		this.sqxh = sqxh;
	}
	
	@Length(min=0, max=1000, message="sqbh长度必须介于 0 和 1000 之间")
	public String getSqbh() {
		return sqbh;
	}

	public void setSqbh(String sqbh) {
		this.sqbh = sqbh;
	}
	
	@Length(min=0, max=1000, message="yccczsh长度必须介于 0 和 1000 之间")
	public String getYccczsh() {
		return yccczsh;
	}

	public void setYccczsh(String yccczsh) {
		this.yccczsh = yccczsh;
	}
	
	@Length(min=0, max=1000, message="ycccbgh长度必须介于 0 和 1000 之间")
	public String getYcccbgh() {
		return ycccbgh;
	}

	public void setYcccbgh(String ycccbgh) {
		this.ycccbgh = ycccbgh;
	}
	
	@Length(min=0, max=1000, message="ycccsqh长度必须介于 0 和 1000 之间")
	public String getYcccsqh() {
		return ycccsqh;
	}

	public void setYcccsqh(String ycccsqh) {
		this.ycccsqh = ycccsqh;
	}
	
	@Length(min=0, max=4000, message="bz长度必须介于 0 和 4000 之间")
	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
	
}
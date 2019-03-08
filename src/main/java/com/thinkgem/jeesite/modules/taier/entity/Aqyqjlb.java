/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 安全元器件Entity
 * @author gy
 * @version 2018-10-31
 */
public class Aqyqjlb extends DataEntity<Aqyqjlb> {
	
	private static final long serialVersionUID = 1L;
	private String mc;		// mc
	private String xh;		// xh
	private String clygg;		// clygg
	private String zzs;		// zzs
	private String scc;		// scc
	private String rzxx;		// rzxx
	private String bz;		// bz
	private String reader;		// reader
	private String writer;		// writer
	private String pk1;		// pk1
	private String glpk;		// glpk
	private String sfqr;		// sfqr
	private String xhh;		// xhh
	private String wh;		// wh
	private String bjh;		// bjh
	private String pxh;		// pxh
	private String dclx;		// dclx
	private String cslx;		// cslx
	
	public Aqyqjlb() {
		super();
	}

	public Aqyqjlb(String id){
		super(id);
	}

	@Length(min=0, max=500, message="mc长度必须介于 0 和 500 之间")
	public String getMc() {
		return mc;
	}

	public void setMc(String mc) {
		this.mc = mc;
	}
	
	@Length(min=0, max=500, message="xh长度必须介于 0 和 500 之间")
	public String getXh() {
		return xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}
	
	@Length(min=0, max=500, message="clygg长度必须介于 0 和 500 之间")
	public String getClygg() {
		return clygg;
	}

	public void setClygg(String clygg) {
		this.clygg = clygg;
	}
	
	@Length(min=0, max=500, message="zzs长度必须介于 0 和 500 之间")
	public String getZzs() {
		return zzs;
	}

	public void setZzs(String zzs) {
		this.zzs = zzs;
	}
	
	@Length(min=0, max=500, message="scc长度必须介于 0 和 500 之间")
	public String getScc() {
		return scc;
	}

	public void setScc(String scc) {
		this.scc = scc;
	}
	
	@Length(min=0, max=500, message="rzxx长度必须介于 0 和 500 之间")
	public String getRzxx() {
		return rzxx;
	}

	public void setRzxx(String rzxx) {
		this.rzxx = rzxx;
	}
	
	@Length(min=0, max=500, message="bz长度必须介于 0 和 500 之间")
	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
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
	
	@Length(min=0, max=300, message="glpk长度必须介于 0 和 300 之间")
	public String getGlpk() {
		return glpk;
	}

	public void setGlpk(String glpk) {
		this.glpk = glpk;
	}
	
	@Length(min=0, max=500, message="sfqr长度必须介于 0 和 500 之间")
	public String getSfqr() {
		return sfqr;
	}

	public void setSfqr(String sfqr) {
		this.sfqr = sfqr;
	}
	
	@Length(min=0, max=1000, message="xhh长度必须介于 0 和 1000 之间")
	public String getXhh() {
		return xhh;
	}

	public void setXhh(String xhh) {
		this.xhh = xhh;
	}
	
	@Length(min=0, max=100, message="wh长度必须介于 0 和 100 之间")
	public String getWh() {
		return wh;
	}

	public void setWh(String wh) {
		this.wh = wh;
	}
	
	@Length(min=0, max=100, message="bjh长度必须介于 0 和 100 之间")
	public String getBjh() {
		return bjh;
	}

	public void setBjh(String bjh) {
		this.bjh = bjh;
	}
	
	@Length(min=0, max=100, message="pxh长度必须介于 0 和 100 之间")
	public String getPxh() {
		return pxh;
	}

	public void setPxh(String pxh) {
		this.pxh = pxh;
	}
	
	@Length(min=0, max=100, message="dclx长度必须介于 0 和 100 之间")
	public String getDclx() {
		return dclx;
	}

	public void setDclx(String dclx) {
		this.dclx = dclx;
	}
	
	@Length(min=0, max=2000, message="cslx长度必须介于 0 和 2000 之间")
	public String getCslx() {
		return cslx;
	}

	public void setCslx(String cslx) {
		this.cslx = cslx;
	}
	
}
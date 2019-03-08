/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * emc关键元器件Entity
 * @author gy
 * @version 2018-10-31
 */
public class Emcgjyqjlb extends DataEntity<Emcgjyqjlb> {
	
	private static final long serialVersionUID = 1L;
	private String gjjmc;		// gjjmc
	private String xh;		// xh
	private String gg;		// gg
	private String scc;		// scc
	private String bz;		// bz
	private String reader;		// reader
	private String writer;		// writer
	private String pk1;		// pk1
	private String glpk;		// glpk
	private String sfqr;		// sfqr
	private String wh;		// wh
	private String scqy;		// scqy
	private String sybz;		// sybz
	private String xhh;		// xhh
	private String zzs;		// zzs
	private String lx;		// lx
	
	public Emcgjyqjlb() {
		super();
	}

	public Emcgjyqjlb(String id){
		super(id);
	}

	@Length(min=0, max=600, message="gjjmc长度必须介于 0 和 600 之间")
	public String getGjjmc() {
		return gjjmc;
	}

	public void setGjjmc(String gjjmc) {
		this.gjjmc = gjjmc;
	}
	
	@Length(min=0, max=500, message="xh长度必须介于 0 和 500 之间")
	public String getXh() {
		return xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}
	
	@Length(min=0, max=500, message="gg长度必须介于 0 和 500 之间")
	public String getGg() {
		return gg;
	}

	public void setGg(String gg) {
		this.gg = gg;
	}
	
	@Length(min=0, max=500, message="scc长度必须介于 0 和 500 之间")
	public String getScc() {
		return scc;
	}

	public void setScc(String scc) {
		this.scc = scc;
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
	
	@Length(min=0, max=500, message="pk1长度必须介于 0 和 500 之间")
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
	
	@Length(min=0, max=200, message="wh长度必须介于 0 和 200 之间")
	public String getWh() {
		return wh;
	}

	public void setWh(String wh) {
		this.wh = wh;
	}
	
	@Length(min=0, max=200, message="scqy长度必须介于 0 和 200 之间")
	public String getScqy() {
		return scqy;
	}

	public void setScqy(String scqy) {
		this.scqy = scqy;
	}
	
	@Length(min=0, max=200, message="sybz长度必须介于 0 和 200 之间")
	public String getSybz() {
		return sybz;
	}

	public void setSybz(String sybz) {
		this.sybz = sybz;
	}
	
	@Length(min=0, max=200, message="xhh长度必须介于 0 和 200 之间")
	public String getXhh() {
		return xhh;
	}

	public void setXhh(String xhh) {
		this.xhh = xhh;
	}
	
	@Length(min=0, max=200, message="zzs长度必须介于 0 和 200 之间")
	public String getZzs() {
		return zzs;
	}

	public void setZzs(String zzs) {
		this.zzs = zzs;
	}
	
	@Length(min=0, max=200, message="lx长度必须介于 0 和 200 之间")
	public String getLx() {
		return lx;
	}

	public void setLx(String lx) {
		this.lx = lx;
	}
	
}
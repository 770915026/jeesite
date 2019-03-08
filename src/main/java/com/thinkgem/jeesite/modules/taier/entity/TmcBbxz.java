/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 设备附件Entity
 * @author gy
 * @version 2018-10-31
 */
public class TmcBbxz extends DataEntity<TmcBbxz> {
	
	private static final long serialVersionUID = 1L;
	private String reader;		// reader
	private String writer;		// writer
	private String pk1;		// pk1
	private String cjr;		// cjr
	private String glpk1;		// glpk1
	private String scr;		// scr
	private String scsj;		// scsj
	private String wjjpk1;		// wjjpk1
	private String wjlj;		// wjlj
	private String wjm;		// wjm
	private String yswjm;		// yswjm
	
	public TmcBbxz() {
		super();
	}

	public TmcBbxz(String id){
		super(id);
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
	
	@Length(min=0, max=100, message="cjr长度必须介于 0 和 100 之间")
	public String getCjr() {
		return cjr;
	}

	public void setCjr(String cjr) {
		this.cjr = cjr;
	}
	
	@Length(min=0, max=100, message="glpk1长度必须介于 0 和 100 之间")
	public String getGlpk1() {
		return glpk1;
	}

	public void setGlpk1(String glpk1) {
		this.glpk1 = glpk1;
	}
	
	@Length(min=0, max=100, message="scr长度必须介于 0 和 100 之间")
	public String getScr() {
		return scr;
	}

	public void setScr(String scr) {
		this.scr = scr;
	}
	
	@Length(min=0, max=100, message="scsj长度必须介于 0 和 100 之间")
	public String getScsj() {
		return scsj;
	}

	public void setScsj(String scsj) {
		this.scsj = scsj;
	}
	
	@Length(min=0, max=100, message="wjjpk1长度必须介于 0 和 100 之间")
	public String getWjjpk1() {
		return wjjpk1;
	}

	public void setWjjpk1(String wjjpk1) {
		this.wjjpk1 = wjjpk1;
	}
	
	@Length(min=0, max=100, message="wjlj长度必须介于 0 和 100 之间")
	public String getWjlj() {
		return wjlj;
	}

	public void setWjlj(String wjlj) {
		this.wjlj = wjlj;
	}
	
	@Length(min=0, max=100, message="wjm长度必须介于 0 和 100 之间")
	public String getWjm() {
		return wjm;
	}

	public void setWjm(String wjm) {
		this.wjm = wjm;
	}
	
	@Length(min=0, max=100, message="yswjm长度必须介于 0 和 100 之间")
	public String getYswjm() {
		return yswjm;
	}

	public void setYswjm(String yswjm) {
		this.yswjm = yswjm;
	}
	
}
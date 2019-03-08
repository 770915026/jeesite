/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 版本信息Entity
 * @author gy
 * @version 2018-10-31
 */
public class TmcBbxx extends DataEntity<TmcBbxx> {
	
	private static final long serialVersionUID = 1L;
	private String cxfs;		// cxfs
	private String rjbbh;		// rjbbh
	private String yjbbh;		// yjbbh
	private String bh;		// bh
	private String reader;		// reader
	private String writer;		// writer
	private String pk1;		// pk1
	
	public TmcBbxx() {
		super();
	}

	public TmcBbxx(String id){
		super(id);
	}

	@Length(min=0, max=100, message="cxfs长度必须介于 0 和 100 之间")
	public String getCxfs() {
		return cxfs;
	}

	public void setCxfs(String cxfs) {
		this.cxfs = cxfs;
	}
	
	@Length(min=0, max=100, message="rjbbh长度必须介于 0 和 100 之间")
	public String getRjbbh() {
		return rjbbh;
	}

	public void setRjbbh(String rjbbh) {
		this.rjbbh = rjbbh;
	}
	
	@Length(min=0, max=100, message="yjbbh长度必须介于 0 和 100 之间")
	public String getYjbbh() {
		return yjbbh;
	}

	public void setYjbbh(String yjbbh) {
		this.yjbbh = yjbbh;
	}
	
	@Length(min=0, max=100, message="bh长度必须介于 0 和 100 之间")
	public String getBh() {
		return bh;
	}

	public void setBh(String bh) {
		this.bh = bh;
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
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 变更确认表子表Entity
 * @author gy
 * @version 2018-10-31
 */
public class TmcBgqrzb extends DataEntity<TmcBgqrzb> {
	
	private static final long serialVersionUID = 1L;
	private String gdh;		// gdh
	private String xh;		// xh
	private String mc;		// mc
	private String bgq;		// bgq
	private String bgh;		// bgh
	private String glpk1;		// glpk1
	private String bm;		// bm
	private String reader;		// reader
	private String writer;		// writer
	private String pk1;		// pk1
	private String lx;		// lx
	
	public TmcBgqrzb() {
		super();
	}

	public TmcBgqrzb(String id){
		super(id);
	}

	@Length(min=0, max=100, message="gdh长度必须介于 0 和 100 之间")
	public String getGdh() {
		return gdh;
	}

	public void setGdh(String gdh) {
		this.gdh = gdh;
	}
	
	@Length(min=0, max=100, message="xh长度必须介于 0 和 100 之间")
	public String getXh() {
		return xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}
	
	@Length(min=0, max=100, message="mc长度必须介于 0 和 100 之间")
	public String getMc() {
		return mc;
	}

	public void setMc(String mc) {
		this.mc = mc;
	}
	
	@Length(min=0, max=4000, message="bgq长度必须介于 0 和 4000 之间")
	public String getBgq() {
		return bgq;
	}

	public void setBgq(String bgq) {
		this.bgq = bgq;
	}
	
	@Length(min=0, max=4000, message="bgh长度必须介于 0 和 4000 之间")
	public String getBgh() {
		return bgh;
	}

	public void setBgh(String bgh) {
		this.bgh = bgh;
	}
	
	@Length(min=0, max=100, message="glpk1长度必须介于 0 和 100 之间")
	public String getGlpk1() {
		return glpk1;
	}

	public void setGlpk1(String glpk1) {
		this.glpk1 = glpk1;
	}
	
	@Length(min=0, max=200, message="bm长度必须介于 0 和 200 之间")
	public String getBm() {
		return bm;
	}

	public void setBm(String bm) {
		this.bm = bm;
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
	
	@Length(min=0, max=100, message="lx长度必须介于 0 和 100 之间")
	public String getLx() {
		return lx;
	}

	public void setLx(String lx) {
		this.lx = lx;
	}
	
}
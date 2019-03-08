/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 电源适配器充电器Entity
 * @author gy
 * @version 2018-10-31
 */
public class TmcDyspqcdq extends DataEntity<TmcDyspqcdq> {
	
	private static final long serialVersionUID = 1L;
	private String bh;		// bh
	private String xh;		// xh
	private String cd;		// cd
	private String scc;		// scc
	private String zzs;		// zzs
	private String zsh;		// zsh
	private String reader;		// reader
	private String writer;		// writer
	private String pk1;		// pk1
	
	public TmcDyspqcdq() {
		super();
	}

	public TmcDyspqcdq(String id){
		super(id);
	}

	@Length(min=0, max=1000, message="bh长度必须介于 0 和 1000 之间")
	public String getBh() {
		return bh;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}
	
	@Length(min=0, max=1000, message="xh长度必须介于 0 和 1000 之间")
	public String getXh() {
		return xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}
	
	@Length(min=0, max=1000, message="cd长度必须介于 0 和 1000 之间")
	public String getCd() {
		return cd;
	}

	public void setCd(String cd) {
		this.cd = cd;
	}
	
	@Length(min=0, max=4000, message="scc长度必须介于 0 和 4000 之间")
	public String getScc() {
		return scc;
	}

	public void setScc(String scc) {
		this.scc = scc;
	}
	
	@Length(min=0, max=400, message="zzs长度必须介于 0 和 400 之间")
	public String getZzs() {
		return zzs;
	}

	public void setZzs(String zzs) {
		this.zzs = zzs;
	}
	
	@Length(min=0, max=4000, message="zsh长度必须介于 0 和 4000 之间")
	public String getZsh() {
		return zsh;
	}

	public void setZsh(String zsh) {
		this.zsh = zsh;
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
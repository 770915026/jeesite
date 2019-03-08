/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 详细信息Entity
 * @author gy
 * @version 2018-10-31
 */
public class TmcXxxx extends DataEntity<TmcXxxx> {
	
	private static final long serialVersionUID = 1L;
	private String dk;		// dk
	private String ej;		// ej
	private String syj;		// syj
	private String ly;		// ly
	private String gps;		// gps
	private String gprs;		// gprs
	private String gprsclass;		// gprsclass
	private String egprs;		// egprs
	private String egprsclass;		// egprsclass
	private String wapi;		// wapi
	private String cmmb;		// cmmb
	private String bz;		// bz
	private String bh;		// bh
	private String reader;		// reader
	private String writer;		// writer
	private String pk1;		// pk1
	
	public TmcXxxx() {
		super();
	}

	public TmcXxxx(String id){
		super(id);
	}

	@Length(min=0, max=100, message="dk长度必须介于 0 和 100 之间")
	public String getDk() {
		return dk;
	}

	public void setDk(String dk) {
		this.dk = dk;
	}
	
	@Length(min=0, max=100, message="ej长度必须介于 0 和 100 之间")
	public String getEj() {
		return ej;
	}

	public void setEj(String ej) {
		this.ej = ej;
	}
	
	@Length(min=0, max=100, message="syj长度必须介于 0 和 100 之间")
	public String getSyj() {
		return syj;
	}

	public void setSyj(String syj) {
		this.syj = syj;
	}
	
	@Length(min=0, max=100, message="ly长度必须介于 0 和 100 之间")
	public String getLy() {
		return ly;
	}

	public void setLy(String ly) {
		this.ly = ly;
	}
	
	@Length(min=0, max=100, message="gps长度必须介于 0 和 100 之间")
	public String getGps() {
		return gps;
	}

	public void setGps(String gps) {
		this.gps = gps;
	}
	
	@Length(min=0, max=100, message="gprs长度必须介于 0 和 100 之间")
	public String getGprs() {
		return gprs;
	}

	public void setGprs(String gprs) {
		this.gprs = gprs;
	}
	
	@Length(min=0, max=100, message="gprsclass长度必须介于 0 和 100 之间")
	public String getGprsclass() {
		return gprsclass;
	}

	public void setGprsclass(String gprsclass) {
		this.gprsclass = gprsclass;
	}
	
	@Length(min=0, max=100, message="egprs长度必须介于 0 和 100 之间")
	public String getEgprs() {
		return egprs;
	}

	public void setEgprs(String egprs) {
		this.egprs = egprs;
	}
	
	@Length(min=0, max=100, message="egprsclass长度必须介于 0 和 100 之间")
	public String getEgprsclass() {
		return egprsclass;
	}

	public void setEgprsclass(String egprsclass) {
		this.egprsclass = egprsclass;
	}
	
	@Length(min=0, max=100, message="wapi长度必须介于 0 和 100 之间")
	public String getWapi() {
		return wapi;
	}

	public void setWapi(String wapi) {
		this.wapi = wapi;
	}
	
	@Length(min=0, max=100, message="cmmb长度必须介于 0 和 100 之间")
	public String getCmmb() {
		return cmmb;
	}

	public void setCmmb(String cmmb) {
		this.cmmb = cmmb;
	}
	
	@Length(min=0, max=4000, message="bz长度必须介于 0 和 4000 之间")
	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
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
package com.thinkgem.jeesite.modules.tyspace.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class YCPZB extends DataEntity<YCPZB>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String wxid;
	private String xtid;
	private String pzbb;
	private String tablenamecn;
	private String tablenameen;
	private String fieldcn;
	private String fielden;
	public YCPZB(){
		super();
	}
	public YCPZB(String id){
		super(id);
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWxid() {
		return wxid;
	}
	public void setWxid(String wxid) {
		this.wxid = wxid;
	}
	public String getXtid() {
		return xtid;
	}
	public void setXtid(String xtid) {
		this.xtid = xtid;
	}
	public String getPzbb() {
		return pzbb;
	}
	public void setPzbb(String pzbb) {
		this.pzbb = pzbb;
	}
	public String getTablenamecn() {
		return tablenamecn;
	}
	public void setTablenamecn(String tablenamecn) {
		this.tablenamecn = tablenamecn;
	}
	public String getTablenameen() {
		return tablenameen;
	}
	public void setTablenameen(String tablenameen) {
		this.tablenameen = tablenameen;
	}
	public String getFieldcn() {
		return fieldcn;
	}
	public void setFieldcn(String fieldcn) {
		this.fieldcn = fieldcn;
	}
	public String getFielden() {
		return fielden;
	}
	public void setFielden(String fielden) {
		this.fielden = fielden;
	}
	
}

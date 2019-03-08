/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

import java.util.List;

/**
 * 手机预置应用公示Entity
 * @author gy
 * @version 2018-08-30
 */
public class TlApppreset extends DataEntity<TlApppreset> {
	
	private static final long serialVersionUID = 1L;
	private String unionId;		// 联合信息
	private String productVersion;		// 产品型号
	private String productName;		// 产品名称
	private String phoneVersion;		// 手机大版本号
	private String versionDate;		// 版本日期
	private String uninstallType;		// 预置应用卸载方法
	private String img;		// 图标
	private String apps;		// 应用id
	private String flag;		// 审核标志0-已保存1-待发布2-已发布
	private String modifiable;		// 可修改
	private String hotflag;		// 热门
	private String applymdf; //是否申请修改0-不是 1-是
	private User user;		// 发布人id
	private String tableName;
	private String reason;//修改理由
	private List<TlApps> applist;
	private String companyId;

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public TlApppreset() {
		super();
	}

	public TlApppreset(String id){
		super(id);
	}

	@Length(min=1, max=64, message="联合信息长度必须介于 1 和 64 之间")
	public String getUnionId() {
		return unionId;
	}

	public void setUnionId(String unionId) {
		this.unionId = unionId;
	}
	
	@Length(min=0, max=200, message="手机大版本号长度必须介于 0 和 200 之间")
	public String getPhoneVersion() {
		return phoneVersion;
	}

	public void setPhoneVersion(String phoneVersion) {
		this.phoneVersion = phoneVersion;
	}
	
	@Length(min=0, max=64, message="版本日期长度必须介于 0 和 64 之间")
	public String getVersionDate() {
		return versionDate;
	}

	public void setVersionDate(String versionDate) {
		this.versionDate = versionDate;
	}
	
	@Length(min=0, max=200, message="预置应用卸载方法长度必须介于 0 和 200 之间")
	public String getUninstallType() {
		return uninstallType;
	}

	public void setUninstallType(String uninstallType) {
		this.uninstallType = uninstallType;
	}
	
	@Length(min=0, max=200, message="图标长度必须介于 0 和 200 之间")
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	@Length(min=0, max=500, message="应用id长度必须介于 0 和 500 之间")
	public String getApps() {
		return apps;
	}

	public void setApps(String apps) {
		this.apps = apps;
	}
	
	@Length(min=0, max=64, message="审核标志0-已保存1-待发布2-已发布长度必须介于 0 和 64 之间")
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	@Length(min=0, max=1, message="可修改长度必须介于 0 和 1 之间")
	public String getModifiable() {
		return modifiable;
	}

	public void setModifiable(String modifiable) {
		this.modifiable = modifiable;
	}
	
	@Length(min=0, max=1, message="热门长度必须介于 0 和 1 之间")
	public String getHotflag() {
		return hotflag;
	}

	public void setHotflag(String hotflag) {
		this.hotflag = hotflag;
	}

	public String getApplymdf() {
		return applymdf;
	}

	public void setApplymdf(String applymdf) {
		this.applymdf = applymdf;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<TlApps> getApplist() {
		return applist;
	}

	public void setApplist(List<TlApps> applist) {
		this.applist = applist;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getProductVersion() {
		return productVersion;
	}

	public void setProductVersion(String productVersion) {
		this.productVersion = productVersion;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.User;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 企业联合信息Entity
 * @author gy
 * @version 2018-08-27
 */
public class TlCompanyUnionInfo extends DataEntity<TlCompanyUnionInfo> {
	
	private static final long serialVersionUID = 1L;
	private String tableName;		// 表名
	private String productName;		// 产品名称
	private String productVersion;		// 产品型号
	private String productImgs;		// 产品照片
	private String configureType;		// 配置信息类型0-图文 1-纯文字
	private String configureImg;		// 配置信息图标
	private String configureTitle;		// 配置信息标题
	private String configureContent;		// 配置信息描述
	private String auth1Img;		// 国内认证图片
	private String auth1Content;		// 国内认证内容
	private String auth2Img;		// 国际认证图片
	private String auth2Content;		// 国际认证内容
	private String auth3Img;		// 泰尔认证图片
	private String auth3Content;		// 泰尔认证内容
	private User user;		// 发布人id
	private String flag;		// 审核标志0-已保存1-待发布2-已发布
	private String modifiable;		// 是否可修改0-不可 1-可修改
	private String hotflag;		// 是否为热门0-不是 1-是
	private String companyId;
	private String orderNo;
	private String approvalRemark;
	private String productintro;
	private String faceImg;
    private String type;
	private String pp;
	private String nc;
	private String cc;
	public String getProductintro() {
		return productintro;
	}

	public void setProductintro(String productintro) {
		this.productintro = productintro;
	}

	public TlCompanyUnionInfo() {
		super();
	}

	public TlCompanyUnionInfo(String id){
		super(id);
	}

	@Length(min=0, max=200, message="表名长度必须介于 0 和 200 之间")
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
	@Length(min=0, max=200, message="产品名称长度必须介于 0 和 200 之间")
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	@Length(min=0, max=200, message="产品型号长度必须介于 0 和 200 之间")
	public String getProductVersion() {
		return productVersion;
	}

	public void setProductVersion(String productVersion) {
		this.productVersion = productVersion;
	}
	
	@Length(min=0, max=500, message="产品照片长度必须介于 0 和 500 之间")
	public String getProductImgs() {
		return productImgs;
	}

	public void setProductImgs(String productImgs) {
		this.productImgs = productImgs;
	}
	
	@Length(min=0, max=64, message="配置信息类型0-图文 1-纯文字长度必须介于 0 和 64 之间")
	public String getConfigureType() {
		return configureType;
	}

	public void setConfigureType(String configureType) {
		this.configureType = configureType;
	}
	
	@Length(min=0, max=200, message="配置信息图标长度必须介于 0 和 200 之间")
	public String getConfigureImg() {
		return configureImg;
	}

	public void setConfigureImg(String configureImg) {
		this.configureImg = configureImg;
	}
	
	@Length(min=0, max=500, message="配置信息标题长度必须介于 0 和 500 之间")
	public String getConfigureTitle() {
		return configureTitle;
	}

	public void setConfigureTitle(String configureTitle) {
		this.configureTitle = configureTitle;
	}
	
	@Length(min=0, max=1500, message="配置信息描述长度必须介于 0 和 1500 之间")
	public String getConfigureContent() {
		return configureContent;
	}

	public void setConfigureContent(String configureContent) {
		this.configureContent = configureContent;
	}
	
	@Length(min=0, max=1500, message="国内认证图片长度必须介于 0 和 1500 之间")
	public String getAuth1Img() {
		return auth1Img;
	}

	public void setAuth1Img(String auth1Img) {
		this.auth1Img = auth1Img;
	}
	
	@Length(min=0, max=1500, message="国内认证内容长度必须介于 0 和 1500 之间")
	public String getAuth1Content() {
		return auth1Content;
	}

	public void setAuth1Content(String auth1Content) {
		this.auth1Content = auth1Content;
	}
	
	@Length(min=0, max=1500, message="国际认证图片长度必须介于 0 和 1500 之间")
	public String getAuth2Img() {
		return auth2Img;
	}

	public void setAuth2Img(String auth2Img) {
		this.auth2Img = auth2Img;
	}
	
	@Length(min=0, max=1500, message="国际认证内容长度必须介于 0 和 1500 之间")
	public String getAuth2Content() {
		return auth2Content;
	}

	public void setAuth2Content(String auth2Content) {
		this.auth2Content = auth2Content;
	}
	
	@Length(min=0, max=1500, message="泰尔认证图片长度必须介于 0 和 1500 之间")
	public String getAuth3Img() {
		return auth3Img;
	}

	public void setAuth3Img(String auth3Img) {
		this.auth3Img = auth3Img;
	}
	
	@Length(min=0, max=1500, message="泰尔认证内容长度必须介于 0 和 1500 之间")
	public String getAuth3Content() {
		return auth3Content;
	}

	public void setAuth3Content(String auth3Content) {
		this.auth3Content = auth3Content;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=0, max=64, message="审核标志0-已保存1-待发布2-已发布长度必须介于 0 和 64 之间")
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	@Length(min=0, max=1, message="是否可修改0-不可 1-可修改长度必须介于 0 和 1 之间")
	public String getModifiable() {
		return modifiable;
	}

	public void setModifiable(String modifiable) {
		this.modifiable = modifiable;
	}

	public String getHotflag() {
		return hotflag;
	}

	public void setHotflag(String hotflag) {
		this.hotflag = hotflag;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getApprovalRemark() {
		return approvalRemark;
	}

	public void setApprovalRemark(String approvalRemark) {
		this.approvalRemark = approvalRemark;
	}

	public String getFaceImg() {
		return faceImg;
	}

	public void setFaceImg(String faceImg) {
		this.faceImg = faceImg;
	}

    public String getPp() {
        return pp;
    }

    public void setPp(String pp) {
        this.pp = pp;
    }

    public String getNc() {
        return nc;
    }

    public void setNc(String nc) {
        this.nc = nc;
    }

    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
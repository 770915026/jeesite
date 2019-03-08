/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 操作记录Entity
 * @author xuyongqiang
 * @version 2018-10-10
 */
public class OperateRecords extends DataEntity<OperateRecords> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 操作用户id
	private String menu;		// 操作菜单
	private String menuName;		// 菜单名称：1-首页，2-新闻，3-在线业务办理，4-企业产品联合信息发布，5-预制应用公示，6-行业分析报告，7-最新活动，8-政策，9-关于我们，10联系我们，11-厂家基本信息，12-进网，13-ccc,14-业务流程及说明，15业务申请，16-业务办理及状态查询，17-历史任务，18-缴费，19-新消息，20-修改密码，21-我的收藏
	private String operateType;		// 操作类型：1-查看，2-增加，3-删除，4-修改
	private String detailId;		// 内容id
	private String detailTitle;		// 内容标题
	
	public OperateRecords() {
		super();
	}

	public OperateRecords(String id){
		super(id);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=0, max=100, message="操作菜单长度必须介于 0 和 100 之间")
	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}
	
	@Length(min=0, max=100, message="菜单名称：1-首页，2-新闻，3-在线业务办理，4-企业产品联合信息发布，5-预制应用公示，6-行业分析报告，7-最新活动，8-政策，9-关于我们，10联系我们，11-厂家基本信息，12-进网，13-ccc,14-业务流程及说明，15业务申请，16-业务办理及状态查询，17-历史任务，18-缴费，19-新消息，20-修改密码，21-我的收藏长度必须介于 0 和 100 之间")
	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	
	@Length(min=0, max=4, message="操作类型：1-查看，2-增加，3-删除，4-修改长度必须介于 0 和 4 之间")
	public String getOperateType() {
		return operateType;
	}

	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}
	
	@Length(min=0, max=64, message="内容id长度必须介于 0 和 64 之间")
	public String getDetailId() {
		return detailId;
	}

	public void setDetailId(String detailId) {
		this.detailId = detailId;
	}
	
	@Length(min=0, max=100, message="内容标题长度必须介于 0 和 100 之间")
	public String getDetailTitle() {
		return detailTitle;
	}

	public void setDetailTitle(String detailTitle) {
		this.detailTitle = detailTitle;
	}
	
}
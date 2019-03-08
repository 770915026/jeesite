/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.apache.commons.lang3.StringEscapeUtils;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 政策Entity
 * @author xuyongqiang
 * @version 2018-08-31
 */
public class Policy extends DataEntity<Policy> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 政策名称
	private String content;		// 内容
	private String source;		// 来源
	private long clickNum;		// 点击次数
	private String type;		// 类型：1-政策文件，2-法律，3-行政法规，4-部门规章
	private String keyWord;    //关键字
	private String orderNo;
	
	public Policy() {
		super();
	}

	public Policy(String id){
		super(id);
	}

	@Length(min=1, max=200, message="政策名称长度必须介于 1 和 200 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return StringEscapeUtils.unescapeHtml4(content);
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=200, message="来源长度必须介于 0 和 200 之间")
	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}
	
	public long getClickNum() {
		return clickNum;
	}

	public void setClickNum(long clickNum) {
		this.clickNum = clickNum;
	}
	
	@Length(min=1, max=4, message="类型：1-政策文件，2-法律，3-行政法规，4-部门规章长度必须介于 1 和 4 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	
}
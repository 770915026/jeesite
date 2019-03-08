/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.apache.commons.lang3.StringEscapeUtils;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 新闻Entity
 * @author xuyongqiang
 * @version 2018-08-23
 */
public class News extends DataEntity<News> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 新闻标题
	private String content;		// 内容
	private String type;		// 新闻类型：1-行业；2-产品；3-快报
	private String isHot;		// 是否热门
	private String author;		// 作者
	private String originalLink;		// 原文链接
	private String contentText;
	private String img;
	private String isToFirstPage;
	private String keyWord;    //关键字
	private String orderNo;
	private String isRoll;//是否设置为滚动栏新闻
	
	public News() {
		super();
	}

	public News(String id){
		super(id);
	}

	@Length(min=1, max=200, message="新闻标题长度必须介于 1 和 200 之间")
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
	
	@Length(min=1, max=4, message="新闻类型：1-行业；2-产品；3-快报长度必须介于 1 和 4 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=4, message="是否热门长度必须介于 0 和 4 之间")
	public String getIsHot() {
		return isHot;
	}

	public void setIsHot(String isHot) {
		this.isHot = isHot;
	}
	
	@Length(min=0, max=100, message="作者长度必须介于 0 和 100 之间")
	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
	
	@Length(min=0, max=200, message="原文链接长度必须介于 0 和 200 之间")
	public String getOriginalLink() {
		return originalLink;
	}

	public void setOriginalLink(String originalLink) {
		this.originalLink = originalLink;
	}

	public String getContentText() {
		return contentText;
	}

	public void setContentText(String contentText) {
		this.contentText = contentText;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getIsToFirstPage() {
		return isToFirstPage;
	}

	public void setIsToFirstPage(String isToFirstPage) {
		this.isToFirstPage = isToFirstPage;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	@Length(min=0, max=10, message="序号长度必须介于 0 和 10 之间")
	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getIsRoll() {
		return isRoll;
	}

	public void setIsRoll(String isRoll) {
		this.isRoll = isRoll;
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.apache.commons.lang3.StringEscapeUtils;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

import java.util.Date;

/**
 * 行业分析报告Entity
 * @author xuyongqiang
 * @version 2018-08-29
 */
public class AnalysisReport extends DataEntity<AnalysisReport> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 企业分析报告标题
	private String cover;		// 封面
	private String content;		// 内容
	private String threeLevelContent;//三级页面内容
	private String source;		// 来源
	private String author;		// author
	private String editor;		// editor
	private String contentText;
	private String isToFirstPage;
	private String orderNo;
	private String pdfurl;
	protected Date beginCreateDate;	// 创建日期查询
	protected Date endCreateDate;	// 创建日期查询
	private  String reportnum;
	private String isCharge;

	public String getIsCharge() {
		return isCharge;
	}

	public void setIsCharge(String isCharge) {
		this.isCharge = isCharge;
	}

	public String getReportnum() {
		return reportnum;
	}

	public void setReportnum(String reportnum) {
		this.reportnum = reportnum;
	}

	public Date getBeginCreateDate() {
		return beginCreateDate;
	}

	public void setBeginCreateDate(Date beginCreateDate) {
		this.beginCreateDate = beginCreateDate;
	}

	public Date getEndCreateDate() {
		return endCreateDate;
	}

	public void setEndCreateDate(Date endCreateDate) {
		this.endCreateDate = endCreateDate;
	}

	public AnalysisReport() {
		super();
	}

	public AnalysisReport(String id){
		super(id);
	}

	@Length(min=1, max=200, message="企业分析报告标题长度必须介于 1 和 200 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=200, message="封面长度必须介于 0 和 200 之间")
	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}
	
	public String getContent() {
		return StringEscapeUtils.unescapeHtml4(content);
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=64, message="来源长度必须介于 0 和 64 之间")
	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}
	
	@Length(min=0, max=64, message="author长度必须介于 0 和 64 之间")
	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
	
	@Length(min=0, max=64, message="editor长度必须介于 0 和 64 之间")
	public String getEditor() {
		return editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

	public String getContentText() {
		return contentText;
	}

	public void setContentText(String contentText) {
		this.contentText = contentText;
	}

	public String getIsToFirstPage() {
		return isToFirstPage;
	}

	public void setIsToFirstPage(String isToFirstPage) {
		this.isToFirstPage = isToFirstPage;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getThreeLevelContent() {
		return StringEscapeUtils.unescapeHtml4(threeLevelContent);
	}

	public void setThreeLevelContent(String threeLevelContent) {
		this.threeLevelContent = threeLevelContent;
	}

	public String getPdfurl() {
		return pdfurl;
	}

	public void setPdfurl(String pdfurl) {
		this.pdfurl = pdfurl;
	}
}
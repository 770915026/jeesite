/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.dao.AnalysisReportDao;
import com.thinkgem.jeesite.modules.taier.entity.AnalysisReport;

/**
 * 行业分析报告Service
 * @author xuyongqiang
 * @version 2018-08-29
 */
@Service
@Transactional(readOnly = true)
public class AnalysisReportService extends CrudService<AnalysisReportDao, AnalysisReport> {

	public AnalysisReport get(String id) {
		return super.get(id);
	}
	
	public List<AnalysisReport> findList(AnalysisReport analysisReport) {
		return super.findList(analysisReport);
	}
	
	public Page<AnalysisReport> findPage(Page<AnalysisReport> page, AnalysisReport analysisReport) {
		return super.findPage(page, analysisReport);
	}
	
	@Transactional(readOnly = false)
	public void save(AnalysisReport analysisReport) {
		super.save(analysisReport);
	}
	
	@Transactional(readOnly = false)
	public void delete(AnalysisReport analysisReport) {
		super.delete(analysisReport);
	}

	public List<AnalysisReport> getFirstPageAnalysisReport(AnalysisReport analysisReport) {
		return dao.getFirstPageAnalysisReport(analysisReport);
	}

	public String getReportNum() {
		
		return dao.getReportNum();
	}
	
}
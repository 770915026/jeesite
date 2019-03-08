/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.AnalysisReport;

/**
 * 行业分析报告DAO接口
 * @author xuyongqiang
 * @version 2018-08-29
 */
@MyBatisDao
public interface AnalysisReportDao extends CrudDao<AnalysisReport> {

	List<AnalysisReport> getFirstPageAnalysisReport(AnalysisReport analysisReport);

	String getReportNum();
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.taier.entity.AnalysisReport;
import com.thinkgem.jeesite.modules.taier.service.AnalysisReportService;

/**
 * 行业分析报告Controller
 * @author xuyongqiang
 * @version 2018-08-29
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/analysisReport")
public class AnalysisReportController extends BaseController {

	@Autowired
	private AnalysisReportService analysisReportService;
	
	@ModelAttribute
	public AnalysisReport get(@RequestParam(required=false) String id) {
		AnalysisReport entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = analysisReportService.get(id);
		}
		if (entity == null){
			entity = new AnalysisReport();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(AnalysisReport analysisReport, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AnalysisReport> page = analysisReportService.findPage(new Page<AnalysisReport>(request, response), analysisReport); 
		model.addAttribute("page", page);
		return "modules/sys/analysisReportList";
	}

	@RequestMapping(value = "form")
	public String form(AnalysisReport analysisReport, Model model) {
		model.addAttribute("analysisReport", analysisReport);
		return "modules/sys/analysisReportForm";
	}

	@RequestMapping(value = "save")
	public String save(AnalysisReport analysisReport, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, analysisReport)){
			return form(analysisReport, model);
		}
		String reportnum=analysisReportService.getReportNum();
		int reportnumLength=reportnum.length();
		for(int i=reportnumLength;i<7;i++){
			reportnum="0"+reportnum;
		}
		reportnum="T"+reportnum;
		analysisReport.setReportnum(reportnum);
		analysisReportService.save(analysisReport);
		addMessage(redirectAttributes, "保存行业分析报告成功");
		return "redirect:"+Global.getAdminPath()+"/taier/analysisReport/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(AnalysisReport analysisReport, RedirectAttributes redirectAttributes) {
		analysisReportService.delete(analysisReport);
		addMessage(redirectAttributes, "删除行业分析报告成功");
		return "redirect:"+Global.getAdminPath()+"/taier/analysisReport/?repage";
	}

}
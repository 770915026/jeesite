/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.taier.entity.TlLink;
import com.thinkgem.jeesite.modules.taier.service.TlLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.front.frontUtils.MessageData;
import com.thinkgem.jeesite.modules.taier.entity.AnalysisReport;
import com.thinkgem.jeesite.modules.taier.entity.CustomerService;
import com.thinkgem.jeesite.modules.taier.service.AnalysisReportService;
import com.thinkgem.jeesite.modules.taier.service.CustomerServiceService;

/**
 * 行业分析报告Controller
 * @author xuyongqiang
 * @version 2018-08-29
 */
@Controller
@RequestMapping(value = "/taier/analysisReportFront")
public class AnalysisReportFrontController extends BaseController {

	@Autowired
	private AnalysisReportService analysisReportService;
	
	@Autowired
    private CustomerServiceService customerServiceService;
    @Autowired
    private TlLinkService tlLinkService;
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
	@RequestMapping(value ="gotoAnalysisReport")
	public String gotoAnalysisReport(AnalysisReport analysisReport, HttpServletRequest request, HttpServletResponse response, Model model) {
		
		/*Page<AnalysisReport> analysisReportPage = analysisReportService.findPage(new Page<AnalysisReport>(request, response), analysisReport);
		List<AnalysisReport> analysisReportList=analysisReportPage.getList();
		String contentText;
		for(AnalysisReport analysisReportObj:analysisReportList){
			if(StringUtils.isNotEmpty(analysisReportObj.getContent())){
				contentText=StringUtils.replaceHtml(analysisReportObj.getContent());
				analysisReportObj.setContentText(contentText);
			}
			
		}
		model.addAttribute("analysisReportPage", analysisReportPage);*/
		model.addAttribute("analysisReport",analysisReport);
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        model.addAttribute("linkList", linkList);
		List<CustomerService> customerServiceList=customerServiceService.getCustomerServiceList();
        model.addAttribute("customerServiceList", customerServiceList);
		return "taier/analysisReport";
	}
	
	@RequestMapping(value ="gotoAnalysisReportDetail")
	public String gotoAnalysisReportDetail( HttpServletRequest request, HttpServletResponse response, Model model) {
		String id=request.getParameter("id");
		AnalysisReport analysisReport = analysisReportService.get(id); 
		model.addAttribute("analysisReport", analysisReport);
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        model.addAttribute("linkList", linkList);
		return "taier/analysisReportDetail";
	}
	@RequestMapping(value ="gotoStatisticalChart")
	public String gotoStatisticalChart( HttpServletRequest request, HttpServletResponse response, Model model) {
		
		return "taier/statisticalChart";
	}
	@RequestMapping(value ="gotoThreeLevelAnalysisReport")
	public String gotoThreeLevelAnalysisReport( HttpServletRequest request, HttpServletResponse response, Model model) {
		String id=request.getParameter("id");
		AnalysisReport analysisReport = analysisReportService.get(id); 
		model.addAttribute("analysisReport", analysisReport);
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        model.addAttribute("linkList", linkList);
		return "taier/threeLevelAnalysisReport";
	}
	@RequestMapping(value ="getAnalysisReportPage")
	@ResponseBody
	public MessageData getAnalysisReportPage(AnalysisReport analysisReport,HttpServletRequest request, HttpServletResponse response){
		Page<AnalysisReport> analysisReportPage = analysisReportService.findPage(new Page<AnalysisReport>(request, response), analysisReport);
		List<AnalysisReport> analysisReportList=analysisReportPage.getList();
		String contentText;
		for(AnalysisReport analysisReportObj:analysisReportList){
			if(StringUtils.isNotEmpty(analysisReportObj.getContent())){
				//contentText=StringEscapeUtils.unescapeHtml4(newsobj.getContent());
				contentText=StringUtils.replaceHtml(analysisReportObj.getContent());
				analysisReportObj.setContentText(contentText);
			}
			
		}
		return MessageData.success().addMsg("analysisReportPage", analysisReportPage);
	}

	@RequestMapping(value ="getFirstPageAnalysisReport")
	@ResponseBody
	public MessageData getFirstPageAnalysisReport(AnalysisReport analysisReport,HttpServletRequest request, HttpServletResponse response){
		List<AnalysisReport> analysisReportList=analysisReportService.getFirstPageAnalysisReport(analysisReport);
		return MessageData.success().addMsg("analysisReportList", analysisReportList);
	}

}
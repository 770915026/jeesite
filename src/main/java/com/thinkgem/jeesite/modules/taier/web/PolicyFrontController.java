/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

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
import com.thinkgem.jeesite.modules.taier.entity.Policy;
import com.thinkgem.jeesite.modules.taier.service.PolicyService;

import java.util.List;

/**
 * 政策Controller
 * @author xuyongqiang
 * @version 2018-08-31
 */
@Controller
@RequestMapping(value = "/taier/policyFront")
public class PolicyFrontController extends BaseController {

	@Autowired
	private PolicyService policyService;
    @Autowired
    private TlLinkService tlLinkService;
	@ModelAttribute
	public Policy get(@RequestParam(required=false) String id) {
		Policy entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = policyService.get(id);
		}
		if (entity == null){
			entity = new Policy();
		}
		return entity;
	}
	
	@RequestMapping(value = "gotoPolicy")
	public String gotoPolicy(Policy policy, HttpServletRequest request, HttpServletResponse response, Model model) {
		String type=request.getParameter("type");
		request.setAttribute("type", type);
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        model.addAttribute("linkList", linkList);
		return "/taier/policy";
	}
	@RequestMapping(value = "getPolicyPageByType")
	@ResponseBody
	public MessageData getPolicyPageByType(Policy policy, HttpServletRequest request, HttpServletResponse response){
		Page<Policy> policyPage=policyService.getPolicyPageByType(new Page<Policy>(request, response), policy);
		return MessageData.success().addMsg("policyPage", policyPage);
	}
	
	@RequestMapping(value="gotoPolicyDetail")
	public String gotoPolicyDetail(HttpServletRequest request, HttpServletResponse response, Model model) {
		String id=request.getParameter("id");
		Policy policy=policyService.get(id);
		
		model.addAttribute("policy", policy);
		return "/taier/policyDetail";
	}
	@RequestMapping(value = "addActClickNum")
	@ResponseBody
	public MessageData addActClickNum(HttpServletRequest request) {
		String id=request.getParameter("id");
		policyService.addActClickNum(id);
		return MessageData.success();
	}

	@RequestMapping(value = "getPolicyDetail")
	@ResponseBody
	public MessageData getPolicyDetail(HttpServletRequest request) {
		String id=request.getParameter("id");
		policyService.addActClickNum(id);
		Policy policy=policyService.get(id);
		return MessageData.success().addMsg("policy", policy);
	}
}
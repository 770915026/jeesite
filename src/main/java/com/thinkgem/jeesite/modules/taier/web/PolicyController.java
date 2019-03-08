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
import com.thinkgem.jeesite.modules.taier.entity.News;
import com.thinkgem.jeesite.modules.taier.entity.Policy;
import com.thinkgem.jeesite.modules.taier.service.PolicyService;

/**
 * 政策Controller
 * @author xuyongqiang
 * @version 2018-08-31
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/policy")
public class PolicyController extends BaseController {

	@Autowired
	private PolicyService policyService;
	
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
	
	@RequestMapping(value = {"list", ""})
	public String list(Policy policy, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Policy> page = policyService.findPage(new Page<Policy>(request, response), policy); 
		model.addAttribute("page", page);
		return "/taier/policyList";
	}

	@RequestMapping(value = "form")
	public String form(Policy policy, Model model) {
		model.addAttribute("policy", policy);
		return "/taier/policyForm";
	}

	@RequestMapping(value = "save")
	public String save(Policy policy, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, policy)){
			return form(policy, model);
		}
		policyService.save(policy);
		addMessage(redirectAttributes, "保存政策成功");
		return "redirect:"+Global.getAdminPath()+"/taier/policy/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(Policy policy, RedirectAttributes redirectAttributes) {
		policyService.delete(policy);
		addMessage(redirectAttributes, "删除政策成功");
		return "redirect:"+Global.getAdminPath()+"/taier/policy/?repage";
	}
	@RequestMapping(value = "batchDel")
	public String batchDel(String[] ids,RedirectAttributes redirectAttributes) {
		policyService.batchDel(ids);
		addMessage(redirectAttributes, "批量删除政策成功");
		return "redirect:"+Global.getAdminPath()+"/taier/policy/?repage";
	}
	@RequestMapping(value = "publishPolicy")
	public String publishPolicy(Policy policy, RedirectAttributes redirectAttributes) {
		policyService.publishPolicy(policy);
		addMessage(redirectAttributes, "发布政策成功");
		return "redirect:"+Global.getAdminPath()+"/taier/policy/?repage";
	}
}
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
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.taier.entity.CustomerService;
import com.thinkgem.jeesite.modules.taier.service.CustomerServiceService;

/**
 * 客服Controller
 * @author xuyongqiang
 * @version 2018-09-28
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/customerService")
public class CustomerServiceController extends BaseController {

	@Autowired
	private CustomerServiceService customerServiceService;
	
	@ModelAttribute
	public CustomerService get(@RequestParam(required=false) String id) {
		CustomerService entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = customerServiceService.get(id);
		}
		if (entity == null){
			entity = new CustomerService();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(CustomerService customerService, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CustomerService> page = customerServiceService.findPage(new Page<CustomerService>(request, response), customerService); 
		model.addAttribute("page", page);
		return "taier/customerServiceList";
	}

	@RequestMapping(value = "form")
	public String form(CustomerService customerService, Model model) {
		model.addAttribute("customerService", customerService);
		return "taier/customerServiceForm";
	}

	@RequestMapping(value = "save")
	public String save(CustomerService customerService, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, customerService)){
			return form(customerService, model);
		}
		customerServiceService.save(customerService);
		addMessage(redirectAttributes, "保存客服成功");
		return "redirect:"+Global.getAdminPath()+"/taier/customerService/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(CustomerService customerService, RedirectAttributes redirectAttributes) {
		customerServiceService.delete(customerService);
		addMessage(redirectAttributes, "删除客服成功");
		return "redirect:"+Global.getAdminPath()+"/taier/customerService/?repage";
	}

}
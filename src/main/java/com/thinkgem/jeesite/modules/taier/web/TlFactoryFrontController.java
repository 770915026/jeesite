/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.taier.entity.TlFactory;
import com.thinkgem.jeesite.modules.taier.service.TlFactoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 厂家管理Controller
 * @author gy
 * @version 2018-09-03
 */
@Controller
@RequestMapping(value = "/taier/tlFactory")
public class TlFactoryFrontController extends BaseController {

	@Autowired
	private TlFactoryService tlFactoryService;
	
	@ModelAttribute
	public TlFactory get(@RequestParam(required=false) String id) {
		TlFactory entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tlFactoryService.get(id);
		}
		if (entity == null){
			entity = new TlFactory();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(TlFactory tlFactory, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TlFactory> page = tlFactoryService.findPage(new Page<TlFactory>(request, response), tlFactory); 
		model.addAttribute("page", page);
		return "taier/tlFactoryList";
	}

	@RequestMapping(value = "form")
	public String form(TlFactory tlFactory, Model model) {
		model.addAttribute("tlFactory", tlFactory);
		return "taier/tlFactoryForm";
	}

	@RequestMapping(value = "save")
	public String save(TlFactory tlFactory, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tlFactory)){
			return form(tlFactory, model);
		}
		tlFactoryService.save(tlFactory);
		addMessage(redirectAttributes, "保存厂家成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlFactory/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(TlFactory tlFactory, RedirectAttributes redirectAttributes) {
		tlFactoryService.delete(tlFactory);
		addMessage(redirectAttributes, "删除厂家成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlFactory/?repage";
	}

}
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
import com.thinkgem.jeesite.modules.taier.entity.TlApps;
import com.thinkgem.jeesite.modules.taier.service.TlAppsService;

/**
 * appController
 * @author gy
 * @version 2018-08-30
 */
@Controller
@RequestMapping(value = "/taier/tlApps")
public class TlAppsFrontController extends BaseController {

	@Autowired
	private TlAppsService tlAppsService;
	
	@ModelAttribute
	public TlApps get(@RequestParam(required=false) String id) {
		TlApps entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tlAppsService.get(id);
		}
		if (entity == null){
			entity = new TlApps();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(TlApps tlApps, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TlApps> page = tlAppsService.findPage(new Page<TlApps>(request, response), tlApps); 
		model.addAttribute("page", page);
		return "taier/tlAppsList";
	}

	@RequestMapping(value = "form")
	public String form(TlApps tlApps, Model model) {
		model.addAttribute("tlApps", tlApps);
		return "taier/tlAppsForm";
	}

	@RequestMapping(value = "save")
	public String save(TlApps tlApps, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tlApps)){
			return form(tlApps, model);
		}
		tlAppsService.save(tlApps);
		addMessage(redirectAttributes, "保存app成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlApps/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(TlApps tlApps, RedirectAttributes redirectAttributes) {
		tlAppsService.delete(tlApps);
		addMessage(redirectAttributes, "删除app成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlApps/?repage";
	}

}
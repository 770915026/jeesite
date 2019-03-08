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
import com.thinkgem.jeesite.modules.taier.entity.AboutUs;
import com.thinkgem.jeesite.modules.taier.service.AboutUsService;

/**
 * 关于我们Controller
 * @author xuyongqiang
 * @version 2018-08-21
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/aboutUs")
public class AboutUsController extends BaseController {

	@Autowired
	private AboutUsService aboutUsService;
	
	@ModelAttribute
	public AboutUs get(@RequestParam(required=false) String id) {
		AboutUs entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = aboutUsService.get(id);
		}
		if (entity == null){
			entity = new AboutUs();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(AboutUs aboutUs, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AboutUs> page = aboutUsService.findPage(new Page<AboutUs>(request, response), aboutUs); 
		model.addAttribute("page", page);
		return "modules/sys/aboutUsList";
	}

	@RequestMapping(value = "form")
	public String form(AboutUs aboutUs, Model model) {
		model.addAttribute("aboutUs", aboutUs);
		return "modules/sys/aboutUsForm";
	}

	@RequestMapping(value = "save")
	public String save(AboutUs aboutUs, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, aboutUs)){
			return form(aboutUs, model);
		}
		aboutUsService.save(aboutUs);
		addMessage(redirectAttributes, "保存关于我们成功");
		return "redirect:"+Global.getAdminPath()+"/taier/aboutUs/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(AboutUs aboutUs, RedirectAttributes redirectAttributes) {
		aboutUsService.delete(aboutUs);
		addMessage(redirectAttributes, "删除关于我们成功");
		return "redirect:"+Global.getAdminPath()+"/taier/aboutUs/?repage";
	}

}
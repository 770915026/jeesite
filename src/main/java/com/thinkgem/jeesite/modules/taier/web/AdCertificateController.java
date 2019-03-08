/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
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
import com.thinkgem.jeesite.modules.taier.entity.AdCertificate;
import com.thinkgem.jeesite.modules.taier.service.AdCertificateService;

/**
 * 广告证书Controller
 * @author xuyongqiang
 * @version 2018-10-17
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/adCertificate")
public class AdCertificateController extends BaseController {

	@Autowired
	private AdCertificateService adCertificateService;
	
	@ModelAttribute
	public AdCertificate get(@RequestParam(required=false) String id) {
		AdCertificate entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = adCertificateService.get(id);
		}
		if (entity == null){
			entity = new AdCertificate();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(AdCertificate adCertificate, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AdCertificate> page = adCertificateService.findPage(new Page<AdCertificate>(request, response), adCertificate); 
		model.addAttribute("page", page);
		return "taier/adCertificateList";
	}

	@RequestMapping(value = "form")
	public String form(AdCertificate adCertificate, Model model) {
		model.addAttribute("adCertificate", adCertificate);
		return "taier/adCertificateForm";
	}

	@RequestMapping(value = "save")
	public String save(AdCertificate adCertificate, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, adCertificate)){
			return form(adCertificate, model);
		}
		adCertificateService.save(adCertificate);
		addMessage(redirectAttributes, "保存广告证书成功");
		return "redirect:"+Global.getAdminPath()+"/taier/adCertificate/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(AdCertificate adCertificate, RedirectAttributes redirectAttributes) {
		adCertificateService.delete(adCertificate);
		addMessage(redirectAttributes, "删除广告证书成功");
		return "redirect:"+Global.getAdminPath()+"/taier/adCertificate/?repage";
	}

}
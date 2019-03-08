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
import com.thinkgem.jeesite.modules.taier.entity.Certificate;
import com.thinkgem.jeesite.modules.taier.service.CertificateService;

/**
 * 泰尔证书Controller
 * @author xuyongqiang
 * @version 2018-11-08
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/certificate")
public class CertificateController extends BaseController {

	@Autowired
	private CertificateService certificateService;
	
	@ModelAttribute
	public Certificate get(@RequestParam(required=false) String id) {
		Certificate entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = certificateService.get(id);
		}
		if (entity == null){
			entity = new Certificate();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(Certificate certificate, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Certificate> page = certificateService.findPage(new Page<Certificate>(request, response), certificate); 
		model.addAttribute("page", page);
		return "modules/taier/certificateList";
	}

	@RequestMapping(value = "form")
	public String form(Certificate certificate, Model model) {
		model.addAttribute("certificate", certificate);
		return "modules/taier/certificateForm";
	}

	@RequestMapping(value = "save")
	public String save(Certificate certificate, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, certificate)){
			return form(certificate, model);
		}
		certificateService.save(certificate);
		addMessage(redirectAttributes, "保存泰尔证书成功");
		return "redirect:"+Global.getAdminPath()+"/taier/certificate/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(Certificate certificate, RedirectAttributes redirectAttributes) {
		certificateService.delete(certificate);
		addMessage(redirectAttributes, "删除泰尔证书成功");
		return "redirect:"+Global.getAdminPath()+"/taier/certificate/?repage";
	}

}
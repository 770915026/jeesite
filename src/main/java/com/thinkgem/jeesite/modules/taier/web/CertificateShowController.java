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
import com.thinkgem.jeesite.modules.taier.entity.CertificateShow;
import com.thinkgem.jeesite.modules.taier.service.CertificateShowService;

/**
 * 证书展示Controller
 * @author xuyongqiang
 * @version 2018-11-20
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/certificateShow")
public class CertificateShowController extends BaseController {

	@Autowired
	private CertificateShowService certificateShowService;
	
	@ModelAttribute
	public CertificateShow get(@RequestParam(required=false) String id) {
		CertificateShow entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = certificateShowService.get(id);
		}
		if (entity == null){
			entity = new CertificateShow();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(CertificateShow certificateShow, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CertificateShow> page = certificateShowService.findPage(new Page<CertificateShow>(request, response), certificateShow); 
		model.addAttribute("page", page);
		return "modules/taier/certificateShowList";
	}

	@RequestMapping(value = "form")
	public String form(CertificateShow certificateShow, Model model) {
		model.addAttribute("certificateShow", certificateShow);
		return "modules/taier/certificateShowForm";
	}

	@RequestMapping(value = "save")
	public String save(CertificateShow certificateShow, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, certificateShow)){
			return form(certificateShow, model);
		}
		certificateShowService.save(certificateShow);
		addMessage(redirectAttributes, "保存证书展示成功");
		return "redirect:"+Global.getAdminPath()+"/taier/certificateShow/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(CertificateShow certificateShow, RedirectAttributes redirectAttributes) {
		certificateShowService.delete(certificateShow);
		addMessage(redirectAttributes, "删除证书展示成功");
		return "redirect:"+Global.getAdminPath()+"/taier/certificateShow/?repage";
	}

}
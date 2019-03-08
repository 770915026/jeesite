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
import com.thinkgem.jeesite.modules.taier.entity.CertificateFirstPage;
import com.thinkgem.jeesite.modules.taier.service.CertificateFirstPageService;

/**
 * 首页证书Controller
 * @author xuyongqiang
 * @version 2018-11-22
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/certificateFirstPage")
public class CertificateFirstPageController extends BaseController {

	@Autowired
	private CertificateFirstPageService certificateFirstPageService;
	
	@ModelAttribute
	public CertificateFirstPage get(@RequestParam(required=false) String id) {
		CertificateFirstPage entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = certificateFirstPageService.get(id);
		}
		if (entity == null){
			entity = new CertificateFirstPage();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(CertificateFirstPage certificateFirstPage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CertificateFirstPage> page = certificateFirstPageService.findPage(new Page<CertificateFirstPage>(request, response), certificateFirstPage); 
		model.addAttribute("page", page);
		return "modules/taier/certificateFirstPageList";
	}

	@RequestMapping(value = "form")
	public String form(CertificateFirstPage certificateFirstPage, Model model) {
		model.addAttribute("certificateFirstPage", certificateFirstPage);
		return "modules/taier/certificateFirstPageForm";
	}

	@RequestMapping(value = "save")
	public String save(CertificateFirstPage certificateFirstPage, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, certificateFirstPage)){
			return form(certificateFirstPage, model);
		}
		certificateFirstPageService.save(certificateFirstPage);
		addMessage(redirectAttributes, "保存首页证书成功");
		return "redirect:"+Global.getAdminPath()+"/taier/certificateFirstPage/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(CertificateFirstPage certificateFirstPage, RedirectAttributes redirectAttributes) {
		certificateFirstPageService.delete(certificateFirstPage);
		addMessage(redirectAttributes, "删除首页证书成功");
		return "redirect:"+Global.getAdminPath()+"/taier/certificateFirstPage/?repage";
	}

}
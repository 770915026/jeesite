/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.taier.entity.TlSysAgreement;
import com.thinkgem.jeesite.modules.taier.service.TlSysAgreementService;
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
 * 协议Controller
 * @author gy
 * @version 2018-08-24
 */
@Controller
@RequestMapping(value = "/taier/tlSysAgreement")
public class TlSysAgreementFrontController extends BaseController {

	@Autowired
	private TlSysAgreementService tlSysAgreementService;
	
	@ModelAttribute
	public TlSysAgreement get(@RequestParam(required=false) String id) {
		TlSysAgreement entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tlSysAgreementService.get(id);
		}
		if (entity == null){
			entity = new TlSysAgreement();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(TlSysAgreement tlSysAgreement, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TlSysAgreement> page = tlSysAgreementService.findPage(new Page<TlSysAgreement>(request, response), tlSysAgreement); 
		model.addAttribute("page", page);
		return "taier/tlSysAgreementList";
	}

	@RequestMapping(value = "form")
	public String form(TlSysAgreement tlSysAgreement, Model model) {
		model.addAttribute("tlSysAgreement", tlSysAgreement);
		return "taier/tlSysAgreementForm";
	}

	@RequestMapping(value = "save")
	public String save(TlSysAgreement tlSysAgreement, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tlSysAgreement)){
			return form(tlSysAgreement, model);
		}
		tlSysAgreementService.save(tlSysAgreement);
		addMessage(redirectAttributes, "保存协议成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlSysAgreement/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(TlSysAgreement tlSysAgreement, RedirectAttributes redirectAttributes) {
		tlSysAgreementService.delete(tlSysAgreement);
		addMessage(redirectAttributes, "删除协议成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlSysAgreement/?repage";
	}

}
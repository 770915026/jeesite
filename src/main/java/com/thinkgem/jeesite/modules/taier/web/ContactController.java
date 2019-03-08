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
import com.thinkgem.jeesite.modules.taier.entity.Contact;
import com.thinkgem.jeesite.modules.taier.service.ContactService;

/**
 * 联系方式Controller
 * @author xuyongqiang
 * @version 2018-11-09
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/contact")
public class ContactController extends BaseController {

	@Autowired
	private ContactService contactService;
	
	@ModelAttribute
	public Contact get(@RequestParam(required=false) String id) {
		Contact entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = contactService.get(id);
		}
		if (entity == null){
			entity = new Contact();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(Contact contact, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Contact> page = contactService.findPage(new Page<Contact>(request, response), contact); 
		model.addAttribute("page", page);
		return "modules/taier/contactList";
	}

	@RequestMapping(value = "form")
	public String form(Contact contact, Model model) {
		model.addAttribute("contact", contact);
		return "modules/taier/contactForm";
	}

	@RequestMapping(value = "save")
	public String save(Contact contact, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, contact)){
			return form(contact, model);
		}
		contactService.save(contact);
		addMessage(redirectAttributes, "保存联系方式成功");
		return "redirect:"+Global.getAdminPath()+"/taier/contact/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(Contact contact, RedirectAttributes redirectAttributes) {
		contactService.delete(contact);
		addMessage(redirectAttributes, "删除联系方式成功");
		return "redirect:"+Global.getAdminPath()+"/taier/contact/?repage";
	}

}
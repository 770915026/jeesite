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
import com.thinkgem.jeesite.modules.taier.entity.TlLink;
import com.thinkgem.jeesite.modules.taier.service.TlLinkService;

/**
 * 友情链接Controller
 * @author xuyongqiang
 * @version 2018-08-22
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/tlLink")
public class TlLinkController extends BaseController {

	@Autowired
	private TlLinkService tlLinkService;
	
	@ModelAttribute
	public TlLink get(@RequestParam(required=false) String id) {
		TlLink entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tlLinkService.get(id);
		}
		if (entity == null){
			entity = new TlLink();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(TlLink tlLink, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TlLink> page = tlLinkService.findPage(new Page<TlLink>(request, response), tlLink); 
		model.addAttribute("page", page);
		return "modules/sys/tlLinkList";
	}

	@RequestMapping(value = "form")
	public String form(TlLink tlLink, Model model) {
		model.addAttribute("tlLink", tlLink);
		return "modules/sys/tlLinkForm";
	}

	@RequestMapping(value = "save")
	public String save(TlLink tlLink, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tlLink)){
			return form(tlLink, model);
		}
		tlLinkService.save(tlLink);
		addMessage(redirectAttributes, "保存友情链接成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlLink/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(TlLink tlLink, RedirectAttributes redirectAttributes) {
		tlLinkService.delete(tlLink);
		addMessage(redirectAttributes, "删除友情链接成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlLink/?repage";
	}

}
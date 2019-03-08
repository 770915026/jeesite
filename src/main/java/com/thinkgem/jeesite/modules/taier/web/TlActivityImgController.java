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
import com.thinkgem.jeesite.modules.taier.entity.TlActivityImg;
import com.thinkgem.jeesite.modules.taier.service.TlActivityImgService;

/**
 * 活动页banner图Controller
 * @author gy
 * @version 2018-10-24
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/tlActivityImg")
public class TlActivityImgController extends BaseController {

	@Autowired
	private TlActivityImgService tlActivityImgService;
	
	@ModelAttribute
	public TlActivityImg get(@RequestParam(required=false) String id) {
		TlActivityImg entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tlActivityImgService.get(id);
		}
		if (entity == null){
			entity = new TlActivityImg();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(TlActivityImg tlActivityImg, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TlActivityImg> page = tlActivityImgService.findPage(new Page<TlActivityImg>(request, response), tlActivityImg); 
		model.addAttribute("page", page);
		return "modules/taier/tlActivityImgList";
	}

	@RequestMapping(value = "form")
	public String form(TlActivityImg tlActivityImg, Model model) {
		model.addAttribute("tlActivityImg", tlActivityImg);
		return "modules/taier/tlActivityImgForm";
	}

	@RequestMapping(value = "save")
	public String save(TlActivityImg tlActivityImg, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tlActivityImg)){
			return form(tlActivityImg, model);
		}
		tlActivityImgService.save(tlActivityImg);
		addMessage(redirectAttributes, "保存图片成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlActivityImg/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(TlActivityImg tlActivityImg, RedirectAttributes redirectAttributes) {
		tlActivityImgService.delete(tlActivityImg);
		addMessage(redirectAttributes, "删除图片成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlActivityImg/?repage";
	}

}
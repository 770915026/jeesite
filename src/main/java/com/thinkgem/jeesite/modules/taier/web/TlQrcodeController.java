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
import com.thinkgem.jeesite.modules.taier.entity.TlQrcode;
import com.thinkgem.jeesite.modules.taier.service.TlQrcodeService;

/**
 * 二维码维护Controller
 * @author gy
 * @version 2018-10-23
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/tlQrcode")
public class TlQrcodeController extends BaseController {

	@Autowired
	private TlQrcodeService tlQrcodeService;
	
	@ModelAttribute
	public TlQrcode get(@RequestParam(required=false) String id) {
		TlQrcode entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tlQrcodeService.get(id);
		}
		if (entity == null){
			entity = new TlQrcode();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(TlQrcode tlQrcode, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TlQrcode> page = tlQrcodeService.findPage(new Page<TlQrcode>(request, response), tlQrcode); 
		model.addAttribute("page", page);
		return "modules/taier/tlQrcodeList";
	}

	@RequestMapping(value = "form")
	public String form(TlQrcode tlQrcode, Model model) {
		model.addAttribute("tlQrcode", tlQrcode);
		return "modules/taier/tlQrcodeForm";
	}

	@RequestMapping(value = "save")
	public String save(TlQrcode tlQrcode, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tlQrcode)){
			return form(tlQrcode, model);
		}
		tlQrcodeService.save(tlQrcode);
		addMessage(redirectAttributes, "保存二维码成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlQrcode/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(TlQrcode tlQrcode, RedirectAttributes redirectAttributes) {
		tlQrcodeService.delete(tlQrcode);
		addMessage(redirectAttributes, "删除二维码成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlQrcode/?repage";
	}

}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.taier.entity.FirstPageImg;
import com.thinkgem.jeesite.modules.taier.service.FirstPageImgService;
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
 * 首页图片Controller
 * @author xuyongqiang
 * @version 2018-08-30
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/firstPageImg")
public class FirstPageImgController extends BaseController {

	@Autowired
	private FirstPageImgService firstPageImgService;
	
	@ModelAttribute
	public FirstPageImg get(@RequestParam(required=false) String id) {
		FirstPageImg entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = firstPageImgService.get(id);
		}
		if (entity == null){
			entity = new FirstPageImg();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(FirstPageImg firstPageImg, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<FirstPageImg> page = firstPageImgService.findPage(new Page<FirstPageImg>(request, response), firstPageImg); 
		model.addAttribute("page", page);
		return "taier/firstPageImgList";
	}

	@RequestMapping(value = "form")
	public String form(FirstPageImg firstPageImg, Model model) {
		model.addAttribute("firstPageImg", firstPageImg);
		return "taier/firstPageImgForm";
	}

	@RequestMapping(value = "save")
	public String save(FirstPageImg firstPageImg, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, firstPageImg)){
			return form(firstPageImg, model);
		}
		firstPageImgService.save(firstPageImg);
		addMessage(redirectAttributes, "保存首页图片成功");
		return "redirect:"+Global.getAdminPath()+"/taier/firstPageImg/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(FirstPageImg firstPageImg, RedirectAttributes redirectAttributes) {
		firstPageImgService.delete(firstPageImg);
		addMessage(redirectAttributes, "删除首页图片成功");
		return "redirect:"+Global.getAdminPath()+"/taier/firstPageImg/?repage";
	}

}
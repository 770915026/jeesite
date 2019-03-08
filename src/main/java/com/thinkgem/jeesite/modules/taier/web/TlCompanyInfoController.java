/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taier.entity.TlFactory;
import com.thinkgem.jeesite.modules.taier.service.TlFactoryService;
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
import com.thinkgem.jeesite.modules.taier.entity.TlCompanyInfo;
import com.thinkgem.jeesite.modules.taier.service.TlCompanyInfoService;

import java.util.List;

/**
 * 厂家基本信息Controller
 * @author gy
 * @version 2018-08-20
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/tlCompanyInfo")
public class TlCompanyInfoController extends BaseController {

	@Autowired
	private TlCompanyInfoService tlCompanyInfoService;

    @Autowired
    private TlFactoryService tlFactoryService;

	@ModelAttribute
	public TlCompanyInfo get(@RequestParam(required=false) String id) {
		TlCompanyInfo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tlCompanyInfoService.get(id);
		}
		if (entity == null){
			entity = new TlCompanyInfo();
		}
		return entity;
	}
	
	@RequestMapping(value = "view")
	public String list(TlCompanyInfo tlCompanyInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		if(user != null) {
			String userId = user.getId();
			tlCompanyInfo = tlCompanyInfoService.findByUserId(userId);
		}

		model.addAttribute("tlCompanyInfo", tlCompanyInfo);
		return "taier/tlCompanyInfoView";
	}

	@RequestMapping(value = "form")
	public String form(TlCompanyInfo tlCompanyInfo, Model model) {
		model.addAttribute("tlCompanyInfo", tlCompanyInfo);
		List<TlFactory> list = tlFactoryService.findList(new TlFactory());
		model.addAttribute("list", list);
		return "taier/tlCompanyInfoEdit";
	}

	@RequestMapping(value = "save")
	public String save(TlCompanyInfo tlCompanyInfo, Model model, RedirectAttributes redirectAttributes) {
		User user = UserUtils.getUser();
		if(user != null && StringUtils.isNotEmpty(user.getId())) {
			tlCompanyInfo.setUser(user);
		}

		if (!beanValidator(model, tlCompanyInfo)){
			return form(tlCompanyInfo, model);
		}
		tlCompanyInfoService.save(tlCompanyInfo);
		addMessage(redirectAttributes, "保存厂家基本信息成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlCompanyInfo/view?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(TlCompanyInfo tlCompanyInfo, RedirectAttributes redirectAttributes) {
		tlCompanyInfoService.delete(tlCompanyInfo);
		addMessage(redirectAttributes, "删除厂家基本信息成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlCompanyInfo/?repage";
	}

}
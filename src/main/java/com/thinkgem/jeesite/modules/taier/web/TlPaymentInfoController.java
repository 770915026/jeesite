/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taier.entity.TlCompanyInfo;
import com.thinkgem.jeesite.modules.taier.service.TlCompanyInfoService;
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
import com.thinkgem.jeesite.modules.taier.entity.TlPaymentInfo;
import com.thinkgem.jeesite.modules.taier.service.TlPaymentInfoService;

import java.util.List;

/**
 * 缴费信息Controller
 * @author gy
 * @version 2018-08-21
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/tlPaymentInfo")
public class TlPaymentInfoController extends BaseController {

	@Autowired
	private TlPaymentInfoService tlPaymentInfoService;

	@Autowired
	private TlCompanyInfoService tlCompanyInfoService;


	@ModelAttribute
	public TlPaymentInfo get(@RequestParam(required=false) String id) {
		TlPaymentInfo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tlPaymentInfoService.get(id);
		}
		if (entity == null){
			entity = new TlPaymentInfo();
		}
		return entity;
	}
	
	@RequiresPermissions("taier:tlPaymentInfo:view")
	@RequestMapping(value = {"list", ""})
	public String list(TlPaymentInfo tlPaymentInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TlPaymentInfo> page = tlPaymentInfoService.findPage(new Page<TlPaymentInfo>(request, response), tlPaymentInfo); 
		model.addAttribute("page", page);
		return "taier/tlPaymentInfoList";
	}

	@RequiresPermissions("taier:tlPaymentInfo:view")
	@RequestMapping(value = "form")
	public String form(TlPaymentInfo tlPaymentInfo, Model model) {
		model.addAttribute("tlPaymentInfo", tlPaymentInfo);
		return "taier/tlPaymentInfoForm";
	}

	@RequiresPermissions("taier:tlPaymentInfo:edit")
	@RequestMapping(value = "save")
	public String save(TlPaymentInfo tlPaymentInfo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tlPaymentInfo)){
			return form(tlPaymentInfo, model);
		}
		tlPaymentInfoService.save(tlPaymentInfo);
		addMessage(redirectAttributes, "保存缴费信息成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlPaymentInfo/?repage";
	}
	
	@RequiresPermissions("taier:tlPaymentInfo:edit")
	@RequestMapping(value = "delete")
	public String delete(TlPaymentInfo tlPaymentInfo, RedirectAttributes redirectAttributes) {
		tlPaymentInfoService.delete(tlPaymentInfo);
		addMessage(redirectAttributes, "删除缴费信息成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlPaymentInfo/?repage";
	}

	@RequestMapping(value = "pay")
	public String pay(TlPaymentInfo tlPaymentInfo, Model model) {
		User user = UserUtils.getUser();
		TlCompanyInfo tlCompanyInfo = tlCompanyInfoService.findByUserId(user.getId());
		List<TlPaymentInfo> list = tlPaymentInfoService.findList(tlPaymentInfo);
		if(list != null && list.size() > 0) {
			tlPaymentInfo = list.get(0);
		}
		model.addAttribute("tlPaymentInfo", tlPaymentInfo);
		model.addAttribute("tlCompanyInfo", tlCompanyInfo);
		return "taier/pay";
	}

}
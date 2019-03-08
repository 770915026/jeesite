/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.front.frontUtils.MessageData;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taier.entity.TlCompanyInfo;
import com.thinkgem.jeesite.modules.taier.entity.TlInvoice;
import com.thinkgem.jeesite.modules.taier.service.TlCompanyInfoService;
import com.thinkgem.jeesite.modules.taier.service.TlInvoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 发票Controller
 * @author gy
 * @version 2018-08-21
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/tlInvoice")
public class TlInvoiceController extends BaseController {

	@Autowired
	private TlInvoiceService tlInvoiceService;

	@Autowired
	private TlCompanyInfoService tlCompanyInfoService;

	@ModelAttribute
	public TlInvoice get(@RequestParam(required=false) String id) {
		TlInvoice entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tlInvoiceService.get(id);
		}
		if (entity == null){
			entity = new TlInvoice();
		}
		return entity;
	}
	
	@RequestMapping(value = "view")
	public String view(TlInvoice tlInvoice, HttpServletRequest request, HttpServletResponse response, Model model) {
		return "taier/invoice";
	}

	@RequestMapping(value = {"list",""})
	public String list(TlInvoice tlInvoice, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TlInvoice> page = tlInvoiceService.findPage(new Page<TlInvoice>(request, response), tlInvoice);
		model.addAttribute("page", page);
		return "taier/tlInvoiceList";
	}

	@RequestMapping(value = "form")
	public String form(TlInvoice tlInvoice, Model model) {
		model.addAttribute("tlInvoice", tlInvoice);
		return "taier/tlInvoiceForm";
	}

	@RequestMapping(value = "save")
	@ResponseBody
	public MessageData save(TlInvoice tlInvoice, Model model, RedirectAttributes redirectAttributes) {
		User user = UserUtils.getUser();
		if(user != null) {
			String userId = user.getId();
			TlCompanyInfo tlCompanyInfo = tlCompanyInfoService.findByUserId(userId);
			tlInvoice.getCompany().setId(tlCompanyInfo.getId());
		}
		tlInvoice.setFlag("0");
		tlInvoiceService.save(tlInvoice);
		return MessageData.success().addMsg("msg", "保存发票成功！");
	}

	@RequestMapping(value = "delete")
	public String delete(TlInvoice tlInvoice, RedirectAttributes redirectAttributes) {
		tlInvoiceService.delete(tlInvoice);
		addMessage(redirectAttributes, "删除发票成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlInvoice/?repage";
	}

	@RequestMapping(value = "invoice")
	public String invoice(TlInvoice tlInvoice, RedirectAttributes redirectAttributes) {
		tlInvoice.setFlag("1");
		tlInvoiceService.save(tlInvoice);
		addMessage(redirectAttributes, "开票成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlInvoice/?repage";
	}
}
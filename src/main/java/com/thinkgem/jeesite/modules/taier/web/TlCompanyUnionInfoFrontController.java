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
import com.thinkgem.jeesite.modules.taier.entity.TlCompanyUnionInfo;
import com.thinkgem.jeesite.modules.taier.service.TlCompanyUnionInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 企业联合信息Controller
 * @author gy
 * @version 2018-08-27
 */
@Controller
@RequestMapping(value = "/taier/tlCompanyUnionInfo")
public class TlCompanyUnionInfoFrontController extends BaseController {

	@Autowired
	private TlCompanyUnionInfoService tlCompanyUnionInfoService;
	
	@ModelAttribute
	public TlCompanyUnionInfo get(@RequestParam(required=false) String id) {
		TlCompanyUnionInfo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tlCompanyUnionInfoService.get(id);
		}
		if (entity == null){
			entity = new TlCompanyUnionInfo();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(TlCompanyUnionInfo tlCompanyUnionInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		if(StringUtils.isEmpty(tlCompanyUnionInfo.getFlag())) {
			tlCompanyUnionInfo.setFlag("4");
		}
		Page<TlCompanyUnionInfo> page = tlCompanyUnionInfoService.findPage(new Page<TlCompanyUnionInfo>(request, response), tlCompanyUnionInfo);
		model.addAttribute("page", page);
		return "taier/tlCompanyUnionInfoList";
	}

	@RequestMapping(value = "form")
	public String form(TlCompanyUnionInfo tlCompanyUnionInfo, Model model) {
		model.addAttribute("tlCompanyUnionInfo", tlCompanyUnionInfo);
		return "taier/tlCompanyUnionInfoForm";
	}

	@RequestMapping(value = "modifyTable")
	public String modifyTable(TlCompanyUnionInfo tlCompanyUnionInfo, Model model, HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		tlCompanyUnionInfo = tlCompanyUnionInfoService.get(id);
		model.addAttribute("tlCompanyUnionInfo", tlCompanyUnionInfo);
		return "taier/unionInfoModifyCompany";
	}

	@RequestMapping(value = "save")
	public @ResponseBody MessageData save(@RequestBody TlCompanyUnionInfo tlCompanyUnionInfo, Model model, RedirectAttributes redirectAttributes) {
		User user = UserUtils.getUser();
		tlCompanyUnionInfo.setUser(user);
		tlCompanyUnionInfo.setFlag("0");
		tlCompanyUnionInfo.setModifiable("1");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		tlCompanyUnionInfo.setTableName(tlCompanyUnionInfo.getProductName()+"+"+tlCompanyUnionInfo.getProductVersion()+"+"+sdf.format(new Date()));
		tlCompanyUnionInfoService.save(tlCompanyUnionInfo);
		return MessageData.success();
	}
	
	@RequestMapping(value = "delete")
	public String delete(TlCompanyUnionInfo tlCompanyUnionInfo, RedirectAttributes redirectAttributes) {
		tlCompanyUnionInfoService.delete(tlCompanyUnionInfo);
		addMessage(redirectAttributes, "删除企业联合信息成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlCompanyUnionInfo/?repage";
	}

	@RequestMapping(value = "infoAdd")
	public String infoAdd(TlCompanyUnionInfo tlCompanyUnionInfo, Model model) {
		model.addAttribute("tlCompanyUnionInfo", tlCompanyUnionInfo);
		return "taier/unionInfoAddCompany";
	}

	@RequestMapping(value = "introduce")
	public String introduce(TlCompanyUnionInfo tlCompanyUnionInfo, Model model) {
		return "taier/unionInfoIntroduceCompany";
	}

	@RequestMapping(value = "checkStatus")
	public String checkStatus(TlCompanyUnionInfo tlCompanyUnionInfo, Model model) {
		return "taier/unionInfoStatusCompany";
	}

	@RequestMapping(value = "/checkStatusList", method = RequestMethod.POST)
	@ResponseBody
	public Page<TlCompanyUnionInfo> checkStatusList(String currentPage,String qrystat,String qrytitle, HttpServletResponse response, HttpServletRequest request){
		User user = UserUtils.getUser();
		TlCompanyUnionInfo tlCompanyUnionInfo = new TlCompanyUnionInfo();
		tlCompanyUnionInfo.setFlag(qrystat);
		tlCompanyUnionInfo.setTableName(qrytitle);
		tlCompanyUnionInfo.setUser(user);
		Page page = new Page<TlCompanyUnionInfo>();
		page.setPageNo(Integer.parseInt(currentPage));
		page.setPageSize(10);
		Page<TlCompanyUnionInfo> pagelist = tlCompanyUnionInfoService.findPage(page,tlCompanyUnionInfo);
		return pagelist;
	}

	@RequestMapping(value = "viewTable")
	public String viewTable(TlCompanyUnionInfo tlCompanyUnionInfo, Model model) {
		model.addAttribute("tlCompanyUnionInfo", tlCompanyUnionInfo);
		return "taier/unionInfoViewCompany";
	}

	@RequestMapping(value = "submit")
	public @ResponseBody MessageData submit(@RequestBody TlCompanyUnionInfo tlCompanyUnionInfo, HttpServletRequest request, HttpSession httpSession) {
		tlCompanyUnionInfo = tlCompanyUnionInfoService.get(tlCompanyUnionInfo.getId());
		tlCompanyUnionInfo.setFlag("1");
		tlCompanyUnionInfo.setModifiable("0");
		tlCompanyUnionInfoService.save(tlCompanyUnionInfo);
		return MessageData.success();
	}

	@RequestMapping(value = "approve")
	public String approve(TlCompanyUnionInfo tlCompanyUnionInfo, RedirectAttributes redirectAttributes) {
		tlCompanyUnionInfo.setFlag("2");
		tlCompanyUnionInfoService.save(tlCompanyUnionInfo);
		addMessage(redirectAttributes, "审核通过");
		return "redirect:"+Global.getAdminPath()+"/taier/tlCompanyUnionInfo/?repage";
	}

	@RequestMapping(value = "approveNo")
	public String approveNo(TlCompanyUnionInfo tlCompanyUnionInfo, RedirectAttributes redirectAttributes) {
		tlCompanyUnionInfo.setFlag("1");
		tlCompanyUnionInfoService.save(tlCompanyUnionInfo);
		addMessage(redirectAttributes, "审核不通过");
		return "redirect:"+Global.getAdminPath()+"/taier/tlCompanyUnionInfo/?repage";
	}

	@RequestMapping(value = "changeModifyable")
	public String changeModifyable(TlCompanyUnionInfo tlCompanyUnionInfo, RedirectAttributes redirectAttributes) {
		String modifiable = tlCompanyUnionInfo.getModifiable();
		if("0".equals(modifiable)) {
			tlCompanyUnionInfo.setModifiable("1");
		} else {
			tlCompanyUnionInfo.setModifiable("0");
		}

		tlCompanyUnionInfoService.save(tlCompanyUnionInfo);
		addMessage(redirectAttributes, "设为可修改");
		return "redirect:"+Global.getAdminPath()+"/taier/tlCompanyUnionInfo/?repage";
	}

	@RequestMapping(value = "sethot")
	public String sethot(TlCompanyUnionInfo tlCompanyUnionInfo, RedirectAttributes redirectAttributes) {
		String hotflag = tlCompanyUnionInfo.getHotflag();
		if("0".equals(hotflag)) {
			tlCompanyUnionInfo.setHotflag("1");
		} else {
			tlCompanyUnionInfo.setHotflag("0");
		}
		tlCompanyUnionInfoService.save(tlCompanyUnionInfo);
		addMessage(redirectAttributes, "设为热门");
		return "redirect:"+Global.getAdminPath()+"/taier/tlCompanyUnionInfo/?repage";
	}

	@RequestMapping(value = "checkHistoryStatus")
	public String checkHistoryStatus(TlCompanyUnionInfo tlCompanyUnionInfo, Model model) {
		return "taier/unionInfoHistoryStatusCompany";
	}

}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taier.entity.Aqyqjlb;
import com.thinkgem.jeesite.modules.taier.entity.Emcgjyqjlb;
import com.thinkgem.jeesite.modules.taier.entity.TlCompanyInfo;
import com.thinkgem.jeesite.modules.taier.entity.TmcBbxx;
import com.thinkgem.jeesite.modules.taier.entity.TmcBbxz;
import com.thinkgem.jeesite.modules.taier.entity.TmcBgqrb;
import com.thinkgem.jeesite.modules.taier.entity.TmcBgqrzb;
import com.thinkgem.jeesite.modules.taier.entity.TmcDc;
import com.thinkgem.jeesite.modules.taier.entity.TmcDyspqcdq;
import com.thinkgem.jeesite.modules.taier.entity.TmcRwsqd;
import com.thinkgem.jeesite.modules.taier.entity.TmcSbjjb;
import com.thinkgem.jeesite.modules.taier.entity.TmcXxxx;
import com.thinkgem.jeesite.modules.taier.service.AqyqjlbService;
import com.thinkgem.jeesite.modules.taier.service.EmcgjyqjlbService;
import com.thinkgem.jeesite.modules.taier.service.TlCompanyInfoService;
import com.thinkgem.jeesite.modules.taier.service.TmcBbxxService;
import com.thinkgem.jeesite.modules.taier.service.TmcBbxzService;
import com.thinkgem.jeesite.modules.taier.service.TmcBgqrbService;
import com.thinkgem.jeesite.modules.taier.service.TmcBgqrzbService;
import com.thinkgem.jeesite.modules.taier.service.TmcDcService;
import com.thinkgem.jeesite.modules.taier.service.TmcDyspqcdqService;
import com.thinkgem.jeesite.modules.taier.service.TmcRwsqdService;
import com.thinkgem.jeesite.modules.taier.service.TmcSbjjbService;
import com.thinkgem.jeesite.modules.taier.service.TmcXxxxService;

/**
 * 进网Controller
 * @author gy
 * @version 2018-08-20
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/theNet")
public class TheNetController extends BaseController {
	
	@Autowired
	private TlCompanyInfoService tlCompanyInfoService;
	
	@Autowired
	private TmcRwsqdService tmcRwsqdService;

	
	@RequestMapping(value = "gotoTheNet")
	public String gotoTheNet (TmcRwsqd tmcRwsqd,HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		TlCompanyInfo tlCompanyInfo=new TlCompanyInfo();
		if(user != null) {
			String userId = user.getId();
			tlCompanyInfo = tlCompanyInfoService.findByUserId(userId);
		}
		model.addAttribute("tlCompanyInfo", tlCompanyInfo);
		model.addAttribute("tmcRwsqd", tmcRwsqd);
		return "/taier/enterNet";
	}
	
	@RequestMapping(value = "gotoTheNetList")
	public String gotoTheNetList(TmcRwsqd tmcRwsqd, HttpServletRequest request, HttpServletResponse response, Model model) {
		tmcRwsqd.setType("1");
		Page<TmcRwsqd> page = tmcRwsqdService.findPage(new Page<TmcRwsqd>(request, response), tmcRwsqd); 
		model.addAttribute("page", page);
		return "/taier/enterNetList";
	}

	@RequestMapping(value = "gotoCCC")
	public String gotoCCC (TmcRwsqd tmcRwsqd,HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		TlCompanyInfo tlCompanyInfo=new TlCompanyInfo();
		if(user != null) {
			String userId = user.getId();
			tlCompanyInfo = tlCompanyInfoService.findByUserId(userId);
		}
		model.addAttribute("tlCompanyInfo", tlCompanyInfo);
		model.addAttribute("tmcRwsqd", tmcRwsqd);
		return "/taier/ccc";
	}
	@RequestMapping(value = "gotoCCCList")
	public String gotoCCCList(TmcRwsqd tmcRwsqd, HttpServletRequest request, HttpServletResponse response, Model model) {
		tmcRwsqd.setType("2");
		Page<TmcRwsqd> page = tmcRwsqdService.findPage(new Page<TmcRwsqd>(request, response), tmcRwsqd); 
		model.addAttribute("page", page);
		return "/taier/cccList";
	}

}
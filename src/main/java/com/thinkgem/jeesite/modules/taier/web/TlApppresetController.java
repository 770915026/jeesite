/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.thinkgem.jeesite.modules.front.frontUtils.MessageData;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taier.entity.TlApps;
import com.thinkgem.jeesite.modules.taier.entity.TlCompanyInfo;
import com.thinkgem.jeesite.modules.taier.entity.TlCompanyUnionInfo;
import com.thinkgem.jeesite.modules.taier.service.TlAppsService;
import com.thinkgem.jeesite.modules.taier.service.TlCompanyInfoService;
import com.thinkgem.jeesite.modules.taier.service.TlCompanyUnionInfoService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.taier.entity.TlApppreset;
import com.thinkgem.jeesite.modules.taier.service.TlApppresetService;

import java.util.ArrayList;
import java.util.List;

/**
 * 手机预置应用公示Controller
 * @author gy
 * @version 2018-08-30
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/tlApppreset")
public class TlApppresetController extends BaseController {

	@Autowired
	private TlApppresetService tlApppresetService;

	@Autowired
	private TlAppsService tlAppsService;

	@Autowired
	private TlCompanyUnionInfoService tlCompanyUnionInfoService;
	
	@Autowired
	private TlCompanyInfoService tlCompanyInfoService;

	@ModelAttribute
	public TlApppreset get(@RequestParam(required=false) String id) {
		TlApppreset entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tlApppresetService.get(id);
		}
		if (entity == null){
			entity = new TlApppreset();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(TlApppreset tlApppreset, HttpServletRequest request, HttpServletResponse response, Model model) {
		if(StringUtils.isEmpty(tlApppreset.getFlag())) {
			tlApppreset.setFlag("4");
		}
		Page<TlApppreset> page = tlApppresetService.findPage(new Page<TlApppreset>(request, response), tlApppreset); 
		model.addAttribute("page", page);
		return "taier/tlApppresetList";
	}

	@RequestMapping(value = "form")
	public String form(TlApppreset tlApppreset, Model model) {
		model.addAttribute("tlApppreset", tlApppreset);
		return "taier/tlApppresetForm";
	}

	@RequestMapping(value = "save")
	public @ResponseBody MessageData save(@RequestBody TlApppreset tlApppreset, Model model, RedirectAttributes redirectAttributes) {
		User user = UserUtils.getUser();
		tlApppreset.setUser(user);
		String userId = user.getId();
		TlCompanyInfo tlCompanyInfo = tlCompanyInfoService.findByUserId(userId);
		if(tlCompanyInfo != null) {
			tlApppreset.setCompanyId(tlCompanyInfo.getId());
		}
		tlApppreset.setTableName(tlApppreset.getProductVersion()+"+"+tlApppreset.getPhoneVersion());
		tlApppresetService.save(tlApppreset);
		addMessage(redirectAttributes, "保存手机预置应用公示成功");
		return MessageData.success();
	}
	
	@RequestMapping(value = "delete")
	public String delete(TlApppreset tlApppreset, RedirectAttributes redirectAttributes) {
		tlApppresetService.delete(tlApppreset);
		addMessage(redirectAttributes, "删除手机预置应用公示成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlApppreset/?repage";
	}


	@RequestMapping(value = "introduce")
	public String introduce(TlApppreset tlApppreset, Model model) {
		return "taier/appPreSetIntroduceCompany";
	}

	@RequestMapping(value = "infoAdd")
	public String infoAdd(TlApppreset tlApppreset, Model model) {
		User user=UserUtils.getUser();
		model.addAttribute("tlApppreset", tlApppreset);
		List<TlCompanyUnionInfo> list = tlCompanyUnionInfoService.findListForAppPreSetAdd();
		model.addAttribute("unionList",list);
		TlApps app=new TlApps();
		app.setCreateUserId(user.getId());
		TlCompanyInfo company=tlCompanyInfoService.findByUserId(user.getId());
		if(company != null) {
			app.setCompanyId(company.getId());
		}
		List<TlApps> applist = tlAppsService.getCommentAndMyApps(app);
		model.addAttribute("applist",applist);

		return "taier/appPreSetInfoAddCompany";
	}

	@RequestMapping(value = "checkStatus")
	public String checkStatus(TlApppreset tlApppreset, Model model) {
		return "taier/appPreSetInfoStatusCompany";
	}

	@RequestMapping(value = "/checkStatusList", method = RequestMethod.POST)
	@ResponseBody
	public Page<TlApppreset> checkStatusList(String currentPage,String qrystat,String qrytitle, HttpServletResponse response, HttpServletRequest request){
		User user = UserUtils.getUser();
		TlApppreset tlApppreset = new TlApppreset();
		tlApppreset.setUser(user);
		tlApppreset.setFlag(qrystat);
		tlApppreset.setTableName(qrytitle);
		Page page = new Page<TlCompanyUnionInfo>();
		page.setPageNo(Integer.parseInt(currentPage));
		page.setPageSize(10);
		Page<TlApppreset> pagelist = tlApppresetService.findPage(page,tlApppreset);
		return pagelist;
	}

	@RequestMapping(value = "viewTable")
	public String viewTable(TlApppreset tlApppreset, Model model) {
		model.addAttribute("tlApppreset", tlApppreset);
		String apps = tlApppreset.getApps();
		if(StringUtils.isEmpty(apps)) {
			apps = "";
		}
		String[] appary = apps.split("\\|\\|");
		List<TlApps> applist = new ArrayList<TlApps>();
		for(int i=0;i<appary.length;i++) {
			String id = appary[i];
			TlApps tlApps = tlAppsService.get(id);
			applist.add(tlApps);
		}
		model.addAttribute("applist", applist);
		return "taier/appPreSetInfoViewCompany";
	}

	@RequestMapping(value = "submit")
	public @ResponseBody MessageData submit(@RequestBody TlApppreset tlApppreset, HttpServletRequest request, HttpSession httpSession) {
		tlApppreset = tlApppresetService.get(tlApppreset.getId());
		tlApppreset.setFlag("1");
		tlApppreset.setModifiable("0");
		tlApppresetService.save(tlApppreset);
		return MessageData.success();
	}

	@RequestMapping(value = "modifyTable")
	public String modifyTable(TlApppreset tlApppreset, Model model, HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		tlApppreset = tlApppresetService.get(tlApppreset.getId());
		model.addAttribute("tlApppreset", tlApppreset);
		TlApps app=new TlApps();
		User user=UserUtils.getUser();
		app.setCreateUserId(user.getId());
		TlCompanyInfo company=tlCompanyInfoService.findByUserId(user.getId());
		if(company != null) {
			app.setCompanyId(company.getId());
		}
		List<TlApps> applist = tlAppsService.getCommentAndMyApps(app);
		model.addAttribute("applist",applist);
		TlCompanyUnionInfo tlCompanyUnionInfo = tlCompanyUnionInfoService.get(tlApppreset.getUnionId());
		model.addAttribute("tlCompanyUnionInfo",tlCompanyUnionInfo);
		return "taier/appPreSetInfoModifyCompany";
	}

	@RequestMapping(value = "approveModify")
	public @ResponseBody MessageData approveModify(@RequestBody TlApppreset tlApppreset, HttpServletRequest request, HttpSession httpSession) {
		String reason = tlApppreset.getReason();
		tlApppreset = tlApppresetService.get(tlApppreset.getId());
		tlApppreset.setReason(reason);
		tlApppreset.setApplymdf("1");
		tlApppresetService.save(tlApppreset);
		return MessageData.success();
	}

	@RequestMapping(value = "approve")
	public String approve(TlApppreset tlApppreset, RedirectAttributes redirectAttributes) {
		tlApppreset.setFlag("2");
		tlApppresetService.save(tlApppreset);
		addMessage(redirectAttributes, "审核通过");
		return "redirect:"+Global.getAdminPath()+"/taier/tlApppreset/?repage";
	}

	@RequestMapping(value = "approveNo")
	public String approveNo(TlApppreset tlApppreset, RedirectAttributes redirectAttributes) {
		tlApppreset.setFlag("1");
		tlApppresetService.save(tlApppreset);
		addMessage(redirectAttributes, "审核不通过");
		return "redirect:"+Global.getAdminPath()+"/taier/tlApppreset/?repage";
	}

	@RequestMapping(value = "changeModifyable")
	public String changeModifyable(TlApppreset tlApppreset, RedirectAttributes redirectAttributes) {
		String modifiable = tlApppreset.getModifiable();
		if("0".equals(modifiable)) {
			tlApppreset.setModifiable("1");
		} else {
			tlApppreset.setModifiable("0");
		}
		tlApppresetService.save(tlApppreset);
		addMessage(redirectAttributes, "设为可修改");
		return "redirect:"+Global.getAdminPath()+"/taier/tlApppreset/?repage";
	}

	@RequestMapping(value = "sethot")
	public String sethot(TlApppreset tlApppreset, RedirectAttributes redirectAttributes) {
		String hotflag = tlApppreset.getHotflag();
		if("0".equals(hotflag)) {
			tlApppreset.setHotflag("1");
		} else {
			tlApppreset.setHotflag("0");
		}
		tlApppresetService.save(tlApppreset);
		addMessage(redirectAttributes, "设为热门");
		return "redirect:"+Global.getAdminPath()+"/taier/tlApppreset/?repage";
	}

	@RequestMapping(value = "checkHistoryStatus")
	public String checkHistoryStatus(TlApppreset tlApppreset, Model model) {
		return "taier/appPreSetInfoHistoryStatusCompany";
	}
	
	@RequestMapping(value="getUnCheckNum")
	@ResponseBody
	public MessageData getUnCheckNum(Model model) {
		int companyUnionInfoNum=tlCompanyUnionInfoService.getUncheckCompanyUnionInfoNum();
		int apppresetNum=tlApppresetService.getUncheckApppresetNum();
		return MessageData.success().addMsg("companyUnionInfoNum", companyUnionInfoNum).addMsg("apppresetNum", apppresetNum);
	}
}
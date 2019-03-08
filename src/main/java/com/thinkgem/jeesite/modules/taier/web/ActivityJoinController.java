/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.front.frontUtils.MessageData;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.security.SystemAuthorizingRealm;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taier.entity.ActivityJoin;
import com.thinkgem.jeesite.modules.taier.service.ActivityJoinService;

/**
 * 参加活动Controller
 * @author xuyongqiang
 * @version 2018-08-27
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/activityJoin")
public class ActivityJoinController extends BaseController {

	@Autowired
	private ActivityJoinService activityJoinService;
	
	@ModelAttribute
	public ActivityJoin get(@RequestParam(required=false) String id) {
		ActivityJoin entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = activityJoinService.get(id);
		}
		if (entity == null){
			entity = new ActivityJoin();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(ActivityJoin activityJoin, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ActivityJoin> page = activityJoinService.findPage(new Page<ActivityJoin>(request, response), activityJoin); 
		model.addAttribute("page", page);
		return "modules/taier/activityJoinList";
	}

	@RequestMapping(value = "form")
	public String form(ActivityJoin activityJoin, Model model) {
		model.addAttribute("activityJoin", activityJoin);
		return "modules/taier/activityJoinForm";
	}

	@RequestMapping(value = "save")
	public String save(ActivityJoin activityJoin, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, activityJoin)){
			return form(activityJoin, model);
		}
		activityJoinService.save(activityJoin);
		addMessage(redirectAttributes, "保存参加活动成功");
		return "redirect:"+Global.getFrontPath()+"/activityFront/getActivityList";
	}
	
	@RequestMapping(value = "delete")
	public String delete(ActivityJoin activityJoin, RedirectAttributes redirectAttributes) {
		activityJoinService.delete(activityJoin);
		addMessage(redirectAttributes, "删除参加活动成功");
		return "redirect:"+Global.getAdminPath()+"/taier/activityJoin/?repage";
	}
	
}
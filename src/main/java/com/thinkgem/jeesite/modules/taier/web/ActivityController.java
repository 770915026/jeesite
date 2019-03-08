/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taier.entity.Activity;
import com.thinkgem.jeesite.modules.taier.entity.Collect;
import com.thinkgem.jeesite.modules.taier.service.ActivityService;
import com.thinkgem.jeesite.modules.taier.service.CollectService;

/**
 * 活动Controller
 * @author xuyongqiang
 * @version 2018-08-25
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/activity")
public class ActivityController extends BaseController {

	@Autowired
	private ActivityService activityService;

	@Autowired
	private CollectService collectService;
	
	@ModelAttribute
	public Activity get(@RequestParam(required=false) String id) {
		Activity entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = activityService.get(id);
		}
		if (entity == null){
			entity = new Activity();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(Activity activity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Activity> page = activityService.findPage(new Page<Activity>(request, response), activity); 
		model.addAttribute("page", page);
		return "modules/sys/activityList";
	}

	@RequestMapping(value = "form")
	public String form(Activity activity, Model model) {
		model.addAttribute("activity", activity);
		return "modules/sys/activityForm";
	}

	@RequestMapping(value = "save")
	public String save(Activity activity, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, activity)){
			return form(activity, model);
		}
		activityService.save(activity);
		addMessage(redirectAttributes, "保存活动成功");
		return "redirect:"+Global.getAdminPath()+"/taier/activity/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(Activity activity, RedirectAttributes redirectAttributes) {
		activityService.delete(activity);
		addMessage(redirectAttributes, "删除活动成功");
		return "redirect:"+Global.getAdminPath()+"/taier/activity/?repage";
	}

	@RequestMapping(value = "/getCollectList", method = RequestMethod.POST)
	@ResponseBody
	public Page<Collect> getCollectList(String currentPage, HttpServletResponse response, HttpServletRequest request){
		User user = UserUtils.getUser();
		Collect tlCollect = new Collect();
		tlCollect.setUser(user);
		Page page = new Page<Collect>();
		page.setPageNo(Integer.parseInt(currentPage));
		page.setPageSize(10);
		Page<Collect> pagelist = collectService.findPage(page,tlCollect);
		return pagelist;
	}

	@RequestMapping(value = "myCollectList")
	public String myCollectList(Activity activity, RedirectAttributes redirectAttributes) {
		return "taier/myCollection";
	}

}
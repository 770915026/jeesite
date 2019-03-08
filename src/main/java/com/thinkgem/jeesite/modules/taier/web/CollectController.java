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
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taier.entity.Collect;
import com.thinkgem.jeesite.modules.taier.service.CollectService;

/**
 * 收藏Controller
 * @author xuyongqiang
 * @version 2018-08-27
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/collect")
public class CollectController extends BaseController {

	@Autowired
	private CollectService collectService;

	@ModelAttribute
	public Collect get(@RequestParam(required=false) String id) {
		Collect entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = collectService.get(id);
		}
		if (entity == null){
			entity = new Collect();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(Collect collect, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Collect> page = collectService.findPage(new Page<Collect>(request, response), collect); 
		model.addAttribute("page", page);
		return "modules/taier/collectList";
	}

	@RequestMapping(value = "form")
	public String form(Collect collect, Model model) {
		model.addAttribute("collect", collect);
		return "modules/taier/collectForm";
	}

	@RequestMapping(value = "save")
	public String save(Collect collect, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, collect)){
			return form(collect, model);
		}
		collectService.save(collect);
		addMessage(redirectAttributes, "保存收藏成功");
		return "redirect:"+Global.getAdminPath()+"/taier/collect/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(Collect collect, RedirectAttributes redirectAttributes) {
		collectService.delete(collect);
		addMessage(redirectAttributes, "删除收藏成功");
		return "redirect:"+Global.getAdminPath()+"/taier/collect/?repage";
	}

	@RequestMapping(value = "saveCollect")
	@ResponseBody
	public MessageData saveCollect(Collect collect) {
		
		User user = UserUtils.getUser();
		if(user.getId()==null){
			return MessageData.failed();
		}
		
		collect.setUser(user);
		collect.setCreateDate(new Date());
		int joinThisActNum=collectService.getNumOfCollectThisAct(collect);
		if(joinThisActNum>0){
			MessageData message = new MessageData();
			message.setCode(300);
			return message;
		}
		collectService.save(collect);
		return MessageData.success();
	}

}
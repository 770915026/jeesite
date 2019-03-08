/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.front.frontUtils.MessageData;
import com.thinkgem.jeesite.modules.taier.entity.LeaveWord;
import com.thinkgem.jeesite.modules.taier.service.LeaveWordService;
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
 * 留言Controller
 * @author xuyongqiang
 * @version 2018-08-21
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/leaveWord")
public class LeaveWordController extends BaseController {

	@Autowired
	private LeaveWordService leaveWordService;
	
	@ModelAttribute
	public LeaveWord get(@RequestParam(required=false) String id) {
		LeaveWord entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = leaveWordService.get(id);
		}
		if (entity == null){
			entity = new LeaveWord();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(LeaveWord leaveWord, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LeaveWord> page = leaveWordService.findPage(new Page<LeaveWord>(request, response), leaveWord); 
		model.addAttribute("page", page);
		return "taier/leaveWordList";
	}

	@RequestMapping(value = "form")
	public String form(LeaveWord leaveWord, Model model) {
		model.addAttribute("leaveWord", leaveWord);
		return "taier/leaveWordForm";
	}

	@RequestMapping(value = "save")
	public String save(LeaveWord leaveWord, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, leaveWord)){
			return form(leaveWord, model);
		}
		leaveWordService.save(leaveWord);
		addMessage(redirectAttributes, "保存留言成功");
		return "redirect:"+Global.getAdminPath()+"/taier/leaveWord/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(LeaveWord leaveWord, RedirectAttributes redirectAttributes) {
		leaveWordService.delete(leaveWord);
		addMessage(redirectAttributes, "删除留言成功");
		return "redirect:"+Global.getAdminPath()+"/taier/leaveWord/?repage";
	}
	

}
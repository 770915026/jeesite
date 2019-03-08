/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.front.frontUtils.MessageData;
import org.apache.shiro.authz.annotation.RequiresPermissions;
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
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taier.entity.OperateRecords;
import com.thinkgem.jeesite.modules.taier.service.OperateRecordsService;

/**
 * 操作记录Controller
 * @author xuyongqiang
 * @version 2018-10-10
 */
@Controller
@RequestMapping(value = "/taier/operateRecords")
public class OperateRecordsFrontController extends BaseController {

	@Autowired
	private OperateRecordsService operateRecordsService;
	
	@ModelAttribute
	public OperateRecords get(@RequestParam(required=false) String id) {
		OperateRecords entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = operateRecordsService.get(id);
		}
		if (entity == null){
			entity = new OperateRecords();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(OperateRecords operateRecords, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OperateRecords> page = operateRecordsService.findPage(new Page<OperateRecords>(request, response), operateRecords); 
		model.addAttribute("page", page);
		return "modules/taier/operateRecordsList";
	}

	@RequestMapping(value = "form")
	public String form(OperateRecords operateRecords, Model model) {
		model.addAttribute("operateRecords", operateRecords);
		return "modules/taier/operateRecordsForm";
	}

	@RequestMapping(value = "save")
	public String save(OperateRecords operateRecords, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, operateRecords)){
			return form(operateRecords, model);
		}
		User user = UserUtils.getUser();
		operateRecords.setUser(user);
		operateRecordsService.save(operateRecords);
		addMessage(redirectAttributes, "保存操作记录成功");
		return "redirect:"+Global.getAdminPath()+"/taier/operateRecords/?repage";
	}

	@RequestMapping(value = "ajaxsave")
	@ResponseBody
	public MessageData ajaxsave(OperateRecords operateRecords, Model model, RedirectAttributes redirectAttributes) {
		User user = UserUtils.getUser();
		operateRecords.setUser(user);
		operateRecordsService.save(operateRecords);
		return MessageData.success().addMsg("msg", "成功！");
	}

	@RequestMapping(value = "delete")
	public String delete(OperateRecords operateRecords, RedirectAttributes redirectAttributes) {
		operateRecordsService.delete(operateRecords);
		addMessage(redirectAttributes, "删除操作记录成功");
		return "redirect:"+Global.getAdminPath()+"/taier/operateRecords/?repage";
	}

}
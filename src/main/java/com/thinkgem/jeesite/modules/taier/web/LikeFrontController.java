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
import com.thinkgem.jeesite.modules.taier.entity.Like;
import com.thinkgem.jeesite.modules.taier.service.LikeService;
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
import java.util.Date;

/**
 * 点赞Controller
 * @author xuyongqiang
 * @version 2018-08-27
 */
@Controller
@RequestMapping(value = "/taier/like")
public class LikeFrontController extends BaseController {

	@Autowired
	private LikeService likeService;
	
	@ModelAttribute
	public Like get(@RequestParam(required=false) String id) {
		Like entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = likeService.get(id);
		}
		if (entity == null){
			entity = new Like();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(Like like, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Like> page = likeService.findPage(new Page<Like>(request, response), like); 
		model.addAttribute("page", page);
		return "modules/taier/likeList";
	}

	@RequestMapping(value = "form")
	public String form(Like like, Model model) {
		model.addAttribute("like", like);
		return "modules/taier/likeForm";
	}

	@RequestMapping(value = "save")
	public String save(Like like, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, like)){
			return form(like, model);
		}
		likeService.save(like);
		addMessage(redirectAttributes, "保存点赞成功");
		return "redirect:"+Global.getAdminPath()+"/taier/like/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(Like like, RedirectAttributes redirectAttributes) {
		likeService.delete(like);
		addMessage(redirectAttributes, "删除点赞成功");
		return "redirect:"+Global.getAdminPath()+"/taier/like/?repage";
	}

	@RequestMapping(value = "saveLike")
	@ResponseBody
	public MessageData saveLike(Like like) {
		
		User user = UserUtils.getUser();
		if(user.getId()==null){
			return MessageData.failed();
		}
		
		like.setUser(user);
		like.setCreateDate(new Date());
		int joinThisActNum=likeService.getNumOfLikeThisAct(like);
		if(joinThisActNum>0){
			MessageData message = new MessageData();
			message.setCode(300);
			return message;
		}
		likeService.save(like);
		return MessageData.success();
	}
}
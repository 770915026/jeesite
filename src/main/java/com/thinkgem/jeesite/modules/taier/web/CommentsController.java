/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.thinkgem.jeesite.modules.front.frontUtils.MessageData;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taier.entity.Comments;
import com.thinkgem.jeesite.modules.taier.entity.Like;
import com.thinkgem.jeesite.modules.taier.service.CommentsService;

/**
 * 评论Controller
 * @author xuyongqiang
 * @version 2018-08-27
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/comments")
public class CommentsController extends BaseController {

	@Autowired
	private CommentsService commentsService;
	
	@ModelAttribute
	public Comments get(@RequestParam(required=false) String id) {
		Comments entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = commentsService.get(id);
		}
		if (entity == null){
			entity = new Comments();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(Comments comments, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Comments> page = commentsService.findPage(new Page<Comments>(request, response), comments); 
		model.addAttribute("page", page);
		return "modules/taier/commentsList";
	}

	@RequestMapping(value = "form")
	public String form(Comments comments, Model model) {
		model.addAttribute("comments", comments);
		return "modules/taier/commentsForm";
	}

	@RequestMapping(value = "save")
	public String save(Comments comments, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, comments)){
			return form(comments, model);
		}
		commentsService.save(comments);
		addMessage(redirectAttributes, "保存评论成功");
		return "redirect:"+Global.getAdminPath()+"/taier/comments/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(Comments comments, RedirectAttributes redirectAttributes) {
		commentsService.delete(comments);
		addMessage(redirectAttributes, "删除评论成功");
		return "redirect:"+Global.getAdminPath()+"/taier/comments/?repage";
	}
	
	@RequestMapping(value = "saveComments")
	@ResponseBody
	public MessageData saveComments(Comments comments) {
		
		User user = UserUtils.getUser();
		if(user.getId()==null){
			return MessageData.failed();
		}
		
		comments.setUser(user);
		comments.setCreateDate(new Date());
		
		commentsService.save(comments);
		return MessageData.success();
	}
	
	@RequestMapping(value = "getActCommentsList")
	@ResponseBody
	public MessageData getCommentsList(Comments comments, HttpServletRequest request, HttpServletResponse response) {
		
		Page<Comments> commentsPage = commentsService.getActCommentsList(new Page<Comments>(request, response), comments); 
		
		return MessageData.success().addMsg("commentsPage", commentsPage).addMsg("lastPage", commentsPage.isLastPage());
	}

}
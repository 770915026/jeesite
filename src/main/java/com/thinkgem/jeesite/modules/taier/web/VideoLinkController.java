/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.taier.entity.VideoLink;
import com.thinkgem.jeesite.modules.taier.service.VideoLinkService;

/**
 * 视频链接Controller
 * @author xuyongqiang
 * @version 2018-11-06
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/videoLink")
public class VideoLinkController extends BaseController {

	@Autowired
	private VideoLinkService videoLinkService;
	
	@ModelAttribute
	public VideoLink get(@RequestParam(required=false) String id) {
		VideoLink entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = videoLinkService.get(id);
		}
		if (entity == null){
			entity = new VideoLink();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(VideoLink videoLink, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<VideoLink> page = videoLinkService.findPage(new Page<VideoLink>(request, response), videoLink); 
		model.addAttribute("page", page);
		return "modules/taier/videoLinkList";
	}

	@RequestMapping(value = "form")
	public String form(VideoLink videoLink, Model model) {
		model.addAttribute("videoLink", videoLink);
		return "modules/taier/videoLinkForm";
	}

	@RequestMapping(value = "save")
	public String save(VideoLink videoLink, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, videoLink)){
			return form(videoLink, model);
		}
		videoLinkService.save(videoLink);
		addMessage(redirectAttributes, "保存视频链接成功");
		return "redirect:"+Global.getAdminPath()+"/taier/videoLink/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(VideoLink videoLink, RedirectAttributes redirectAttributes) {
		videoLinkService.delete(videoLink);
		addMessage(redirectAttributes, "删除视频链接成功");
		return "redirect:"+Global.getAdminPath()+"/taier/videoLink/?repage";
	}

}
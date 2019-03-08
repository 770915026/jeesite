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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.taier.entity.News;
import com.thinkgem.jeesite.modules.taier.service.NewsService;

/**
 * 新闻Controller
 * @author xuyongqiang
 * @version 2018-08-22
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/news")
public class NewsController extends BaseController {

	@Autowired
	private NewsService newsService;
	
	@ModelAttribute
	public News get(@RequestParam(required=false) String id) {
		News entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = newsService.get(id);
		}
		if (entity == null){
			entity = new News();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(News news, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<News> page = newsService.findPage(new Page<News>(request, response), news); 
		model.addAttribute("page", page);
		return "taier/newsList";
	}

	@RequestMapping(value = "form")
	public String form(News news, Model model) {
		model.addAttribute("news", news);
		return "taier/newsForm";
	}
	@RequestMapping(value = "preview")
	public String preview(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
        News news = newsService.get(id);
        model.addAttribute("news", news);
		return "taier/newsPreview";
	}
	@RequestMapping(value = "trashForm")
	public String trashForm(News news, Model model) {
		model.addAttribute("news", news);
		return "taier/newsTrashForm";
	}
	@RequestMapping(value = "save")
	public String save(News news, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, news)){
			return form(news, model);
		}
		newsService.save(news);
		addMessage(redirectAttributes, "保存新闻成功");
		return "redirect:"+Global.getAdminPath()+"/taier/news/?repage";
	}
	@RequestMapping(value = "saveTrash")
	public String saveTrash(News news, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, news)){
			return form(news, model);
		}
		newsService.save(news);
		addMessage(redirectAttributes, "保存新闻成功");
		return "redirect:"+Global.getAdminPath()+"/taier/news/newsTrash?repage";
	}
	@RequestMapping(value = "delete")
	public String delete(News news, RedirectAttributes redirectAttributes) {
		newsService.delete(news);
		addMessage(redirectAttributes, "删除新闻成功");
		return "redirect:"+Global.getAdminPath()+"/taier/news/?repage";
	}
	
	@RequestMapping(value = "batchDel")
	public String batchDel(String[] ids,RedirectAttributes redirectAttributes) {
		newsService.batchDel(ids);
		addMessage(redirectAttributes, "删除新闻成功");
		return "redirect:"+Global.getAdminPath()+"/taier/news/?repage";
	}
	@RequestMapping(value = "restore")
	public String restore(News news, RedirectAttributes redirectAttributes) {
		newsService.restore(news);
		addMessage(redirectAttributes, "恢复新闻成功");
		return "redirect:"+Global.getAdminPath()+"/taier/news/newsTrash?repage";
	}
	
	@RequestMapping(value = "batchRestore")
	public String batchRestore(String[] ids,RedirectAttributes redirectAttributes) {
		newsService.batchRestore(ids);
		addMessage(redirectAttributes, "恢复新闻成功");
		return "redirect:"+Global.getAdminPath()+"/taier/news/newsTrash?repage";
	}
	@RequestMapping(value = "publishNews")
	public String publishNews(News news, RedirectAttributes redirectAttributes) {
		newsService.publishNews(news);
		addMessage(redirectAttributes, "发布新闻成功");
		return "redirect:"+Global.getAdminPath()+"/taier/news/?repage";
	}
	@RequestMapping(value = "newsTrash")
	public String newsTrash(News news, HttpServletRequest request, HttpServletResponse response, Model model) {
		news.setDelFlag("1");
		Page<News> page = newsService.findNewsTrashPage(new Page<News>(request, response), news); 
		model.addAttribute("page", page);
		return "taier/newsTrashList";
	}
}
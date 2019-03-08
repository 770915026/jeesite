/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.front.frontUtils.MessageData;
import com.thinkgem.jeesite.modules.taier.entity.News;
import com.thinkgem.jeesite.modules.taier.service.NewsService;

/**
 * 新闻Controller
 * @author xuyongqiang
 * @version 2018-08-22
 */
@Controller
@RequestMapping(value = "/taier/news")
public class NewsFrontController extends BaseController {

	@Autowired
	private NewsService newsService;

	@RequestMapping(value ="getFirstPageNewsByConditions")
	@ResponseBody
	public MessageData getFirstPageNewsByConditions(News news, HttpServletRequest request, HttpServletResponse response) {
		List<News> newsList=newsService.getFirstPageNewsByConditions(news);
		String contentText;
		List<News> resultNewsList=new ArrayList<News>();
		Map<String,String> imgMap;
		News resultNews;
		for(News newsobj:newsList){
			if(StringUtils.isNotEmpty(newsobj.getContent())){
				//contentText=StringEscapeUtils.unescapeHtml4(newsobj.getContent());
				contentText=StringUtils.replaceHtml(newsobj.getContent());
				newsobj.setContentText(contentText);
				imgMap=StringUtils.getImgStr(newsobj.getContent());
				if(imgMap.size()>0){
					resultNews=new News();
					resultNews.setId(newsobj.getId());
					resultNews.setTitle(newsobj.getTitle());
					resultNews.setCreateDate(newsobj.getCreateDate());
					resultNews.setImg(imgMap.get("1"));
                    resultNews.setContentText(contentText);
					resultNewsList.add(resultNews);
				}
			}
		}

		if(resultNewsList.size()==0){
			resultNews=null;
		}else{
			resultNews=resultNewsList.get(0);
		}
		return MessageData.success().addMsg("newsList", newsList).addMsg("resultNews", resultNews).addMsg("resultNewsList", resultNewsList);
	}

	@RequestMapping(value ="findNewsPageByConditions")
	@ResponseBody
	public MessageData findNewsPageByConditions(News news, HttpServletRequest request, HttpServletResponse response) {
		String pageNo=request.getParameter("pageNo");
		System.out.println(pageNo);
		Page<News> newsPage = newsService.findNewsPageByConditions(new Page<News>(request, response), news);
		List<News> newsList=newsPage.getList();
		String contentText;
        Map<String,String> imgMap;
		for(News newsobj:newsList){
            imgMap=StringUtils.getImgStr(newsobj.getContent());
            if(imgMap.size()>0){
                newsobj.setImg(imgMap.get("1"));
            }
			if(StringUtils.isNotEmpty(newsobj.getContent())){
				//contentText=StringEscapeUtils.unescapeHtml4(newsobj.getContent());
				contentText=StringUtils.replaceHtml(newsobj.getContent());
				newsobj.setContentText(contentText);
			}

		}
		return MessageData.success().addMsg("newsPage", newsPage).addMsg("lastPage", newsPage.isLastPage());
	}

}
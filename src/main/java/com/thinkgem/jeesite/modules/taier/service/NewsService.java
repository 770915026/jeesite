/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.dao.NewsDao;
import com.thinkgem.jeesite.modules.taier.entity.News;

/**
 * 新闻Service
 * @author xuyongqiang
 * @version 2018-08-22
 */
@Service
@Transactional(readOnly = true)
public class NewsService extends CrudService<NewsDao, News> {
	
	public News get(String id) {
		return super.get(id);
	}
	
	public List<News> findList(News news) {
		return super.findList(news);
	}
	
	public Page<News> findPage(Page<News> page, News news) {
		return super.findPage(page, news);
	}
	
	@Transactional(readOnly = false)
	public void save(News news) {
		super.save(news);
	}
	
	@Transactional(readOnly = false)
	public void delete(News news) {
		super.delete(news);
	}

	public Page<News> findNewsPageByConditions(Page<News> page, News news) {
		news.setPage(page);
		page.setList(dao.findNewsPageByConditions(news));
		return page;
	}

	public List<News> getHotNewsList() {
		return dao.getHotNewsList();
	}

	public List<News> getFirstPageNews() {
		
		return dao.getFirstPageNews();
	}

	public List<News> getFirstPageNewsByConditions(News news) {
		
		return dao.getFirstPageNewsByConditions(news);
	}

	public void batchDel(String[] ids) {
		dao.batchDel(ids);
	}

	public void publishNews(News news) {
		dao.publishNews(news);
	}

	public Page<News> findNewsTrashPage(Page<News> page, News news) {
		news.setPage(page);
		page.setList(dao.findNewsTrashPage(news));
		return page;
	}

	public void restore(News news) {
		dao.restore(news);
	}

	public void batchRestore(String[] ids) {
		dao.batchRestore(ids);
	}

	public List<News> getRollNewsList() {
		return dao.getRollNewsList();
	}
	
}
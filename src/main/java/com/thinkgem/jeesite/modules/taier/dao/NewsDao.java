/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.News;

/**
 * 新闻DAO接口
 * @author xuyongqiang
 * @version 2018-08-22
 */
@MyBatisDao
public interface NewsDao extends CrudDao<News> {

	List<News> findNewsPageByConditions(News news);

	List<News> getHotNewsList();

	List<News> getFirstPageNews();

	List<News> getFirstPageNewsByConditions(News news);

	void batchDel(String[] ids);

	void publishNews(News news);

	List<News> findNewsTrashPage(News news);

	void restore(News news);

	void batchRestore(String[] ids);

	List<News> getRollNewsList();
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.Comments;
import com.thinkgem.jeesite.modules.taier.dao.CommentsDao;

/**
 * 评论Service
 * @author xuyongqiang
 * @version 2018-08-27
 */
@Service
@Transactional(readOnly = true)
public class CommentsService extends CrudService<CommentsDao, Comments> {

	public Comments get(String id) {
		return super.get(id);
	}
	
	public List<Comments> findList(Comments comments) {
		return super.findList(comments);
	}
	
	public Page<Comments> findPage(Page<Comments> page, Comments comments) {
		return super.findPage(page, comments);
	}
	
	@Transactional(readOnly = false)
	public void save(Comments comments) {
		super.save(comments);
	}
	
	@Transactional(readOnly = false)
	public void delete(Comments comments) {
		super.delete(comments);
	}

	public Page<Comments> getActCommentsList(Page<Comments> page, Comments comments) {
		comments.setPage(page);
		page.setList(dao.getActCommentsList(comments));
		return page;
	}
	
}
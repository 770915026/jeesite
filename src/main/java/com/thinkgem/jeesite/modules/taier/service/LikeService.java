/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.Like;
import com.thinkgem.jeesite.modules.taier.dao.LikeDao;

/**
 * 点赞Service
 * @author xuyongqiang
 * @version 2018-08-27
 */
@Service
@Transactional(readOnly = true)
public class LikeService extends CrudService<LikeDao, Like> {

	public Like get(String id) {
		return super.get(id);
	}
	
	public List<Like> findList(Like like) {
		return super.findList(like);
	}
	
	public Page<Like> findPage(Page<Like> page, Like like) {
		return super.findPage(page, like);
	}
	
	@Transactional(readOnly = false)
	public void save(Like like) {
		super.save(like);
	}
	
	@Transactional(readOnly = false)
	public void delete(Like like) {
		super.delete(like);
	}

	public int getNumOfLikeThisAct(Like like) {
		return dao.getNumOfLikeThisAct(like);
	}

	public List<Like> findByUserAndActivity(Like like) {
		return dao.findByUserAndActivity(like);
	}
}
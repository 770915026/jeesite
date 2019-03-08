/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.dao.FirstPageImgDao;
import com.thinkgem.jeesite.modules.taier.entity.FirstPageImg;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 首页图片Service
 * @author xuyongqiang
 * @version 2018-08-30
 */
@Service
@Transactional(readOnly = true)
public class FirstPageImgService extends CrudService<FirstPageImgDao, FirstPageImg> {

	public FirstPageImg get(String id) {
		return super.get(id);
	}
	
	public List<FirstPageImg> findList(FirstPageImg firstPageImg) {
		return super.findList(firstPageImg);
	}
	
	public Page<FirstPageImg> findPage(Page<FirstPageImg> page, FirstPageImg firstPageImg) {
		return super.findPage(page, firstPageImg);
	}
	
	@Transactional(readOnly = false)
	public void save(FirstPageImg firstPageImg) {
		super.save(firstPageImg);
	}
	
	@Transactional(readOnly = false)
	public void delete(FirstPageImg firstPageImg) {
		super.delete(firstPageImg);
	}

	public List<FirstPageImg> getFirstPageImgList() {
		return dao.getFirstPageImgList();
	}
	
}
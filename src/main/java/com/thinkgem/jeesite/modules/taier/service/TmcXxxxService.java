/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.dao.TmcXxxxDao;
import com.thinkgem.jeesite.modules.taier.entity.TmcXxxx;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 设备简介表Service
 * @author gy
 * @version 2018-10-31
 */
@Service
@Transactional(readOnly = true)
public class TmcXxxxService extends CrudService<TmcXxxxDao, TmcXxxx> {

	public TmcXxxx get(String id) {
		return super.get(id);
	}
	
	public List<TmcXxxx> findList(TmcXxxx TmcXxxx) {
		return super.findList(TmcXxxx);
	}
	
	public Page<TmcXxxx> findPage(Page<TmcXxxx> page, TmcXxxx TmcXxxx) {
		return super.findPage(page, TmcXxxx);
	}
	
	@Transactional(readOnly = false)
	public void save(TmcXxxx TmcXxxx) {
		super.save(TmcXxxx);
	}
	
	@Transactional(readOnly = false)
	public void delete(TmcXxxx TmcXxxx) {
		super.delete(TmcXxxx);
	}

	public TmcXxxx getTmcXxxxBypk1(String pk1) {
		return dao.getTmcXxxxBypk1(pk1);
	}
	
}
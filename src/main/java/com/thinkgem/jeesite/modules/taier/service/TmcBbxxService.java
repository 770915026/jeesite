/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.dao.TmcBbxxDao;
import com.thinkgem.jeesite.modules.taier.entity.TmcBbxx;
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
public class TmcBbxxService extends CrudService<TmcBbxxDao, TmcBbxx> {

	public TmcBbxx get(String id) {
		return super.get(id);
	}
	
	public List<TmcBbxx> findList(TmcBbxx TmcBbxx) {
		return super.findList(TmcBbxx);
	}
	
	public Page<TmcBbxx> findPage(Page<TmcBbxx> page, TmcBbxx TmcBbxx) {
		return super.findPage(page, TmcBbxx);
	}
	
	@Transactional(readOnly = false)
	public void save(TmcBbxx TmcBbxx) {
		super.save(TmcBbxx);
	}
	
	@Transactional(readOnly = false)
	public void delete(TmcBbxx TmcBbxx) {
		super.delete(TmcBbxx);
	}

	public TmcBbxx getTmcBbxxByPk1(String pk1) {
		return dao.getTmcBbxxByPk1(pk1);
	}
	
}
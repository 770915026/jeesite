/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.dao.TmcDcDao;
import com.thinkgem.jeesite.modules.taier.dao.TmcSbjjbDao;
import com.thinkgem.jeesite.modules.taier.entity.TmcDc;
import com.thinkgem.jeesite.modules.taier.entity.TmcSbjjb;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 电池Service
 * @author gy
 * @version 2018-10-31
 */
@Service
@Transactional(readOnly = true)
public class TmcDcService extends CrudService<TmcDcDao, TmcDc> {

	public TmcDc get(String id) {
		return super.get(id);
	}
	
	public List<TmcDc> findList(TmcDc TmcDc) {
		return super.findList(TmcDc);
	}
	
	public Page<TmcDc> findPage(Page<TmcDc> page, TmcDc TmcDc) {
		return super.findPage(page, TmcDc);
	}
	
	@Transactional(readOnly = false)
	public void save(TmcDc TmcDc) {
		super.save(TmcDc);
	}
	
	@Transactional(readOnly = false)
	public void delete(TmcDc TmcDc) {
		super.delete(TmcDc);
	}

	public TmcDc getDcByPk1(String pk1) {
		return dao.getDcByPk1(pk1);
	}
	
}
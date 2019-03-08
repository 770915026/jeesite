/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.dao.TmcDyspqcdqDao;
import com.thinkgem.jeesite.modules.taier.dao.TmcSbjjbDao;
import com.thinkgem.jeesite.modules.taier.entity.TmcDyspqcdq;
import com.thinkgem.jeesite.modules.taier.entity.TmcSbjjb;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 电源适配器/充电器Service
 * @author gy
 * @version 2018-10-31
 */
@Service
@Transactional(readOnly = true)
public class TmcDyspqcdqService extends CrudService<TmcDyspqcdqDao, TmcDyspqcdq> {

	public TmcDyspqcdq get(String id) {
		return super.get(id);
	}
	
	public List<TmcDyspqcdq> findList(TmcDyspqcdq TmcDyspqcdq) {
		return super.findList(TmcDyspqcdq);
	}
	
	public Page<TmcDyspqcdq> findPage(Page<TmcDyspqcdq> page, TmcDyspqcdq TmcDyspqcdq) {
		return super.findPage(page, TmcDyspqcdq);
	}
	
	@Transactional(readOnly = false)
	public void save(TmcDyspqcdq TmcDyspqcdq) {
		super.save(TmcDyspqcdq);
	}
	
	@Transactional(readOnly = false)
	public void delete(TmcDyspqcdq TmcDyspqcdq) {
		super.delete(TmcDyspqcdq);
	}

	public TmcDyspqcdq getTmcDyspqcdqBypk1(String pk1) {
		return dao.getTmcDyspqcdqBypk1(pk1);
	}
	
}
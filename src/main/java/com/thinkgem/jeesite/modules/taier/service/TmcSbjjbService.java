/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.dao.TmcRwsqdDao;
import com.thinkgem.jeesite.modules.taier.dao.TmcSbjjbDao;
import com.thinkgem.jeesite.modules.taier.entity.TmcRwsqd;
import com.thinkgem.jeesite.modules.taier.entity.TmcSbjjb;
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
public class TmcSbjjbService extends CrudService<TmcSbjjbDao, TmcSbjjb> {

	public TmcSbjjb get(String id) {
		return super.get(id);
	}
	
	public List<TmcSbjjb> findList(TmcSbjjb tmcSbjjb) {
		return super.findList(tmcSbjjb);
	}
	
	public Page<TmcSbjjb> findPage(Page<TmcSbjjb> page, TmcSbjjb tmcSbjjb) {
		return super.findPage(page, tmcSbjjb);
	}
	
	@Transactional(readOnly = false)
	public void save(TmcSbjjb tmcSbjjb) {
		super.save(tmcSbjjb);
	}
	
	@Transactional(readOnly = false)
	public void delete(TmcSbjjb tmcSbjjb) {
		super.delete(tmcSbjjb);
	}

	public TmcSbjjb getSbjjByBh(String bh) {
		return dao.getSbjjByBh(bh);
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.dao.AqyqjlbDao;
import com.thinkgem.jeesite.modules.taier.dao.TmcBgqrbDao;
import com.thinkgem.jeesite.modules.taier.entity.Aqyqjlb;
import com.thinkgem.jeesite.modules.taier.entity.TmcBgqrb;
import com.thinkgem.jeesite.modules.taier.entity.TmcRwsqd;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 变更确认主表Service
 * @author gy
 * @version 2018-10-31
 */
@Service
@Transactional(readOnly = true)
public class TmcBgqrbService extends CrudService<TmcBgqrbDao, TmcBgqrb> {

	public TmcBgqrb get(String id) {
		return super.get(id);
	}
	
	public List<TmcBgqrb> findList(TmcBgqrb TmcBgqrb) {
		return super.findList(TmcBgqrb);
	}
	
	public Page<TmcBgqrb> findPage(Page<TmcBgqrb> page, TmcBgqrb TmcBgqrb) {
		return super.findPage(page, TmcBgqrb);
	}
	
	@Transactional(readOnly = false)
	public void save(TmcBgqrb TmcBgqrb) {
		super.save(TmcBgqrb);
	}
	
	@Transactional(readOnly = false)
	public void delete(TmcBgqrb TmcBgqrb) {
		super.delete(TmcBgqrb);
	}

	public TmcBgqrb getTmcBgqrbByPk1(String pk1) {
		return dao.getTmcBgqrbByPk1(pk1);
	}

}
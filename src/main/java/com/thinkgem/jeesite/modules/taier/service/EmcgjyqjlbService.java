/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.dao.EmcgjyqjlbDao;
import com.thinkgem.jeesite.modules.taier.dao.TmcXxxxDao;
import com.thinkgem.jeesite.modules.taier.entity.Emcgjyqjlb;
import com.thinkgem.jeesite.modules.taier.entity.TmcXxxx;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * emc关键元器件Service
 * @author gy
 * @version 2018-10-31
 */
@Service
@Transactional(readOnly = true)
public class EmcgjyqjlbService extends CrudService<EmcgjyqjlbDao, Emcgjyqjlb> {

	public Emcgjyqjlb get(String id) {
		return super.get(id);
	}
	
	public List<Emcgjyqjlb> findList(Emcgjyqjlb Emcgjyqjlb) {
		return super.findList(Emcgjyqjlb);
	}
	
	public Page<Emcgjyqjlb> findPage(Page<Emcgjyqjlb> page, Emcgjyqjlb Emcgjyqjlb) {
		return super.findPage(page, Emcgjyqjlb);
	}
	
	@Transactional(readOnly = false)
	public void save(Emcgjyqjlb Emcgjyqjlb) {
		super.save(Emcgjyqjlb);
	}
	
	@Transactional(readOnly = false)
	public void delete(Emcgjyqjlb Emcgjyqjlb) {
		super.delete(Emcgjyqjlb);
	}

	public List<Emcgjyqjlb> getEmcgjyqjlbListByPk1(String pk1) {
		return dao.getEmcgjyqjlbListByPk1(pk1);
	}
	
}
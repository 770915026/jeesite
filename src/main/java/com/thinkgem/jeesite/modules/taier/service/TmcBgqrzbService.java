/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.dao.AqyqjlbDao;
import com.thinkgem.jeesite.modules.taier.dao.TmcBgqrzbDao;
import com.thinkgem.jeesite.modules.taier.entity.Aqyqjlb;
import com.thinkgem.jeesite.modules.taier.entity.TmcBgqrzb;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 变更确认子表Service
 * @author gy
 * @version 2018-10-31
 */
@Service
@Transactional(readOnly = true)
public class TmcBgqrzbService extends CrudService<TmcBgqrzbDao, TmcBgqrzb> {

	public TmcBgqrzb get(String id) {
		return super.get(id);
	}
	
	public List<TmcBgqrzb> findList(TmcBgqrzb TmcBgqrzb) {
		return super.findList(TmcBgqrzb);
	}
	
	public Page<TmcBgqrzb> findPage(Page<TmcBgqrzb> page, TmcBgqrzb TmcBgqrzb) {
		return super.findPage(page, TmcBgqrzb);
	}
	
	@Transactional(readOnly = false)
	public void save(TmcBgqrzb TmcBgqrzb) {
		super.save(TmcBgqrzb);
	}
	
	@Transactional(readOnly = false)
	public void delete(TmcBgqrzb TmcBgqrzb) {
		super.delete(TmcBgqrzb);
	}

	public List<TmcBgqrzb> getTmcBgqrzbListBypk1(String pk1) {
		return dao.getTmcBgqrzbListBypk1(pk1);
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.dao.TmcBbxzDao;
import com.thinkgem.jeesite.modules.taier.dao.TmcRwsqdDao;
import com.thinkgem.jeesite.modules.taier.entity.TmcBbxz;
import com.thinkgem.jeesite.modules.taier.entity.TmcRwsqd;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 设备附件Service
 * @author gy
 * @version 2018-10-31
 */
@Service
@Transactional(readOnly = true)
public class TmcBbxzService extends CrudService<TmcBbxzDao, TmcBbxz> {

	public TmcBbxz get(String id) {
		return super.get(id);
	}
	
	public List<TmcBbxz> findList(TmcBbxz tmcBbxz) {
		return super.findList(tmcBbxz);
	}
	
	public Page<TmcBbxz> findPage(Page<TmcBbxz> page, TmcBbxz tmcBbxz) {
		return super.findPage(page, tmcBbxz);
	}
	
	@Transactional(readOnly = false)
	public void save(TmcBbxz tmcBbxz) {
		super.save(tmcBbxz);
	}
	
	@Transactional(readOnly = false)
	public void delete(TmcBbxz tmcBbxz) {
		super.delete(tmcBbxz);
	}

	public List<TmcBbxz> getBbxzListByPk1(String pk1) {
		return dao.getBbxzListByPk1(pk1);
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.TlFactory;
import com.thinkgem.jeesite.modules.taier.dao.TlFactoryDao;

/**
 * 厂家管理Service
 * @author gy
 * @version 2018-09-03
 */
@Service
@Transactional(readOnly = true)
public class TlFactoryService extends CrudService<TlFactoryDao, TlFactory> {

	public TlFactory get(String id) {
		return super.get(id);
	}
	
	public List<TlFactory> findList(TlFactory tlFactory) {
		return super.findList(tlFactory);
	}
	
	public Page<TlFactory> findPage(Page<TlFactory> page, TlFactory tlFactory) {
		return super.findPage(page, tlFactory);
	}
	
	@Transactional(readOnly = false)
	public void save(TlFactory tlFactory) {
		super.save(tlFactory);
	}
	
	@Transactional(readOnly = false)
	public void delete(TlFactory tlFactory) {
		super.delete(tlFactory);
	}
	
}
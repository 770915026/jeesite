/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.TlApps;
import com.thinkgem.jeesite.modules.taier.dao.TlAppsDao;

/**
 * appService
 * @author gy
 * @version 2018-08-30
 */
@Service
@Transactional(readOnly = true)
public class TlAppsService extends CrudService<TlAppsDao, TlApps> {

	public TlApps get(String id) {
		return super.get(id);
	}
	
	public List<TlApps> findList(TlApps tlApps) {
		return super.findList(tlApps);
	}
	
	public Page<TlApps> findPage(Page<TlApps> page, TlApps tlApps) {
		return super.findPage(page, tlApps);
	}
	
	@Transactional(readOnly = false)
	public void save(TlApps tlApps) {
		super.save(tlApps);
	}
	
	@Transactional(readOnly = false)
	public void delete(TlApps tlApps) {
		super.delete(tlApps);
	}

	public TlApps getAppsByCondition(TlApps app) {
		return dao.getAppsByCondition(app);
	}

	public List<TlApps> getCommentAndMyApps(TlApps app) {
		return dao.getCommentAndMyApps(app);
	}

	public void deleteBycompanyId(TlApps app){
		dao.deleteBycompanyId(app);
	}
}
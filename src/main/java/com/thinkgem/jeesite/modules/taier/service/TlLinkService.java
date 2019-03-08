/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.dao.TlLinkDao;
import com.thinkgem.jeesite.modules.taier.entity.TlLink;

/**
 * 友情链接Service
 * @author xuyongqiang
 * @version 2018-08-22
 */
@Service
@Transactional(readOnly = true)
public class TlLinkService extends CrudService<TlLinkDao, TlLink> {

	public TlLink get(String id) {
		return super.get(id);
	}
	
	public List<TlLink> findList(TlLink tlLink) {
		return super.findList(tlLink);
	}
	
	public Page<TlLink> findPage(Page<TlLink> page, TlLink tlLink) {
		return super.findPage(page, tlLink);
	}
	
	@Transactional(readOnly = false)
	public void save(TlLink tlLink) {
		super.save(tlLink);
	}
	
	@Transactional(readOnly = false)
	public void delete(TlLink tlLink) {
		super.delete(tlLink);
	}
	
}
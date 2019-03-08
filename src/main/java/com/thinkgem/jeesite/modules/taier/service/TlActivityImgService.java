/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.TlActivityImg;
import com.thinkgem.jeesite.modules.taier.dao.TlActivityImgDao;

/**
 * 活动页banner图Service
 * @author gy
 * @version 2018-10-24
 */
@Service
@Transactional(readOnly = true)
public class TlActivityImgService extends CrudService<TlActivityImgDao, TlActivityImg> {

	public TlActivityImg get(String id) {
		return super.get(id);
	}
	
	public List<TlActivityImg> findList(TlActivityImg tlActivityImg) {
		return super.findList(tlActivityImg);
	}
	
	public Page<TlActivityImg> findPage(Page<TlActivityImg> page, TlActivityImg tlActivityImg) {
		return super.findPage(page, tlActivityImg);
	}
	
	@Transactional(readOnly = false)
	public void save(TlActivityImg tlActivityImg) {
		super.save(tlActivityImg);
	}
	
	@Transactional(readOnly = false)
	public void delete(TlActivityImg tlActivityImg) {
		super.delete(tlActivityImg);
	}
	
}
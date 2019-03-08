/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.TlSysAgreement;
import com.thinkgem.jeesite.modules.taier.dao.TlSysAgreementDao;

/**
 * 协议Service
 * @author gy
 * @version 2018-08-24
 */
@Service
@Transactional(readOnly = true)
public class TlSysAgreementService extends CrudService<TlSysAgreementDao, TlSysAgreement> {

	public TlSysAgreement get(String id) {
		return super.get(id);
	}
	
	public List<TlSysAgreement> findList(TlSysAgreement tlSysAgreement) {
		return super.findList(tlSysAgreement);
	}
	
	public Page<TlSysAgreement> findPage(Page<TlSysAgreement> page, TlSysAgreement tlSysAgreement) {
		return super.findPage(page, tlSysAgreement);
	}
	
	@Transactional(readOnly = false)
	public void save(TlSysAgreement tlSysAgreement) {
		super.save(tlSysAgreement);
	}
	
	@Transactional(readOnly = false)
	public void delete(TlSysAgreement tlSysAgreement) {
		super.delete(tlSysAgreement);
	}
	
}
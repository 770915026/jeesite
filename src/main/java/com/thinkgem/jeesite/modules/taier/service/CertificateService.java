/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.Certificate;
import com.thinkgem.jeesite.modules.taier.dao.CertificateDao;

/**
 * 泰尔证书Service
 * @author xuyongqiang
 * @version 2018-11-08
 */
@Service
@Transactional(readOnly = true)
public class CertificateService extends CrudService<CertificateDao, Certificate> {

	public Certificate get(String id) {
		return super.get(id);
	}
	
	public List<Certificate> findList(Certificate certificate) {
		return super.findList(certificate);
	}
	
	public Page<Certificate> findPage(Page<Certificate> page, Certificate certificate) {
		return super.findPage(page, certificate);
	}
	
	@Transactional(readOnly = false)
	public void save(Certificate certificate) {
		super.save(certificate);
	}
	
	@Transactional(readOnly = false)
	public void delete(Certificate certificate) {
		super.delete(certificate);
	}
	
}
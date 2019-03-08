/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.AdCertificate;
import com.thinkgem.jeesite.modules.taier.dao.AdCertificateDao;

/**
 * 广告证书Service
 * @author xuyongqiang
 * @version 2018-10-17
 */
@Service
@Transactional(readOnly = true)
public class AdCertificateService extends CrudService<AdCertificateDao, AdCertificate> {

	public AdCertificate get(String id) {
		return super.get(id);
	}
	
	public List<AdCertificate> findList(AdCertificate adCertificate) {
		return super.findList(adCertificate);
	}
	
	public Page<AdCertificate> findPage(Page<AdCertificate> page, AdCertificate adCertificate) {
		return super.findPage(page, adCertificate);
	}
	
	@Transactional(readOnly = false)
	public void save(AdCertificate adCertificate) {
		super.save(adCertificate);
	}
	
	@Transactional(readOnly = false)
	public void delete(AdCertificate adCertificate) {
		super.delete(adCertificate);
	}

	public AdCertificate getAdCertificate() {
		return dao.getAdCertificate();
	}
	
}
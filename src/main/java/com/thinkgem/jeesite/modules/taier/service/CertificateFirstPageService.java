/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.CertificateFirstPage;
import com.thinkgem.jeesite.modules.taier.dao.CertificateFirstPageDao;

/**
 * 首页证书Service
 * @author xuyongqiang
 * @version 2018-11-22
 */
@Service
@Transactional(readOnly = true)
public class CertificateFirstPageService extends CrudService<CertificateFirstPageDao, CertificateFirstPage> {

	public CertificateFirstPage get(String id) {
		return super.get(id);
	}
	
	public List<CertificateFirstPage> findList(CertificateFirstPage certificateFirstPage) {
		return super.findList(certificateFirstPage);
	}
	
	public Page<CertificateFirstPage> findPage(Page<CertificateFirstPage> page, CertificateFirstPage certificateFirstPage) {
		return super.findPage(page, certificateFirstPage);
	}
	
	@Transactional(readOnly = false)
	public void save(CertificateFirstPage certificateFirstPage) {
		super.save(certificateFirstPage);
	}
	
	@Transactional(readOnly = false)
	public void delete(CertificateFirstPage certificateFirstPage) {
		super.delete(certificateFirstPage);
	}

	public CertificateFirstPage getOneCertificateFirstPage() {
		return dao.getOneCertificateFirstPage();
	}
	
}
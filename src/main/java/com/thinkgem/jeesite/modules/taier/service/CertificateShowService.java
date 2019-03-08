/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.CertificateShow;
import com.thinkgem.jeesite.modules.taier.dao.CertificateShowDao;

/**
 * 证书展示Service
 * @author xuyongqiang
 * @version 2018-11-20
 */
@Service
@Transactional(readOnly = true)
public class CertificateShowService extends CrudService<CertificateShowDao, CertificateShow> {

	public CertificateShow get(String id) {
		return super.get(id);
	}
	
	public List<CertificateShow> findList(CertificateShow certificateShow) {
		return super.findList(certificateShow);
	}
	
	public Page<CertificateShow> findPage(Page<CertificateShow> page, CertificateShow certificateShow) {
		return super.findPage(page, certificateShow);
	}
	
	@Transactional(readOnly = false)
	public void save(CertificateShow certificateShow) {
		super.save(certificateShow);
	}
	
	@Transactional(readOnly = false)
	public void delete(CertificateShow certificateShow) {
		super.delete(certificateShow);
	}
	
}
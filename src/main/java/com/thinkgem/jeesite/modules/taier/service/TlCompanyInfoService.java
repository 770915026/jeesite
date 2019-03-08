/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.TlCompanyInfo;
import com.thinkgem.jeesite.modules.taier.dao.TlCompanyInfoDao;

/**
 * 厂家基本信息Service
 * @author gy
 * @version 2018-08-20
 */
@Service
@Transactional(readOnly = true)
public class TlCompanyInfoService extends CrudService<TlCompanyInfoDao, TlCompanyInfo> {

	public TlCompanyInfo get(String id) {
		return super.get(id);
	}
	
	public List<TlCompanyInfo> findList(TlCompanyInfo tlCompanyInfo) {
		return super.findList(tlCompanyInfo);
	}
	
	public Page<TlCompanyInfo> findPage(Page<TlCompanyInfo> page, TlCompanyInfo tlCompanyInfo) {
		return super.findPage(page, tlCompanyInfo);
	}
	
	@Transactional(readOnly = false)
	public void save(TlCompanyInfo tlCompanyInfo) {
		super.save(tlCompanyInfo);
	}
	
	@Transactional(readOnly = false)
	public void delete(TlCompanyInfo tlCompanyInfo) {
		super.delete(tlCompanyInfo);
	}

	public TlCompanyInfo findByUserId(String userId) {
		return dao.findByUserId(userId);
	}
}
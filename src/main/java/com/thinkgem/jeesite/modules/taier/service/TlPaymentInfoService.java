/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.TlPaymentInfo;
import com.thinkgem.jeesite.modules.taier.dao.TlPaymentInfoDao;

/**
 * 缴费信息Service
 * @author gy
 * @version 2018-08-21
 */
@Service
@Transactional(readOnly = true)
public class TlPaymentInfoService extends CrudService<TlPaymentInfoDao, TlPaymentInfo> {

	public TlPaymentInfo get(String id) {
		return super.get(id);
	}
	
	public List<TlPaymentInfo> findList(TlPaymentInfo tlPaymentInfo) {
		return super.findList(tlPaymentInfo);
	}
	
	public Page<TlPaymentInfo> findPage(Page<TlPaymentInfo> page, TlPaymentInfo tlPaymentInfo) {
		return super.findPage(page, tlPaymentInfo);
	}
	
	@Transactional(readOnly = false)
	public void save(TlPaymentInfo tlPaymentInfo) {
		super.save(tlPaymentInfo);
	}
	
	@Transactional(readOnly = false)
	public void delete(TlPaymentInfo tlPaymentInfo) {
		super.delete(tlPaymentInfo);
	}
	
}
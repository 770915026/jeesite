/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.TlInvoice;
import com.thinkgem.jeesite.modules.taier.dao.TlInvoiceDao;

/**
 * 发票Service
 * @author gy
 * @version 2018-08-22
 */
@Service
@Transactional(readOnly = true)
public class TlInvoiceService extends CrudService<TlInvoiceDao, TlInvoice> {

	public TlInvoice get(String id) {
		return super.get(id);
	}
	
	public List<TlInvoice> findList(TlInvoice tlInvoice) {
		return super.findList(tlInvoice);
	}
	
	public Page<TlInvoice> findPage(Page<TlInvoice> page, TlInvoice tlInvoice) {
		return super.findPage(page, tlInvoice);
	}
	
	@Transactional(readOnly = false)
	public void save(TlInvoice tlInvoice) {
		super.save(tlInvoice);
	}
	
	@Transactional(readOnly = false)
	public void delete(TlInvoice tlInvoice) {
		super.delete(tlInvoice);
	}
	
}
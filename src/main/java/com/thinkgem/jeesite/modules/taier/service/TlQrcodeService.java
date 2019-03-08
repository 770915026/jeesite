/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.TlQrcode;
import com.thinkgem.jeesite.modules.taier.dao.TlQrcodeDao;

/**
 * 二维码维护Service
 * @author gy
 * @version 2018-10-23
 */
@Service
@Transactional(readOnly = true)
public class TlQrcodeService extends CrudService<TlQrcodeDao, TlQrcode> {

	public TlQrcode get(String id) {
		return super.get(id);
	}
	
	public List<TlQrcode> findList(TlQrcode tlQrcode) {
		return super.findList(tlQrcode);
	}
	
	public Page<TlQrcode> findPage(Page<TlQrcode> page, TlQrcode tlQrcode) {
		return super.findPage(page, tlQrcode);
	}
	
	@Transactional(readOnly = false)
	public void save(TlQrcode tlQrcode) {
		super.save(tlQrcode);
	}
	
	@Transactional(readOnly = false)
	public void delete(TlQrcode tlQrcode) {
		super.delete(tlQrcode);
	}
	
}
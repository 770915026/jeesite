/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.dao.AboutUsDao;
import com.thinkgem.jeesite.modules.taier.entity.AboutUs;

/**
 * 关于我们Service
 * @author xuyongqiang
 * @version 2018-08-21
 */
@Service
@Transactional(readOnly = true)
public class AboutUsService extends CrudService<AboutUsDao, AboutUs> {
	
	@Autowired
	private AboutUsDao aboutUsDao;
	public AboutUs get(String id) {
		return super.get(id);
	}
	
	public List<AboutUs> findList(AboutUs aboutUs) {
		return super.findList(aboutUs);
	}
	
	public Page<AboutUs> findPage(Page<AboutUs> page, AboutUs aboutUs) {
		return super.findPage(page, aboutUs);
	}
	
	@Transactional(readOnly = false)
	public void save(AboutUs aboutUs) {
		super.save(aboutUs);
	}
	
	@Transactional(readOnly = false)
	public void delete(AboutUs aboutUs) {
		super.delete(aboutUs);
	}

	public AboutUs getLastAboutUs() {
		return aboutUsDao.getLastAboutUs();
	}
	
}
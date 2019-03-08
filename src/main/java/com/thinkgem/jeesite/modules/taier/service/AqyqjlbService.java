/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.dao.AqyqjlbDao;
import com.thinkgem.jeesite.modules.taier.dao.EmcgjyqjlbDao;
import com.thinkgem.jeesite.modules.taier.entity.Aqyqjlb;
import com.thinkgem.jeesite.modules.taier.entity.Emcgjyqjlb;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 安全元器件Service
 * @author gy
 * @version 2018-10-31
 */
@Service
@Transactional(readOnly = true)
public class AqyqjlbService extends CrudService<AqyqjlbDao, Aqyqjlb> {

	public Aqyqjlb get(String id) {
		return super.get(id);
	}
	
	public List<Aqyqjlb> findList(Aqyqjlb Aqyqjlb) {
		return super.findList(Aqyqjlb);
	}
	
	public Page<Aqyqjlb> findPage(Page<Aqyqjlb> page, Aqyqjlb Aqyqjlb) {
		return super.findPage(page, Aqyqjlb);
	}
	
	@Transactional(readOnly = false)
	public void save(Aqyqjlb Aqyqjlb) {
		super.save(Aqyqjlb);
	}
	
	@Transactional(readOnly = false)
	public void delete(Aqyqjlb Aqyqjlb) {
		super.delete(Aqyqjlb);
	}

	public List<Aqyqjlb> getAqyqjlbListByPk1(String pk1) {
		return dao.getEmcgjyqjlbListByPk1(pk1);
	}
	
}
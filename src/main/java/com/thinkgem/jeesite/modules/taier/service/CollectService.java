/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.Collect;
import com.thinkgem.jeesite.modules.taier.dao.CollectDao;

/**
 * 收藏Service
 * @author xuyongqiang
 * @version 2018-08-27
 */
@Service
@Transactional(readOnly = true)
public class CollectService extends CrudService<CollectDao, Collect> {

	public Collect get(String id) {
		return super.get(id);
	}
	
	public List<Collect> findList(Collect collect) {
		return super.findList(collect);
	}
	
	public Page<Collect> findPage(Page<Collect> page, Collect collect) {
		return super.findPage(page, collect);
	}
	
	@Transactional(readOnly = false)
	public void save(Collect collect) {
		super.save(collect);
	}
	
	@Transactional(readOnly = false)
	public void delete(Collect collect) {
		super.delete(collect);
	}

	public int getNumOfCollectThisAct(Collect collect) {
		return dao.getNumOfCollectThisAct(collect);
	}

    @Transactional(readOnly = false)
    public Collect getByUserAndActivity(Collect collect){
	    return dao.getByUserAndActivity(collect);
    }
}
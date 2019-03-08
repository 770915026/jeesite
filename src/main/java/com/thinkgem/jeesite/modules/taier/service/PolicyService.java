/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.dao.PolicyDao;
import com.thinkgem.jeesite.modules.taier.entity.Policy;

/**
 * 政策Service
 * @author xuyongqiang
 * @version 2018-08-31
 */
@Service
@Transactional(readOnly = true)
public class PolicyService extends CrudService<PolicyDao, Policy> {

	public Policy get(String id) {
		return super.get(id);
	}
	
	public List<Policy> findList(Policy policy) {
		return super.findList(policy);
	}
	
	public Page<Policy> findPage(Page<Policy> page, Policy policy) {
		return super.findPage(page, policy);
	}
	
	@Transactional(readOnly = false)
	public void save(Policy policy) {
		super.save(policy);
	}
	
	@Transactional(readOnly = false)
	public void delete(Policy policy) {
		super.delete(policy);
	}

	public Page<Policy> getPolicyPageByType(Page<Policy> page, Policy policy) {
		policy.setPage(page);
		page.setList(dao.getPolicyPageByType(policy));
		return page;
		
	}

	public void addActClickNum(String id) {
		dao.addActClickNum(id);
	}

	public void batchDel(String[] ids) {
		dao.batchDel(ids);
	}

	public void publishPolicy(Policy policy) {
		dao.publishPolicy(policy);
	}
	
}
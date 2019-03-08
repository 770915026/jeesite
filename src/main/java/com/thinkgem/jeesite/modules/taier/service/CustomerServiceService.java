/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.CustomerService;
import com.thinkgem.jeesite.modules.taier.dao.CustomerServiceDao;

/**
 * 客服Service
 * @author xuyongqiang
 * @version 2018-09-28
 */
@Service
@Transactional(readOnly = true)
public class CustomerServiceService extends CrudService<CustomerServiceDao, CustomerService> {

	public CustomerService get(String id) {
		return super.get(id);
	}
	
	public List<CustomerService> findList(CustomerService customerService) {
		return super.findList(customerService);
	}
	
	public Page<CustomerService> findPage(Page<CustomerService> page, CustomerService customerService) {
		return super.findPage(page, customerService);
	}
	
	@Transactional(readOnly = false)
	public void save(CustomerService customerService) {
		super.save(customerService);
	}
	
	@Transactional(readOnly = false)
	public void delete(CustomerService customerService) {
		super.delete(customerService);
	}

	public List<CustomerService> getCustomerServiceList() {
		return dao.getCustomerServiceList();
	}
	
}
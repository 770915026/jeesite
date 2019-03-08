/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.OperateRecords;
import com.thinkgem.jeesite.modules.taier.dao.OperateRecordsDao;

/**
 * 操作记录Service
 * @author xuyongqiang
 * @version 2018-10-10
 */
@Service
@Transactional(readOnly = true)
public class OperateRecordsService extends CrudService<OperateRecordsDao, OperateRecords> {

	public OperateRecords get(String id) {
		return super.get(id);
	}
	
	public List<OperateRecords> findList(OperateRecords operateRecords) {
		return super.findList(operateRecords);
	}
	
	public Page<OperateRecords> findPage(Page<OperateRecords> page, OperateRecords operateRecords) {
		return super.findPage(page, operateRecords);
	}
	
	@Transactional(readOnly = false)
	public void save(OperateRecords operateRecords) {
		super.save(operateRecords);
	}
	
	@Transactional(readOnly = false)
	public void delete(OperateRecords operateRecords) {
		super.delete(operateRecords);
	}
	
}
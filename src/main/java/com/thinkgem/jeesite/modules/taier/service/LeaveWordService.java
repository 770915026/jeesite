/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.LeaveWord;
import com.thinkgem.jeesite.modules.taier.dao.LeaveWordDao;

/**
 * 留言Service
 * @author xuyongqiang
 * @version 2018-08-21
 */
@Service
@Transactional(readOnly = true)
public class LeaveWordService extends CrudService<LeaveWordDao, LeaveWord> {

	public LeaveWord get(String id) {
		return super.get(id);
	}
	
	public List<LeaveWord> findList(LeaveWord leaveWord) {
		return super.findList(leaveWord);
	}
	
	public Page<LeaveWord> findPage(Page<LeaveWord> page, LeaveWord leaveWord) {
		return super.findPage(page, leaveWord);
	}
	
	@Transactional(readOnly = false)
	public void save(LeaveWord leaveWord) {
		super.save(leaveWord);
	}
	
	@Transactional(readOnly = false)
	public void delete(LeaveWord leaveWord) {
		super.delete(leaveWord);
	}
	
}
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
import com.thinkgem.jeesite.modules.taier.entity.ActivityJoin;
import com.thinkgem.jeesite.modules.taier.dao.ActivityJoinDao;

/**
 * 参加活动Service
 * @author xuyongqiang
 * @version 2018-08-27
 */
@Service
@Transactional(readOnly = true)
public class ActivityJoinService extends CrudService<ActivityJoinDao, ActivityJoin> {
	
	public ActivityJoin get(String id) {
		return super.get(id);
	}
	
	public List<ActivityJoin> findList(ActivityJoin activityJoin) {
		return super.findList(activityJoin);
	}
	
	public Page<ActivityJoin> findPage(Page<ActivityJoin> page, ActivityJoin activityJoin) {
		return super.findPage(page, activityJoin);
	}
	
	@Transactional(readOnly = false)
	public void save(ActivityJoin activityJoin) {
		super.save(activityJoin);
	}
	
	@Transactional(readOnly = false)
	public void delete(ActivityJoin activityJoin) {
		super.delete(activityJoin);
	}
	
	@Transactional(readOnly = false)
	public void saveActivityJoin(ActivityJoin activityJoin) {
		dao.insert(activityJoin);
	}

	public int getNumOfJoinThisAct(ActivityJoin activityJoin) {
		
		return dao.getNumOfJoinThisAct(activityJoin);
	}
	
}
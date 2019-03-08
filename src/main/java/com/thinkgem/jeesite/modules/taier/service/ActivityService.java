/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.dao.ActivityDao;
import com.thinkgem.jeesite.modules.taier.entity.Activity;

/**
 * 活动Service
 * @author xuyongqiang
 * @version 2018-08-25
 */
@Service
@Transactional(readOnly = true)
public class ActivityService extends CrudService<ActivityDao, Activity> {

	public Activity get(String id) {
		return super.get(id);
	}
	
	public List<Activity> findList(Activity activity) {
		return super.findList(activity);
	}
	
	public Page<Activity> findPage(Page<Activity> page, Activity activity) {
		return super.findPage(page, activity);
	}
	
	@Transactional(readOnly = false)
	public void save(Activity activity) {
		super.save(activity);
	}
	
	@Transactional(readOnly = false)
	public void delete(Activity activity) {
		super.delete(activity);
	}
	
	@Transactional(readOnly = false)
	public Page<Activity> getActivityList(Page<Activity> page, Activity activity) {
		activity.setPage(page);
		page.setList(dao.getActivityList(activity));
		return page;
	}

	public int getUnderwayActNum() {
		
		return dao.getUnderwayActNum();
	}

	public int getJoinNumOfPeople() {
		return dao.getJoinNumOfPeople();
	}

	public Activity getActivityById(String id) {
		return dao.getActivityById(id);
	}
	@Transactional(readOnly = false)
	public void addActClickNum(String id) {
		dao.addActClickNum(id);
	}

	public List<Activity> getFirstActivity(Activity activity) {
		return dao.getFirstActivity(activity);
	}
	
}
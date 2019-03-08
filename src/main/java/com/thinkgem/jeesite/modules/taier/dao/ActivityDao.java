/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.Activity;

/**
 * 活动DAO接口
 * @author xuyongqiang
 * @version 2018-08-25
 */
@MyBatisDao
public interface ActivityDao extends CrudDao<Activity> {
	
	List<Activity> getActivityList(Activity activity);

	int getUnderwayActNum();

	int getJoinNumOfPeople();

	Activity getActivityById(String id);

	void addActClickNum(String id);

	List<Activity> getFirstActivity(Activity activity);
	
}
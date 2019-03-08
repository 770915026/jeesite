/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.ActivityJoin;

/**
 * 参加活动DAO接口
 * @author xuyongqiang
 * @version 2018-08-27
 */
@MyBatisDao
public interface ActivityJoinDao extends CrudDao<ActivityJoin> {

	int getNumOfJoinThisAct(ActivityJoin activityJoin);
	
}
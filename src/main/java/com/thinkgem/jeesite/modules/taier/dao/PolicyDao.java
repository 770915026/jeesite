/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.Policy;

/**
 * 政策DAO接口
 * @author xuyongqiang
 * @version 2018-08-31
 */
@MyBatisDao
public interface PolicyDao extends CrudDao<Policy> {

	List<Policy> getPolicyPageByType(Policy policy);

	void addActClickNum(String id);

	void batchDel(String[] ids);

	void publishPolicy(Policy policy);
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.TmcXxxx;

/**
 * 详细信息DAO接口
 * @author gy
 * @version 2018-10-31
 */
@MyBatisDao
public interface TmcXxxxDao extends CrudDao<TmcXxxx> {

	TmcXxxx getTmcXxxxBypk1(String pk1);

	void deleteByBh(TmcXxxx tmcXxxx);
	
}
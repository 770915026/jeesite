/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.TlFactory;

/**
 * 厂家管理DAO接口
 * @author gy
 * @version 2018-09-03
 */
@MyBatisDao
public interface TlFactoryDao extends CrudDao<TlFactory> {
	
}
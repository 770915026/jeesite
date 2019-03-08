/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.TmcBgqrzb;

/**
 * 变更确认表子表DAO接口
 * @author gy
 * @version 2018-10-31
 */
@MyBatisDao
public interface TmcBgqrzbDao extends CrudDao<TmcBgqrzb> {

	List<TmcBgqrzb> getTmcBgqrzbListBypk1(String pk1);

	void deleteByGdh(TmcBgqrzb tmcBgqrzb);
	
}
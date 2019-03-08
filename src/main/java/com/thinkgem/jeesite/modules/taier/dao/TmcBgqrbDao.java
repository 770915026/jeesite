/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.TmcBgqrb;
import com.thinkgem.jeesite.modules.taier.entity.TmcRwsqd;

/**
 * 变更确认表主表DAO接口
 * @author gy
 * @version 2018-10-31
 */
@MyBatisDao
public interface TmcBgqrbDao extends CrudDao<TmcBgqrb> {

	void deleteByGdh(TmcBgqrb tmcBgqrb);

	TmcBgqrb getTmcBgqrbByPk1(String pk1);

}
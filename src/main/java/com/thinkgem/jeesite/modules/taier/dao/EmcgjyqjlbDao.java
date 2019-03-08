/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.Emcgjyqjlb;

/**
 * emc关键元器件DAO接口
 * @author gy
 * @version 2018-10-31
 */
@MyBatisDao
public interface EmcgjyqjlbDao extends CrudDao<Emcgjyqjlb> {

	void deleteByGlpk(Emcgjyqjlb emcgjyqjlb);

	List<Emcgjyqjlb> getEmcgjyqjlbByPk1(String pk1);

	List<Emcgjyqjlb> getEmcgjyqjlbListByPk1(String pk1);
	
}
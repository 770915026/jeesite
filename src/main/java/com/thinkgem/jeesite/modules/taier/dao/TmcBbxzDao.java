/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.TmcBbxz;

/**
 * 设备附件DAO接口
 * @author gy
 * @version 2018-10-31
 */
@MyBatisDao
public interface TmcBbxzDao extends CrudDao<TmcBbxz> {

	void deleteByGlpk1(TmcBbxz tmcBbxz);

	List<TmcBbxz> getBbxzListByPk1(String pk1);
	
}
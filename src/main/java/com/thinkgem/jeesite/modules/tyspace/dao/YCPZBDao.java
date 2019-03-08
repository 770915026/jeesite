package com.thinkgem.jeesite.modules.tyspace.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.tyspace.entity.YCPZB;

/**
 * 
* Title: YCPZBDao.java  
* Description:查询配置表的接口   
* Copyright: Copyright (c) 2019
* Company: 北京中锐识华信息科技有限公司
* @author Yuyanan  
* @date 2019年3月2日  
* @version 1.0
 */
@MyBatisDao
public interface YCPZBDao extends CrudDao<YCPZB>{
	List<YCPZB> getTableName();
	List<YCPZB> getField(String tableName);
}

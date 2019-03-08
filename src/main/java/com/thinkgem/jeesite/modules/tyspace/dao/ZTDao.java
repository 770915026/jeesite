package com.thinkgem.jeesite.modules.tyspace.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.tyspace.entity.ZT;

/**
 * 
* Title: ZTDao.java  
* Description:动态查询遥测数据 
* Copyright: Copyright (c) 2019
* Company: 北京中锐识华信息科技有限公司
* @author Yuyanan  
* @date 2019年3月3日  
* @version 1.0
 */
@MyBatisDao
public interface ZTDao extends CrudDao<ZT>{
	List<ZT> getDynamicQuery(Map map);
	List<ZT> getWd();
	List<ZT> getCurrent();
	List<ZT> getVoltage();
	List<ZT> getDydl();
}

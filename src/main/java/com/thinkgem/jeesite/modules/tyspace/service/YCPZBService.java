package com.thinkgem.jeesite.modules.tyspace.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.tyspace.dao.YCPZBDao;
import com.thinkgem.jeesite.modules.tyspace.entity.YCPZB;

/**
 * 
* Title: YCPZBService.java  
* Description:查询配置表   
* Copyright: Copyright (c) 2019
* Company: 北京中锐识华信息科技有限公司
* @author Yuyanan  
* @date 2019年3月2日  
* @version 1.0
 */
@Service
@Transactional(readOnly=true)
public class YCPZBService extends CrudService<YCPZBDao, YCPZB>{
	 public List<YCPZB> getTableName(){
		 return dao.getTableName();
	 }
	 
	 public List<YCPZB> getField(String tableName){
		 return dao.getField(tableName);
	 }
}

package com.thinkgem.jeesite.modules.tyspace.service;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.tyspace.dao.WXDao;
import com.thinkgem.jeesite.modules.tyspace.entity.WX;
/**
 * 
* Title: WXService.java  
* Description:   
* Copyright: Copyright (c) 2019
* Company: 北京中锐识华信息科技有限公司
* @author Yuyanan  
* @date 2019年2月28日  
* @version 1.0
 */
@Service
@Transactional(readOnly = true)
public class WXService extends CrudService<WXDao, WX> {
	
	public List<WX> getWXmcAll() {
		return dao.getWXmcAll();
	}
}

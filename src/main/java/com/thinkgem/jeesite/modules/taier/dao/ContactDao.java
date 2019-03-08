/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.Contact;

/**
 * 联系方式DAO接口
 * @author xuyongqiang
 * @version 2018-11-09
 */
@MyBatisDao
public interface ContactDao extends CrudDao<Contact> {

	Contact getLastContact();
	
}
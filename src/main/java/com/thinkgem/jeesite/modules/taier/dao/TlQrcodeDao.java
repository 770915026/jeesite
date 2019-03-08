/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.TlQrcode;

/**
 * 二维码维护DAO接口
 * @author gy
 * @version 2018-10-23
 */
@MyBatisDao
public interface TlQrcodeDao extends CrudDao<TlQrcode> {
	
}
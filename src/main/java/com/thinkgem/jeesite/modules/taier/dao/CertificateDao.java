/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.Certificate;

/**
 * 泰尔证书DAO接口
 * @author xuyongqiang
 * @version 2018-11-08
 */
@MyBatisDao
public interface CertificateDao extends CrudDao<Certificate> {
	
}
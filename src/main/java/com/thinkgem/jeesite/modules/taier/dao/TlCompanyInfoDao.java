/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.TlCompanyInfo;
import org.apache.ibatis.annotations.Param;

/**
 * 厂家基本信息DAO接口
 * @author gy
 * @version 2018-08-20
 */
@MyBatisDao
public interface TlCompanyInfoDao extends CrudDao<TlCompanyInfo> {
    public TlCompanyInfo findByUserId(@Param("userId") String userId);

}
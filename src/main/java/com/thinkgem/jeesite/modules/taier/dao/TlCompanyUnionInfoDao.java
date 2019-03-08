/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.ModelInfo;
import com.thinkgem.jeesite.modules.taier.entity.TlCompanyUnionInfo;

import java.util.List;

/**
 * 企业联合信息DAO接口
 * @author gy
 * @version 2018-08-27
 */
@MyBatisDao
public interface TlCompanyUnionInfoDao extends CrudDao<TlCompanyUnionInfo> {
    public List<TlCompanyUnionInfo> findListForAppPreSetAdd();
    
    public List<TlCompanyUnionInfo> userunioninfoqry(TlCompanyUnionInfo tlCompanyUnionInfo);
    
	public int getUncheckCompanyUnionInfoNum();

	public void batchDel(String[] ids);
}
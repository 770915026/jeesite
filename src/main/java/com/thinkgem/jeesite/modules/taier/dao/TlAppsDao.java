/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.TlApps;

/**
 * appDAO接口
 * @author gy
 * @version 2018-08-30
 */
@MyBatisDao
public interface TlAppsDao extends CrudDao<TlApps> {

	TlApps getAppsByCondition(TlApps app);

	List<TlApps> getCommentAndMyApps(TlApps app);

	void deleteBycompanyId(TlApps app);
}
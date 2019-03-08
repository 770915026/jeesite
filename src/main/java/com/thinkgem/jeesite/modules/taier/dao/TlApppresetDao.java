/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.ModelInfo;
import com.thinkgem.jeesite.modules.taier.entity.TlApppreset;

import java.util.List;

/**
 * 手机预置应用公示DAO接口
 * @author gy
 * @version 2018-08-30
 */
@MyBatisDao
public interface TlApppresetDao extends CrudDao<TlApppreset> {
	public List<TlApppreset> userpresetqry(TlApppreset tlApppreset);

	public int getUncheckApppresetNum();
}
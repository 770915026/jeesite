/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.VideoLink;

/**
 * 视频链接DAO接口
 * @author xuyongqiang
 * @version 2018-11-06
 */
@MyBatisDao
public interface VideoLinkDao extends CrudDao<VideoLink> {
	
}
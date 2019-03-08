/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.Comments;

/**
 * 评论DAO接口
 * @author xuyongqiang
 * @version 2018-08-27
 */
@MyBatisDao
public interface CommentsDao extends CrudDao<Comments> {

	List<Comments> getActCommentsList(Comments comments);
	
}
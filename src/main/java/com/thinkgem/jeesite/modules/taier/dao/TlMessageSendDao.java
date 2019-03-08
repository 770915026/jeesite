/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taier.entity.TlMessageSend;

/**
 * 消息发送DAO接口
 * @author gy
 * @version 2018-08-22
 */
@MyBatisDao
public interface TlMessageSendDao extends CrudDao<TlMessageSend> {
   public void deleteByMsgId(TlMessageSend tlMessageSend);

   public void insertAll(List<TlMessageSend> messageSendList);
}
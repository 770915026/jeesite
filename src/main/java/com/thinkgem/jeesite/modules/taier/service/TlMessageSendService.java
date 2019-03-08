/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.taier.dao.TlMessageSendDao;
import com.thinkgem.jeesite.modules.taier.entity.TlMessage;
import com.thinkgem.jeesite.modules.taier.entity.TlMessageSend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 消息发送Service
 * @author gy
 * @version 2018-08-22
 */
@Service
@Transactional(readOnly = true)
public class TlMessageSendService extends CrudService<TlMessageSendDao, TlMessageSend> {

	public TlMessageSend get(String id) {
		return super.get(id);
	}
	
	public List<TlMessageSend> findList(TlMessageSend tlMessageSend) {
		return super.findList(tlMessageSend);
	}
	
	public Page<TlMessageSend> findPage(Page<TlMessageSend> page, TlMessageSend tlMessageSend) {
		return super.findPage(page, tlMessageSend);
	}
	
	@Transactional(readOnly = false)
	public void save(TlMessageSend tlMessageSend, String userId) {
		super.save(tlMessageSend);
	}
	
	@Transactional(readOnly = false)
	public void delete(TlMessageSend tlMessageSend) {
		super.delete(tlMessageSend);
	}
	
}
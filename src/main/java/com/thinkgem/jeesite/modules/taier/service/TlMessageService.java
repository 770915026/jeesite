/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.OaNotify;
import com.thinkgem.jeesite.modules.oa.entity.OaNotifyRecord;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taier.dao.TlCompanyInfoDao;
import com.thinkgem.jeesite.modules.taier.dao.TlMessageDao;
import com.thinkgem.jeesite.modules.taier.dao.TlMessageSendDao;
import com.thinkgem.jeesite.modules.taier.entity.TlMessage;
import com.thinkgem.jeesite.modules.taier.entity.TlMessageSend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 消息Service
 * @author gy
 * @version 2018-08-22
 */
@Service
@Transactional(readOnly = true)
public class TlMessageService extends CrudService<TlMessageDao, TlMessage> {

	@Autowired
	private TlMessageSendDao tlMessageSendDao;

	@Autowired
	private UserDao userDao;

	public TlMessage get(String id) {
		return super.get(id);
	}
	
	public List<TlMessage> findList(TlMessage tlMessage) {
		return super.findList(tlMessage);
	}
	
	public Page<TlMessage> findPage(Page<TlMessage> page, TlMessage tlMessage) {
		return super.findPage(page, tlMessage);
	}
	
	@Transactional(readOnly = false)
	public void save(TlMessage tlMessage, String userId) {
		boolean flag = false;
		if (tlMessage.getIsNewRecord()){
			flag = true;
		}
		super.save(tlMessage);
		TlMessageSend tlMessageSend=new TlMessageSend();
		tlMessageSend.setMessageid(tlMessage.getId());
		tlMessageSendDao.deleteByMsgId(tlMessageSend);
		if(flag){
			if (tlMessage.getMessageSendList().size() > 0){
				for(TlMessageSend messageSend:tlMessage.getMessageSendList()){
					messageSend.setMessageid(tlMessage.getId());
				}
			}
			
		}
		if (tlMessage.getMessageSendList().size() > 0){
			tlMessageSendDao.insertAll(tlMessage.getMessageSendList());
		}
		
		/*boolean flag = false;
		if (tlMessage.getIsNewRecord()){
			flag = true;
		}
		super.save(tlMessage);
		if(flag) {
			if(StringUtils.isNotEmpty(userId)) {
				TlMessageSend tlMessageSend = new TlMessageSend();
				tlMessageSend.setMessageid(tlMessage.getId());
				User user = new User();
				user.setId(userId);
				tlMessageSend.setUser(user);
				tlMessageSend.setIsread("0");
				tlMessageSend.preInsert();
				tlMessageSendDao.insert(tlMessageSend);
			} else {
				User user1 = new User();
				List<User> list = userDao.findList(user1);
				for(int i=0;i<list.size();i++) {
					TlMessageSend tlMessageSend = new TlMessageSend();
					tlMessageSend.setMessageid(tlMessage.getId());
					User user = list.get(i);
					tlMessageSend.setUser(user);
					tlMessageSend.setIsread("0");
					tlMessageSend.preInsert();
					tlMessageSendDao.insert(tlMessageSend);
				}
			}
		}*/

	}
	
	@Transactional(readOnly = false)
	public void delete(TlMessage tlMessage) {
		super.delete(tlMessage);
		TlMessageSend tlMessageSend = new TlMessageSend();
		tlMessageSend.setMessageid(tlMessage.getId());
		tlMessageSendDao.deleteByMsgId(tlMessageSend);
	}

	public TlMessage getRecorderList(TlMessage tlMessage) {
		TlMessageSend tlMessageSend=new TlMessageSend();
		tlMessageSend.setMessageid(tlMessage.getId());
		List<TlMessageSend> tlMessageSendList=tlMessageSendDao.findList(tlMessageSend);
		tlMessage.setMessageSendList(tlMessageSendList);
		return tlMessage;
	}
	
}
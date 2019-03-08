/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.front.frontUtils.MessageData;
import com.thinkgem.jeesite.modules.taier.entity.LeaveWord;
import com.thinkgem.jeesite.modules.taier.service.LeaveWordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 留言Controller
 * @author xuyongqiang
 * @version 2018-08-21
 */
@Controller
@RequestMapping(value = "/taier/leaveWord")
public class LeaveWordFrontController extends BaseController {

	@Autowired
	private LeaveWordService leaveWordService;

	@RequestMapping(value = "saveLeaveWord")
	@ResponseBody
	public MessageData saveLeaveWord(LeaveWord leaveWord) {
		leaveWordService.save(leaveWord);
		return MessageData.success().addMsg("msg", "添加留言成功！");
	}
	

}
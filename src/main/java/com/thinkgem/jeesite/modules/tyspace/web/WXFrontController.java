package com.thinkgem.jeesite.modules.tyspace.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.front.frontUtils.MessageData;
import com.thinkgem.jeesite.modules.tyspace.entity.WX;
import com.thinkgem.jeesite.modules.tyspace.service.WXService;
/**
 * 
* Title: WXFrontController.java  
* Description:卫星查询
* Copyright: Copyright (c) 2019
* Company: 北京中锐识华信息科技有限公司
* @author Yuyanan  
* @date 2019年2月28日  
* @version 1.0
 */
@Controller
@RequestMapping(value = "/TYSpace/wx")
public class WXFrontController extends BaseController{
	
	@Autowired
	private WXService wxService;
	
	@RequestMapping(value="getWxmcAll")
	@ResponseBody
	public MessageData getWxmcAll(HttpServletRequest request, HttpServletResponse response) {
		List<WX> wxList=wxService.getWXmcAll();
		
		return MessageData.success().addMsg("wxList", wxList);
	}
}

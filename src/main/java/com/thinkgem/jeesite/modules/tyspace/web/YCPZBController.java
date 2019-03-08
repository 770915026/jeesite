package com.thinkgem.jeesite.modules.tyspace.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.front.frontUtils.MessageData;
import com.thinkgem.jeesite.modules.tyspace.entity.YCPZB;
import com.thinkgem.jeesite.modules.tyspace.entity.ZT;
import com.thinkgem.jeesite.modules.tyspace.service.YCPZBService;
import com.thinkgem.jeesite.modules.tyspace.service.ZTService;

@Controller
@RequestMapping(value="/TYSpace/ycpzb")
public class YCPZBController extends BaseController{
	
	@Autowired
	private YCPZBService ycpzbService;
	
	@Autowired
	private ZTService ztService;
	
	@RequestMapping(value="getTableName")
	@ResponseBody
	public MessageData getTableName(HttpServletRequest request, HttpServletResponse response){
		List<YCPZB> list = ycpzbService.getTableName();
		return MessageData.success().addMsg("ycpzblist", list);
	}
	
	@RequestMapping(value="getYcData")
	@ResponseBody
	public MessageData getYcData(@RequestParam String tableName,HttpServletRequest request,HttpServletResponse response){
		List<YCPZB> list_ycpzb = getField(tableName);
		String queryField = "";
		for(int i=0;i<list_ycpzb.size();i++){
			YCPZB ycpzb = list_ycpzb.get(i);
			if(i==0){
				queryField = ycpzb.getFielden();
			}else{
				queryField += ","+ycpzb.getFielden();
			}
		}
		List<ZT> list = ztService.getDynamicQuery(tableName,queryField);
		return MessageData.success().addMsg("ztlist", list).addMsg("pzlist", list_ycpzb);
	}
	
	@RequestMapping(value="getField")
	@ResponseBody
	public List<YCPZB> getField(@RequestParam String tableName){
		return ycpzbService.getField(tableName);
	}
	
	@RequestMapping(value="getWd")
	@ResponseBody
	public MessageData getWd(HttpServletRequest request,HttpServletResponse response){
		List<ZT> list = ztService.getWd();
		return MessageData.success().addMsg("ztlist", list);
	}
	
	@RequestMapping(value="getVoltage")
	@ResponseBody
	public MessageData getVoltage(HttpServletRequest request,HttpServletResponse response){
		List<ZT> list = ztService.getVoltage();
		return MessageData.success().addMsg("ztlist", list);
	}
	
	@RequestMapping(value="getCurrent")
	@ResponseBody
	public MessageData getCurrent(HttpServletRequest request,HttpServletResponse response){
		List<ZT> list = ztService.getCurrent();
		return MessageData.success().addMsg("ztlist", list);
	}
	
	
	@RequestMapping(value="getDydl")
	@ResponseBody
	public MessageData getDydl(HttpServletRequest request,HttpServletResponse response){
		List<ZT> list = ztService.getDydl();
		return MessageData.success().addMsg("ztlist", list);
	}
}

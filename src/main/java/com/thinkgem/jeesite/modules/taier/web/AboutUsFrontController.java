/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.front.frontUtils.MessageData;
import com.thinkgem.jeesite.modules.taier.entity.AboutUs;
import com.thinkgem.jeesite.modules.taier.service.AboutUsService;

/**
 * 关于我们Controller
 * @author xuyongqiang
 * @version 2018-08-21
 */
@Controller
@RequestMapping(value = "/taier/aboutUs")
public class AboutUsFrontController extends BaseController {

	@Autowired
	private AboutUsService aboutUsService;
	
	@ModelAttribute
	public AboutUs get(@RequestParam(required=false) String id) {
		AboutUs entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = aboutUsService.get(id);
		}
		if (entity == null){
			entity = new AboutUs();
		}
		return entity;
	}

	@RequestMapping(value ="getAboutUs")
	@ResponseBody
	public MessageData getAboutUs(){
		AboutUs aboutUs=aboutUsService.getLastAboutUs();
		if(aboutUs!=null){
			String situationContent=aboutUs.getSituationContent();
			String sitContentResult=StringUtils.getDelImg(situationContent);
			aboutUs.setSituationContent(sitContentResult);
		}

		return MessageData.success().addMsg("aboutUs", aboutUs);
	}

}
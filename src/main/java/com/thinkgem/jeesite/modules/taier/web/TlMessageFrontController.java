/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taier.entity.TlCompanyUnionInfo;
import com.thinkgem.jeesite.modules.taier.entity.TlMessage;
import com.thinkgem.jeesite.modules.taier.entity.TlMessageSend;
import com.thinkgem.jeesite.modules.taier.service.TlMessageSendService;
import com.thinkgem.jeesite.modules.taier.service.TlMessageService;
import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 消息Controller
 * @author gy
 * @version 2018-08-22
 */
@Controller
@RequestMapping(value = "/taier/tlMessage")
public class TlMessageFrontController extends BaseController {

	@Autowired
	private TlMessageService tlMessageService;

	@Autowired
	private TlMessageSendService tlMessageSendService;
	
	@ModelAttribute
	public TlMessage get(@RequestParam(required=false) String id) {
		TlMessage entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tlMessageService.get(id);
		}
		if (entity == null){
			entity = new TlMessage();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(TlMessage tlMessage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TlMessage> page = tlMessageService.findPage(new Page<TlMessage>(request, response), tlMessage); 
		model.addAttribute("page", page);
		return "taier/tlMessageList";
	}

	@RequestMapping(value = "form")
	public String form(TlMessage tlMessage, Model model) {
		model.addAttribute("tlMessage", tlMessage);
		return "taier/tlMessageForm";
	}

	@RequestMapping(value = "msgCompany")
	public String msgCompany(TlMessage tlMessage, Model model,HttpServletRequest request, HttpServletResponse response) {
		User user = UserUtils.getUser();
		TlMessageSend tlMessageSend = new TlMessageSend();
		tlMessageSend.setUser(user);
		Page<TlMessageSend> pager = new Page(request, response);
		pager.setPageSize(10);
		Page<TlMessageSend> page = tlMessageSendService.findPage(pager, tlMessageSend);
		List<TlMessageSend> list = page.getList();
		for(int i=0;i<list.size();i++){
			TlMessageSend tlMessageSend1 = list.get(i);
			tlMessageSend1.getTlMessage().setContent(StringEscapeUtils.unescapeHtml4((tlMessageSend1.getTlMessage().getContent())));
		}
		model.addAttribute("page", page);
		return "taier/msgCompany";
	}

	@RequestMapping(value = "detailCompany")
	public String detailCompany(TlMessage tlMessage, Model model) {
		tlMessage.setContent(StringEscapeUtils.unescapeHtml4(tlMessage.getContent()));
		model.addAttribute("tlMessage", tlMessage);
        return "taier/msgDetailCompany";
	}

    @RequestMapping(value = "detailUSer")
    public String detailUSer(TlMessage tlMessage, Model model) {
        tlMessage.setContent(StringEscapeUtils.unescapeHtml4(tlMessage.getContent()));
        model.addAttribute("tlMessage", tlMessage);
        return "taier/msgDetailUser";
    }

	@RequestMapping(value = "save")
	public String save(TlMessage tlMessage, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tlMessage)){
			return form(tlMessage, model);
		}
		tlMessageService.save(tlMessage,"");
		addMessage(redirectAttributes, "保存消息成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlMessage/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(TlMessage tlMessage, RedirectAttributes redirectAttributes) {
		tlMessageService.delete(tlMessage);
		addMessage(redirectAttributes, "删除消息成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlMessage/?repage";
	}

	public String deleteHtml(String str){
		String regEx_html = "<[^>]+>";
		Pattern p_html = Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE);
		Matcher m_html = p_html.matcher(str);
		str = m_html.replaceAll("");
		return str;
	}

	@RequestMapping(value = "/getList", method = RequestMethod.POST)
	@ResponseBody
	public Page<TlMessageSend> getList(String currentPage, HttpServletResponse response, HttpServletRequest request){
		User user = UserUtils.getUser();
		TlMessageSend tlMessageSend = new TlMessageSend();
		tlMessageSend.setUser(user);
		Page page = new Page<TlCompanyUnionInfo>();
		page.setPageNo(Integer.parseInt(currentPage));
		page.setPageSize(10);
		Page<TlMessageSend> pagelist = tlMessageSendService.findPage(page,tlMessageSend);
		return pagelist;
	}
}
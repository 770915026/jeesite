/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.front.frontUtils.MessageData;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taier.entity.Aqyqjlb;
import com.thinkgem.jeesite.modules.taier.entity.Emcgjyqjlb;
import com.thinkgem.jeesite.modules.taier.entity.TlCompanyInfo;
import com.thinkgem.jeesite.modules.taier.entity.TmcBbxx;
import com.thinkgem.jeesite.modules.taier.entity.TmcBbxz;
import com.thinkgem.jeesite.modules.taier.entity.TmcBgqrb;
import com.thinkgem.jeesite.modules.taier.entity.TmcBgqrzb;
import com.thinkgem.jeesite.modules.taier.entity.TmcDc;
import com.thinkgem.jeesite.modules.taier.entity.TmcDyspqcdq;
import com.thinkgem.jeesite.modules.taier.entity.TmcRwsqd;
import com.thinkgem.jeesite.modules.taier.entity.TmcSbjjb;
import com.thinkgem.jeesite.modules.taier.entity.TmcXxxx;
import com.thinkgem.jeesite.modules.taier.service.AqyqjlbService;
import com.thinkgem.jeesite.modules.taier.service.EmcgjyqjlbService;
import com.thinkgem.jeesite.modules.taier.service.TlCompanyInfoService;
import com.thinkgem.jeesite.modules.taier.service.TmcBbxxService;
import com.thinkgem.jeesite.modules.taier.service.TmcBbxzService;
import com.thinkgem.jeesite.modules.taier.service.TmcBgqrbService;
import com.thinkgem.jeesite.modules.taier.service.TmcBgqrzbService;
import com.thinkgem.jeesite.modules.taier.service.TmcDcService;
import com.thinkgem.jeesite.modules.taier.service.TmcDyspqcdqService;
import com.thinkgem.jeesite.modules.taier.service.TmcRwsqdService;
import com.thinkgem.jeesite.modules.taier.service.TmcSbjjbService;
import com.thinkgem.jeesite.modules.taier.service.TmcXxxxService;
import com.thinkgem.jeesite.modules.tmc.modal.AqyqjlbModal;
import com.thinkgem.jeesite.modules.tmc.modal.EmcgjyqjlbModal;
import com.thinkgem.jeesite.modules.tmc.modal.TmcBbxxModal;
import com.thinkgem.jeesite.modules.tmc.modal.TmcBbxzModal;
import com.thinkgem.jeesite.modules.tmc.modal.TmcBgqrbModal;
import com.thinkgem.jeesite.modules.tmc.modal.TmcBgqrzbModal;
import com.thinkgem.jeesite.modules.tmc.modal.TmcDcModal;
import com.thinkgem.jeesite.modules.tmc.modal.TmcDyspqcdqModal;
import com.thinkgem.jeesite.modules.tmc.modal.TmcRwsqdModal;
import com.thinkgem.jeesite.modules.tmc.modal.TmcSbjjbModal;
import com.thinkgem.jeesite.modules.tmc.modal.TmcXxxxModal;

/**
 * 进网任务申请表Controller
 * @author gy
 * @version 2018-10-31
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/tmcRwsqd")
public class TmcRwsqdController extends BaseController {

	@Autowired
	private TmcRwsqdService tmcRwsqdService;

	@Autowired
	private TmcSbjjbService tmcSbjjbService;

	@Autowired
	private TmcBbxzService tmcBbxzService;

	@Autowired
	private TmcDcService tmcDcService;

	@Autowired
	private TmcDyspqcdqService tmcDyspqcdqService;

	@Autowired
	private TmcBbxxService tmcBbxxService;

	@Autowired
	private TmcXxxxService tmcXxxxService;

	@Autowired
	private EmcgjyqjlbService emcgjyqjlbService;

	@Autowired
	private AqyqjlbService aqyqjlbService;

	@Autowired
	private TmcBgqrbService tmcBgqrbService;

	@Autowired
	private TmcBgqrzbService tmcBgqrzbService;
	
	@Autowired
	private TlCompanyInfoService tlCompanyInfoService;

	@ModelAttribute
	public TmcRwsqd get(@RequestParam(required=false) String id) {
		TmcRwsqd entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tmcRwsqdService.get(id);
		}
		if (entity == null){
			entity = new TmcRwsqd();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(TmcRwsqd tmcRwsqd, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TmcRwsqd> page = tmcRwsqdService.findPage(new Page<TmcRwsqd>(request, response), tmcRwsqd); 
		model.addAttribute("page", page);
		return "modules/taier/tmcRwsqdList";
	}
	@RequestMapping(value = "tmcRwsqdList")
	@ResponseBody
	public Page<TmcRwsqd> tmcRwsqdList(TmcRwsqd tmcRwsqd, HttpServletRequest request, HttpServletResponse response, Model model) {
		tmcRwsqd.setCreateUserId(UserUtils.getUser().getId());
		Page<TmcRwsqd> pageList = tmcRwsqdService.findPage(new Page<TmcRwsqd>(request, response), tmcRwsqd); 
		return pageList;
	}
	
	@RequestMapping(value = "form")
	public String form(TmcRwsqd tmcRwsqd, Model model) {
		model.addAttribute("tmcRwsqd", tmcRwsqd);
		return "modules/taier/tmcRwsqdForm";
	}
	//进网保存
	@RequestMapping(value = "save")
	public String save(TmcRwsqd tmcRwsqd, Model model, RedirectAttributes redirectAttributes) throws SQLException {
		User user=UserUtils.getUser();
		if(tmcRwsqd.getPk1() !=null && !"".equals(tmcRwsqd.getPk1())){
			
			tmcRwsqdService.updateTmcRwsqd(tmcRwsqd);
		}else{
			
			tmcRwsqd.setCreateUserId(user.getId());
			tmcRwsqdService.saveTmcRwsqd(tmcRwsqd);
		}
		addMessage(redirectAttributes, "保存任务申请表成功");
		redirectAttributes.addFlashAttribute("tmcRwsqd", tmcRwsqd);
		if("2".equals(tmcRwsqd.getType())) {
			return "redirect:"+Global.getAdminPath()+"/taier/theNet/gotoCCC";
		} else {
			return "redirect:"+Global.getAdminPath()+"/taier/theNet/gotoTheNet";
		}
	}
	
	@RequestMapping(value = "delete")
	public String delete(TmcRwsqd tmcRwsqd, RedirectAttributes redirectAttributes) {
		tmcRwsqdService.delete(tmcRwsqd);
		addMessage(redirectAttributes, "删除任务申请表成功");
		return "redirect:/taier/enterNet/?repage";
	}
	
	@RequestMapping(value = "delTmcRwsqd")
	@ResponseBody
	public MessageData delTmcRwsqd(TmcRwsqd tmcRwsqd, RedirectAttributes redirectAttributes) {
		tmcRwsqdService.delTmcRwsqd(tmcRwsqd);
		return MessageData.success().addMsg("msg", "删除成功");
	}
	
	@RequestMapping(value = "viewEnterNet")
	public String viewEnterNet(TmcRwsqd tmcRwsqd, Model model) {
		User user = UserUtils.getUser();
		TlCompanyInfo tlCompanyInfo=new TlCompanyInfo();
		if(user != null) {
			String userId = user.getId();
			tlCompanyInfo = tlCompanyInfoService.findByUserId(userId);
		}
		model.addAttribute("tlCompanyInfo", tlCompanyInfo);
		
		String pk1=tmcRwsqd.getPk1();
		String bh=tmcRwsqd.getBh();
		tmcRwsqd=tmcRwsqdService.get(pk1);
		TmcSbjjb tmcSbjjb = tmcSbjjbService.getSbjjByBh(bh);
		tmcRwsqd.setTmcSbjjb(tmcSbjjb);
		
		List<TmcBbxz> tmcBbxzList = tmcBbxzService.getBbxzListByPk1(pk1);
		tmcRwsqd.setTmcBbxzList(tmcBbxzList);
		model.addAttribute("tmcRwsqd", tmcRwsqd);
		
		return "/taier/viewEnterNet";
	}
	
	@RequestMapping(value = "viewCCC")
	public String viewCCC(TmcRwsqd tmcRwsqd, Model model) {
		User user = UserUtils.getUser();
		TlCompanyInfo tlCompanyInfo=new TlCompanyInfo();
		if(user != null) {
			String userId = user.getId();
			tlCompanyInfo = tlCompanyInfoService.findByUserId(userId);
		}
		model.addAttribute("tlCompanyInfo", tlCompanyInfo);
		
		String pk1=tmcRwsqd.getPk1();
		String bh=tmcRwsqd.getBh();
		tmcRwsqd=tmcRwsqdService.get(pk1);
		
		TmcSbjjb tmcSbjjb = tmcSbjjbService.getSbjjByBh(bh);
		tmcRwsqd.setTmcSbjjb(tmcSbjjb);
		
		List<TmcBbxz> tmcBbxzList = tmcBbxzService.getBbxzListByPk1(pk1);
		tmcRwsqd.setTmcBbxzList(tmcBbxzList);
		
		TmcDc tmcDc = tmcDcService.getDcByPk1(pk1);
		tmcRwsqd.setTmcDc(tmcDc);
		
		//电源适配器
		TmcDyspqcdq tmcDyspqcdq = tmcDyspqcdqService.getTmcDyspqcdqBypk1(pk1);
		tmcRwsqd.setTmcDyspqcdq(tmcDyspqcdq);
		
		//版本信息
		TmcBbxx bbxx = tmcBbxxService.getTmcBbxxByPk1(pk1);
		tmcRwsqd.setTmcBbxx(bbxx);
		
		//详细信息
		TmcXxxx tmcXxxx = tmcXxxxService.getTmcXxxxBypk1(pk1);
		tmcRwsqd.setTmcXxxx(tmcXxxx);
		
		
		List<Emcgjyqjlb> emcgjyqjlbList= emcgjyqjlbService.getEmcgjyqjlbListByPk1(pk1);
		tmcRwsqd.setEmcgjyqjlbList(emcgjyqjlbList);
		
		List<Aqyqjlb> aqyqjlbList = aqyqjlbService.getAqyqjlbListByPk1(pk1);
		tmcRwsqd.setAqyqjlbList(aqyqjlbList);
		
		TmcBgqrb tmcBgqrb=tmcBgqrbService.getTmcBgqrbByPk1(pk1);
		tmcRwsqd.setTmcBgqrb(tmcBgqrb);
		
		List<TmcBgqrzb> tmcBgqrzbList = tmcBgqrzbService.getTmcBgqrzbListBypk1(pk1);
		tmcRwsqd.setTmcBgqrzbList(tmcBgqrzbList);
		
		model.addAttribute("tmcRwsqd", tmcRwsqd);
		return "/taier/viewCcc";
	}
	
	@RequestMapping(value = "updateStatus")
	public String updateStatus(TmcRwsqd tmcRwsqd) throws SQLException {
		
		tmcRwsqd=tmcRwsqdService.get(tmcRwsqd.getPk1());
		String pk1=tmcRwsqd.getPk1();
		String bh=tmcRwsqd.getBh();
		String type=tmcRwsqd.getType();
		tmcRwsqd.setZt("001");
		TmcSbjjb tmcSbjjb = tmcSbjjbService.getSbjjByBh(bh);
		tmcRwsqd.setTmcSbjjb(tmcSbjjb);
		List<TmcBbxz> tmcBbxzList = tmcBbxzService.getBbxzListByPk1(pk1);
		tmcRwsqd.setTmcBbxzList(tmcBbxzList);
		
		if("2".equals(type)){
			TmcDc tmcDc = tmcDcService.getDcByPk1(pk1);
			tmcRwsqd.setTmcDc(tmcDc);
			
			//电源适配器
			TmcDyspqcdq tmcDyspqcdq = tmcDyspqcdqService.getTmcDyspqcdqBypk1(pk1);
			tmcRwsqd.setTmcDyspqcdq(tmcDyspqcdq);
			
			//版本信息
			TmcBbxx bbxx = tmcBbxxService.getTmcBbxxByPk1(pk1);
			tmcRwsqd.setTmcBbxx(bbxx);
			
			//详细信息
			TmcXxxx tmcXxxx = tmcXxxxService.getTmcXxxxBypk1(pk1);
			tmcRwsqd.setTmcXxxx(tmcXxxx);
			
			
			List<Emcgjyqjlb> emcgjyqjlbList= emcgjyqjlbService.getEmcgjyqjlbListByPk1(pk1);
			tmcRwsqd.setEmcgjyqjlbList(emcgjyqjlbList);
			
			List<Aqyqjlb> aqyqjlbList = aqyqjlbService.getAqyqjlbListByPk1(pk1);
			tmcRwsqd.setAqyqjlbList(aqyqjlbList);
			
			TmcBgqrb tmcBgqrb=tmcBgqrbService.getTmcBgqrbByPk1(pk1);
			tmcRwsqd.setTmcBgqrb(tmcBgqrb);
			
			List<TmcBgqrzb> tmcBgqrzbList = tmcBgqrzbService.getTmcBgqrzbListBypk1(pk1);
			tmcRwsqd.setTmcBgqrzbList(tmcBgqrzbList);
		}
		tmcRwsqdService.updateStatus(tmcRwsqd);
		
		if("2".equals(type)) {
			return "redirect:"+Global.getAdminPath()+"/taier/theNet/gotoCCCList";
		} else {
			return "redirect:"+Global.getAdminPath()+"/taier/theNet/gotoTheNetList";
		}
	}
	

}
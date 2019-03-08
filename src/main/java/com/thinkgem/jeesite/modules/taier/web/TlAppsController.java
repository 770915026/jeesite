/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taier.entity.TlApps;
import com.thinkgem.jeesite.modules.taier.service.TlAppsService;

/**
 * appController
 * @author gy
 * @version 2018-08-30
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/tlApps")
public class TlAppsController extends BaseController {

	@Autowired
	private TlAppsService tlAppsService;
	
	@ModelAttribute
	public TlApps get(@RequestParam(required=false) String id) {
		TlApps entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tlAppsService.get(id);
		}
		if (entity == null){
			entity = new TlApps();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(TlApps tlApps, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TlApps> page = tlAppsService.findPage(new Page<TlApps>(request, response), tlApps); 
		model.addAttribute("page", page);
		return "taier/tlAppsList";
	}

	@RequestMapping(value = "form")
	public String form(TlApps tlApps, Model model) {
		model.addAttribute("tlApps", tlApps);
		return "taier/tlAppsForm";
	}

	@RequestMapping(value = "save")
	public String save(TlApps tlApps, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tlApps)){
			return form(tlApps, model);
		}
		User user=UserUtils.getUser();
		tlApps.setCreateUserId(user.getId());
		tlAppsService.save(tlApps);
		addMessage(redirectAttributes, "保存app成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlApps/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(TlApps tlApps, RedirectAttributes redirectAttributes) {
		tlAppsService.delete(tlApps);
		addMessage(redirectAttributes, "删除app成功");
		return "redirect:"+Global.getAdminPath()+"/taier/tlApps/?repage";
	}
	/**
	 * 导入
	 * @param file
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "import", method=RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + adminPath + "/sys/user/list?repage";
		}
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 0, 0);
			List<TlApps> list = ei.getDataList(TlApps.class);
			for (TlApps app : list){
				try{

					if (checkExisApp(app)){
						failureMsg.append("<br/>登录名 "+app.getName()+" 已存在; ");
						failureNum++;

					}else{
						BeanValidators.validateWithException(validator, app);
						tlAppsService.save(app);
						successNum++;
					}
				}catch(ConstraintViolationException ex){
					failureMsg.append("<br/>登录名 "+app.getName()+" 导入失败：");
					List<String> messageList = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
					for (String message : messageList){
						failureMsg.append(message+"; ");
						failureNum++;
					}
				}catch (Exception ex) {
					failureMsg.append("<br/>登录名 "+app.getName()+" 导入失败："+ex.getMessage());
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条用户，导入信息如下：");
			}
			addMessage(redirectAttributes, "已成功导入 "+successNum+" 条用户"+failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入用户失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/taier/tlApps/?repage";
    }
	
	private Boolean checkExisApp(TlApps app){
		TlApps searchApp=tlAppsService.getAppsByCondition(app);
		if(searchApp!=null){
			return true;
		}else{
			return false;
		}
		
	}

}
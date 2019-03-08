/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolationException;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.servlet.ValidateCodeServlet;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.front.frontUtils.MessageData;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taier.entity.Activity;
import com.thinkgem.jeesite.modules.taier.entity.Collect;
import com.thinkgem.jeesite.modules.taier.entity.ModelInfo;
import com.thinkgem.jeesite.modules.taier.entity.News;
import com.thinkgem.jeesite.modules.taier.service.ActivityService;
import com.thinkgem.jeesite.modules.taier.service.CollectService;
import com.thinkgem.jeesite.modules.taier.service.TlCompanyInfoService;

/**
 * 用户基本信息Controller
 * @author gy
 * @version 2018-08-20
 */
@Controller
@RequestMapping(value = "${adminPath}/taier/user")
public class TlUserController extends BaseController {

	@Autowired
	private SystemService systemService;

	@Autowired
	private TlCompanyInfoService tlCompanyInfoService;

    @Autowired
    private CollectService collectService;

    @Autowired
    private ActivityService activityService;


	@RequestMapping(value = "modifyPasswordC")
	public String modifyPasswordC(HttpServletRequest request, HttpServletResponse response, Model model) {
		String phone = "";
		User user = UserUtils.getUser();
		if(user != null && StringUtils.isNotEmpty(user.getId())) {
			phone = user.getPhone();
		}
		model.addAttribute("phone",phone);
		return "taier/modeifyPasswordCompany";
	}

	@RequestMapping(value = "checkCode")
	public @ResponseBody MessageData checkCode(@RequestBody ModelInfo modelInfo, HttpServletRequest request, HttpSession httpSession) {
		//图形验证码
		String code = modelInfo.getCode();
		//短信验证码
		String code1 = modelInfo.getCode1();
		String sessioncode = (String)httpSession.getAttribute(ValidateCodeServlet.MPW_CODE);
		String sessioncode1 = (String)httpSession.getAttribute("modifyPasswordSms");

		if(StringUtils.isNotEmpty(code) && StringUtils.isNotEmpty(sessioncode) && code.toLowerCase().equals(sessioncode.toLowerCase())){
			if(StringUtils.isNotEmpty(code1) && StringUtils.isNotEmpty(sessioncode1) && code1.toLowerCase().equals(sessioncode1.toLowerCase())){
				httpSession.removeAttribute("modifyPasswordSms");
				return MessageData.success();
			}else {
				return MessageData.failed().addMsg("msg","短信验证码错误");
			}
		} else {
			return MessageData.failed().addMsg("msg","图形验证码错误");
		}
	}



	@RequestMapping(value = "modeifyPwd")
	public @ResponseBody MessageData modeifyPwd(@RequestBody ModelInfo modelInfo, HttpServletRequest request, HttpSession httpSession) {
		User user = UserUtils.getUser();
		systemService.updatePasswordById(user.getId(), user.getLoginName(), modelInfo.getPassword());
		return MessageData.success();
	}


	//企业端同意协议
	@RequestMapping(value = "releaseCompany")
	public String releaseCompany(HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		user.setRelease("1");
		systemService.updateUserInfo(user);
		return "taier/tlCompanyInfoView";
	}

    //    上传文件
    @ResponseBody
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public void uploadFile(@RequestParam(value = "fileinfo", required = false) MultipartFile file, HttpServletRequest request, HttpServletResponse response) {
        Map<String,Object> mapresponse=new HashMap<String,Object>();
	    //上传文件的路径
        String path = getFileInfo(request, response, file);
        mapresponse.put("path", path);
        JsonMapper.writeJsonForDes(mapresponse, response);
    }

    //MultipartFile上传文件
    public static String getFileInfo(HttpServletRequest request, HttpServletResponse response, MultipartFile file) {
        Calendar cal = Calendar.getInstance();
        String p = "upload/" + UUID.randomUUID();
        Map<String,Object> mapresponse=new HashMap<String,Object>();
        String path = request.getSession().getServletContext().getRealPath(p);
        List<String> filepaths = new ArrayList<String>();
        String fileName = file.getOriginalFilename();
        File targetFile = new File(path, fileName);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return request.getContextPath() + "/" + p + "/" + fileName;
    }
    
	@RequestMapping(value = {"list"})
	public String list(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
		String userType = user.getUserType();
		if(StringUtils.isEmpty(userType)) {
		    user.setUserType("3");
        }
		
	    Page<User> page = systemService.findUser(new Page<User>(request, response), user);
	    model.addAttribute("userType", user.getUserType());
		model.addAttribute("page", page);
		return "taier/tlUserList";
	}
	@RequestMapping(value = "form")
	public String form(User user, Model model) {
		user=systemService.getUser(user.getId());
		if(user==null){
			user=new User();
		}
		model.addAttribute("user", user);
		model.addAttribute("allRoles", systemService.findAllRole());
		return "taier/tlUserForm";
	}
	/**
	 * 验证登录名是否有效
	 * @param oldLoginName
	 * @param loginName
	 * @return
	 */
	@ResponseBody
	@RequiresPermissions("sys:user:edit")
	@RequestMapping(value = "checkLoginName")
	public String checkLoginName(String oldLoginName, String loginName) {
		if (loginName !=null && loginName.equals(oldLoginName)) {
			return "true";
		} else if (loginName !=null && systemService.getUserByLoginName(loginName) == null) {
			return "true";
		}
		return "false";
	}
	
	@RequestMapping(value = "save")
	public String save(User user, Model model, RedirectAttributes redirectAttributes) {
		if (StringUtils.isNotBlank(user.getNewPassword())) {
			user.setPassword(SystemService.entryptPassword(user.getNewPassword()));
		}
		user.setLoginName(user.getName());
		if (!"true".equals(checkLoginName(user.getOldLoginName(), user.getLoginName()))){
			addMessage(model, "保存用户'" + user.getLoginName() + "'失败，登录名已存在");
			return form(user, model);
		}
		if (!beanValidator(model, user)){
			return form(user, model);
		}
		
		// 角色数据有效性验证，过滤不在授权内的角色
		List<Role> roleList = Lists.newArrayList();
		List<String> roleIdList = user.getRoleIdList();
		for (Role r : systemService.findAllRole()){
			if (roleIdList.contains(r.getId())){
				roleList.add(r);
			}
		}
		user.setRoleList(roleList);
		systemService.saveUser(user);
		addMessage(redirectAttributes, "保存用户成功");
		// 清除当前用户缓存
		if (user.getLoginName().equals(UserUtils.getUser().getLoginName())){
			UserUtils.clearCache();
			//UserUtils.getCacheMap().clear();
		}
		return "redirect:"+Global.getAdminPath()+"/taier/user/list?repage";
	}
	@RequestMapping(value = "delUser")
	public String delUser(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
		systemService.deleteUser(user);
		return "redirect:"+Global.getAdminPath()+"/taier/user/list?repage";
	}
	@RequestMapping(value = "changefbqx")
	public String changefbqx(User user, Model model) {
		if(StringUtils.isNotEmpty(user.getId())) {
			user = UserUtils.get(user.getId());
			String flag = user.getFlag();
			if("0".equals(flag)) {
				user.setFlag("1");
			} else {
				user.setFlag("0");
			}
		}
		systemService.updateUserInfo(user);
		return "redirect:"+Global.getAdminPath()+"/taier/user/list?repage";
	}

    @RequestMapping(value = {"userinfoyh"})
    public String userinfoyh(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        return "taier/userInfo";
    }

    @RequestMapping(value = {"userinfoyhPwd"})
    public String userinfoyhPwd(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        String phone = "";
        user = UserUtils.getUser();
        if(user != null && StringUtils.isNotEmpty(user.getId())) {
            phone = user.getPhone();
        }
        model.addAttribute("phone",phone);
        return "taier/userinfoyhPwd";
    }

    @RequestMapping(value = {"userinfoyhMsg"})
    public String userinfoyhMsg(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        String phone = "";
        user = UserUtils.getUser();
        if(user != null && StringUtils.isNotEmpty(user.getId())) {
            phone = user.getPhone();
        }
        model.addAttribute("phone",phone);
        return "taier/msgUser";
    }

    @RequestMapping(value = {"myCollectUSer"})
    public String myCollectUSer(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        return "taier/myCollectUser";
    }

    @RequestMapping(value = {"myCollectUSerDel"})
    public String myCollectUSerDel(ModelInfo modelInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
        String id = modelInfo.getId();
        Collect collect = new Collect();
        User user = UserUtils.getUser();
        collect.setUser(user);
        Activity activity = activityService.get(id);
        collect.setActivity(activity);
        collect = collectService.getByUserAndActivity(collect);

        collectService.delete(collect);
        return "taier/myCollectUser";
    }

    @RequestMapping(value = {"ywbl"})
    public String ywbl(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        return "taier/TMC_RWSQD_TAG";
    }
    
    /**
	 * 导入用户数据
	 * @param file
	 * @param redirectAttributes
	 * @return
	 */
    @RequestMapping(value = "import", method=RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + adminPath + "/taier/user/list?repage";
		}
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 0, 0);
			List<User> list = ei.getDataList(User.class);
			for (User user : list){
				try{
					String name=user.getName().trim();
					user.setLoginName(name);
					if ("true".equals(checkLoginName("", user.getLoginName()))){
						
						Office company = new Office();
				        company.setId("1");
				        user.setCompany(company);
				        user.setUserType("4");
						user.setPassword(SystemService.entryptPassword(name));
						BeanValidators.validateWithException(validator, user);
						systemService.saveImportUser(user);
						successNum++;
					}else{
						failureMsg.append("<br/>登录名 "+user.getLoginName()+" 已存在; ");
						failureNum++;
					}
				}catch(ConstraintViolationException ex){
					failureMsg.append("<br/>登录名 "+user.getLoginName()+" 导入失败：");
					List<String> messageList = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
					for (String message : messageList){
						failureMsg.append(message+"; ");
						failureNum++;
					}
				}catch (Exception ex) {
					failureMsg.append("<br/>登录名 "+user.getLoginName()+" 导入失败："+ex.getMessage());
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条用户，导入信息如下：");
			}
			addMessage(redirectAttributes, "已成功导入 "+successNum+" 条用户"+failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入用户失败！失败信息："+e.getMessage());
		}
		return "redirect:" + adminPath + "/taier/user/list?repage";
    }

}
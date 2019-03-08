/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.taier.entity.*;
import com.thinkgem.jeesite.modules.taier.service.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.front.frontUtils.MessageData;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 活动Controller
 * @author xuyongqiang
 * @version 2018-08-25
 */
@Controller
@RequestMapping(value = "/taier/activityFront")
public class ActivityFrontController extends BaseController {

	@Autowired
	private ActivityService activityService;

	@Autowired
	private CollectService collectService;

	@Autowired
	private LikeService likeService;

	@Autowired
	private TlActivityImgService tlActivityImgService;

	@Autowired
	private VideoLinkService videoLinkService;
    @Autowired
    private TlLinkService tlLinkService;
	@RequestMapping(value ="gotoActivity")
	public String getActivityList(Activity activity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Activity> page = activityService.getActivityList(new Page<Activity>(request, response), activity); 
		model.addAttribute("page", page);

		List<TlActivityImg> imgs = tlActivityImgService.findList(new TlActivityImg());
		model.addAttribute("imgs", imgs);
		
		List<VideoLink> videoLinkList=videoLinkService.findList(new VideoLink());
		model.addAttribute("videoLinkList", videoLinkList);
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        model.addAttribute("linkList", linkList);

		return "taier/latestActivity";
	}
	@RequestMapping(value = "addActClickNum")
	@ResponseBody
	public MessageData addActClickNum(HttpServletRequest request) {
		String id=request.getParameter("id");
		activityService.addActClickNum(id);
		return MessageData.success();
	}
	@RequestMapping(value ="gotoLatestActivityDetail")
	public String gotoActivityDetail( HttpServletRequest request, HttpServletResponse response, Model model) {
		String id=request.getParameter("id");
		User currUSer = UserUtils.getUser();
		Activity activity = activityService.getActivityById(id); 
		model.addAttribute("activity", activity);

		String ifcollect = "0";
		String iflike = "0";
		if(currUSer != null) {
			Collect collect = new Collect();
			collect.setUser(currUSer);
			collect.setActivity(activity);
			Collect collect1 = collectService.getByUserAndActivity(collect);
			if (collect1 != null && StringUtils.isNotEmpty(collect1.getId())) {
				ifcollect = "1";
			}

			Like like = new Like();
			like.setUser(currUSer);
			like.setActivityId(activity.getId());
			List<Like> likelist = likeService.findByUserAndActivity(like);
			if(likelist != null && likelist.size() > 0) {
				iflike = "1";
			}
		}

		model.addAttribute("ifcollect",ifcollect);
		model.addAttribute("iflike",iflike);
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        model.addAttribute("linkList", linkList);
		return "taier/latestActivityDetail";
	}
	
	@RequestMapping(value = "getUnderwayActNum")
	@ResponseBody
	public MessageData getUnderwayActNum(HttpServletRequest request) {

		int underwayActNum=activityService.getUnderwayActNum();
		int joinNumOfPeople=activityService.getJoinNumOfPeople();
		
		return MessageData.success().addMsg("underwayActNum", underwayActNum).addMsg("joinNumOfPeople", joinNumOfPeople);
	}
	@RequestMapping(value = "getActivityPage")
	@ResponseBody
	public MessageData getActivityPage(Activity activity, HttpServletRequest request, HttpServletResponse response){
		Page<Activity> activityPage = activityService.getActivityList(new Page<Activity>(request, response), activity);
		return MessageData.success().addMsg("activityPage", activityPage);
				
	}

    @RequestMapping(value ="getActivityMorePage")
    public String getActivityMorePage(Activity activity, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<Activity> activityPage = activityService.getActivityList(new Page<Activity>(request, response), activity);
        return "taier/getActivityMorePage";

    }

	@RequestMapping(value ="getFirstActivity")
	@ResponseBody
	public MessageData getFirstActivity(Activity Activity,HttpServletRequest request, HttpServletResponse response){
		List<Activity> activityList=activityService.getFirstActivity(Activity);

		return MessageData.success().addMsg("activityList", activityList);

	}
}
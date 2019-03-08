/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.VideoLink;
import com.thinkgem.jeesite.modules.taier.dao.VideoLinkDao;

/**
 * 视频链接Service
 * @author xuyongqiang
 * @version 2018-11-06
 */
@Service
@Transactional(readOnly = true)
public class VideoLinkService extends CrudService<VideoLinkDao, VideoLink> {

	public VideoLink get(String id) {
		return super.get(id);
	}
	
	public List<VideoLink> findList(VideoLink videoLink) {
		return super.findList(videoLink);
	}
	
	public Page<VideoLink> findPage(Page<VideoLink> page, VideoLink videoLink) {
		return super.findPage(page, videoLink);
	}
	
	@Transactional(readOnly = false)
	public void save(VideoLink videoLink) {
		super.save(videoLink);
	}
	
	@Transactional(readOnly = false)
	public void delete(VideoLink videoLink) {
		super.delete(videoLink);
	}
	
}
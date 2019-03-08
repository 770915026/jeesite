package com.thinkgem.jeesite.modules.tyspace.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.tyspace.dao.ZTDao;
import com.thinkgem.jeesite.modules.tyspace.entity.ZT;
@Service
public class ZTService extends CrudService<ZTDao, ZT>{

	/**
	 * 根据传过来的表名和字段来查询（动态查询）
	 * @param entity
	 */
	public List<ZT> getDynamicQuery(String tableName,String queryField){
	    Map<String, String> map = new HashMap<>();
	    map.put("tableName", tableName);
	    map.put("queryField", queryField);
	    return (List<ZT>) dao.getDynamicQuery(map);

	}
	/**
	 * 
	 * Description:查询温度表6个温度的数据
	 * @date 2019年3月3日
	 */
	public List<ZT> getWd(){
		List<ZT> list = dao.getWd();
		return list;
	}
	/**
	 * 
	 * Description:查询状态表3个电流的数据
	 * @date 2019年3月3日
	 */
	public List<ZT> getCurrent(){
		List<ZT> list = dao.getCurrent();
		return list;
	}

	/**
	 * 
	 * Description:查询状态表3个电压
	 * @date 2019年3月3日
	 */
	public List<ZT> getVoltage(){
		List<ZT> list = dao.getVoltage();
		return list;
	}
	/**
	 * 
	 * Description:查询电压电流
	 * @date 2019年3月3日
	 */
	public List<ZT> getDydl(){
		List<ZT> list = dao.getDydl();
		return list;
	}
	
}

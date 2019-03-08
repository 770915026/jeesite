/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import com.thinkgem.jeesite.modules.taier.entity.ModelInfo;
import com.thinkgem.jeesite.modules.taier.entity.TlApppreset;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.TlCompanyUnionInfo;
import com.thinkgem.jeesite.modules.taier.dao.TlCompanyUnionInfoDao;

/**
 * 企业联合信息Service
 * @author gy
 * @version 2018-08-27
 */
@Service
@Transactional(readOnly = true)
public class TlCompanyUnionInfoService extends CrudService<TlCompanyUnionInfoDao, TlCompanyUnionInfo> {

	public TlCompanyUnionInfo get(String id) {
		return super.get(id);
	}
	
	public List<TlCompanyUnionInfo> findList(TlCompanyUnionInfo tlCompanyUnionInfo) {
		return super.findList(tlCompanyUnionInfo);
	}
	
	public Page<TlCompanyUnionInfo> findPage(Page<TlCompanyUnionInfo> page, TlCompanyUnionInfo tlCompanyUnionInfo) {
		return super.findPage(page, tlCompanyUnionInfo);
	}
	
	@Transactional(readOnly = false)
	public void save(TlCompanyUnionInfo tlCompanyUnionInfo) {
		super.save(tlCompanyUnionInfo);
	}
	
	@Transactional(readOnly = false)
	public void delete(TlCompanyUnionInfo tlCompanyUnionInfo) {
		super.delete(tlCompanyUnionInfo);
	}

	public List<TlCompanyUnionInfo> findListForAppPreSetAdd() {
		return dao.findListForAppPreSetAdd();
	}

	public Page<TlCompanyUnionInfo> userunioninfoqry(Page<TlCompanyUnionInfo> page , TlCompanyUnionInfo tlCompanyUnionInfo){
		page.setPageNo(tlCompanyUnionInfo.getModelInfo().getPageNo());
        page.setPageSize(tlCompanyUnionInfo.getModelInfo().getPageSize());
		tlCompanyUnionInfo.setPage(page);
		page.setList(dao.userunioninfoqry(tlCompanyUnionInfo));
		return page;
	}

	public int getUncheckCompanyUnionInfoNum() {
		return dao.getUncheckCompanyUnionInfoNum();
	}

	public void batchDel(String[] ids) {
		dao.batchDel(ids);
		
	}
}
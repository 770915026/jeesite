/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.util.List;

import com.thinkgem.jeesite.modules.taier.entity.ModelInfo;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taier.entity.TlApppreset;
import com.thinkgem.jeesite.modules.taier.dao.TlApppresetDao;

/**
 * 手机预置应用公示Service
 * @author gy
 * @version 2018-08-30
 */
@Service
@Transactional(readOnly = true)
public class TlApppresetService extends CrudService<TlApppresetDao, TlApppreset> {

	public TlApppreset get(String id) {
		return super.get(id);
	}
	
	public List<TlApppreset> findList(TlApppreset tlApppreset) {
		return super.findList(tlApppreset);
	}
	
	public Page<TlApppreset> findPage(Page<TlApppreset> page, TlApppreset tlApppreset) {
		return super.findPage(page, tlApppreset);
	}
	
	@Transactional(readOnly = false)
	public void save(TlApppreset tlApppreset) {
		super.save(tlApppreset);
	}
	
	@Transactional(readOnly = false)
	public void delete(TlApppreset tlApppreset) {
		super.delete(tlApppreset);
	}

    public Page<TlApppreset> userpresetqry(Page<TlApppreset> page , TlApppreset tlApppreset){
			tlApppreset.setPage(page);
			page.setPageNo(tlApppreset.getModelInfo().getPageNo());
            page.setList(dao.userpresetqry(tlApppreset));
            return page;
    }

	public int getUncheckApppresetNum() {
		return dao.getUncheckApppresetNum();
	}
	
}
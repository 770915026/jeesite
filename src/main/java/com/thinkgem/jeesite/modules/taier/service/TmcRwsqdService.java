/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.service;

import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.taier.dao.AqyqjlbDao;
import com.thinkgem.jeesite.modules.taier.dao.EmcgjyqjlbDao;
import com.thinkgem.jeesite.modules.taier.dao.TmcBbxxDao;
import com.thinkgem.jeesite.modules.taier.dao.TmcBbxzDao;
import com.thinkgem.jeesite.modules.taier.dao.TmcBgqrbDao;
import com.thinkgem.jeesite.modules.taier.dao.TmcBgqrzbDao;
import com.thinkgem.jeesite.modules.taier.dao.TmcDcDao;
import com.thinkgem.jeesite.modules.taier.dao.TmcDyspqcdqDao;
import com.thinkgem.jeesite.modules.taier.dao.TmcRwsqdDao;
import com.thinkgem.jeesite.modules.taier.dao.TmcSbjjbDao;
import com.thinkgem.jeesite.modules.taier.dao.TmcXxxxDao;
import com.thinkgem.jeesite.modules.taier.entity.Aqyqjlb;
import com.thinkgem.jeesite.modules.taier.entity.Emcgjyqjlb;
import com.thinkgem.jeesite.modules.taier.entity.TmcBbxx;
import com.thinkgem.jeesite.modules.taier.entity.TmcBbxz;
import com.thinkgem.jeesite.modules.taier.entity.TmcBgqrb;
import com.thinkgem.jeesite.modules.taier.entity.TmcBgqrzb;
import com.thinkgem.jeesite.modules.taier.entity.TmcDc;
import com.thinkgem.jeesite.modules.taier.entity.TmcDyspqcdq;
import com.thinkgem.jeesite.modules.taier.entity.TmcRwsqd;
import com.thinkgem.jeesite.modules.taier.entity.TmcSbjjb;
import com.thinkgem.jeesite.modules.taier.entity.TmcXxxx;
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
 * 任务申请表Service
 * @author gy
 * @version 2018-10-31
 */
@Service
@Transactional(readOnly = true)
public class TmcRwsqdService extends CrudService<TmcRwsqdDao, TmcRwsqd> {
	
	@Autowired
	private TmcSbjjbDao tmcSbjjbDao;
	@Autowired
	private TmcBbxzDao tmcBbxzDao;
	
	@Autowired
	private TmcDcDao tmcDcDao;
	@Autowired
	private EmcgjyqjlbDao emcgjyqjlbDao;//关键元器件
	@Autowired
	private AqyqjlbDao aqyqjlbDao;//安全元器件
	@Autowired
	private TmcBgqrbDao tmcBgqrbDao;
	
	@Autowired
	private TmcDyspqcdqDao tmcDyspqcdqDao;
	@Autowired
	private TmcBbxxDao tmcBbxxDao;
	@Autowired
	private TmcXxxxDao tmcXxxxDao;
	@Autowired
	private TmcBgqrzbDao tmcBgqrzbDao;
	

	public TmcRwsqd get(String id) {
		return super.get(id);
	}
	
	public List<TmcRwsqd> findList(TmcRwsqd tmcRwsqd) {
		return super.findList(tmcRwsqd);
	}
	
	public Page<TmcRwsqd> findPage(Page<TmcRwsqd> page, TmcRwsqd tmcRwsqd) {
		return super.findPage(page, tmcRwsqd);
	}
	
	@Transactional(readOnly = false)
	public void save(TmcRwsqd tmcRwsqd) {
		super.save(tmcRwsqd);
	}
	
	@Transactional(readOnly = false)
	public void delete(TmcRwsqd tmcRwsqd) {
		super.delete(tmcRwsqd);
	}
	
	@Transactional(readOnly = false)
	public void delTmcRwsqd(TmcRwsqd tmcRwsqd) {
		
		dao.delete(tmcRwsqd);
		
		TmcSbjjb tmcSbjjb=new TmcSbjjb();
		tmcSbjjb.setGlbh(tmcRwsqd.getBh());
		tmcSbjjbDao.deleteByGlbh(tmcSbjjb);
		
		TmcBbxz tmcBbxz=new TmcBbxz();
		tmcBbxz.setGlpk1(tmcRwsqd.getPk1());
		tmcBbxzDao.deleteByGlpk1(tmcBbxz);
		
		TmcDc tmcDc=new TmcDc();
		tmcDc.setBh(tmcRwsqd.getPk1());
		tmcDcDao.deleteByBh(tmcDc);
		
		TmcDyspqcdq tmcDyspqcdq=new TmcDyspqcdq();
		tmcDyspqcdq.setBh(tmcRwsqd.getPk1());
		tmcDyspqcdqDao.deleteByBh(tmcDyspqcdq);
		
		TmcBbxx bbxx = new TmcBbxx();
		bbxx.setBh(tmcRwsqd.getPk1());
		tmcBbxxDao.deleteByBh(bbxx);
		
		TmcXxxx tmcXxxx=new TmcXxxx();
		tmcXxxx.setBh(tmcRwsqd.getPk1());
		tmcXxxxDao.deleteByBh(tmcXxxx);
		
		Emcgjyqjlb emcgjyqjlb=new Emcgjyqjlb();
		emcgjyqjlb.setGlpk(tmcRwsqd.getPk1());
		emcgjyqjlbDao.deleteByGlpk(emcgjyqjlb);
		
		Aqyqjlb aqyqjlb=new Aqyqjlb();
		aqyqjlb.setGlpk(aqyqjlb.getPk1());
		aqyqjlbDao.deleteByGlpk(aqyqjlb);
		
		TmcBgqrb tmcBgqrb=new TmcBgqrb();
		tmcBgqrb.setGdh(aqyqjlb.getPk1());
		tmcBgqrbDao.deleteByGdh(tmcBgqrb);
		
		TmcBgqrzb tmcBgqrzb=new TmcBgqrzb();
		tmcBgqrzb.setGdh(aqyqjlb.getPk1());
		tmcBgqrzbDao.deleteByGdh(tmcBgqrzb);
	}

	@Transactional(readOnly = false)
	public void updateStatus(TmcRwsqd tmcRwsqd) throws SQLException {
		dao.updateStatus(tmcRwsqd);
		dao.updateZt(tmcRwsqd);
		saveTmcRwsqdToDataBase(tmcRwsqd);
	}
	private void saveTmcRwsqdToDataBase(TmcRwsqd tmcRwsqd) throws SQLException {
		
		TmcRwsqdModal tmcRwsqdModal=new TmcRwsqdModal();
		tmcRwsqdModal.save(tmcRwsqd);
		
		TmcSbjjb tmcSbjjb = tmcRwsqd.getTmcSbjjb();
		if(tmcSbjjb != null) {
			TmcSbjjbModal tmcSbjjbModal=new TmcSbjjbModal();
			tmcSbjjbModal.save(tmcSbjjb);
		}
		
		List<TmcBbxz> tmcBbxzList = tmcRwsqd.getTmcBbxzList();
		if(tmcBbxzList != null) {
			TmcBbxzModal tmcBbxzModal=new TmcBbxzModal();
			for(int i=0;i<tmcBbxzList.size();i++) {
				String wjm = tmcBbxzList.get(i).getWjm();
				if(StringUtils.isNotEmpty(wjm)){
					TmcBbxz tmcBbxz = tmcBbxzList.get(i);
					//tmcBbxz.setGlpk1(tmcRwsqd.getPk1());
					tmcBbxzModal.save(tmcBbxz);
					
					
				}
			}
		}
		
		TmcDc tmcDc = tmcRwsqd.getTmcDc();
		if(tmcDc != null) {
			TmcDcModal tmcDcModal=new TmcDcModal();
			tmcDcModal.save(tmcDc);
		}
		
		//电源适配器/充电器
		TmcDyspqcdq tmcDyspqcdq = tmcRwsqd.getTmcDyspqcdq();
		if(tmcDyspqcdq != null) {
			//tmcDyspqcdq.setBh(tmcRwsqd.getPk1());
			TmcDyspqcdqModal tmcDyspqcdqModal=new TmcDyspqcdqModal();
			tmcDyspqcdqModal.save(tmcDyspqcdq);
		}
		//版本信息
		TmcBbxx bbxx = tmcRwsqd.getTmcBbxx();
		if(bbxx != null) {
			//bbxx.setBh(tmcRwsqd.getPk1());
			TmcBbxxModal tmcBbxxModal=new TmcBbxxModal();
			tmcBbxxModal.save(bbxx);
		}
		//详细信息
		TmcXxxx tmcXxxx = tmcRwsqd.getTmcXxxx();
		if(tmcXxxx != null) {
			//tmcXxxx.setBh(tmcRwsqd.getPk1());
			TmcXxxxModal tmcXxxxModal=new TmcXxxxModal();
			tmcXxxxModal.save(tmcXxxx);
		}		
		//emc关键件
		List<Emcgjyqjlb> emcgjyqjlbList = tmcRwsqd.getEmcgjyqjlbList();
		if(emcgjyqjlbList != null) {
			EmcgjyqjlbModal EmcgjyqjlbModal=new EmcgjyqjlbModal();
			for(int i=0;i<emcgjyqjlbList.size();i++) {
				String gjjmc = emcgjyqjlbList.get(i).getGjjmc();
				if(StringUtils.isNotEmpty(gjjmc)){
					Emcgjyqjlb emcgjyqjlb = emcgjyqjlbList.get(i);
					/*emcgjyqjlb.setGlpk(tmcRwsqd.getPk1());*/
					emcgjyqjlb.setId(null);
					
					EmcgjyqjlbModal.save(emcgjyqjlb);
				}
			}
		}
		//安全元器件
		List<Aqyqjlb> aqyqjlbList = tmcRwsqd.getAqyqjlbList();
		if(aqyqjlbList != null) {
			AqyqjlbModal aqyqjlbModal=new AqyqjlbModal();
			for(int i=0;i<aqyqjlbList.size();i++) {
				String xh = aqyqjlbList.get(i).getXh();
				if(StringUtils.isNotEmpty(xh)){
					Aqyqjlb aqyqjlb = aqyqjlbList.get(i);
					//aqyqjlb.setGlpk(tmcRwsqd.getPk1());
					aqyqjlb.setId(null);
					
					aqyqjlbModal.save(aqyqjlb);
				}
			}
		}		
		//变更确认主表
		TmcBgqrb tmcBgqrb = tmcRwsqd.getTmcBgqrb();
		if(tmcBgqrb != null) {
			//tmcBgqrb.setGdh(tmcRwsqd.getPk1());
			TmcBgqrbModal tmcBgqrbModal=new TmcBgqrbModal();
			tmcBgqrbModal.save(tmcBgqrb);
		}
		//变更确认子表
		List<TmcBgqrzb> tmcBgqrzbList = tmcRwsqd.getTmcBgqrzbList();
		if(tmcBgqrzbList != null) {
			TmcBgqrzbModal tmcBgqrzbModal=new TmcBgqrzbModal();
			for(int i=0;i<tmcBgqrzbList.size();i++) {
				String xh = tmcBgqrzbList.get(i).getXh();
				if(StringUtils.isNotEmpty(xh)){
					TmcBgqrzb tmcBgqrzb = tmcBgqrzbList.get(i);
					//tmcBgqrzb.setGdh(tmcRwsqd.getPk1());
					tmcBgqrzb.setId(null);
					
					tmcBgqrzbModal.save(tmcBgqrzb);
				}
			}
		}		

		
	}

	public void updateTmcRwsqd(TmcRwsqd tmcRwsqd) throws SQLException {
		
		dao.update(tmcRwsqd);
		
		//保存到客户数据库
		/*TmcRwsqdModal tmcRwsqdModal=new TmcRwsqdModal();
		tmcRwsqdModal.update(tmcRwsqd);*/
		//设备简介
		TmcSbjjb tmcSbjjb = tmcRwsqd.getTmcSbjjb();
		if(tmcSbjjb!=null) {
			tmcSbjjbDao.update(tmcSbjjb);
			/*TmcSbjjbModal tmcSbjjbModal=new TmcSbjjbModal();
			tmcSbjjbModal.update(tmcSbjjb);*/
		}

		//设备附件
		List<TmcBbxz> tmcBbxzList = tmcRwsqd.getTmcBbxzList();
		if(tmcBbxzList != null) {
			
			//TmcBbxzModal tmcBbxzModal=new TmcBbxzModal();
			TmcBbxz tmcBbxzDel=new TmcBbxz();
			tmcBbxzDel.setGlpk1(tmcRwsqd.getPk1());
			tmcBbxzDao.deleteByGlpk1(tmcBbxzDel);
			//tmcBbxzModal.deleteByGlpk1(tmcBbxzDel);
			for(int i=0;i<tmcBbxzList.size();i++) {
				String wjm = tmcBbxzList.get(i).getWjm();
				if(StringUtils.isNotEmpty(wjm)){
					TmcBbxz tmcBbxz = tmcBbxzList.get(i);
					tmcBbxz.setPk1(UUID.randomUUID().toString().replace("-", ""));
					tmcBbxz.setGlpk1(tmcRwsqd.getPk1());
					tmcBbxzDao.insert(tmcBbxz);
					//tmcBbxzModal.save(tmcBbxz);
					
					
					
					
				}
			}
		}

		//电池
		TmcDc tmcDc = tmcRwsqd.getTmcDc();
		if(tmcDc != null) {
			tmcDcDao.update(tmcDc);
			
			/*TmcDcModal tmcDcModal=new TmcDcModal();
			tmcDcModal.update(tmcDc);*/
		}

		//电源适配器/充电器
		TmcDyspqcdq tmcDyspqcdq = tmcRwsqd.getTmcDyspqcdq();
		if(tmcDyspqcdq != null) {
			tmcDyspqcdqDao.update(tmcDyspqcdq);
			
			/*TmcDyspqcdqModal tmcDyspqcdqModal=new TmcDyspqcdqModal();
			tmcDyspqcdqModal.update(tmcDyspqcdq);*/
		}

		//版本信息
		TmcBbxx bbxx = tmcRwsqd.getTmcBbxx();
		if(bbxx != null) {
			tmcBbxxDao.update(bbxx);
			
			/*TmcBbxxModal tmcBbxxModal=new TmcBbxxModal();
			tmcBbxxModal.update(bbxx);*/
		}

		//详细信息
		TmcXxxx tmcXxxx = tmcRwsqd.getTmcXxxx();
		if(tmcXxxx != null) {
			tmcXxxxDao.update(tmcXxxx);
			
			/*TmcXxxxModal tmcXxxxModal=new TmcXxxxModal();
			tmcXxxxModal.update(tmcXxxx);*/
		}

		//emc关键件
		List<Emcgjyqjlb> emcgjyqjlbList = tmcRwsqd.getEmcgjyqjlbList();
		if(emcgjyqjlbList != null) {
			//EmcgjyqjlbModal emcgjyqjlbModal=new EmcgjyqjlbModal();
			Emcgjyqjlb emcgjyqjlbDel = new Emcgjyqjlb();
			emcgjyqjlbDel.setGlpk(tmcRwsqd.getPk1());
			emcgjyqjlbDao.deleteByGlpk(emcgjyqjlbDel);
			//emcgjyqjlbModal.deleteByGlpk(emcgjyqjlbDel);
			for(int i=0;i<emcgjyqjlbList.size();i++) {
				String gjjmc = emcgjyqjlbList.get(i).getGjjmc();
				if(StringUtils.isNotEmpty(gjjmc)){
					Emcgjyqjlb emcgjyqjlb = emcgjyqjlbList.get(i);
					emcgjyqjlb.setPk1(UUID.randomUUID().toString().replace("-", ""));
					emcgjyqjlb.setGlpk(tmcRwsqd.getPk1());
					emcgjyqjlb.setId(null);
					emcgjyqjlbDao.insert(emcgjyqjlb);
					//emcgjyqjlbModal.save(emcgjyqjlb);
					
					
					
				}
			}
		}

		//安全元器件
		List<Aqyqjlb> aqyqjlbList = tmcRwsqd.getAqyqjlbList();
		if(aqyqjlbList != null) {
			//AqyqjlbModal aqyqjlbModal=new AqyqjlbModal();
			Aqyqjlb aqyqjlbDel = new Aqyqjlb();
			aqyqjlbDel.setGlpk(tmcRwsqd.getPk1());
			aqyqjlbDao.deleteByGlpk(aqyqjlbDel);
			//aqyqjlbModal.deleteByGlpk(aqyqjlbDel);
			for(int i=0;i<aqyqjlbList.size();i++) {
				String xh = aqyqjlbList.get(i).getXh();
				if(StringUtils.isNotEmpty(xh)){
					Aqyqjlb aqyqjlb = aqyqjlbList.get(i);
					aqyqjlb.setPk1(UUID.randomUUID().toString().replace("-", ""));
					aqyqjlb.setGlpk(tmcRwsqd.getPk1());
					aqyqjlb.setId(null);
					aqyqjlbDao.insert(aqyqjlb);
					
					//aqyqjlbModal.save(aqyqjlb);	
					
				}
			}
		}

		//变更确认主表
		TmcBgqrb tmcBgqrb = tmcRwsqd.getTmcBgqrb();
		if(tmcBgqrb != null) {
			tmcBgqrbDao.update(tmcBgqrb);
			
			/*TmcBgqrbModal tmcBgqrbModal=new TmcBgqrbModal();
			tmcBgqrbModal.update(tmcBgqrb);*/
		}

		//变更确认子表
		List<TmcBgqrzb> tmcBgqrzbList = tmcRwsqd.getTmcBgqrzbList();
		if(tmcBgqrzbList != null) {
			//TmcBgqrzbModal tmcBgqrzbModal=new TmcBgqrzbModal();
			TmcBgqrzb tmcBgqrzbDel=new TmcBgqrzb();
			tmcBgqrzbDao.deleteByGdh(tmcBgqrzbDel);
			//tmcBgqrzbModal.deleteByGdh(tmcBgqrzbDel);
			for(int i=0;i<tmcBgqrzbList.size();i++) {
				String xh = tmcBgqrzbList.get(i).getXh();
				if(StringUtils.isNotEmpty(xh)){
					TmcBgqrzb tmcBgqrzb = tmcBgqrzbList.get(i);
					tmcBgqrzb.setPk1(UUID.randomUUID().toString().replace("-", ""));
					tmcBgqrzb.setGdh(tmcRwsqd.getPk1());
					tmcBgqrzb.setId(null);
					tmcBgqrzbDao.insert(tmcBgqrzb);
					
					//tmcBgqrzbModal.save(tmcBgqrzb);	
					
				}
			}
		}
	}

	public void saveTmcRwsqd(TmcRwsqd tmcRwsqd) throws SQLException {
		
		tmcRwsqd.setBh(UUID.randomUUID().toString().replace("-", ""));
		tmcRwsqd.setPk1(UUID.randomUUID().toString().replace("-", ""));
		tmcRwsqd.setId(null);
		dao.insert(tmcRwsqd);
		
		//保存到客户数据库
		/*TmcRwsqdModal tmcRwsqdModal=new TmcRwsqdModal();
		tmcRwsqdModal.save(tmcRwsqd);*/
		//设备简介
		TmcSbjjb tmcSbjjb = tmcRwsqd.getTmcSbjjb();
		if(tmcSbjjb!=null) {
			tmcSbjjb.setGlbh(tmcRwsqd.getBh());
			tmcSbjjb.setPk1(UUID.randomUUID().toString().replace("-", ""));
			tmcSbjjbDao.insert(tmcSbjjb);
			
			/*TmcSbjjbModal tmcSbjjbModal=new TmcSbjjbModal();
			tmcSbjjbModal.save(tmcSbjjb);*/
		}

		//设备附件
		List<TmcBbxz> tmcBbxzList = tmcRwsqd.getTmcBbxzList();
		if(tmcBbxzList != null) {
			for(int i=0;i<tmcBbxzList.size();i++) {
				String wjm = tmcBbxzList.get(i).getWjm();
				if(StringUtils.isNotEmpty(wjm)){
					TmcBbxz tmcBbxz = tmcBbxzList.get(i);
					tmcBbxz.setPk1(UUID.randomUUID().toString().replace("-", ""));
					tmcBbxz.setGlpk1(tmcRwsqd.getPk1());
					tmcBbxzDao.insert(tmcBbxz);
					
					/*TmcBbxzModal tmcBbxzModal=new TmcBbxzModal();
					tmcBbxzModal.save(tmcBbxz);*/
				}
			}
		}

		//电池
		TmcDc tmcDc = tmcRwsqd.getTmcDc();
		if(tmcDc != null) {
			tmcDc.setBh(tmcRwsqd.getPk1());
			tmcDc.setPk1(UUID.randomUUID().toString().replace("-", ""));
			tmcDcDao.insert(tmcDc);
			
			/*TmcDcModal tmcDcModal=new TmcDcModal();
			tmcDcModal.save(tmcDc);*/
		}

		//电源适配器/充电器
		TmcDyspqcdq tmcDyspqcdq = tmcRwsqd.getTmcDyspqcdq();
		if(tmcDyspqcdq != null) {
			tmcDyspqcdq.setBh(tmcRwsqd.getPk1());
			tmcDyspqcdq.setPk1(UUID.randomUUID().toString().replace("-", ""));
			tmcDyspqcdqDao.insert(tmcDyspqcdq);
			
			/*TmcDyspqcdqModal tmcDyspqcdqModal=new TmcDyspqcdqModal();
			tmcDyspqcdqModal.save(tmcDyspqcdq);*/
		}

		//版本信息
		TmcBbxx bbxx = tmcRwsqd.getTmcBbxx();
		if(bbxx != null) {
			bbxx.setBh(tmcRwsqd.getPk1());
			bbxx.setPk1(UUID.randomUUID().toString().replace("-", ""));
			tmcBbxxDao.insert(bbxx);
			
			/*TmcBbxxModal tmcBbxxModal=new TmcBbxxModal();
			tmcBbxxModal.save(bbxx);*/
		}

		//详细信息
		TmcXxxx tmcXxxx = tmcRwsqd.getTmcXxxx();
		if(tmcXxxx != null) {
			tmcXxxx.setBh(tmcRwsqd.getPk1());
			tmcXxxx.setPk1(UUID.randomUUID().toString().replace("-", ""));
			tmcXxxxDao.insert(tmcXxxx);
			
			/*TmcXxxxModal tmcXxxxModal=new TmcXxxxModal();
			tmcXxxxModal.save(tmcXxxx);*/
		}

		//emc关键件
		List<Emcgjyqjlb> emcgjyqjlbList = tmcRwsqd.getEmcgjyqjlbList();
		if(emcgjyqjlbList != null) {
			//EmcgjyqjlbModal EmcgjyqjlbModal=new EmcgjyqjlbModal();
			for(int i=0;i<emcgjyqjlbList.size();i++) {
				String gjjmc = emcgjyqjlbList.get(i).getGjjmc();
				if(StringUtils.isNotEmpty(gjjmc)){
					Emcgjyqjlb emcgjyqjlb = emcgjyqjlbList.get(i);
					emcgjyqjlb.setPk1(UUID.randomUUID().toString().replace("-", ""));
					emcgjyqjlb.setGlpk(tmcRwsqd.getPk1());
					emcgjyqjlb.setId(null);
					emcgjyqjlbDao.insert(emcgjyqjlb);
					
					//EmcgjyqjlbModal.save(emcgjyqjlb);
				}
			}
		}

		//安全元器件
		List<Aqyqjlb> aqyqjlbList = tmcRwsqd.getAqyqjlbList();
		if(aqyqjlbList != null) {
			//AqyqjlbModal aqyqjlbModal=new AqyqjlbModal();
			for(int i=0;i<aqyqjlbList.size();i++) {
				String xh = aqyqjlbList.get(i).getXh();
				if(StringUtils.isNotEmpty(xh)){
					Aqyqjlb aqyqjlb = aqyqjlbList.get(i);
					aqyqjlb.setPk1(UUID.randomUUID().toString().replace("-", ""));
					aqyqjlb.setGlpk(tmcRwsqd.getPk1());
					aqyqjlb.setId(null);
					aqyqjlbDao.insert(aqyqjlb);
					
					//aqyqjlbModal.save(aqyqjlb);
				}
			}
		}

		//变更确认主表
		TmcBgqrb tmcBgqrb = tmcRwsqd.getTmcBgqrb();
		if(tmcBgqrb != null) {
			tmcBgqrb.setGdh(tmcRwsqd.getPk1());
			tmcBgqrb.setPk1(UUID.randomUUID().toString().replace("-", ""));
			tmcBgqrbDao.insert(tmcBgqrb);
			
			/*TmcBgqrbModal tmcBgqrbModal=new TmcBgqrbModal();
			tmcBgqrbModal.save(tmcBgqrb);*/
		}

		//变更确认子表
		List<TmcBgqrzb> tmcBgqrzbList = tmcRwsqd.getTmcBgqrzbList();
		if(tmcBgqrzbList != null) {
			//TmcBgqrzbModal tmcBgqrzbModal=new TmcBgqrzbModal();
			for(int i=0;i<tmcBgqrzbList.size();i++) {
				String xh = tmcBgqrzbList.get(i).getXh();
				if(StringUtils.isNotEmpty(xh)){
					TmcBgqrzb tmcBgqrzb = tmcBgqrzbList.get(i);
					tmcBgqrzb.setPk1(UUID.randomUUID().toString().replace("-", ""));
					tmcBgqrzb.setGdh(tmcRwsqd.getPk1());
					tmcBgqrzb.setId(null);
					tmcBgqrzbDao.insert(tmcBgqrzb);
					
					//tmcBgqrzbModal.save(tmcBgqrzb);
				}
			}
		}
	}
	
}
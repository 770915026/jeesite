/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

import java.util.List;

/**
 * 任务申请表Entity
 * @author gy
 * @version 2018-10-31
 */
public class TmcRwsqd extends DataEntity<TmcRwsqd> {
	
	private static final long serialVersionUID = 1L;
	private String sjdw;		// 受检单位
	private String sjdwdz;		// 受检地址
	private String scc;		// 生产厂
	private String sccdz;		// 生产厂地址
	private String zzsmc;		// 制造商名称
	private String zzsdz;		// 制造商地址
	private String cd;		// 产地
	private String lxrmc;		// 联系人名称
	private String yddh;		// yddh
	private String cz;		// 传真
	private String email;		// 邮件
	private String sbxh;		// 设备型号
	private String jclb;		// 检测类别
	private String csyj;		// 测试依据
	private String bglx;		// 报告类型
	private String yhsm;		// yhsm
	private String yhdbqz;		// yhdbqz
	private String yhdbqzrq;		// yhdbqzrq
	private String zxsm;		// zxsm
	private String zxrwslyqz;		// zxrwslyqz
	private String zxrwslyqzrq;		// zxrwslyqzrq
	private String bbxx;		// bbxx
	private String xxxx;		// xxxx
	private String bz;		// 备注
	private String reader;		// reader
	private String writer;		// writer
	private String pk1;		// pk1
	private String sbmc;		// sbmc
	private String cccsqh;		// cccsqh
	private String bh;		// 编号
	private String dj;		// dj
	private String ejdkxx;		// ejdkxx
	private String kclx;		// kclx
	private String sfzccmmb;		// sfzccmmb
	private String sfzcegprsgn;		// sfzcegprsgn
	private String sfzcgprsgn;		// sfzcgprsgn
	private String sfzcgpsgn;		// sfzcgpsgn
	private String sfzclygn;		// sfzclygn
	private String sfzcsyjgn;		// sfzcsyjgn
	private String sfzcwapi;		// sfzcwapi
	private String rjbbcxfs;		// rjbbcxfs
	private String rjbbh;		// rjbbh
	private String yjbbh;		// yjbbh
	private String edj;		// edj
	private String edsrdy;		// edsrdy
	private String fsgl;		// fsgl
	private String edgl;		// edgl
	private String fspl;		// fspl
	private String scdl;		// scdl
	private String scdy;		// scdy
	private String zdsrdy;		// zdsrdy
	private String sffsj;		// sffsj
	private String zt;		// zt
	private String sqrq;		// sqrq
	private String tysm;		// tysm
	private String jlsj;		// jlsj
	private String sqfs;		// sqfs
	private String fszs;		// fszs
	private String slbh;		// slbh
	private String sbjc;		// sbjc
	private String sfsc;		// sfsc
	private String gjwwbg;		// gjwwbg
	private String bgsm;		// bgsm
	private String jclbo;		// jclbo
	private String sfbm;		// sfbm
	private String sfcwapi;		// sfcwapi
	private String sblb;		// sblb
	private String gdh;		// gdh
	private String xxlb;		// xxlb
	private String drfs;		// drfs
	private String rwly;		// rwly
	private String dls;		// dls
	private String dhyj;   //打回意见
	private String status; //状态：0-保存，1-提交审核，2-审核通过，3-审核不通过
	private String type;       //类型 ：1-进网，2-ccc
	private String createUserId;
	private TmcSbjjb tmcSbjjb; //设备简介
	private List<TmcBbxz> tmcBbxzList;//设备附件
	private TmcDyspqcdq tmcDyspqcdq; // 电源适配器/充电器
	private TmcDc tmcDc; //电池
	private TmcBbxx tmcBbxx; //版本信息
	private TmcXxxx tmcXxxx; //详细信息
	private List<Emcgjyqjlb> emcgjyqjlbList;//emc关键元器件
	private List<Aqyqjlb> aqyqjlbList; //安全元器件
	private TmcBgqrb tmcBgqrb;//变更确认主表
	private  List<TmcBgqrzb> tmcBgqrzbList; //变更确认子表


	public TmcRwsqd() {
		super();
	}

	public TmcRwsqd(String id){
		super(id);
	}

	@Length(min=0, max=1000, message="受检单位长度必须介于 0 和 1000 之间")
	public String getSjdw() {
		return sjdw;
	}

	public void setSjdw(String sjdw) {
		this.sjdw = sjdw;
	}
	
	@Length(min=0, max=1000, message="受检地址长度必须介于 0 和 1000 之间")
	public String getSjdwdz() {
		return sjdwdz;
	}

	public void setSjdwdz(String sjdwdz) {
		this.sjdwdz = sjdwdz;
	}
	
	@Length(min=0, max=1000, message="生产厂长度必须介于 0 和 1000 之间")
	public String getScc() {
		return scc;
	}

	public void setScc(String scc) {
		this.scc = scc;
	}
	
	@Length(min=0, max=1000, message="生产厂地址长度必须介于 0 和 1000 之间")
	public String getSccdz() {
		return sccdz;
	}

	public void setSccdz(String sccdz) {
		this.sccdz = sccdz;
	}
	
	@Length(min=0, max=1000, message="制造商名称长度必须介于 0 和 1000 之间")
	public String getZzsmc() {
		return zzsmc;
	}

	public void setZzsmc(String zzsmc) {
		this.zzsmc = zzsmc;
	}
	
	@Length(min=0, max=1000, message="制造商地址长度必须介于 0 和 1000 之间")
	public String getZzsdz() {
		return zzsdz;
	}

	public void setZzsdz(String zzsdz) {
		this.zzsdz = zzsdz;
	}
	
	@Length(min=0, max=1000, message="产地长度必须介于 0 和 1000 之间")
	public String getCd() {
		return cd;
	}

	public void setCd(String cd) {
		this.cd = cd;
	}
	
	@Length(min=0, max=1000, message="联系人名称长度必须介于 0 和 1000 之间")
	public String getLxrmc() {
		return lxrmc;
	}

	public void setLxrmc(String lxrmc) {
		this.lxrmc = lxrmc;
	}
	
	@Length(min=0, max=1000, message="yddh长度必须介于 0 和 1000 之间")
	public String getYddh() {
		return yddh;
	}

	public void setYddh(String yddh) {
		this.yddh = yddh;
	}
	
	@Length(min=0, max=1000, message="传真长度必须介于 0 和 1000 之间")
	public String getCz() {
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}
	
	@Length(min=0, max=1000, message="邮件长度必须介于 0 和 1000 之间")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Length(min=0, max=1000, message="设备型号长度必须介于 0 和 1000 之间")
	public String getSbxh() {
		return sbxh;
	}

	public void setSbxh(String sbxh) {
		this.sbxh = sbxh;
	}
	
	@Length(min=0, max=1000, message="检测类别长度必须介于 0 和 1000 之间")
	public String getJclb() {
		return jclb;
	}

	public void setJclb(String jclb) {
		this.jclb = jclb;
	}
	
	@Length(min=0, max=1000, message="测试依据长度必须介于 0 和 1000 之间")
	public String getCsyj() {
		return csyj;
	}

	public void setCsyj(String csyj) {
		this.csyj = csyj;
	}
	
	@Length(min=0, max=1000, message="报告类型长度必须介于 0 和 1000 之间")
	public String getBglx() {
		return bglx;
	}

	public void setBglx(String bglx) {
		this.bglx = bglx;
	}
	
	@Length(min=0, max=1000, message="yhsm长度必须介于 0 和 1000 之间")
	public String getYhsm() {
		return yhsm;
	}

	public void setYhsm(String yhsm) {
		this.yhsm = yhsm;
	}
	
	@Length(min=0, max=1000, message="yhdbqz长度必须介于 0 和 1000 之间")
	public String getYhdbqz() {
		return yhdbqz;
	}

	public void setYhdbqz(String yhdbqz) {
		this.yhdbqz = yhdbqz;
	}
	
	@Length(min=0, max=1000, message="yhdbqzrq长度必须介于 0 和 1000 之间")
	public String getYhdbqzrq() {
		return yhdbqzrq;
	}

	public void setYhdbqzrq(String yhdbqzrq) {
		this.yhdbqzrq = yhdbqzrq;
	}
	
	@Length(min=0, max=1000, message="zxsm长度必须介于 0 和 1000 之间")
	public String getZxsm() {
		return zxsm;
	}

	public void setZxsm(String zxsm) {
		this.zxsm = zxsm;
	}
	
	@Length(min=0, max=1000, message="zxrwslyqz长度必须介于 0 和 1000 之间")
	public String getZxrwslyqz() {
		return zxrwslyqz;
	}

	public void setZxrwslyqz(String zxrwslyqz) {
		this.zxrwslyqz = zxrwslyqz;
	}
	
	@Length(min=0, max=1000, message="zxrwslyqzrq长度必须介于 0 和 1000 之间")
	public String getZxrwslyqzrq() {
		return zxrwslyqzrq;
	}

	public void setZxrwslyqzrq(String zxrwslyqzrq) {
		this.zxrwslyqzrq = zxrwslyqzrq;
	}
	
	@Length(min=0, max=1000, message="bbxx长度必须介于 0 和 1000 之间")
	public String getBbxx() {
		return bbxx;
	}

	public void setBbxx(String bbxx) {
		this.bbxx = bbxx;
	}
	
	@Length(min=0, max=1000, message="xxxx长度必须介于 0 和 1000 之间")
	public String getXxxx() {
		return xxxx;
	}

	public void setXxxx(String xxxx) {
		this.xxxx = xxxx;
	}
	
	@Length(min=0, max=1000, message="备注长度必须介于 0 和 1000 之间")
	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
	
	@Length(min=0, max=2000, message="reader长度必须介于 0 和 2000 之间")
	public String getReader() {
		return reader;
	}

	public void setReader(String reader) {
		this.reader = reader;
	}
	
	@Length(min=0, max=2000, message="writer长度必须介于 0 和 2000 之间")
	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	@Length(min=0, max=100, message="pk1长度必须介于 0 和 100 之间")
	public String getPk1() {
		return pk1;
	}

	public void setPk1(String pk1) {
		this.pk1 = pk1;
	}
	
	@Length(min=0, max=1000, message="sbmc长度必须介于 0 和 1000 之间")
	public String getSbmc() {
		return sbmc;
	}

	public void setSbmc(String sbmc) {
		this.sbmc = sbmc;
	}
	
	@Length(min=0, max=1000, message="cccsqh长度必须介于 0 和 1000 之间")
	public String getCccsqh() {
		return cccsqh;
	}

	public void setCccsqh(String cccsqh) {
		this.cccsqh = cccsqh;
	}
	
	@Length(min=0, max=1000, message="编号长度必须介于 0 和 1000 之间")
	public String getBh() {
		return bh;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}
	
	@Length(min=0, max=1000, message="dj长度必须介于 0 和 1000 之间")
	public String getDj() {
		return dj;
	}

	public void setDj(String dj) {
		this.dj = dj;
	}
	
	@Length(min=0, max=1000, message="ejdkxx长度必须介于 0 和 1000 之间")
	public String getEjdkxx() {
		return ejdkxx;
	}

	public void setEjdkxx(String ejdkxx) {
		this.ejdkxx = ejdkxx;
	}
	
	@Length(min=0, max=1000, message="kclx长度必须介于 0 和 1000 之间")
	public String getKclx() {
		return kclx;
	}

	public void setKclx(String kclx) {
		this.kclx = kclx;
	}
	
	@Length(min=0, max=1000, message="sfzccmmb长度必须介于 0 和 1000 之间")
	public String getSfzccmmb() {
		return sfzccmmb;
	}

	public void setSfzccmmb(String sfzccmmb) {
		this.sfzccmmb = sfzccmmb;
	}
	
	@Length(min=0, max=1000, message="sfzcegprsgn长度必须介于 0 和 1000 之间")
	public String getSfzcegprsgn() {
		return sfzcegprsgn;
	}

	public void setSfzcegprsgn(String sfzcegprsgn) {
		this.sfzcegprsgn = sfzcegprsgn;
	}
	
	@Length(min=0, max=1000, message="sfzcgprsgn长度必须介于 0 和 1000 之间")
	public String getSfzcgprsgn() {
		return sfzcgprsgn;
	}

	public void setSfzcgprsgn(String sfzcgprsgn) {
		this.sfzcgprsgn = sfzcgprsgn;
	}
	
	@Length(min=0, max=1000, message="sfzcgpsgn长度必须介于 0 和 1000 之间")
	public String getSfzcgpsgn() {
		return sfzcgpsgn;
	}

	public void setSfzcgpsgn(String sfzcgpsgn) {
		this.sfzcgpsgn = sfzcgpsgn;
	}
	
	@Length(min=0, max=1000, message="sfzclygn长度必须介于 0 和 1000 之间")
	public String getSfzclygn() {
		return sfzclygn;
	}

	public void setSfzclygn(String sfzclygn) {
		this.sfzclygn = sfzclygn;
	}
	
	@Length(min=0, max=1000, message="sfzcsyjgn长度必须介于 0 和 1000 之间")
	public String getSfzcsyjgn() {
		return sfzcsyjgn;
	}

	public void setSfzcsyjgn(String sfzcsyjgn) {
		this.sfzcsyjgn = sfzcsyjgn;
	}
	
	@Length(min=0, max=1000, message="sfzcwapi长度必须介于 0 和 1000 之间")
	public String getSfzcwapi() {
		return sfzcwapi;
	}

	public void setSfzcwapi(String sfzcwapi) {
		this.sfzcwapi = sfzcwapi;
	}
	
	@Length(min=0, max=1000, message="rjbbcxfs长度必须介于 0 和 1000 之间")
	public String getRjbbcxfs() {
		return rjbbcxfs;
	}

	public void setRjbbcxfs(String rjbbcxfs) {
		this.rjbbcxfs = rjbbcxfs;
	}
	
	@Length(min=0, max=1000, message="rjbbh长度必须介于 0 和 1000 之间")
	public String getRjbbh() {
		return rjbbh;
	}

	public void setRjbbh(String rjbbh) {
		this.rjbbh = rjbbh;
	}
	
	@Length(min=0, max=1000, message="yjbbh长度必须介于 0 和 1000 之间")
	public String getYjbbh() {
		return yjbbh;
	}

	public void setYjbbh(String yjbbh) {
		this.yjbbh = yjbbh;
	}
	
	@Length(min=0, max=1000, message="edj长度必须介于 0 和 1000 之间")
	public String getEdj() {
		return edj;
	}

	public void setEdj(String edj) {
		this.edj = edj;
	}
	
	@Length(min=0, max=1000, message="edsrdy长度必须介于 0 和 1000 之间")
	public String getEdsrdy() {
		return edsrdy;
	}

	public void setEdsrdy(String edsrdy) {
		this.edsrdy = edsrdy;
	}
	
	@Length(min=0, max=1000, message="fsgl长度必须介于 0 和 1000 之间")
	public String getFsgl() {
		return fsgl;
	}

	public void setFsgl(String fsgl) {
		this.fsgl = fsgl;
	}
	
	@Length(min=0, max=1000, message="edgl长度必须介于 0 和 1000 之间")
	public String getEdgl() {
		return edgl;
	}

	public void setEdgl(String edgl) {
		this.edgl = edgl;
	}
	
	@Length(min=0, max=1000, message="fspl长度必须介于 0 和 1000 之间")
	public String getFspl() {
		return fspl;
	}

	public void setFspl(String fspl) {
		this.fspl = fspl;
	}
	
	@Length(min=0, max=1000, message="scdl长度必须介于 0 和 1000 之间")
	public String getScdl() {
		return scdl;
	}

	public void setScdl(String scdl) {
		this.scdl = scdl;
	}
	
	@Length(min=0, max=1000, message="scdy长度必须介于 0 和 1000 之间")
	public String getScdy() {
		return scdy;
	}

	public void setScdy(String scdy) {
		this.scdy = scdy;
	}
	
	@Length(min=0, max=1000, message="zdsrdy长度必须介于 0 和 1000 之间")
	public String getZdsrdy() {
		return zdsrdy;
	}

	public void setZdsrdy(String zdsrdy) {
		this.zdsrdy = zdsrdy;
	}
	
	@Length(min=0, max=1000, message="sffsj长度必须介于 0 和 1000 之间")
	public String getSffsj() {
		return sffsj;
	}

	public void setSffsj(String sffsj) {
		this.sffsj = sffsj;
	}
	
	@Length(min=0, max=1000, message="zt长度必须介于 0 和 1000 之间")
	public String getZt() {
		return zt;
	}

	public void setZt(String zt) {
		this.zt = zt;
	}
	
	@Length(min=0, max=1000, message="sqrq长度必须介于 0 和 1000 之间")
	public String getSqrq() {
		return sqrq;
	}

	public void setSqrq(String sqrq) {
		this.sqrq = sqrq;
	}
	
	@Length(min=0, max=1000, message="tysm长度必须介于 0 和 1000 之间")
	public String getTysm() {
		return tysm;
	}

	public void setTysm(String tysm) {
		this.tysm = tysm;
	}
	
	@Length(min=0, max=1000, message="jlsj长度必须介于 0 和 1000 之间")
	public String getJlsj() {
		return jlsj;
	}

	public void setJlsj(String jlsj) {
		this.jlsj = jlsj;
	}
	
	@Length(min=0, max=100, message="sqfs长度必须介于 0 和 100 之间")
	public String getSqfs() {
		return sqfs;
	}

	public void setSqfs(String sqfs) {
		this.sqfs = sqfs;
	}
	
	@Length(min=0, max=100, message="fszs长度必须介于 0 和 100 之间")
	public String getFszs() {
		return fszs;
	}

	public void setFszs(String fszs) {
		this.fszs = fszs;
	}
	
	@Length(min=0, max=100, message="slbh长度必须介于 0 和 100 之间")
	public String getSlbh() {
		return slbh;
	}

	public void setSlbh(String slbh) {
		this.slbh = slbh;
	}
	
	@Length(min=0, max=100, message="sbjc长度必须介于 0 和 100 之间")
	public String getSbjc() {
		return sbjc;
	}

	public void setSbjc(String sbjc) {
		this.sbjc = sbjc;
	}
	
	@Length(min=0, max=100, message="sfsc长度必须介于 0 和 100 之间")
	public String getSfsc() {
		return sfsc;
	}

	public void setSfsc(String sfsc) {
		this.sfsc = sfsc;
	}
	
	@Length(min=0, max=100, message="gjwwbg长度必须介于 0 和 100 之间")
	public String getGjwwbg() {
		return gjwwbg;
	}

	public void setGjwwbg(String gjwwbg) {
		this.gjwwbg = gjwwbg;
	}
	
	@Length(min=0, max=500, message="bgsm长度必须介于 0 和 500 之间")
	public String getBgsm() {
		return bgsm;
	}

	public void setBgsm(String bgsm) {
		this.bgsm = bgsm;
	}
	
	@Length(min=0, max=100, message="jclbo长度必须介于 0 和 100 之间")
	public String getJclbo() {
		return jclbo;
	}

	public void setJclbo(String jclbo) {
		this.jclbo = jclbo;
	}
	
	@Length(min=0, max=100, message="sfbm长度必须介于 0 和 100 之间")
	public String getSfbm() {
		return sfbm;
	}

	public void setSfbm(String sfbm) {
		this.sfbm = sfbm;
	}
	
	@Length(min=0, max=100, message="sfcwapi长度必须介于 0 和 100 之间")
	public String getSfcwapi() {
		return sfcwapi;
	}

	public void setSfcwapi(String sfcwapi) {
		this.sfcwapi = sfcwapi;
	}
	
	@Length(min=0, max=100, message="sblb长度必须介于 0 和 100 之间")
	public String getSblb() {
		return sblb;
	}

	public void setSblb(String sblb) {
		this.sblb = sblb;
	}
	
	@Length(min=0, max=100, message="gdh长度必须介于 0 和 100 之间")
	public String getGdh() {
		return gdh;
	}

	public void setGdh(String gdh) {
		this.gdh = gdh;
	}
	
	@Length(min=0, max=100, message="xxlb长度必须介于 0 和 100 之间")
	public String getXxlb() {
		return xxlb;
	}

	public void setXxlb(String xxlb) {
		this.xxlb = xxlb;
	}
	
	@Length(min=0, max=100, message="drfs长度必须介于 0 和 100 之间")
	public String getDrfs() {
		return drfs;
	}

	public void setDrfs(String drfs) {
		this.drfs = drfs;
	}
	
	@Length(min=0, max=100, message="rwly长度必须介于 0 和 100 之间")
	public String getRwly() {
		return rwly;
	}

	public void setRwly(String rwly) {
		this.rwly = rwly;
	}
	
	@Length(min=0, max=100, message="dls长度必须介于 0 和 100 之间")
	public String getDls() {
		return dls;
	}

	public void setDls(String dls) {
		this.dls = dls;
	}
	
	public String getDhyj() {
		return dhyj;
	}

	public void setDhyj(String dhyj) {
		this.dhyj = dhyj;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

	public TmcSbjjb getTmcSbjjb() {
		return tmcSbjjb;
	}

	public void setTmcSbjjb(TmcSbjjb tmcSbjjb) {
		this.tmcSbjjb = tmcSbjjb;
	}

	public List<TmcBbxz> getTmcBbxzList() {
		return tmcBbxzList;
	}

	public void setTmcBbxzList(List<TmcBbxz> tmcBbxzList) {
		this.tmcBbxzList = tmcBbxzList;
	}

	public TmcDc getTmcDc() {
		return tmcDc;
	}

	public void setTmcDc(TmcDc tmcDc) {
		this.tmcDc = tmcDc;
	}

	public TmcBgqrb getTmcBgqrb() {
		return tmcBgqrb;
	}

	public void setTmcBgqrb(TmcBgqrb tmcBgqrb) {
		this.tmcBgqrb = tmcBgqrb;
	}

	public List<TmcBgqrzb> getTmcBgqrzbList() {
		return tmcBgqrzbList;
	}

	public void setTmcBgqrzbList(List<TmcBgqrzb> tmcBgqrzbList) {
		this.tmcBgqrzbList = tmcBgqrzbList;
	}

	public TmcDyspqcdq getTmcDyspqcdq() {
		return tmcDyspqcdq;
	}

	public void setTmcDyspqcdq(TmcDyspqcdq tmcDyspqcdq) {
		this.tmcDyspqcdq = tmcDyspqcdq;
	}

	public TmcBbxx getTmcBbxx() {
		return tmcBbxx;
	}

	public void setTmcBbxx(TmcBbxx tmcBbxx) {
		this.tmcBbxx = tmcBbxx;
	}

	public TmcXxxx getTmcXxxx() {
		return tmcXxxx;
	}

	public void setTmcXxxx(TmcXxxx tmcXxxx) {
		this.tmcXxxx = tmcXxxx;
	}

	public List<Emcgjyqjlb> getEmcgjyqjlbList() {
		return emcgjyqjlbList;
	}

	public void setEmcgjyqjlbList(List<Emcgjyqjlb> emcgjyqjlbList) {
		this.emcgjyqjlbList = emcgjyqjlbList;
	}

	public List<Aqyqjlb> getAqyqjlbList() {
		return aqyqjlbList;
	}

	public void setAqyqjlbList(List<Aqyqjlb> aqyqjlbList) {
		this.aqyqjlbList = aqyqjlbList;
	}
}
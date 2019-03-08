/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 设备简介Entity
 * @author gy
 * @version 2018-10-31
 */
public class TmcSbjjb extends DataEntity<TmcSbjjb> {
	
	private static final long serialVersionUID = 1L;
	private String qymc;		// qymc
	private String sbjc;		// sbjc
	private String sbxh;		// sbxh
	private String sypdgsm;		// sypdgsm
	private String sypdcdma;		// sypdcdma
	private String sypdwcdma;		// sypdwcdma
	private String sypdwcdmaqt;		// sypdwcdmaqt
	private String sypdcdma2000;		// sypdcdma2000
	private String sypdcdma2000qt;		// sypdcdma2000qt
	private String sypdtdscdma;		// sypdtdscdma
	private String sypdtdscdmaqt;		// sypdtdscdmaqt
	private String sypdtdlte;		// sypdtdlte
	private String sypdtdlte41;		// sypdtdlte41
	private String sim;		// sim
	private String uimkc;		// uimkc
	private String djfs;		// djfs
	private String djfsqt;		// djfsqt
	private String hxxpzsl;		// hxxpzsl
	private String sfzctsfs;		// sfzctsfs
	private String hxxpgys;		// hxxpgys
	private String hxxpxh;		// hxxpxh
	private String jdxpgys;		// jdxpgys
	private String jdxpxh;		// jdxpxh
	private String spxpgys;		// spxpgys
	private String spxpxh;		// spxpxh
	private String rjbb;		// rjbb
	private String rjbbcxzl;		// rjbbcxzl
	private String rjkfs;		// rjkfs
	private String yjbb;		// yjbb
	private String yjbbcxzl;		// yjbbcxzl
	private String ylxpwz;		// ylxpwz
	private String ylwxpxh;		// ylwxpxh
	private String ylwxpgn;		// ylwxpgn
	private String cdmabb;		// cdmabb
	private String cdmabbqt;		// cdmabbqt
	private String cdma2000bb;		// cdma2000bb
	private String cdma2000bbqt;		// cdma2000bbqt
	private String wcdmabb;		// wcdmabb
	private String tdscdmabb;		// tdscdmabb
	private String tdltebb;		// tdltebb
	private String czxt;		// czxt
	private String czxtqt;		// czxtqt
	private String bbh;		// bbh
	private String sfznzd;		// sfznzd
	private String gprsgn;		// gprsgn
	private String gprsgnclass;		// gprsgnclass
	private String hsdpagntdscdma;		// hsdpagntdscdma
	private String hsdpagntdscdmajrlb;		// hsdpagntdscdmajrlb
	private String hsdpagnwcdma;		// hsdpagnwcdma
	private String hsdpagnwcdmajrlb;		// hsdpagnwcdmajrlb
	private String hsupagntdscdma;		// hsupagntdscdma
	private String hsupagnwcdma;		// hsupagnwcdma
	private String hsupagnwcdmajrlb;		// hsupagnwcdmajrlb
	private String ltecsnl;		// ltecsnl
	private String dtxcsms;		// dtxcsms
	private String ltezdyyms;		// ltezdyyms
	private String cdma1xsfzcbcxd;		// cdma1xsfzcbcxd
	private String cdmasjbmfs;		// cdmasjbmfs
	private String dx;		// dx
	private String zcdbcyw;		// zcdbcyw
	private String zcdzzyw1;		// zcdzzyw1
	private String zcdzzyw2;		// zcdzzyw2
	private String jjhj;		// jjhj
	private String jjhjqt;		// jjhjqt
	private String cmmbgbssjds;		// cmmbgbssjds
	private String edge;		// edge
	private String edgeclass;		// edgeclass
	private String dclx;		// dclx
	private String dcxh;		// dcxh
	private String dcedrl;		// dcedrl
	private String dcbcdy;		// dcbcdy
	private String dcsccj;		// dcsccj
	private String dczzs;		// dczzs
	private String qtpj;		// qtpj
	private String dyspqcdqxh;		// dyspqcdqxh
	private String dyspqcdqcd;		// dyspqcdqcd
	private String dyspqcdqscc;		// dyspqcdqscc
	private String dyspqcdqzzs;		// dyspqcdqzzs
	private String dyspqcdqccczsh;		// dyspqcdqccczsh
	private String bz;		// bz
	private String reader;		// reader
	private String writer;		// writer
	private String pk1;		// pk1
	private String kzgn;		// kzgn
	private String glbh;		// glbh
	private String sfzctm5;		// sfzctm5
	private String sfzctm8;		// sfzctm8
	private String sfzcyyhldgsm;		// sfzcyyhldgsm
	private String sfzcyyhldtdscdma;		// sfzcyyhldtdscdma
	private String ggzms4;		// ggzms4
	private String ggzmsqt4;		// ggzmsqt4
	private String kcsl;		// kcsl
	private String skgzms;		// skgzms
	private String skgzmsqt;		// skgzmsqt
	private String zdks;		// zdks
	private String zdksqt;		// zdksqt
	private String ggzmstype4;		// ggzmstype4
	private String dxqt;		// dxqt
	private String bdljfs;		// bdljfs
	private String zxsxgn;		// zxsxgn
	private String bdljfsqt;		// bdljfsqt
	private String zxsxgnsl;		// zxsxgnsl
	private String hsupagntdscdmajrlb;		// hsupagntdscdmajrlb
	private String ltefdd;		// ltefdd
	private String ltefddbb;		// ltefddbb
	private String zcdzzywwcdmasj;		// zcdzzywwcdmasj
	private String zcdzzywwcdmaksdh;		// zcdzzywwcdmaksdh
	private String zcdzzywtdscdma;		// zcdzzywtdscdma
	private String dyspqcdqsfbp;		// dyspqcdqsfbp
	private String ttyh;		// ttyh
	private String nbiotpd;		// nbiotpd
	private String nbiotyw;		// nbiotyw
	private String nbiotbb;		// nbiotbb
	private String nbiotcsnldj;		// nbiotcsnldj
	private String wlwmzxh;		// wlwmzxh
	private String wlwmzgys;		// wlwmzgys
	private String sfczkazdywyycx;		// sfczkazdywyycx
	private String sfcsyhxx;		// sfcsyhxx
	private String sfzcqtfwgn;		// sfzcqtfwgn
	private String nbhxxpgys;		// nbhxxpgys
	private String nbhxxpxh;		// nbhxxpxh
	private String nbjdxpgys;		// nbjdxpgys
	private String nbjdxpxh;		// nbjdxpxh
	private String nbspxpgys;		// nbspxpgys
	private String nbspxpxh;		// nbspxpxh
	private String sfyczywyy;		// sfyczywyy
	private String jhSYPDWCDMAQT;
	private String jhSYPDCDMA2000QT;
	private String wxyw;
	private String wxydzdlb;
	private String sfzcfwgn;
	private String ipxy;

	public String getJhSYPDCDMA2000QT() {
		return jhSYPDCDMA2000QT;
	}

	public void setJhSYPDCDMA2000QT(String jhSYPDCDMA2000QT) {
		this.jhSYPDCDMA2000QT = jhSYPDCDMA2000QT;
	}

	public String getJhSYPDWCDMAQT() {
		return jhSYPDWCDMAQT;
	}

	public void setJhSYPDWCDMAQT(String jhSYPDWCDMAQT) {
		this.jhSYPDWCDMAQT = jhSYPDWCDMAQT;
	}

	public TmcSbjjb() {
		super();
	}

	public TmcSbjjb(String id){
		super(id);
	}

	@Length(min=0, max=100, message="qymc长度必须介于 0 和 100 之间")
	public String getQymc() {
		return qymc;
	}

	public void setQymc(String qymc) {
		this.qymc = qymc;
	}
	
	@Length(min=0, max=100, message="sbjc长度必须介于 0 和 100 之间")
	public String getSbjc() {
		return sbjc;
	}

	public void setSbjc(String sbjc) {
		this.sbjc = sbjc;
	}
	
	@Length(min=0, max=100, message="sbxh长度必须介于 0 和 100 之间")
	public String getSbxh() {
		return sbxh;
	}

	public void setSbxh(String sbxh) {
		this.sbxh = sbxh;
	}
	
	@Length(min=0, max=100, message="sypdgsm长度必须介于 0 和 100 之间")
	public String getSypdgsm() {
		if(sypdgsm!=null){
			sypdgsm=sypdgsm.replaceAll(",", "|");
		}
		return sypdgsm;
	}

	public void setSypdgsm(String sypdgsm) {
		this.sypdgsm = sypdgsm;
	}
	
	@Length(min=0, max=100, message="sypdcdma长度必须介于 0 和 100 之间")
	public String getSypdcdma() {
		if(sypdcdma!=null){
			sypdcdma=sypdcdma.replaceAll(",", "|");
		}
		return sypdcdma;
	}

	public void setSypdcdma(String sypdcdma) {
		this.sypdcdma = sypdcdma;
	}
	
	@Length(min=0, max=100, message="sypdwcdma长度必须介于 0 和 100 之间")
	public String getSypdwcdma() {
		return sypdwcdma;
	}

	public void setSypdwcdma(String sypdwcdma) {
		this.sypdwcdma = sypdwcdma;
	}
	
	@Length(min=0, max=100, message="sypdwcdmaqt长度必须介于 0 和 100 之间")
	public String getSypdwcdmaqt() {
		return sypdwcdmaqt;
	}

	public void setSypdwcdmaqt(String sypdwcdmaqt) {
		this.sypdwcdmaqt = sypdwcdmaqt;
	}
	
	@Length(min=0, max=100, message="sypdcdma2000长度必须介于 0 和 100 之间")
	public String getSypdcdma2000() {
		return sypdcdma2000;
	}

	public void setSypdcdma2000(String sypdcdma2000) {
		this.sypdcdma2000 = sypdcdma2000;
	}
	
	@Length(min=0, max=100, message="sypdcdma2000qt长度必须介于 0 和 100 之间")
	public String getSypdcdma2000qt() {
		return sypdcdma2000qt;
	}

	public void setSypdcdma2000qt(String sypdcdma2000qt) {
		this.sypdcdma2000qt = sypdcdma2000qt;
	}
	
	@Length(min=0, max=100, message="sypdtdscdma长度必须介于 0 和 100 之间")
	public String getSypdtdscdma() {
		if(sypdtdscdma!=null){
			sypdtdscdma=sypdtdscdma.replaceAll(",", "|");
		}
		return sypdtdscdma;
	}

	public void setSypdtdscdma(String sypdtdscdma) {
		this.sypdtdscdma = sypdtdscdma;
	}
	
	@Length(min=0, max=100, message="sypdtdscdmaqt长度必须介于 0 和 100 之间")
	public String getSypdtdscdmaqt() {
		return sypdtdscdmaqt;
	}

	public void setSypdtdscdmaqt(String sypdtdscdmaqt) {
		this.sypdtdscdmaqt = sypdtdscdmaqt;
	}
	
	@Length(min=0, max=100, message="sypdtdlte长度必须介于 0 和 100 之间")
	public String getSypdtdlte() {
		if(sypdtdlte!=null){
			sypdtdlte=sypdtdlte.replaceAll(",", "|");
		}
		return sypdtdlte;
	}

	public void setSypdtdlte(String sypdtdlte) {
		this.sypdtdlte = sypdtdlte;
	}
	
	@Length(min=0, max=100, message="sypdtdlte41长度必须介于 0 和 100 之间")
	public String getSypdtdlte41() {
		if(sypdtdlte41!=null){
			sypdtdlte41=sypdtdlte41.replaceAll(",", "|");
		}
		return sypdtdlte41;
	}

	public void setSypdtdlte41(String sypdtdlte41) {
		this.sypdtdlte41 = sypdtdlte41;
	}
	
	@Length(min=0, max=100, message="sim长度必须介于 0 和 100 之间")
	public String getSim() {
		if(sim!=null){
			sim=sim.replaceAll(",", "|");
		}
		return sim;
	}

	public void setSim(String sim) {
		this.sim = sim;
	}
	
	@Length(min=0, max=100, message="uimkc长度必须介于 0 和 100 之间")
	public String getUimkc() {
		if(uimkc!=null){
			uimkc=uimkc.replaceAll(",", "|");
		}
		return uimkc;
	}

	public void setUimkc(String uimkc) {
		this.uimkc = uimkc;
	}
	
	@Length(min=0, max=100, message="djfs长度必须介于 0 和 100 之间")
	public String getDjfs() {
		return djfs;
	}

	public void setDjfs(String djfs) {
		this.djfs = djfs;
	}
	
	@Length(min=0, max=100, message="djfsqt长度必须介于 0 和 100 之间")
	public String getDjfsqt() {
		return djfsqt;
	}

	public void setDjfsqt(String djfsqt) {
		this.djfsqt = djfsqt;
	}
	
	@Length(min=0, max=100, message="hxxpzsl长度必须介于 0 和 100 之间")
	public String getHxxpzsl() {
		return hxxpzsl;
	}

	public void setHxxpzsl(String hxxpzsl) {
		this.hxxpzsl = hxxpzsl;
	}
	
	@Length(min=0, max=100, message="sfzctsfs长度必须介于 0 和 100 之间")
	public String getSfzctsfs() {
		return sfzctsfs;
	}

	public void setSfzctsfs(String sfzctsfs) {
		this.sfzctsfs = sfzctsfs;
	}
	
	@Length(min=0, max=100, message="hxxpgys长度必须介于 0 和 100 之间")
	public String getHxxpgys() {
		return hxxpgys;
	}

	public void setHxxpgys(String hxxpgys) {
		this.hxxpgys = hxxpgys;
	}
	
	@Length(min=0, max=100, message="hxxpxh长度必须介于 0 和 100 之间")
	public String getHxxpxh() {
		return hxxpxh;
	}

	public void setHxxpxh(String hxxpxh) {
		this.hxxpxh = hxxpxh;
	}
	
	@Length(min=0, max=100, message="jdxpgys长度必须介于 0 和 100 之间")
	public String getJdxpgys() {
		return jdxpgys;
	}

	public void setJdxpgys(String jdxpgys) {
		this.jdxpgys = jdxpgys;
	}
	
	@Length(min=0, max=100, message="jdxpxh长度必须介于 0 和 100 之间")
	public String getJdxpxh() {
		return jdxpxh;
	}

	public void setJdxpxh(String jdxpxh) {
		this.jdxpxh = jdxpxh;
	}
	
	@Length(min=0, max=200, message="spxpgys长度必须介于 0 和 200 之间")
	public String getSpxpgys() {
		return spxpgys;
	}

	public void setSpxpgys(String spxpgys) {
		this.spxpgys = spxpgys;
	}
	
	@Length(min=0, max=100, message="spxpxh长度必须介于 0 和 100 之间")
	public String getSpxpxh() {
		return spxpxh;
	}

	public void setSpxpxh(String spxpxh) {
		this.spxpxh = spxpxh;
	}
	
	@Length(min=0, max=1000, message="rjbb长度必须介于 0 和 1000 之间")
	public String getRjbb() {
		return rjbb;
	}

	public void setRjbb(String rjbb) {
		this.rjbb = rjbb;
	}
	
	@Length(min=0, max=1000, message="rjbbcxzl长度必须介于 0 和 1000 之间")
	public String getRjbbcxzl() {
		return rjbbcxzl;
	}

	public void setRjbbcxzl(String rjbbcxzl) {
		this.rjbbcxzl = rjbbcxzl;
	}
	
	@Length(min=0, max=100, message="rjkfs长度必须介于 0 和 100 之间")
	public String getRjkfs() {
		return rjkfs;
	}

	public void setRjkfs(String rjkfs) {
		this.rjkfs = rjkfs;
	}
	
	@Length(min=0, max=100, message="yjbb长度必须介于 0 和 100 之间")
	public String getYjbb() {
		return yjbb;
	}

	public void setYjbb(String yjbb) {
		this.yjbb = yjbb;
	}
	
	@Length(min=0, max=100, message="yjbbcxzl长度必须介于 0 和 100 之间")
	public String getYjbbcxzl() {
		return yjbbcxzl;
	}

	public void setYjbbcxzl(String yjbbcxzl) {
		this.yjbbcxzl = yjbbcxzl;
	}
	
	@Length(min=0, max=100, message="ylxpwz长度必须介于 0 和 100 之间")
	public String getYlxpwz() {
		return ylxpwz;
	}

	public void setYlxpwz(String ylxpwz) {
		this.ylxpwz = ylxpwz;
	}
	
	@Length(min=0, max=1000, message="ylwxpxh长度必须介于 0 和 1000 之间")
	public String getYlwxpxh() {
		return ylwxpxh;
	}

	public void setYlwxpxh(String ylwxpxh) {
		this.ylwxpxh = ylwxpxh;
	}
	
	@Length(min=0, max=1000, message="ylwxpgn长度必须介于 0 和 1000 之间")
	public String getYlwxpgn() {
		return ylwxpgn;
	}

	public void setYlwxpgn(String ylwxpgn) {
		this.ylwxpgn = ylwxpgn;
	}
	
	@Length(min=0, max=100, message="cdmabb长度必须介于 0 和 100 之间")
	public String getCdmabb() {
		if(cdmabb!=null){
			cdmabb=cdmabb.replaceAll(",", "|");
		}
		return cdmabb;
	}

	public void setCdmabb(String cdmabb) {
		this.cdmabb = cdmabb;
	}
	
	@Length(min=0, max=100, message="cdmabbqt长度必须介于 0 和 100 之间")
	public String getCdmabbqt() {
		return cdmabbqt;
	}

	public void setCdmabbqt(String cdmabbqt) {
		this.cdmabbqt = cdmabbqt;
	}
	
	@Length(min=0, max=500, message="cdma2000bb长度必须介于 0 和 500 之间")
	public String getCdma2000bb() {
		if(cdma2000bb!=null){
			cdma2000bb=cdma2000bb.replaceAll(",", "|");
		}
		return cdma2000bb;
	}

	public void setCdma2000bb(String cdma2000bb) {
		this.cdma2000bb = cdma2000bb;
	}
	
	@Length(min=0, max=100, message="cdma2000bbqt长度必须介于 0 和 100 之间")
	public String getCdma2000bbqt() {
		return cdma2000bbqt;
	}

	public void setCdma2000bbqt(String cdma2000bbqt) {
		this.cdma2000bbqt = cdma2000bbqt;
	}
	
	@Length(min=0, max=100, message="wcdmabb长度必须介于 0 和 100 之间")
	public String getWcdmabb() {
		if(wcdmabb!=null){
			wcdmabb=wcdmabb.replaceAll(",", "|");
		}
		return wcdmabb;
	}

	public void setWcdmabb(String wcdmabb) {
		this.wcdmabb = wcdmabb;
	}
	
	@Length(min=0, max=100, message="tdscdmabb长度必须介于 0 和 100 之间")
	public String getTdscdmabb() {
		if(tdscdmabb!=null){
			tdscdmabb=tdscdmabb.replaceAll(",", "|");
		}
		return tdscdmabb;
	}

	public void setTdscdmabb(String tdscdmabb) {
		this.tdscdmabb = tdscdmabb;
	}
	
	@Length(min=0, max=100, message="tdltebb长度必须介于 0 和 100 之间")
	public String getTdltebb() {
		if(tdltebb!=null){
			tdltebb=tdltebb.replaceAll(",", "|");
		}
		return tdltebb;
	}

	public void setTdltebb(String tdltebb) {
		this.tdltebb = tdltebb;
	}
	
	@Length(min=0, max=100, message="czxt长度必须介于 0 和 100 之间")
	public String getCzxt() {
		return czxt;
	}

	public void setCzxt(String czxt) {
		this.czxt = czxt;
	}
	
	@Length(min=0, max=100, message="czxtqt长度必须介于 0 和 100 之间")
	public String getCzxtqt() {
		return czxtqt;
	}

	public void setCzxtqt(String czxtqt) {
		this.czxtqt = czxtqt;
	}
	
	@Length(min=0, max=100, message="bbh长度必须介于 0 和 100 之间")
	public String getBbh() {
		return bbh;
	}

	public void setBbh(String bbh) {
		this.bbh = bbh;
	}
	
	@Length(min=0, max=100, message="sfznzd长度必须介于 0 和 100 之间")
	public String getSfznzd() {
		return sfznzd;
	}

	public void setSfznzd(String sfznzd) {
		this.sfznzd = sfznzd;
	}
	
	@Length(min=0, max=100, message="gprsgn长度必须介于 0 和 100 之间")
	public String getGprsgn() {
		return gprsgn;
	}

	public void setGprsgn(String gprsgn) {
		this.gprsgn = gprsgn;
	}
	
	@Length(min=0, max=100, message="gprsgnclass长度必须介于 0 和 100 之间")
	public String getGprsgnclass() {
		return gprsgnclass;
	}

	public void setGprsgnclass(String gprsgnclass) {
		this.gprsgnclass = gprsgnclass;
	}
	
	@Length(min=0, max=100, message="hsdpagntdscdma长度必须介于 0 和 100 之间")
	public String getHsdpagntdscdma() {
		return hsdpagntdscdma;
	}

	public void setHsdpagntdscdma(String hsdpagntdscdma) {
		this.hsdpagntdscdma = hsdpagntdscdma;
	}
	
	@Length(min=0, max=500, message="hsdpagntdscdmajrlb长度必须介于 0 和 500 之间")
	public String getHsdpagntdscdmajrlb() {
		return hsdpagntdscdmajrlb;
	}

	public void setHsdpagntdscdmajrlb(String hsdpagntdscdmajrlb) {
		this.hsdpagntdscdmajrlb = hsdpagntdscdmajrlb;
	}
	
	@Length(min=0, max=100, message="hsdpagnwcdma长度必须介于 0 和 100 之间")
	public String getHsdpagnwcdma() {
		return hsdpagnwcdma;
	}

	public void setHsdpagnwcdma(String hsdpagnwcdma) {
		this.hsdpagnwcdma = hsdpagnwcdma;
	}
	
	@Length(min=0, max=500, message="hsdpagnwcdmajrlb长度必须介于 0 和 500 之间")
	public String getHsdpagnwcdmajrlb() {
		return hsdpagnwcdmajrlb;
	}

	public void setHsdpagnwcdmajrlb(String hsdpagnwcdmajrlb) {
		this.hsdpagnwcdmajrlb = hsdpagnwcdmajrlb;
	}
	
	@Length(min=0, max=100, message="hsupagntdscdma长度必须介于 0 和 100 之间")
	public String getHsupagntdscdma() {
		return hsupagntdscdma;
	}

	public void setHsupagntdscdma(String hsupagntdscdma) {
		this.hsupagntdscdma = hsupagntdscdma;
	}
	
	@Length(min=0, max=100, message="hsupagnwcdma长度必须介于 0 和 100 之间")
	public String getHsupagnwcdma() {
		return hsupagnwcdma;
	}

	public void setHsupagnwcdma(String hsupagnwcdma) {
		this.hsupagnwcdma = hsupagnwcdma;
	}
	
	@Length(min=0, max=100, message="hsupagnwcdmajrlb长度必须介于 0 和 100 之间")
	public String getHsupagnwcdmajrlb() {
		return hsupagnwcdmajrlb;
	}

	public void setHsupagnwcdmajrlb(String hsupagnwcdmajrlb) {
		this.hsupagnwcdmajrlb = hsupagnwcdmajrlb;
	}
	
	@Length(min=0, max=100, message="ltecsnl长度必须介于 0 和 100 之间")
	public String getLtecsnl() {
		if(ltecsnl!=null){
			ltecsnl=ltecsnl.replaceAll(",", "|");
		}
		return ltecsnl;
	}

	public void setLtecsnl(String ltecsnl) {
		this.ltecsnl = ltecsnl;
	}
	
	@Length(min=0, max=100, message="dtxcsms长度必须介于 0 和 100 之间")
	public String getDtxcsms() {
		return dtxcsms;
	}

	public void setDtxcsms(String dtxcsms) {
		this.dtxcsms = dtxcsms;
	}
	
	@Length(min=0, max=100, message="ltezdyyms长度必须介于 0 和 100 之间")
	public String getLtezdyyms() {
		if(ltezdyyms!=null){
			ltezdyyms=ltezdyyms.replaceAll(",", "|");
		}
		return ltezdyyms;
	}

	public void setLtezdyyms(String ltezdyyms) {
		this.ltezdyyms = ltezdyyms;
	}
	
	@Length(min=0, max=100, message="cdma1xsfzcbcxd长度必须介于 0 和 100 之间")
	public String getCdma1xsfzcbcxd() {
		return cdma1xsfzcbcxd;
	}

	public void setCdma1xsfzcbcxd(String cdma1xsfzcbcxd) {
		this.cdma1xsfzcbcxd = cdma1xsfzcbcxd;
	}
	
	@Length(min=0, max=100, message="cdmasjbmfs长度必须介于 0 和 100 之间")
	public String getCdmasjbmfs() {
		if(cdmasjbmfs!=null){
			cdmasjbmfs=cdmasjbmfs.replaceAll(",", "|");
		}
		return cdmasjbmfs;
	}

	public void setCdmasjbmfs(String cdmasjbmfs) {
		this.cdmasjbmfs = cdmasjbmfs;
	}
	
	@Length(min=0, max=100, message="dx长度必须介于 0 和 100 之间")
	public String getDx() {
		if(dx!=null){
			dx=dx.replaceAll(",", "|");
		}
		return dx;
	}

	public void setDx(String dx) {
		this.dx = dx;
	}
	
	@Length(min=0, max=100, message="zcdbcyw长度必须介于 0 和 100 之间")
	public String getZcdbcyw() {
		if(zcdbcyw!=null){
			zcdbcyw=zcdbcyw.replaceAll(",", "|");
		}
		return zcdbcyw;
	}

	public void setZcdbcyw(String zcdbcyw) {
		this.zcdbcyw = zcdbcyw;
	}
	
	@Length(min=0, max=100, message="zcdzzyw1长度必须介于 0 和 100 之间")
	public String getZcdzzyw1() {
		return zcdzzyw1;
	}

	public void setZcdzzyw1(String zcdzzyw1) {
		this.zcdzzyw1 = zcdzzyw1;
	}
	
	@Length(min=0, max=100, message="zcdzzyw2长度必须介于 0 和 100 之间")
	public String getZcdzzyw2() {
		return zcdzzyw2;
	}

	public void setZcdzzyw2(String zcdzzyw2) {
		this.zcdzzyw2 = zcdzzyw2;
	}
	
	@Length(min=0, max=500, message="jjhj长度必须介于 0 和 500 之间")
	public String getJjhj() {
		if(jjhj!=null){
			jjhj=jjhj.replaceAll(",", "|");
		}
		return jjhj;
	}

	public void setJjhj(String jjhj) {
		this.jjhj = jjhj;
	}
	
	@Length(min=0, max=100, message="jjhjqt长度必须介于 0 和 100 之间")
	public String getJjhjqt() {
		return jjhjqt;
	}

	public void setJjhjqt(String jjhjqt) {
		this.jjhjqt = jjhjqt;
	}
	
	@Length(min=0, max=100, message="cmmbgbssjds长度必须介于 0 和 100 之间")
	public String getCmmbgbssjds() {
		return cmmbgbssjds;
	}

	public void setCmmbgbssjds(String cmmbgbssjds) {
		this.cmmbgbssjds = cmmbgbssjds;
	}
	
	@Length(min=0, max=100, message="edge长度必须介于 0 和 100 之间")
	public String getEdge() {
		return edge;
	}

	public void setEdge(String edge) {
		this.edge = edge;
	}
	
	@Length(min=0, max=100, message="edgeclass长度必须介于 0 和 100 之间")
	public String getEdgeclass() {
		return edgeclass;
	}

	public void setEdgeclass(String edgeclass) {
		this.edgeclass = edgeclass;
	}
	
	@Length(min=0, max=100, message="dclx长度必须介于 0 和 100 之间")
	public String getDclx() {
		return dclx;
	}

	public void setDclx(String dclx) {
		this.dclx = dclx;
	}
	
	@Length(min=0, max=100, message="dcxh长度必须介于 0 和 100 之间")
	public String getDcxh() {
		return dcxh;
	}

	public void setDcxh(String dcxh) {
		this.dcxh = dcxh;
	}
	
	@Length(min=0, max=100, message="dcedrl长度必须介于 0 和 100 之间")
	public String getDcedrl() {
		return dcedrl;
	}

	public void setDcedrl(String dcedrl) {
		this.dcedrl = dcedrl;
	}
	
	@Length(min=0, max=100, message="dcbcdy长度必须介于 0 和 100 之间")
	public String getDcbcdy() {
		return dcbcdy;
	}

	public void setDcbcdy(String dcbcdy) {
		this.dcbcdy = dcbcdy;
	}
	
	@Length(min=0, max=300, message="dcsccj长度必须介于 0 和 300 之间")
	public String getDcsccj() {
		return dcsccj;
	}

	public void setDcsccj(String dcsccj) {
		this.dcsccj = dcsccj;
	}
	
	@Length(min=0, max=300, message="dczzs长度必须介于 0 和 300 之间")
	public String getDczzs() {
		return dczzs;
	}

	public void setDczzs(String dczzs) {
		this.dczzs = dczzs;
	}
	
	@Length(min=0, max=100, message="qtpj长度必须介于 0 和 100 之间")
	public String getQtpj() {
		return qtpj;
	}

	public void setQtpj(String qtpj) {
		this.qtpj = qtpj;
	}
	
	@Length(min=0, max=100, message="dyspqcdqxh长度必须介于 0 和 100 之间")
	public String getDyspqcdqxh() {
		return dyspqcdqxh;
	}

	public void setDyspqcdqxh(String dyspqcdqxh) {
		this.dyspqcdqxh = dyspqcdqxh;
	}
	
	@Length(min=0, max=100, message="dyspqcdqcd长度必须介于 0 和 100 之间")
	public String getDyspqcdqcd() {
		return dyspqcdqcd;
	}

	public void setDyspqcdqcd(String dyspqcdqcd) {
		this.dyspqcdqcd = dyspqcdqcd;
	}
	
	@Length(min=0, max=100, message="dyspqcdqscc长度必须介于 0 和 100 之间")
	public String getDyspqcdqscc() {
		return dyspqcdqscc;
	}

	public void setDyspqcdqscc(String dyspqcdqscc) {
		this.dyspqcdqscc = dyspqcdqscc;
	}
	
	@Length(min=0, max=100, message="dyspqcdqzzs长度必须介于 0 和 100 之间")
	public String getDyspqcdqzzs() {
		return dyspqcdqzzs;
	}

	public void setDyspqcdqzzs(String dyspqcdqzzs) {
		this.dyspqcdqzzs = dyspqcdqzzs;
	}
	
	@Length(min=0, max=100, message="dyspqcdqccczsh长度必须介于 0 和 100 之间")
	public String getDyspqcdqccczsh() {
		return dyspqcdqccczsh;
	}

	public void setDyspqcdqccczsh(String dyspqcdqccczsh) {
		this.dyspqcdqccczsh = dyspqcdqccczsh;
	}
	
	@Length(min=0, max=500, message="bz长度必须介于 0 和 500 之间")
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
	
	@Length(min=0, max=100, message="kzgn长度必须介于 0 和 100 之间")
	public String getKzgn() {
		if(kzgn!=null){
			kzgn=kzgn.replaceAll(",", "|");
		}
		return kzgn;
	}

	public void setKzgn(String kzgn) {
		this.kzgn = kzgn;
	}
	
	@Length(min=0, max=100, message="glbh长度必须介于 0 和 100 之间")
	public String getGlbh() {
		return glbh;
	}

	public void setGlbh(String glbh) {
		this.glbh = glbh;
	}
	
	@Length(min=0, max=100, message="sfzctm5长度必须介于 0 和 100 之间")
	public String getSfzctm5() {
		if(sfzctm5!=null){
			sfzctm5=sfzctm5.replaceAll(",", "|");
		}
		return sfzctm5;
	}

	public void setSfzctm5(String sfzctm5) {
		this.sfzctm5 = sfzctm5;
	}
	
	@Length(min=0, max=100, message="sfzctm8长度必须介于 0 和 100 之间")
	public String getSfzctm8() {
		return sfzctm8;
	}

	public void setSfzctm8(String sfzctm8) {
		this.sfzctm8 = sfzctm8;
	}
	
	@Length(min=0, max=100, message="sfzcyyhldgsm长度必须介于 0 和 100 之间")
	public String getSfzcyyhldgsm() {
		return sfzcyyhldgsm;
	}

	public void setSfzcyyhldgsm(String sfzcyyhldgsm) {
		this.sfzcyyhldgsm = sfzcyyhldgsm;
	}
	
	@Length(min=0, max=100, message="sfzcyyhldtdscdma长度必须介于 0 和 100 之间")
	public String getSfzcyyhldtdscdma() {
		return sfzcyyhldtdscdma;
	}

	public void setSfzcyyhldtdscdma(String sfzcyyhldtdscdma) {
		this.sfzcyyhldtdscdma = sfzcyyhldtdscdma;
	}
	
	@Length(min=0, max=100, message="ggzms4长度必须介于 0 和 100 之间")
	public String getGgzms4() {
		return ggzms4;
	}

	public void setGgzms4(String ggzms4) {
		this.ggzms4 = ggzms4;
	}
	
	@Length(min=0, max=100, message="ggzmsqt4长度必须介于 0 和 100 之间")
	public String getGgzmsqt4() {
		return ggzmsqt4;
	}

	public void setGgzmsqt4(String ggzmsqt4) {
		this.ggzmsqt4 = ggzmsqt4;
	}
	
	@Length(min=0, max=100, message="kcsl长度必须介于 0 和 100 之间")
	public String getKcsl() {
		return kcsl;
	}

	public void setKcsl(String kcsl) {
		this.kcsl = kcsl;
	}
	
	@Length(min=0, max=100, message="skgzms长度必须介于 0 和 100 之间")
	public String getSkgzms() {
		return skgzms;
	}

	public void setSkgzms(String skgzms) {
		this.skgzms = skgzms;
	}
	
	@Length(min=0, max=100, message="skgzmsqt长度必须介于 0 和 100 之间")
	public String getSkgzmsqt() {
		return skgzmsqt;
	}

	public void setSkgzmsqt(String skgzmsqt) {
		this.skgzmsqt = skgzmsqt;
	}
	
	@Length(min=0, max=100, message="zdks长度必须介于 0 和 100 之间")
	public String getZdks() {
		return zdks;
	}

	public void setZdks(String zdks) {
		this.zdks = zdks;
	}
	
	@Length(min=0, max=100, message="zdksqt长度必须介于 0 和 100 之间")
	public String getZdksqt() {
		return zdksqt;
	}

	public void setZdksqt(String zdksqt) {
		this.zdksqt = zdksqt;
	}
	
	@Length(min=0, max=100, message="ggzmstype4长度必须介于 0 和 100 之间")
	public String getGgzmstype4() {
		return ggzmstype4;
	}

	public void setGgzmstype4(String ggzmstype4) {
		this.ggzmstype4 = ggzmstype4;
	}
	
	@Length(min=0, max=100, message="dxqt长度必须介于 0 和 100 之间")
	public String getDxqt() {
		return dxqt;
	}

	public void setDxqt(String dxqt) {
		this.dxqt = dxqt;
	}
	
	@Length(min=0, max=300, message="bdljfs长度必须介于 0 和 300 之间")
	public String getBdljfs() {
		if(bdljfs!=null){
			bdljfs=bdljfs.replaceAll(",", "|");
		}
		return bdljfs;
	}

	public void setBdljfs(String bdljfs) {
		this.bdljfs = bdljfs;
	}
	
	@Length(min=0, max=100, message="zxsxgn长度必须介于 0 和 100 之间")
	public String getZxsxgn() {
		return zxsxgn;
	}

	public void setZxsxgn(String zxsxgn) {
		this.zxsxgn = zxsxgn;
	}
	
	@Length(min=0, max=1000, message="bdljfsqt长度必须介于 0 和 1000 之间")
	public String getBdljfsqt() {
		return bdljfsqt;
	}

	public void setBdljfsqt(String bdljfsqt) {
		this.bdljfsqt = bdljfsqt;
	}
	
	@Length(min=0, max=100, message="zxsxgnsl长度必须介于 0 和 100 之间")
	public String getZxsxgnsl() {
		return zxsxgnsl;
	}

	public void setZxsxgnsl(String zxsxgnsl) {
		this.zxsxgnsl = zxsxgnsl;
	}
	
	@Length(min=0, max=100, message="hsupagntdscdmajrlb长度必须介于 0 和 100 之间")
	public String getHsupagntdscdmajrlb() {
		return hsupagntdscdmajrlb;
	}

	public void setHsupagntdscdmajrlb(String hsupagntdscdmajrlb) {
		this.hsupagntdscdmajrlb = hsupagntdscdmajrlb;
	}
	
	@Length(min=0, max=100, message="ltefdd长度必须介于 0 和 100 之间")
	public String getLtefdd() {
		if(ltefdd!=null){
			ltefdd=ltefdd.replaceAll(",", "|");
		}
		return ltefdd;
	}

	public void setLtefdd(String ltefdd) {
		this.ltefdd = ltefdd;
	}
	
	@Length(min=0, max=100, message="ltefddbb长度必须介于 0 和 100 之间")
	public String getLtefddbb() {
		if(ltefddbb!=null){
			ltefddbb=ltefddbb.replaceAll(",", "|");
		}
		return ltefddbb;
	}

	public void setLtefddbb(String ltefddbb) {
		this.ltefddbb = ltefddbb;
	}
	
	@Length(min=0, max=100, message="zcdzzywwcdmasj长度必须介于 0 和 100 之间")
	public String getZcdzzywwcdmasj() {
		return zcdzzywwcdmasj;
	}

	public void setZcdzzywwcdmasj(String zcdzzywwcdmasj) {
		this.zcdzzywwcdmasj = zcdzzywwcdmasj;
	}
	
	@Length(min=0, max=100, message="zcdzzywwcdmaksdh长度必须介于 0 和 100 之间")
	public String getZcdzzywwcdmaksdh() {
		return zcdzzywwcdmaksdh;
	}

	public void setZcdzzywwcdmaksdh(String zcdzzywwcdmaksdh) {
		this.zcdzzywwcdmaksdh = zcdzzywwcdmaksdh;
	}
	
	@Length(min=0, max=100, message="zcdzzywtdscdma长度必须介于 0 和 100 之间")
	public String getZcdzzywtdscdma() {
		if(zcdzzywtdscdma!=null){
			zcdzzywtdscdma=zcdzzywtdscdma.replaceAll(",", "|");
		}
		return zcdzzywtdscdma;
	}

	public void setZcdzzywtdscdma(String zcdzzywtdscdma) {
		this.zcdzzywtdscdma = zcdzzywtdscdma;
	}
	
	@Length(min=0, max=100, message="dyspqcdqsfbp长度必须介于 0 和 100 之间")
	public String getDyspqcdqsfbp() {
		return dyspqcdqsfbp;
	}

	public void setDyspqcdqsfbp(String dyspqcdqsfbp) {
		this.dyspqcdqsfbp = dyspqcdqsfbp;
	}
	
	@Length(min=0, max=100, message="ttyh长度必须介于 0 和 100 之间")
	public String getTtyh() {
		return ttyh;
	}

	public void setTtyh(String ttyh) {
		this.ttyh = ttyh;
	}
	
	@Length(min=0, max=100, message="nbiotpd长度必须介于 0 和 100 之间")
	public String getNbiotpd() {
		if(nbiotpd!=null){
			nbiotpd=nbiotpd.replaceAll(",", "|");
		}
		return nbiotpd;
	}

	public void setNbiotpd(String nbiotpd) {
		this.nbiotpd = nbiotpd;
	}
	
	@Length(min=0, max=100, message="nbiotyw长度必须介于 0 和 100 之间")
	public String getNbiotyw() {
		if(nbiotyw!=null){
			nbiotyw=nbiotyw.replaceAll(",", "|");
		}
		return nbiotyw;
	}

	public void setNbiotyw(String nbiotyw) {
		this.nbiotyw = nbiotyw;
	}
	
	@Length(min=0, max=100, message="nbiotbb长度必须介于 0 和 100 之间")
	public String getNbiotbb() {
		if(nbiotbb !=null){
			nbiotbb=nbiotbb.replaceAll(",", "|");
		}
		return nbiotbb;
	}

	public void setNbiotbb(String nbiotbb) {
		this.nbiotbb = nbiotbb;
	}
	
	@Length(min=0, max=100, message="nbiotcsnldj长度必须介于 0 和 100 之间")
	public String getNbiotcsnldj() {
		return nbiotcsnldj;
	}

	public void setNbiotcsnldj(String nbiotcsnldj) {
		this.nbiotcsnldj = nbiotcsnldj;
	}
	
	@Length(min=0, max=100, message="wlwmzxh长度必须介于 0 和 100 之间")
	public String getWlwmzxh() {
		return wlwmzxh;
	}

	public void setWlwmzxh(String wlwmzxh) {
		this.wlwmzxh = wlwmzxh;
	}
	
	@Length(min=0, max=100, message="wlwmzgys长度必须介于 0 和 100 之间")
	public String getWlwmzgys() {
		return wlwmzgys;
	}

	public void setWlwmzgys(String wlwmzgys) {
		this.wlwmzgys = wlwmzgys;
	}
	
	@Length(min=0, max=100, message="sfczkazdywyycx长度必须介于 0 和 100 之间")
	public String getSfczkazdywyycx() {
		return sfczkazdywyycx;
	}

	public void setSfczkazdywyycx(String sfczkazdywyycx) {
		this.sfczkazdywyycx = sfczkazdywyycx;
	}
	
	@Length(min=0, max=100, message="sfcsyhxx长度必须介于 0 和 100 之间")
	public String getSfcsyhxx() {
		return sfcsyhxx;
	}

	public void setSfcsyhxx(String sfcsyhxx) {
		this.sfcsyhxx = sfcsyhxx;
	}
	
	@Length(min=0, max=100, message="sfzcqtfwgn长度必须介于 0 和 100 之间")
	public String getSfzcqtfwgn() {
		return sfzcqtfwgn;
	}

	public void setSfzcqtfwgn(String sfzcqtfwgn) {
		this.sfzcqtfwgn = sfzcqtfwgn;
	}
	
	@Length(min=0, max=100, message="nbhxxpgys长度必须介于 0 和 100 之间")
	public String getNbhxxpgys() {
		return nbhxxpgys;
	}

	public void setNbhxxpgys(String nbhxxpgys) {
		this.nbhxxpgys = nbhxxpgys;
	}
	
	@Length(min=0, max=100, message="nbhxxpxh长度必须介于 0 和 100 之间")
	public String getNbhxxpxh() {
		return nbhxxpxh;
	}

	public void setNbhxxpxh(String nbhxxpxh) {
		this.nbhxxpxh = nbhxxpxh;
	}
	
	@Length(min=0, max=100, message="nbjdxpgys长度必须介于 0 和 100 之间")
	public String getNbjdxpgys() {
		return nbjdxpgys;
	}

	public void setNbjdxpgys(String nbjdxpgys) {
		this.nbjdxpgys = nbjdxpgys;
	}
	
	@Length(min=0, max=100, message="nbjdxpxh长度必须介于 0 和 100 之间")
	public String getNbjdxpxh() {
		return nbjdxpxh;
	}

	public void setNbjdxpxh(String nbjdxpxh) {
		this.nbjdxpxh = nbjdxpxh;
	}
	
	@Length(min=0, max=100, message="nbspxpgys长度必须介于 0 和 100 之间")
	public String getNbspxpgys() {
		return nbspxpgys;
	}

	public void setNbspxpgys(String nbspxpgys) {
		this.nbspxpgys = nbspxpgys;
	}
	
	@Length(min=0, max=100, message="nbspxpxh长度必须介于 0 和 100 之间")
	public String getNbspxpxh() {
		return nbspxpxh;
	}

	public void setNbspxpxh(String nbspxpxh) {
		this.nbspxpxh = nbspxpxh;
	}
	
	@Length(min=0, max=100, message="sfyczywyy长度必须介于 0 和 100 之间")
	public String getSfyczywyy() {
		return sfyczywyy;
	}

	public void setSfyczywyy(String sfyczywyy) {
		this.sfyczywyy = sfyczywyy;
	}

	public String getWxyw() {
		if(wxyw !=null){
			wxyw=wxyw.replaceAll(",", "|");
		}
		return wxyw;
	}

	public void setWxyw(String wxyw) {
		this.wxyw = wxyw;
	}

	public String getWxydzdlb() {
		return wxydzdlb;
	}

	public void setWxydzdlb(String wxydzdlb) {
		this.wxydzdlb = wxydzdlb;
	}

	public String getSfzcfwgn() {
		return sfzcfwgn;
	}

	public void setSfzcfwgn(String sfzcfwgn) {
		this.sfzcfwgn = sfzcfwgn;
	}

	public String getIpxy() {
		return ipxy;
	}

	public void setIpxy(String ipxy) {
		this.ipxy = ipxy;
	}
	
}
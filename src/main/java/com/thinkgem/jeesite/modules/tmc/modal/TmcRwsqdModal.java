package com.thinkgem.jeesite.modules.tmc.modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.thinkgem.jeesite.modules.taier.entity.TmcRwsqd;
import com.thinkgem.jeesite.modules.tmc.utils.DBConnectionUtils;

public class TmcRwsqdModal {

	public void save(TmcRwsqd rwsqd) throws SQLException{
		Connection conn=DBConnectionUtils.getConnection();
		String sql="INSERT INTO TMC9081.tmc_rwsqd("+
			"SJDW, SJDWDZ, SCC, SCCDZ, ZZSMC, ZZSDZ, CD, LXRMC, YDDH, CZ,"+
			" EMAIL, SBXH, JCLB, CSYJ, BGLX, YHSM, YHDBQZ, YHDBQZRQ, ZXSM, ZXRWSLYQZ,"+
			" ZXRWSLYQZRQ, BBXX, XXXX, BZ, READER, WRITER, PK1, SBMC, CCCSQH, BH,"+
			" DJ, EJDKXX, KCLX, SFZCCMMB, SFZCEGPRSGN, SFZCGPRSGN, SFZCGPSGN, SFZCLYGN, SFZCSYJGN, SFZCWAPI,"+
			" RJBBCXFS, RJBBH, YJBBH, EDJ, EDSRDY, FSGL, EDGL, FSPL, SCDL, SCDY,"+
			" ZDSRDY, SFFSJ, ZT, SQRQ, TYSM, JLSJ, SQFS, FSZS, SLBH, SBJC,"+
			" SFSC, GJWWBG, BGSM, JCLBO, SFBM, SFCWAPI, SBLB, GDH, XXLB, DRFS,"+
			" RWLY, DLS"+
		") VALUES ("+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?"+
		")";
		PreparedStatement ptmt=conn.prepareStatement(sql);
		ptmt.setString(1, rwsqd.getSjdw());
		ptmt.setString(2, rwsqd.getSjdwdz());
		ptmt.setString(3, rwsqd.getScc());
		ptmt.setString(4, rwsqd.getSccdz());
		ptmt.setString(5, rwsqd.getZzsmc());
		ptmt.setString(6, rwsqd.getZzsdz());
		ptmt.setString(7, rwsqd.getCd());
		ptmt.setString(8, rwsqd.getLxrmc());
		ptmt.setString(9, rwsqd.getYddh());
		ptmt.setString(10, rwsqd.getCz());
		ptmt.setString(11, rwsqd.getEmail());
		ptmt.setString(12, rwsqd.getSbxh());
		ptmt.setString(13, rwsqd.getJclb());
		ptmt.setString(14, rwsqd.getCsyj());
		ptmt.setString(15, rwsqd.getBglx());
		ptmt.setString(16, rwsqd.getYhsm());
		ptmt.setString(17, rwsqd.getYhdbqz());
		ptmt.setString(18, rwsqd.getYhdbqzrq());
		ptmt.setString(19, rwsqd.getZxsm());
		ptmt.setString(20, rwsqd.getZxrwslyqz());
		ptmt.setString(21, rwsqd.getZxrwslyqzrq());
		ptmt.setString(22, rwsqd.getBbxx());
		ptmt.setString(23, rwsqd.getXxxx());
		ptmt.setString(24, rwsqd.getBz());
		ptmt.setString(25, rwsqd.getReader());
		ptmt.setString(26, rwsqd.getWriter());
		ptmt.setString(27, rwsqd.getPk1());
		ptmt.setString(28, rwsqd.getSbmc());
		ptmt.setString(29, rwsqd.getCccsqh());
		ptmt.setString(30, rwsqd.getBh());
		ptmt.setString(31, rwsqd.getDj());
		ptmt.setString(32, rwsqd.getEjdkxx());
		ptmt.setString(33, rwsqd.getKclx());
		ptmt.setString(34, rwsqd.getSfzccmmb());
		ptmt.setString(35, rwsqd.getSfzcegprsgn());
		ptmt.setString(36, rwsqd.getSfzcgprsgn());
		ptmt.setString(37, rwsqd.getSfzcgpsgn());
		ptmt.setString(38, rwsqd.getSfzclygn());
		ptmt.setString(39, rwsqd.getSfzcsyjgn());
		ptmt.setString(40, rwsqd.getSfzcwapi());
		ptmt.setString(41, rwsqd.getRjbbcxfs());
		ptmt.setString(42, rwsqd.getRjbbh());
		ptmt.setString(43, rwsqd.getYjbbh());
		ptmt.setString(44, rwsqd.getEdj());
		ptmt.setString(45, rwsqd.getEdsrdy());
		ptmt.setString(46, rwsqd.getFsgl());
		ptmt.setString(47, rwsqd.getEdgl());
		ptmt.setString(48, rwsqd.getFspl());
		ptmt.setString(49, rwsqd.getScdl());
		ptmt.setString(50, rwsqd.getScdy());
		ptmt.setString(51, rwsqd.getZdsrdy());
		ptmt.setString(52, rwsqd.getSffsj());
		ptmt.setString(53, rwsqd.getZt());
		ptmt.setString(54, rwsqd.getSqrq());
		ptmt.setString(55, rwsqd.getTysm());
		ptmt.setString(56, rwsqd.getJlsj());
		ptmt.setString(57, rwsqd.getSqfs());
		ptmt.setString(58, rwsqd.getFszs());
		ptmt.setString(59, rwsqd.getSlbh());
		ptmt.setString(60, rwsqd.getSbjc());
		ptmt.setString(61, rwsqd.getSfsc());
		ptmt.setString(62, rwsqd.getGjwwbg());
		ptmt.setString(63, rwsqd.getBgsm());
		ptmt.setString(64, rwsqd.getJclbo());
		ptmt.setString(65, rwsqd.getSfbm());
		ptmt.setString(66, rwsqd.getSfcwapi());
		ptmt.setString(67, rwsqd.getSblb());
		ptmt.setString(68, rwsqd.getGdh());
		ptmt.setString(69, rwsqd.getXxlb());
		ptmt.setString(70, rwsqd.getDrfs());
		ptmt.setString(71, rwsqd.getRwly());
		ptmt.setString(72, rwsqd.getDls());
		
		ptmt.execute();
	}
	public void update(TmcRwsqd rwsqd) throws SQLException{
		Connection conn=DBConnectionUtils.getConnection();
		String sql="UPDATE TMC9081.tmc_rwsqd SET "+
			"SJDW=?, SJDWDZ=?, SCC=?, SCCDZ=?, ZZSMC=?, ZZSDZ=?, CD=?, LXRMC=?, YDDH=?, CZ=?,"+
			" EMAIL=?, SBXH=?, JCLB=?, CSYJ=?, BGLX=?, YHSM=?, YHDBQZ=?, YHDBQZRQ=?, ZXSM=?, ZXRWSLYQZ=?,"+
			" ZXRWSLYQZRQ=?, BBXX=?, XXXX=?, BZ=?, READER=?, WRITER=?,DLS=?, SBMC=?, CCCSQH=?, RWLY=?,"+
			" DJ=?, EJDKXX=?, KCLX=?, SFZCCMMB=?, SFZCEGPRSGN=?, SFZCGPRSGN=?, SFZCGPSGN=?, SFZCLYGN=?, SFZCSYJGN=?, SFZCWAPI=?,"+
			" RJBBCXFS=?, RJBBH=?, YJBBH=?, EDJ=?, EDSRDY=?, FSGL=?, EDGL=?, FSPL=?, SCDL=?, SCDY=?,"+
			" ZDSRDY=?, SFFSJ=?, ZT=?, SQRQ=?, TYSM=?, JLSJ=?, SQFS=?, FSZS=?, SLBH=?, SBJC=?,"+
			" SFSC=?, GJWWBG=?, BGSM=?, JCLBO=?, SFBM=?, SFCWAPI=?, SBLB=?, GDH=?, XXLB=?, DRFS=?"+
			"   WHERE pk1 = ?";
		PreparedStatement ptmt=conn.prepareStatement(sql);
		ptmt.setString(1, rwsqd.getSjdw());
		ptmt.setString(2, rwsqd.getSjdwdz());
		ptmt.setString(3, rwsqd.getScc());
		ptmt.setString(4, rwsqd.getSccdz());
		ptmt.setString(5, rwsqd.getZzsmc());
		ptmt.setString(6, rwsqd.getZzsdz());
		ptmt.setString(7, rwsqd.getCd());
		ptmt.setString(8, rwsqd.getLxrmc());
		ptmt.setString(9, rwsqd.getYddh());
		ptmt.setString(10, rwsqd.getCz());
		ptmt.setString(11, rwsqd.getEmail());
		ptmt.setString(12, rwsqd.getSbxh());
		ptmt.setString(13, rwsqd.getJclb());
		ptmt.setString(14, rwsqd.getCsyj());
		ptmt.setString(15, rwsqd.getBglx());
		ptmt.setString(16, rwsqd.getYhsm());
		ptmt.setString(17, rwsqd.getYhdbqz());
		ptmt.setString(18, rwsqd.getYhdbqzrq());
		ptmt.setString(19, rwsqd.getZxsm());
		ptmt.setString(20, rwsqd.getZxrwslyqz());
		ptmt.setString(21, rwsqd.getZxrwslyqzrq());
		ptmt.setString(22, rwsqd.getBbxx());
		ptmt.setString(23, rwsqd.getXxxx());
		ptmt.setString(24, rwsqd.getBz());
		ptmt.setString(25, rwsqd.getReader());
		ptmt.setString(26, rwsqd.getWriter());
		//ptmt.setString(27, rwsqd.getPk1());
		ptmt.setString(27, rwsqd.getDls());
		ptmt.setString(28, rwsqd.getSbmc());
		ptmt.setString(29, rwsqd.getCccsqh());
		ptmt.setString(30, rwsqd.getRwly());
		//ptmt.setString(30, rwsqd.getBh());
		ptmt.setString(31, rwsqd.getDj());
		ptmt.setString(32, rwsqd.getEjdkxx());
		ptmt.setString(33, rwsqd.getKclx());
		ptmt.setString(34, rwsqd.getSfzccmmb());
		ptmt.setString(35, rwsqd.getSfzcegprsgn());
		ptmt.setString(36, rwsqd.getSfzcgprsgn());
		ptmt.setString(37, rwsqd.getSfzcgpsgn());
		ptmt.setString(38, rwsqd.getSfzclygn());
		ptmt.setString(39, rwsqd.getSfzcsyjgn());
		ptmt.setString(40, rwsqd.getSfzcwapi());
		ptmt.setString(41, rwsqd.getRjbbcxfs());
		ptmt.setString(42, rwsqd.getRjbbh());
		ptmt.setString(43, rwsqd.getYjbbh());
		ptmt.setString(44, rwsqd.getEdj());
		ptmt.setString(45, rwsqd.getEdsrdy());
		ptmt.setString(46, rwsqd.getFsgl());
		ptmt.setString(47, rwsqd.getEdgl());
		ptmt.setString(48, rwsqd.getFspl());
		ptmt.setString(49, rwsqd.getScdl());
		ptmt.setString(50, rwsqd.getScdy());
		ptmt.setString(51, rwsqd.getZdsrdy());
		ptmt.setString(52, rwsqd.getSffsj());
		ptmt.setString(53, rwsqd.getZt());
		ptmt.setString(54, rwsqd.getSqrq());
		ptmt.setString(55, rwsqd.getTysm());
		ptmt.setString(56, rwsqd.getJlsj());
		ptmt.setString(57, rwsqd.getSqfs());
		ptmt.setString(58, rwsqd.getFszs());
		ptmt.setString(59, rwsqd.getSlbh());
		ptmt.setString(60, rwsqd.getSbjc());
		ptmt.setString(61, rwsqd.getSfsc());
		ptmt.setString(62, rwsqd.getGjwwbg());
		ptmt.setString(63, rwsqd.getBgsm());
		ptmt.setString(64, rwsqd.getJclbo());
		ptmt.setString(65, rwsqd.getSfbm());
		ptmt.setString(66, rwsqd.getSfcwapi());
		ptmt.setString(67, rwsqd.getSblb());
		ptmt.setString(68, rwsqd.getGdh());
		ptmt.setString(69, rwsqd.getXxlb());
		ptmt.setString(70, rwsqd.getDrfs());
		
		ptmt.setString(71, rwsqd.getPk1());
		ptmt.execute();
	}
	
}

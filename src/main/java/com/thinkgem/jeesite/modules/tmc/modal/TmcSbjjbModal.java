package com.thinkgem.jeesite.modules.tmc.modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.thinkgem.jeesite.modules.taier.entity.TmcSbjjb;
import com.thinkgem.jeesite.modules.tmc.utils.DBConnectionUtils;

public class TmcSbjjbModal {

	public void save(TmcSbjjb sbjjb) throws SQLException{
		Connection conn=DBConnectionUtils.getConnection();
		String sql="INSERT INTO TMC9081.tmc_sbjjb("+
			"QYMC, SBJC, SBXH, SYPDGSM, SYPDCDMA, SYPDWCDMA, SYPDWCDMAQT, SYPDCDMA2000, SYPDCDMA2000QT, SYPDTDSCDMA,"+
			" SYPDTDSCDMAQT, SYPDTDLTE, SYPDTDLTE41, SIM, UIMKC, DJFS, DJFSQT, HXXPZSL, SFZCTSFS, HXXPGYS,"+
			" HXXPXH, JDXPGYS, JDXPXH, SPXPGYS, SPXPXH, RJBB, RJBBCXZL, RJKFS, YJBB, YJBBCXZL,"+
			" YLXPWZ, YLWXPXH, YLWXPGN, CDMABB, CDMABBQT, CDMA2000BB, CDMA2000BBQT, WCDMABB, TDSCDMABB, TDLTEBB,"+
			" CZXT, CZXTQT, BBH, SFZNZD, GPRSGN, GPRSGNCLASS, HSDPAGNTDSCDMA, HSDPAGNTDSCDMAJRLB, HSDPAGNWCDMA, HSDPAGNWCDMAJRLB,"+
			" HSUPAGNTDSCDMA, HSUPAGNWCDMA, HSUPAGNWCDMAJRLB, LTECSNL, DTXCSMS, LTEZDYYMS, CDMA1XSFZCBCXD, CDMASJBMFS, DX, ZCDBCYW,"+
			" ZCDZZYW1, ZCDZZYW2, JJHJ, JJHJQT, CMMBGBSSJDS, EDGE, EDGECLASS, DCLX, DCXH, DCEDRL,"+
			" DCBCDY, DCSCCJ, DCZZS, QTPJ, DYSPQCDQXH, DYSPQCDQCD, DYSPQCDQSCC, DYSPQCDQZZS, DYSPQCDQCCCZSH, BZ,"+
			" READER, WRITER, PK1, KZGN, GLBH, SFZCTM5, SFZCTM8, SFZCYYHLDGSM, SFZCYYHLDTDSCDMA, GGZMS4,"+
			" GGZMSQT4, KCSL, SKGZMS, SKGZMSQT, ZDKS, ZDKSQT, GGZMSTYPE4, DXQT, BDLJFS, ZXSXGN,"+
			" BDLJFSQT, ZXSXGNSL, HSUPAGNTDSCDMAJRLB, LTEFDD, LTEFDDBB, ZCDZZYWWCDMASJ, ZCDZZYWWCDMAKSDH, ZCDZZYWTDSCDMA, DYSPQCDQSFBP, TTYH,"+
			" NBIOTPD, NBIOTYW, NBIOTBB, NBIOTCSNLDJ, WLWMZXH, WLWMZGYS, SFCZKAZDYWYYCX, SFCSYHXX, SFZCQTFWGN, NBHXXPGYS,"+
			" NBHXXPXH, NBJDXPGYS, NBJDXPXH, NBSPXPGYS, NBSPXPXH, SFYCZYWYY,WXYW ,WXYDZDLB ,SFZCFWGN,IPXY "+
		") VALUES ("+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?,?,?"+
		")";
		PreparedStatement ptmt=conn.prepareStatement(sql);
		ptmt.setString(1, sbjjb.getQymc());
		ptmt.setString(2, sbjjb.getSbjc());
		ptmt.setString(3, sbjjb.getSbxh());
		ptmt.setString(4, sbjjb.getSypdgsm());
		ptmt.setString(5, sbjjb.getSypdcdma());
		ptmt.setString(6, sbjjb.getSypdwcdma());
		ptmt.setString(7, sbjjb.getSypdwcdmaqt());
		ptmt.setString(8, sbjjb.getSypdcdma2000());
		ptmt.setString(9, sbjjb.getSypdcdma2000qt());
		ptmt.setString(10, sbjjb.getSypdtdscdma());
		ptmt.setString(11, sbjjb.getSypdtdscdmaqt());
		ptmt.setString(12, sbjjb.getSypdtdlte());
		ptmt.setString(13, sbjjb.getSypdtdlte41());
		ptmt.setString(14, sbjjb.getSim());
		ptmt.setString(15, sbjjb.getUimkc());
		ptmt.setString(16, sbjjb.getDjfs());
		ptmt.setString(17, sbjjb.getDjfsqt());
		ptmt.setString(18, sbjjb.getHxxpzsl());
		ptmt.setString(19, sbjjb.getSfzctsfs());
		ptmt.setString(20, sbjjb.getHxxpgys());
		ptmt.setString(21, sbjjb.getHxxpxh());
		ptmt.setString(22, sbjjb.getJdxpgys());
		ptmt.setString(23, sbjjb.getJdxpxh());
		ptmt.setString(24, sbjjb.getSpxpgys());
		ptmt.setString(25, sbjjb.getSpxpxh());
		ptmt.setString(26, sbjjb.getRjbb());
		ptmt.setString(27, sbjjb.getRjbbcxzl());
		ptmt.setString(28, sbjjb.getRjkfs());
		ptmt.setString(29, sbjjb.getYjbb());
		ptmt.setString(30, sbjjb.getYjbbcxzl());
		ptmt.setString(31, sbjjb.getYlxpwz());
		ptmt.setString(32, sbjjb.getYlwxpxh());
		ptmt.setString(33, sbjjb.getYlwxpgn());
		ptmt.setString(34, sbjjb.getCdmabb());
		ptmt.setString(35, sbjjb.getCdmabbqt());
		ptmt.setString(36, sbjjb.getCdma2000bb());
		ptmt.setString(37, sbjjb.getCdma2000bbqt());
		ptmt.setString(38, sbjjb.getWcdmabb());
		ptmt.setString(39, sbjjb.getTdscdmabb());
		ptmt.setString(40, sbjjb.getTdltebb());
		ptmt.setString(41, sbjjb.getCzxt());
		ptmt.setString(42, sbjjb.getCzxtqt());
		ptmt.setString(43, sbjjb.getBbh());
		ptmt.setString(44, sbjjb.getSfznzd());
		ptmt.setString(45, sbjjb.getGprsgn());
		ptmt.setString(46, sbjjb.getGprsgnclass());
		ptmt.setString(47, sbjjb.getHsdpagntdscdma());
		ptmt.setString(48, sbjjb.getHsdpagntdscdmajrlb());
		ptmt.setString(49, sbjjb.getHsdpagnwcdma());
		ptmt.setString(50, sbjjb.getHsdpagnwcdmajrlb());
		ptmt.setString(51, sbjjb.getHsupagntdscdma());
		ptmt.setString(52, sbjjb.getHsupagnwcdma());
		ptmt.setString(53, sbjjb.getHsupagnwcdmajrlb());
		ptmt.setString(54, sbjjb.getLtecsnl());
		ptmt.setString(55, sbjjb.getDtxcsms());
		ptmt.setString(56, sbjjb.getLtezdyyms());
		ptmt.setString(57, sbjjb.getCdma1xsfzcbcxd());
		ptmt.setString(58, sbjjb.getCdmasjbmfs());
		ptmt.setString(59, sbjjb.getDx());
		ptmt.setString(60, sbjjb.getZcdbcyw());
		ptmt.setString(61, sbjjb.getZcdzzyw1());
		ptmt.setString(62, sbjjb.getZcdzzyw2());
		ptmt.setString(63, sbjjb.getJjhj());
		ptmt.setString(64, sbjjb.getJjhjqt());
		ptmt.setString(65, sbjjb.getCmmbgbssjds());
		ptmt.setString(66, sbjjb.getEdge());
		ptmt.setString(67, sbjjb.getEdgeclass());
		ptmt.setString(68, sbjjb.getDclx());
		ptmt.setString(69, sbjjb.getDcxh());
		ptmt.setString(70, sbjjb.getDcedrl());
		ptmt.setString(71, sbjjb.getDcbcdy());
		ptmt.setString(72, sbjjb.getDcsccj());
		ptmt.setString(73, sbjjb.getDczzs());
		ptmt.setString(74, sbjjb.getQtpj());
		ptmt.setString(75, sbjjb.getDyspqcdqxh());
		ptmt.setString(76, sbjjb.getDyspqcdqcd());
		ptmt.setString(77, sbjjb.getDyspqcdqscc());
		ptmt.setString(78, sbjjb.getDyspqcdqzzs());
		ptmt.setString(79, sbjjb.getDyspqcdqccczsh());
		ptmt.setString(80, sbjjb.getBz());
		ptmt.setString(81, sbjjb.getReader());
		ptmt.setString(82, sbjjb.getWriter());
		ptmt.setString(83, sbjjb.getPk1());
		ptmt.setString(84, sbjjb.getKzgn());
		ptmt.setString(85, sbjjb.getGlbh());
		ptmt.setString(86, sbjjb.getSfzctm5());
		ptmt.setString(87, sbjjb.getSfzctm8());
		ptmt.setString(88, sbjjb.getSfzcyyhldgsm());
		ptmt.setString(89, sbjjb.getSfzcyyhldtdscdma());
		ptmt.setString(90, sbjjb.getGgzms4());
		ptmt.setString(91, sbjjb.getGgzmsqt4());
		ptmt.setString(92, sbjjb.getKcsl());
		ptmt.setString(93, sbjjb.getSkgzms());
		ptmt.setString(94, sbjjb.getSkgzmsqt());
		ptmt.setString(95, sbjjb.getZdks());
		ptmt.setString(96, sbjjb.getZdksqt());
		ptmt.setString(97, sbjjb.getGgzmstype4());
		ptmt.setString(98, sbjjb.getDxqt());
		ptmt.setString(99, sbjjb.getBdljfs());
		ptmt.setString(100, sbjjb.getZxsxgn());
		ptmt.setString(101, sbjjb.getBdljfsqt());
		ptmt.setString(102, sbjjb.getZxsxgnsl());
		ptmt.setString(103, sbjjb.getHsupagntdscdmajrlb());
		ptmt.setString(104, sbjjb.getLtefdd());
		ptmt.setString(105, sbjjb.getLtefddbb());
		ptmt.setString(106, sbjjb.getZcdzzywwcdmasj());
		ptmt.setString(107, sbjjb.getZcdzzywwcdmaksdh());
		ptmt.setString(108, sbjjb.getZcdzzywtdscdma());
		ptmt.setString(109, sbjjb.getDyspqcdqsfbp());
		ptmt.setString(110, sbjjb.getTtyh());
		ptmt.setString(111, sbjjb.getNbiotpd());
		ptmt.setString(112, sbjjb.getNbiotyw());
		ptmt.setString(113, sbjjb.getNbiotbb());
		ptmt.setString(114, sbjjb.getNbiotcsnldj());
		ptmt.setString(115, sbjjb.getWlwmzxh());
		ptmt.setString(116, sbjjb.getWlwmzgys());
		ptmt.setString(117, sbjjb.getSfczkazdywyycx());
		ptmt.setString(118, sbjjb.getSfcsyhxx());
		ptmt.setString(119, sbjjb.getSfzcqtfwgn());
		ptmt.setString(120, sbjjb.getNbhxxpgys());
		ptmt.setString(121, sbjjb.getNbhxxpxh());
		ptmt.setString(122, sbjjb.getNbjdxpgys());
		ptmt.setString(123, sbjjb.getNbjdxpxh());
		ptmt.setString(124, sbjjb.getNbspxpgys());
		ptmt.setString(125, sbjjb.getNbspxpxh());
		ptmt.setString(126, sbjjb.getSfyczywyy());
		ptmt.setString(127, sbjjb.getWxyw());
		ptmt.setString(128, sbjjb.getWxydzdlb());
		ptmt.setString(129, sbjjb.getSfzcfwgn());
		ptmt.setString(130, sbjjb.getIpxy());
		ptmt.execute();
	}
	public void update(TmcSbjjb sbjjb) throws SQLException{
		Connection conn=DBConnectionUtils.getConnection();
		String sql="UPDATE TMC9081.tmc_sbjjb SET "+
			"QYMC=?, SBJC=?, SBXH=?, SYPDGSM=?, SYPDCDMA=?, SYPDWCDMA=?, SYPDWCDMAQT=?, SYPDCDMA2000=?, SYPDCDMA2000QT=?, SYPDTDSCDMA=?,"+
			" SYPDTDSCDMAQT=?, SYPDTDLTE=?, SYPDTDLTE41=?, SIM=?, UIMKC=?, DJFS=?, DJFSQT=?, HXXPZSL=?, SFZCTSFS=?, HXXPGYS=?,"+
			" HXXPXH=?, JDXPGYS=?, JDXPXH=?, SPXPGYS=?, SPXPXH=?, RJBB=?, RJBBCXZL=?, RJKFS=?, YJBB=?, YJBBCXZL=?,"+
			" YLXPWZ=?, YLWXPXH=?, YLWXPGN=?, CDMABB=?, CDMABBQT=?, CDMA2000BB=?, CDMA2000BBQT=?, WCDMABB=?, TDSCDMABB=?, TDLTEBB=?,"+
			" CZXT=?, CZXTQT=?, BBH=?, SFZNZD=?, GPRSGN=?, GPRSGNCLASS=?, HSDPAGNTDSCDMA=?, HSDPAGNTDSCDMAJRLB=?, HSDPAGNWCDMA=?, HSDPAGNWCDMAJRLB=?,"+
			" HSUPAGNTDSCDMA=?, HSUPAGNWCDMA=?, HSUPAGNWCDMAJRLB=?, LTECSNL=?, DTXCSMS=?, LTEZDYYMS=?, CDMA1XSFZCBCXD=?, CDMASJBMFS=?, DX=?, ZCDBCYW=?,"+
			" ZCDZZYW1=?, ZCDZZYW2=?, JJHJ=?, JJHJQT=?, CMMBGBSSJDS=?, EDGE=?, EDGECLASS=?, DCLX=?, DCXH=?, DCEDRL=?,"+
			" DCBCDY=?, DCSCCJ=?, DCZZS=?, QTPJ=?, DYSPQCDQXH=?, DYSPQCDQCD=?, DYSPQCDQSCC=?, DYSPQCDQZZS=?, DYSPQCDQCCCZSH=?, BZ=?,"+
			" READER=?, WRITER=?, SFZCFWGN=?, KZGN=?, IPXY=?, SFZCTM5=?, SFZCTM8=?, SFZCYYHLDGSM=?, SFZCYYHLDTDSCDMA=?, GGZMS4=?,"+
			" GGZMSQT4=?, KCSL=?, SKGZMS=?, SKGZMSQT=?, ZDKS=?, ZDKSQT=?, GGZMSTYPE4=?, DXQT=?, BDLJFS=?, ZXSXGN=?,"+
			" BDLJFSQT=?, ZXSXGNSL=?, HSUPAGNTDSCDMAJRLB=?, LTEFDD=?, LTEFDDBB=?, ZCDZZYWWCDMASJ=?, ZCDZZYWWCDMAKSDH=?, ZCDZZYWTDSCDMA=?, DYSPQCDQSFBP=?, TTYH=?,"+
			" NBIOTPD=?, NBIOTYW=?, NBIOTBB=?, NBIOTCSNLDJ=?, WLWMZXH=?, WLWMZGYS=?, SFCZKAZDYWYYCX=?, SFCSYHXX=?, SFZCQTFWGN=?, NBHXXPGYS=?,"+
			" NBHXXPXH=?, NBJDXPGYS=?, NBJDXPXH=?, NBSPXPGYS=?, NBSPXPXH=?, SFYCZYWYY=?,WXYW =?,WXYDZDLB=? WHERE pk1 = ? ";
		PreparedStatement ptmt=conn.prepareStatement(sql);
		ptmt.setString(1, sbjjb.getQymc());
		ptmt.setString(2, sbjjb.getSbjc());
		ptmt.setString(3, sbjjb.getSbxh());
		ptmt.setString(4, sbjjb.getSypdgsm());
		ptmt.setString(5, sbjjb.getSypdcdma());
		ptmt.setString(6, sbjjb.getSypdwcdma());
		ptmt.setString(7, sbjjb.getSypdwcdmaqt());
		ptmt.setString(8, sbjjb.getSypdcdma2000());
		ptmt.setString(9, sbjjb.getSypdcdma2000qt());
		ptmt.setString(10, sbjjb.getSypdtdscdma());
		ptmt.setString(11, sbjjb.getSypdtdscdmaqt());
		ptmt.setString(12, sbjjb.getSypdtdlte());
		ptmt.setString(13, sbjjb.getSypdtdlte41());
		ptmt.setString(14, sbjjb.getSim());
		ptmt.setString(15, sbjjb.getUimkc());
		ptmt.setString(16, sbjjb.getDjfs());
		ptmt.setString(17, sbjjb.getDjfsqt());
		ptmt.setString(18, sbjjb.getHxxpzsl());
		ptmt.setString(19, sbjjb.getSfzctsfs());
		ptmt.setString(20, sbjjb.getHxxpgys());
		ptmt.setString(21, sbjjb.getHxxpxh());
		ptmt.setString(22, sbjjb.getJdxpgys());
		ptmt.setString(23, sbjjb.getJdxpxh());
		ptmt.setString(24, sbjjb.getSpxpgys());
		ptmt.setString(25, sbjjb.getSpxpxh());
		ptmt.setString(26, sbjjb.getRjbb());
		ptmt.setString(27, sbjjb.getRjbbcxzl());
		ptmt.setString(28, sbjjb.getRjkfs());
		ptmt.setString(29, sbjjb.getYjbb());
		ptmt.setString(30, sbjjb.getYjbbcxzl());
		ptmt.setString(31, sbjjb.getYlxpwz());
		ptmt.setString(32, sbjjb.getYlwxpxh());
		ptmt.setString(33, sbjjb.getYlwxpgn());
		ptmt.setString(34, sbjjb.getCdmabb());
		ptmt.setString(35, sbjjb.getCdmabbqt());
		ptmt.setString(36, sbjjb.getCdma2000bb());
		ptmt.setString(37, sbjjb.getCdma2000bbqt());
		ptmt.setString(38, sbjjb.getWcdmabb());
		ptmt.setString(39, sbjjb.getTdscdmabb());
		ptmt.setString(40, sbjjb.getTdltebb());
		ptmt.setString(41, sbjjb.getCzxt());
		ptmt.setString(42, sbjjb.getCzxtqt());
		ptmt.setString(43, sbjjb.getBbh());
		ptmt.setString(44, sbjjb.getSfznzd());
		ptmt.setString(45, sbjjb.getGprsgn());
		ptmt.setString(46, sbjjb.getGprsgnclass());
		ptmt.setString(47, sbjjb.getHsdpagntdscdma());
		ptmt.setString(48, sbjjb.getHsdpagntdscdmajrlb());
		ptmt.setString(49, sbjjb.getHsdpagnwcdma());
		ptmt.setString(50, sbjjb.getHsdpagnwcdmajrlb());
		ptmt.setString(51, sbjjb.getHsupagntdscdma());
		ptmt.setString(52, sbjjb.getHsupagnwcdma());
		ptmt.setString(53, sbjjb.getHsupagnwcdmajrlb());
		ptmt.setString(54, sbjjb.getLtecsnl());
		ptmt.setString(55, sbjjb.getDtxcsms());
		ptmt.setString(56, sbjjb.getLtezdyyms());
		ptmt.setString(57, sbjjb.getCdma1xsfzcbcxd());
		ptmt.setString(58, sbjjb.getCdmasjbmfs());
		ptmt.setString(59, sbjjb.getDx());
		ptmt.setString(60, sbjjb.getZcdbcyw());
		ptmt.setString(61, sbjjb.getZcdzzyw1());
		ptmt.setString(62, sbjjb.getZcdzzyw2());
		ptmt.setString(63, sbjjb.getJjhj());
		ptmt.setString(64, sbjjb.getJjhjqt());
		ptmt.setString(65, sbjjb.getCmmbgbssjds());
		ptmt.setString(66, sbjjb.getEdge());
		ptmt.setString(67, sbjjb.getEdgeclass());
		ptmt.setString(68, sbjjb.getDclx());
		ptmt.setString(69, sbjjb.getDcxh());
		ptmt.setString(70, sbjjb.getDcedrl());
		ptmt.setString(71, sbjjb.getDcbcdy());
		ptmt.setString(72, sbjjb.getDcsccj());
		ptmt.setString(73, sbjjb.getDczzs());
		ptmt.setString(74, sbjjb.getQtpj());
		ptmt.setString(75, sbjjb.getDyspqcdqxh());
		ptmt.setString(76, sbjjb.getDyspqcdqcd());
		ptmt.setString(77, sbjjb.getDyspqcdqscc());
		ptmt.setString(78, sbjjb.getDyspqcdqzzs());
		ptmt.setString(79, sbjjb.getDyspqcdqccczsh());
		ptmt.setString(80, sbjjb.getBz());
		ptmt.setString(81, sbjjb.getReader());
		ptmt.setString(82, sbjjb.getWriter());
		//ptmt.setString(83, sbjjb.getPk1());
		ptmt.setString(83, sbjjb.getSfzcfwgn());
		ptmt.setString(84, sbjjb.getKzgn());
		//ptmt.setString(85, sbjjb.getGlbh());
		ptmt.setString(85, sbjjb.getIpxy());
		ptmt.setString(86, sbjjb.getSfzctm5());
		ptmt.setString(87, sbjjb.getSfzctm8());
		ptmt.setString(88, sbjjb.getSfzcyyhldgsm());
		ptmt.setString(89, sbjjb.getSfzcyyhldtdscdma());
		ptmt.setString(90, sbjjb.getGgzms4());
		ptmt.setString(91, sbjjb.getGgzmsqt4());
		ptmt.setString(92, sbjjb.getKcsl());
		ptmt.setString(93, sbjjb.getSkgzms());
		ptmt.setString(94, sbjjb.getSkgzmsqt());
		ptmt.setString(95, sbjjb.getZdks());
		ptmt.setString(96, sbjjb.getZdksqt());
		ptmt.setString(97, sbjjb.getGgzmstype4());
		ptmt.setString(98, sbjjb.getDxqt());
		ptmt.setString(99, sbjjb.getBdljfs());
		ptmt.setString(100, sbjjb.getZxsxgn());
		ptmt.setString(101, sbjjb.getBdljfsqt());
		ptmt.setString(102, sbjjb.getZxsxgnsl());
		ptmt.setString(103, sbjjb.getHsupagntdscdmajrlb());
		ptmt.setString(104, sbjjb.getLtefdd());
		ptmt.setString(105, sbjjb.getLtefddbb());
		ptmt.setString(106, sbjjb.getZcdzzywwcdmasj());
		ptmt.setString(107, sbjjb.getZcdzzywwcdmaksdh());
		ptmt.setString(108, sbjjb.getZcdzzywtdscdma());
		ptmt.setString(109, sbjjb.getDyspqcdqsfbp());
		ptmt.setString(110, sbjjb.getTtyh());
		ptmt.setString(111, sbjjb.getNbiotpd());
		ptmt.setString(112, sbjjb.getNbiotyw());
		ptmt.setString(113, sbjjb.getNbiotbb());
		ptmt.setString(114, sbjjb.getNbiotcsnldj());
		ptmt.setString(115, sbjjb.getWlwmzxh());
		ptmt.setString(116, sbjjb.getWlwmzgys());
		ptmt.setString(117, sbjjb.getSfczkazdywyycx());
		ptmt.setString(118, sbjjb.getSfcsyhxx());
		ptmt.setString(119, sbjjb.getSfzcqtfwgn());
		ptmt.setString(120, sbjjb.getNbhxxpgys());
		ptmt.setString(121, sbjjb.getNbhxxpxh());
		ptmt.setString(122, sbjjb.getNbjdxpgys());
		ptmt.setString(123, sbjjb.getNbjdxpxh());
		ptmt.setString(124, sbjjb.getNbspxpgys());
		ptmt.setString(125, sbjjb.getNbspxpxh());
		ptmt.setString(126, sbjjb.getSfyczywyy());
		ptmt.setString(127, sbjjb.getWxyw());
		ptmt.setString(128, sbjjb.getWxydzdlb());
		ptmt.setString(129, sbjjb.getPk1());
		
		ptmt.execute();
	}
}

package com.thinkgem.jeesite.modules.tmc.modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.thinkgem.jeesite.modules.taier.entity.Aqyqjlb;
import com.thinkgem.jeesite.modules.tmc.utils.DBConnectionUtils;

public class AqyqjlbModal {

	public void save(Aqyqjlb aqyqjlb) throws SQLException{
		Connection conn=DBConnectionUtils.getConnection();
		String sql="INSERT INTO TMC9081.aqyqjlb("+
			"mc,xh,clygg,zzs,scc,rzxx,bz,reader,writer,pk1,"+
			"glpk,sfqr,xhh,wh,bjh,pxh,dclx,cslx"+
		") VALUES ("+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?,?,?"+
		")";
		PreparedStatement ptmt=conn.prepareStatement(sql);
		ptmt.setString(1, aqyqjlb.getMc());
		ptmt.setString(2, aqyqjlb.getXh());
		ptmt.setString(3, aqyqjlb.getClygg());
		ptmt.setString(4, aqyqjlb.getZzs());
		ptmt.setString(5, aqyqjlb.getScc());
		ptmt.setString(6, aqyqjlb.getRzxx());
		ptmt.setString(7, aqyqjlb.getBz());
		ptmt.setString(8, aqyqjlb.getReader());
		ptmt.setString(9, aqyqjlb.getWriter());
		ptmt.setString(10, aqyqjlb.getPk1());
		ptmt.setString(11, aqyqjlb.getGlpk());
		ptmt.setString(12, aqyqjlb.getSfqr());
		ptmt.setString(13, aqyqjlb.getXhh());
		ptmt.setString(14, aqyqjlb.getWh());
		ptmt.setString(15, aqyqjlb.getBjh());
		ptmt.setString(16, aqyqjlb.getPxh());
		ptmt.setString(17, aqyqjlb.getDclx());
		ptmt.setString(18, aqyqjlb.getCslx());
		ptmt.execute();
	}
	public void update(Aqyqjlb aqyqjlb) throws SQLException{
		Connection conn=DBConnectionUtils.getConnection();
		String sql="UPDATE TMC9081.aqyqjlb SET "+
			"mc=?,xh=?,clygg=?,zzs=?,scc=?,rzxx=?,bz=?,reader=?,writer=?,cslx=?,"+
			"dclx=?,sfqr=?,xhh=?,wh=?,bjh=?,pxh=? WHERE pk1 = ?";
		
		PreparedStatement ptmt=conn.prepareStatement(sql);
		ptmt.setString(1, aqyqjlb.getMc());
		ptmt.setString(2, aqyqjlb.getXh());
		ptmt.setString(3, aqyqjlb.getClygg());
		ptmt.setString(4, aqyqjlb.getZzs());
		ptmt.setString(5, aqyqjlb.getScc());
		ptmt.setString(6, aqyqjlb.getRzxx());
		ptmt.setString(7, aqyqjlb.getBz());
		ptmt.setString(8, aqyqjlb.getReader());
		ptmt.setString(9, aqyqjlb.getWriter());
		//ptmt.setString(10, aqyqjlb.getPk1());
		ptmt.setString(10, aqyqjlb.getCslx());
		ptmt.setString(11, aqyqjlb.getDclx());
		//ptmt.setString(11, aqyqjlb.getGlpk());
		ptmt.setString(12, aqyqjlb.getSfqr());
		ptmt.setString(13, aqyqjlb.getXhh());
		ptmt.setString(14, aqyqjlb.getWh());
		ptmt.setString(15, aqyqjlb.getBjh());
		ptmt.setString(16, aqyqjlb.getPxh());
		ptmt.setString(17, aqyqjlb.getPk1());
		
		ptmt.execute();
	}
	public void deleteByGlpk(Aqyqjlb aqyqjlbDel) throws SQLException {
		
		Connection conn=DBConnectionUtils.getConnection();
		String sql="DELETE FROM aqyqjlb"+
				"WHERE glpk ="+aqyqjlbDel.getGlpk();
		Statement stmt =conn.createStatement();
		stmt.executeQuery(sql);
		
	}
}

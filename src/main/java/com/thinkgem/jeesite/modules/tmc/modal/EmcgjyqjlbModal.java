package com.thinkgem.jeesite.modules.tmc.modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.thinkgem.jeesite.modules.taier.entity.Emcgjyqjlb;
import com.thinkgem.jeesite.modules.tmc.utils.DBConnectionUtils;

public class EmcgjyqjlbModal {

	public void save(Emcgjyqjlb emcgjyqjlb) throws SQLException{
		Connection conn=DBConnectionUtils.getConnection();
		String sql="INSERT INTO TMC9081.emcgjyqjlb("+
			"gjjmc,xh,gg,scc,bz,reader,writer,pk1,glpk,sfqr,"+
			"wh,scqy,sybz,xhh,zzs,lx"+
		") VALUES ("+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?,?,?,?"+
		")";
		PreparedStatement ptmt=conn.prepareStatement(sql);
		ptmt.setString(1, emcgjyqjlb.getGjjmc());
		ptmt.setString(2, emcgjyqjlb.getXh());
		ptmt.setString(3, emcgjyqjlb.getGg());
		ptmt.setString(4, emcgjyqjlb.getScc());
		ptmt.setString(5, emcgjyqjlb.getBz());
		ptmt.setString(6, emcgjyqjlb.getReader());
		ptmt.setString(7, emcgjyqjlb.getWriter());
		ptmt.setString(8, emcgjyqjlb.getPk1());
		ptmt.setString(9, emcgjyqjlb.getGlpk());
		ptmt.setString(10, emcgjyqjlb.getSfqr());
		ptmt.setString(11, emcgjyqjlb.getWh());
		ptmt.setString(12, emcgjyqjlb.getScqy());
		ptmt.setString(13, emcgjyqjlb.getSybz());
		ptmt.setString(14, emcgjyqjlb.getXhh());
		ptmt.setString(15, emcgjyqjlb.getZzs());
		ptmt.setString(16, emcgjyqjlb.getLx());
		ptmt.execute();
	}
	
	public void update(Emcgjyqjlb emcgjyqjlb) throws SQLException{
		Connection conn=DBConnectionUtils.getConnection();
		String sql="UPDATE TMC9081.emcgjyqjlb SET "+
			"gjjmc=?,xh=?,gg=?,scc=?,bz=?,reader=?,writer=?,lx=?,zzs=?,sfqr=?,"+
			"wh=?,scqy=?,sybz=?,xhh=? WHERE pk1 = ?";
		PreparedStatement ptmt=conn.prepareStatement(sql);
		ptmt.setString(1, emcgjyqjlb.getGjjmc());
		ptmt.setString(2, emcgjyqjlb.getXh());
		ptmt.setString(3, emcgjyqjlb.getGg());
		ptmt.setString(4, emcgjyqjlb.getScc());
		ptmt.setString(5, emcgjyqjlb.getBz());
		ptmt.setString(6, emcgjyqjlb.getReader());
		ptmt.setString(7, emcgjyqjlb.getWriter());
		//ptmt.setString(8, emcgjyqjlb.getPk1());
		ptmt.setString(8, emcgjyqjlb.getLx());
		//ptmt.setString(9, emcgjyqjlb.getGlpk());
		ptmt.setString(9, emcgjyqjlb.getZzs());
		ptmt.setString(10, emcgjyqjlb.getSfqr());
		ptmt.setString(11, emcgjyqjlb.getWh());
		ptmt.setString(12, emcgjyqjlb.getScqy());
		ptmt.setString(13, emcgjyqjlb.getSybz());
		ptmt.setString(14, emcgjyqjlb.getXhh());
		ptmt.setString(15, emcgjyqjlb.getPk1());
		
		ptmt.execute();
	}

	public void deleteByGlpk(Emcgjyqjlb emcgjyqjlbDel) throws SQLException {
		
		Connection conn=DBConnectionUtils.getConnection();
		String sql="DELETE FROM emcgjyqjlb"+
				"WHERE glpk ="+emcgjyqjlbDel.getGlpk();
		Statement stmt =conn.createStatement();
		stmt.executeQuery(sql);
		
	}
}

package com.thinkgem.jeesite.modules.tmc.modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.thinkgem.jeesite.modules.taier.entity.TmcBgqrzb;
import com.thinkgem.jeesite.modules.tmc.utils.DBConnectionUtils;

public class TmcBgqrzbModal {

	public void save(TmcBgqrzb bgqrzb) throws SQLException{
		Connection conn=DBConnectionUtils.getConnection();
		String sql="INSERT INTO TMC9081.tmc_bgqrzb("+
			"gdh,xh,mc,bgq,bgh,glpk1,bm,reader,writer,pk1,lx"+
		") VALUES ("+
			"?,?,?,?,?,?,?,?,?,?,?"+
		")";
		PreparedStatement ptmt=conn.prepareStatement(sql);
		ptmt.setString(1, bgqrzb.getGdh());
		ptmt.setString(2, bgqrzb.getXh());
		ptmt.setString(3, bgqrzb.getMc());
		ptmt.setString(4, bgqrzb.getBgq());
		ptmt.setString(5, bgqrzb.getBgh());
		ptmt.setString(6, bgqrzb.getGlpk1());
		ptmt.setString(7, bgqrzb.getBm());
		ptmt.setString(8, bgqrzb.getReader());
		ptmt.setString(9, bgqrzb.getWriter());
		ptmt.setString(10, bgqrzb.getPk1());
		ptmt.setString(11, bgqrzb.getLx());
		ptmt.execute();
	}
	public void update(TmcBgqrzb bgqrzb) throws SQLException{
		Connection conn=DBConnectionUtils.getConnection();
		String sql="UPDATE TMC9081.tmc_bgqrzb SET"+
			"lx=?,xh=?,mc=?,bgq=?,bgh=?,glpk1=?,bm=?,reader=?,writer=? WHERE pk1 = ?";
		PreparedStatement ptmt=conn.prepareStatement(sql);
		ptmt.setString(1, bgqrzb.getLx());
		//ptmt.setString(1, bgqrzb.getGdh());
		ptmt.setString(2, bgqrzb.getXh());
		ptmt.setString(3, bgqrzb.getMc());
		ptmt.setString(4, bgqrzb.getBgq());
		ptmt.setString(5, bgqrzb.getBgh());
		ptmt.setString(6, bgqrzb.getGlpk1());
		ptmt.setString(7, bgqrzb.getBm());
		ptmt.setString(8, bgqrzb.getReader());
		ptmt.setString(9, bgqrzb.getWriter());
		ptmt.setString(10, bgqrzb.getPk1());
		
		ptmt.execute();
	}
	public void deleteByGdh(TmcBgqrzb tmcBgqrzbDel) throws SQLException {
		
		Connection conn=DBConnectionUtils.getConnection();
		String sql="DELETE FROM tmc_bgqrzb"+
				"WHERE gdh = "+tmcBgqrzbDel.getGdh();
		Statement stmt =conn.createStatement();
		stmt.executeQuery(sql);
		
	}
}

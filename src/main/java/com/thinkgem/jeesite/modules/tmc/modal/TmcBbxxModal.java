package com.thinkgem.jeesite.modules.tmc.modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.thinkgem.jeesite.modules.taier.entity.TmcBbxx;
import com.thinkgem.jeesite.modules.tmc.utils.DBConnectionUtils;

public class TmcBbxxModal {

	public void save(TmcBbxx bbxx) throws SQLException{
		Connection conn=DBConnectionUtils.getConnection();
		String sql="INSERT INTO TMC9081.tmc_bbxx("+
			"cxfs,rjbbh,yjbbh,bh,reader,writer,pk1"+
		") VALUES ("+
			"?,?,?,?,?,?,?"+
		")";
		PreparedStatement ptmt=conn.prepareStatement(sql);
		ptmt.setString(1, bbxx.getCxfs());
		ptmt.setString(2, bbxx.getRjbbh());
		ptmt.setString(3, bbxx.getYjbbh());
		ptmt.setString(4, bbxx.getBh());
		ptmt.setString(5, bbxx.getReader());
		ptmt.setString(6, bbxx.getWriter());
		ptmt.setString(7, bbxx.getPk1());
		ptmt.execute();
	}

	public void update(TmcBbxx bbxx) throws SQLException {
		Connection conn=DBConnectionUtils.getConnection();
		String sql="UPDATE TMC9081.tmc_bbxx SET "+
			"cxfs=?,rjbbh=?,yjbbh=?,writer=?,reader=? WHERE pk1 = ?";
		Statement stmt =conn.createStatement();
		stmt.executeQuery(sql);
		
	}
}

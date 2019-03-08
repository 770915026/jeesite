package com.thinkgem.jeesite.modules.tmc.modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.thinkgem.jeesite.modules.taier.entity.TmcDc;
import com.thinkgem.jeesite.modules.tmc.utils.DBConnectionUtils;

public class TmcDcModal {

	public void save(TmcDc dc) throws SQLException{
		Connection conn=DBConnectionUtils.getConnection();
		String sql="INSERT INTO TMC9081.tmc_dc("+
			"bh,xh,cd,bcdy,rl,scc,zzs,reader,writer,pk1"+
		") VALUES ("+
			"?,?,?,?,?,?,?,?,?,?"+
		")";
		PreparedStatement ptmt=conn.prepareStatement(sql);
		ptmt.setString(1, dc.getBh());
		ptmt.setString(2, dc.getXh());
		ptmt.setString(3, dc.getCd());
		ptmt.setString(4, dc.getBcdy());
		ptmt.setString(5, dc.getRl());
		ptmt.setString(6, dc.getScc());
		ptmt.setString(7, dc.getZzs());
		ptmt.setString(8, dc.getReader());
		ptmt.setString(9, dc.getWriter());
		ptmt.setString(10, dc.getPk1());
		ptmt.execute();
	}

	public void update(TmcDc tmcDc) throws SQLException {

		Connection conn=DBConnectionUtils.getConnection();
		String sql="UPDATE TMC9081.tmc_dc SET"+
			"writer=?,xh=?,cd=?,bcdy=?,rl=?,scc=?,zzs=?,reader=? WHERE pk1 = ?";
		Statement stmt =conn.createStatement();
		stmt.executeQuery(sql);
		
	}
}

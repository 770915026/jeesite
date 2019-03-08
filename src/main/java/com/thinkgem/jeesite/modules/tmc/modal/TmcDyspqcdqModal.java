package com.thinkgem.jeesite.modules.tmc.modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.thinkgem.jeesite.modules.taier.entity.TmcDyspqcdq;
import com.thinkgem.jeesite.modules.tmc.utils.DBConnectionUtils;

public class TmcDyspqcdqModal {

	public void save(TmcDyspqcdq dyspqcdq) throws SQLException{
		Connection conn=DBConnectionUtils.getConnection();
		String sql="INSERT INTO TMC9081.tmc_dyspqcdq("+
			"bh,xh,cd,scc,zzs,zsh,reader,writer,pk1"+
		") VALUES ("+
			"?,?,?,?,?,?,?,?,?"+
		")";
		PreparedStatement ptmt=conn.prepareStatement(sql);
		ptmt.setString(1, dyspqcdq.getBh());
		ptmt.setString(2, dyspqcdq.getXh());
		ptmt.setString(3, dyspqcdq.getCd());
		ptmt.setString(4, dyspqcdq.getScc());
		ptmt.setString(5, dyspqcdq.getZzs());
		ptmt.setString(6, dyspqcdq.getZsh());
		ptmt.setString(7, dyspqcdq.getReader());
		ptmt.setString(8, dyspqcdq.getWriter());
		ptmt.setString(9, dyspqcdq.getPk1());
		ptmt.execute();
	}

	public void update(TmcDyspqcdq tmcDyspqcdq) throws SQLException {
		Connection conn=DBConnectionUtils.getConnection();
		String sql="UPDATE TMC9081.tmc_dyspqcdq SET "+
			"writer=?,xh=?,cd=?,scc=?,zzs=?,zsh=?,reader=? WHERE pk1 = ?";
		Statement stmt =conn.createStatement();
		stmt.executeQuery(sql);
		
	}
}

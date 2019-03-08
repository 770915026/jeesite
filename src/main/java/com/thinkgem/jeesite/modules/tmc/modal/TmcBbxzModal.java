package com.thinkgem.jeesite.modules.tmc.modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.thinkgem.jeesite.modules.taier.entity.TmcBbxz;
import com.thinkgem.jeesite.modules.tmc.utils.DBConnectionUtils;

public class TmcBbxzModal {

	public void save(TmcBbxz bbxz) throws SQLException{
		Connection conn=DBConnectionUtils.getConnection();
		String sql="UPDATE TMC9081.tmc_bbxz SET"+
			"reader=?,writer=?,yswjm=?,cjr=?,wjm=?,scr=?,scsj=?,wjjpk1=?,wjlj=? WHERE pk1 = ?";
		PreparedStatement ptmt=conn.prepareStatement(sql);
		ptmt.setString(1, bbxz.getReader());
		ptmt.setString(2, bbxz.getWriter());
		ptmt.setString(3, bbxz.getYswjm());
		ptmt.setString(4, bbxz.getCjr());
		//ptmt.setString(5, bbxz.getGlpk1());
		ptmt.setString(5, bbxz.getWjm());
		ptmt.setString(6, bbxz.getScr());
		ptmt.setString(7, bbxz.getScsj());
		ptmt.setString(8, bbxz.getWjjpk1());
		ptmt.setString(9, bbxz.getWjlj());
		
		
		ptmt.setString(10, bbxz.getPk1());
		ptmt.execute();
	}

	public void deleteByGlpk1(TmcBbxz tmcBbxzDel) throws SQLException {
		Connection conn=DBConnectionUtils.getConnection();
		String sql="DELETE FROM tmc_bbxz"+
				"WHERE glpk1="+tmcBbxzDel.getGlpk1();
		Statement stmt =conn.createStatement();
		stmt.executeQuery(sql);
	}
}

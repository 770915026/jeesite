package com.thinkgem.jeesite.modules.tmc.modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.thinkgem.jeesite.modules.taier.entity.TmcBgqrb;
import com.thinkgem.jeesite.modules.tmc.utils.DBConnectionUtils;

public class TmcBgqrbModal {

	public void save(TmcBgqrb bgqrb) throws SQLException{
		Connection conn=DBConnectionUtils.getConnection();
		String sql="INSERT INTO TMC9081.tmc_bgqrb("+
			"bgjl,gdh,reader,writer,pk1,bm,sqdw,sqxh,sqbh,yccczsh,"+
			"ycccbgh,ycccsqh,bz"+
		") VALUES ("+
			"?,?,?,?,?,?,?,?,?,?,"+
			"?,?,?"+
		")";
		PreparedStatement ptmt=conn.prepareStatement(sql);
		ptmt.setString(1, bgqrb.getBgjl());
		ptmt.setString(2, bgqrb.getGdh());
		ptmt.setString(3, bgqrb.getReader());
		ptmt.setString(4, bgqrb.getWriter());
		ptmt.setString(5, bgqrb.getPk1());
		ptmt.setString(6, bgqrb.getBm());
		ptmt.setString(7, bgqrb.getSqdw());
		ptmt.setString(8, bgqrb.getSqxh());
		ptmt.setString(9, bgqrb.getSqbh());
		ptmt.setString(10, bgqrb.getYccczsh());
		ptmt.setString(11, bgqrb.getYcccbgh());
		ptmt.setString(12, bgqrb.getYcccsqh());
		ptmt.setString(13, bgqrb.getBz());
		ptmt.execute();
	}
	
	public void update(TmcBgqrb bgqrb) throws SQLException{
		Connection conn=DBConnectionUtils.getConnection();
		String sql="UPDATE TMC9081.tmc_bgqrb SET"+
			"bgjl=?,ycccsqh=?,reader=?,writer=?,bz=?,bm=?,sqdw=?,sqxh=?,sqbh=?,yccczsh=?,"+
			"ycccbgh=? WHERE pk1 = ?";
		PreparedStatement ptmt=conn.prepareStatement(sql);
		ptmt.setString(1, bgqrb.getBgjl());
		//ptmt.setString(2, bgqrb.getGdh());
		ptmt.setString(2, bgqrb.getYcccsqh());
		ptmt.setString(3, bgqrb.getReader());
		ptmt.setString(4, bgqrb.getWriter());
		ptmt.setString(5, bgqrb.getBz());
		
		ptmt.setString(6, bgqrb.getBm());
		ptmt.setString(7, bgqrb.getSqdw());
		ptmt.setString(8, bgqrb.getSqxh());
		ptmt.setString(9, bgqrb.getSqbh());
		ptmt.setString(10, bgqrb.getYccczsh());
		ptmt.setString(11, bgqrb.getYcccbgh());
		
		ptmt.setString(12, bgqrb.getPk1());
		ptmt.execute();
	}
}

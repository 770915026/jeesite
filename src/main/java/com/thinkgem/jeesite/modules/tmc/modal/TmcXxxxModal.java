package com.thinkgem.jeesite.modules.tmc.modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.thinkgem.jeesite.modules.taier.entity.TmcXxxx;
import com.thinkgem.jeesite.modules.tmc.utils.DBConnectionUtils;

public class TmcXxxxModal {

	public void save(TmcXxxx xxxx) throws SQLException{
		Connection conn=DBConnectionUtils.getConnection();
		String sql="INSERT INTO TMC9081.tmc_xxxx("+
			"dk,ej,syj,ly,gps,gprs,gprsclass,egprs,egprsclass,wapi,cmmb,bz,bh,reader,writer,pk1"+
		") VALUES ("+
			"?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?"+
		")";
		PreparedStatement ptmt=conn.prepareStatement(sql);
		ptmt.setString(1, xxxx.getDk());
		ptmt.setString(2, xxxx.getEj());
		ptmt.setString(3, xxxx.getSyj());
		ptmt.setString(4, xxxx.getLy());
		ptmt.setString(5, xxxx.getGps());
		ptmt.setString(6, xxxx.getGprs());
		ptmt.setString(7, xxxx.getGprsclass());
		ptmt.setString(8, xxxx.getEgprs());
		ptmt.setString(9, xxxx.getEgprsclass());
		ptmt.setString(10, xxxx.getWapi());
		ptmt.setString(11, xxxx.getCmmb());
		ptmt.setString(12, xxxx.getBz());
		ptmt.setString(13, xxxx.getBh());
		ptmt.setString(14, xxxx.getReader());
		ptmt.setString(15, xxxx.getWriter());
		ptmt.setString(16, xxxx.getPk1());
		ptmt.execute();
	}
	public void update(TmcXxxx xxxx) throws SQLException{
		Connection conn=DBConnectionUtils.getConnection();
		String sql="UPDATE TMC9081.tmc_xxxx SET "+
			"dk=?,ej=?,syj=?,ly=?,gps=?,gprs=?,gprsclass=?,egprs=?,egprsclass=?,wapi=?,cmmb=?,bz=?,writer=?,reader=? WHERE pk1 = ?";
		PreparedStatement ptmt=conn.prepareStatement(sql);
		ptmt.setString(1, xxxx.getDk());
		ptmt.setString(2, xxxx.getEj());
		ptmt.setString(3, xxxx.getSyj());
		ptmt.setString(4, xxxx.getLy());
		ptmt.setString(5, xxxx.getGps());
		ptmt.setString(6, xxxx.getGprs());
		ptmt.setString(7, xxxx.getGprsclass());
		ptmt.setString(8, xxxx.getEgprs());
		ptmt.setString(9, xxxx.getEgprsclass());
		ptmt.setString(10, xxxx.getWapi());
		ptmt.setString(11, xxxx.getCmmb());
		ptmt.setString(12, xxxx.getBz());
		//ptmt.setString(13, xxxx.getBh());
		ptmt.setString(13, xxxx.getWriter());
		ptmt.setString(14, xxxx.getReader());
		ptmt.setString(15, xxxx.getPk1());
		ptmt.execute();
	}
}

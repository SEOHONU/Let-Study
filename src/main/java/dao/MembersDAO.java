package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import controllers.EncryptionUtils;

public class MembersDAO {
	
	private static MembersDAO instance = null;
	
	public synchronized static MembersDAO getInstacne() {
	
		if(instance == null) {
			instance = new MembersDAO(); 
		}
		return instance; 
	}
	
	private MembersDAO ( ) {}
	
	private Connection getConnection() throws Exception {
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource) iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
	
	public boolean isIdExist(String id) throws Exception {
		String sql = "select * from members where id=?"; 
		
		try(Connection con = this.getConnection();
		PreparedStatement pstat = con.prepareStatement(sql);) {
			
			pstat.setString(1, id);
			
			ResultSet rs = pstat.executeQuery();
			boolean result = rs.next();
			return result; 
		}
	}
	
	public boolean isMember(String id, String pw) throws Exception {
		String sql = "select * from members where id=? and pw=?"; 
		
		try(Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql); ) {
			pstat.setString(1,id); 
			pstat.setString(2,EncryptionUtils.sha512(pw));
			try(ResultSet rs = pstat.executeQuery();){
				boolean result = rs.next();
				return result; 
			}
			
		}
	}

}

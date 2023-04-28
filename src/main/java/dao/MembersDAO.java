package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import controllers.EncryptionUtils;
import dto.MembersDTO;

public class MembersDAO {
	
	private static MembersDAO instance = null;
	
	public synchronized static MembersDAO getInstance() {
	
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
	
	public String getNickname(String id) throws Exception {
		String sql = "select nickname from members where id =?"; 
		try(Connection con = this.getConnection(); 
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			try(ResultSet rs = pstat.executeQuery()){
				rs.next();
				String nickname = rs.getString("nickname");
				return nickname;
			}
			
			
			
		}
	}
	
	public int insertAll(MembersDTO dto) throws Exception {
		
		String sql = "insert into members values (?,?,?,?,?,?,?,?,?,?,sysdate)"; 
		try(Connection con = this.getConnection(); 
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getId());
			pstat.setString(2, EncryptionUtils.sha512(dto.getPw())); 
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getBirth_date());
			pstat.setString(5, dto.getNickname());
			pstat.setString(6, dto.getContact());
			pstat.setString(7, dto.getEmail());
			pstat.setString(8, dto.getZipcode());
			pstat.setString(9, dto.getAddress1());
			pstat.setString(10, dto.getAddress2());
			int result = pstat.executeUpdate(); 
			con.commit();
			return result; 
			
		}
		
		
		
	}		
	

}

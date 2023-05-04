package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import commons.EncryptionUtils;
import dto.MembersDTO;

public class MembersDAO {

   private static MembersDAO instance = null;

   public synchronized static MembersDAO getInstance() {
      if (instance == null) {
         instance = new MembersDAO();
      }
      return instance;
   }

   private MembersDAO() {
   }

   private Connection getConnection() throws Exception {
      Context iCtx = new InitialContext();
      DataSource ds = (DataSource) iCtx.lookup("java:/comp/env/jdbc/ora");
      return ds.getConnection();
   }


   public boolean isMember(String id, String pw) throws Exception {
	      String sql = "select * from members where id=? and pw=?";
	      try (Connection con = this.getConnection(); 
	            PreparedStatement pstat = con.prepareStatement(sql);) {
	         pstat.setString(1, id);
	         pstat.setString(2, EncryptionUtils.sha512(pw));
	         try (ResultSet rs = pstat.executeQuery();) {
	            boolean result = rs.next();
	            return result;
	         }
	      }
	   }


	   public boolean isIdExist(String id) throws Exception {
	      String sql = "select * from members where id=?";
	      try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
	         pstat.setString(1, id);
	         ResultSet rs = pstat.executeQuery();
	         boolean result = rs.next();
	         return result;
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
	         System.out.println(dto);
	         int result = pstat.executeUpdate(); 
	         con.commit();
	         
	         return result;
	      }
	   }
	   
		public int insertProfile(String id, String nickname) throws Exception {
			 String sql = "insert into profile values (?,?,null,null,null,null)";
			   try(Connection con = this.getConnection(); 
					   PreparedStatement pstat = con.prepareStatement(sql);) {
				   pstat.setString(1, id);
				   pstat.setString(2, nickname);
				   int result = pstat.executeUpdate();
				   return result;
		}
		}


	   public MembersDTO myInfoSelect(String id) throws Exception {
	      String sql = "select * from members where id=?";
	      try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
	         pstat.setString(1, id);
	         try (ResultSet rs = pstat.executeQuery();) {
	            rs.next();
	            String name = rs.getString("name");
	            String birth_date = rs.getString("birth_date");
	            String nickname = rs.getString("nickname");
	            String contact = rs.getString("contact");
	            String email = rs.getString("email");
	            String zipcode = rs.getString("zipcode");
	            String address1 = rs.getString("address1");
	            String address2 = rs.getString("address2");
	            Timestamp join_date = rs.getTimestamp("join_date");
	            MembersDTO dto = new MembersDTO(id, null, name, birth_date, nickname, contact, email, zipcode,
	                  address1, address2, join_date);
	            return dto;
	         }
	      }
	   }


	   public int update(MembersDTO dto) throws Exception {
	      String sql = "update members set pw=?,nickname=?,contact=?,email=?,zipcode=?,address1=?,address2=? where id =?";
	      try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
	         pstat.setString(1, EncryptionUtils.sha512(dto.getPw()));
	         pstat.setString(2, dto.getNickname());
	         pstat.setString(3, dto.getContact());
	         pstat.setString(4, dto.getEmail());
	         pstat.setString(5, dto.getZipcode());
	         pstat.setString(6, dto.getAddress1());
	         pstat.setString(7, dto.getAddress2());
	         pstat.setString(8, dto.getId());

	         int result = pstat.executeUpdate();
	         con.commit();
	         return result;
	      }

	   }


	   public void memberOut(String id) throws Exception {
	      String sql = "delete from members where id=?";
	      try (Connection con = this.getConnection(); 
	            PreparedStatement pstat = con.prepareStatement(sql);) {
	         pstat.setString(1, id);
	         pstat.executeUpdate();
	         con.commit();
	      }
	   }



}
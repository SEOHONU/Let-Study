package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.MembersDTO;

public class MembersDAO {

	private static MembersDAO instance = null;

	public synchronized static MembersDAO getInstacne() {
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
			pstat.setString(2, pw);
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

	public int insert (MembersDTO dto) throws Exception {
		String sql = "insert into members values(?,?,?,?,?,?,?,?,?,?,sysdate,null)";
		try (Connection con = this.getConnection(); 
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
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
			System.out.println("222");
			return result;
		}
	}


	public MembersDTO myInfoSelect(String id) throws Exception {
		String sql = "select * from members where id=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				String myid = rs.getString("id");
				String name = rs.getString("name");
				String birth_date = rs.getString("birth_date");
				String nickname = rs.getString("nickname");
				String contact = rs.getString("contact");
				String email = rs.getString("email");
				String zipcode = rs.getString("zipcode");
				String address1 = rs.getString("address1");
				String address2 = rs.getString("address2");

				Timestamp sysdate = null;
				MembersDTO dto = new MembersDTO(myid, null, name, birth_date, nickname, contact, email, zipcode,
						address1, address2, sysdate, null);
				return dto;
			}
		}
	}


	public int update(MembersDTO dto) throws Exception {
		String sql = "update members set pw=?,nickname=?,contact=?,email=?,zipcode=?,address1=?,address2=? where id =?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getPw());

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




	public String getNickname(String id) throws Exception{
		String sql = "select nickname from members where id=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			pstat.executeUpdate();
			try(ResultSet rs = pstat.executeQuery()){
				rs.next();
				String result= rs.getString("nickname");
				return result;
			}
		}




	}
}

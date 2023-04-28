package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Profile_settingDTO;

public class Profile_settingDAO {

	private static Profile_settingDAO instance = null;

	public synchronized static Profile_settingDAO getInstance() {
		if (instance == null) {
			instance = new Profile_settingDAO();
		}
		return instance;
	}

	private Profile_settingDAO() {
	}

	private Connection getConnection() throws Exception {
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource) iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}

	

	public Profile_settingDTO select(String id) throws Exception{
		String sql = "select from profile where profile_id=?";
		try (Connection con = this.getConnection(); 
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				String nickname = rs.getString("profile_nickname");
				String introduce = rs.getString("profile_introduce");
				String instargram = rs.getString("profile_instargram");
				String facebook = rs.getString("profile_facebook");
				String url = rs.getString("profile_url");

				Profile_settingDTO dto = new Profile_settingDTO(null,nickname,introduce,instargram,facebook,url);

				return dto;

			}
		}
	}

	public Profile_settingDTO update(Profile_settingDTO dto)throws Exception{
		String sql = "update profile set profile_nickname=?,profile_introduce=?,profile_instargram=?,profile_facebook=?,profile_url=? where id=?";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1,dto.getProfile_nickname());
			pstat.setString(2,dto.getProfile_introduce());
			pstat.setString(3,dto.getProfile_instargram());
			pstat.setString(4,dto.getProfile_facebook());
			pstat.setString(5,dto.getProfile_url());
			pstat.setString(6, dto.getProfile_id());
			
			Profile_settingDTO ps_dto = new Profile_settingDTO(dto.getProfile_nickname(),dto.getProfile_introduce(),dto.getProfile_instargram(),dto.getProfile_facebook(),dto.getProfile_url(),dto.getProfile_id());
			pstat.executeUpdate();
			con.commit();
			return ps_dto;
			
		}


	}
}

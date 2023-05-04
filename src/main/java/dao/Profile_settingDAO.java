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

	public Profile_settingDTO select(String id) throws Exception {
		String sql = "select * from profile where profile_id=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			System.out.println(id);
			pstat.setString(1, id);
			
			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				String nickname = rs.getString("profile_nickname");
				String introduce = rs.getString("profile_introduce");
				String instargram = rs.getString("profile_instargram");
				String facebook = rs.getString("profile_facebook");
				String url = rs.getString("profile_url");
				Profile_settingDTO dto = new Profile_settingDTO(id, nickname, introduce, instargram, facebook, url);

				return dto;
			}
		}
	}

	public int update(Profile_settingDTO dto) throws Exception {
		String sql = "update profile set profile_nickname=?,profile_introduce=?,profile_instargram=?,profile_facebook=?,profile_url=? where profile_id=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getProfile_nickname());
			pstat.setString(2, dto.getProfile_introduce());
			pstat.setString(3, dto.getProfile_instargram());
			pstat.setString(4, dto.getProfile_facebook());
			pstat.setString(5, dto.getProfile_url());
			pstat.setString(6, dto.getProfile_id());

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	// 회원가입시 id,nickname값 받아오기
	public int profileInsertnull(String id, String nickname) throws Exception {
		String sql = "insert into profile values (?,?,null,null,null,null)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			pstat.setString(2, nickname);

			int result = pstat.executeUpdate();
			con.commit();
			return result;

		}
	}
}

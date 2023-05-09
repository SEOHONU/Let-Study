package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.FreeBoardDTO;
import dto.MembersDTO;
import dto.SecondHandDTO;
import dto.StudyBoardDTO;
import statics.Settings;

public class Admin_DAO {
	private static Admin_DAO instance = null;

	public synchronized static Admin_DAO getInstance() {
		if (instance == null) {
			instance = new Admin_DAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource) iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}

	public boolean isAdmin(String admin_id, String admin_pw) throws SQLException, Exception {
		String sql = "select * from admin where admin_id=? and admin_pw=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, admin_id);
			pstat.setString(2, admin_pw);
			try (ResultSet rs = pstat.executeQuery();) {

				return rs.next();
			}
		}
	}

	public List<StudyBoardDTO> admin_select_StudyBoard() throws SQLException, Exception {
		String sql = "select*from studyboard";
		List<StudyBoardDTO> result = new ArrayList<>();
		try (Connection con = this.getConnection();
				PreparedStatement stat = con.prepareStatement(sql);
				ResultSet rs = stat.executeQuery();) {
			while (rs.next()) {
				int seq = rs.getInt("seq");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String detailcontents = rs.getString("detailcontents");
				int view_count = rs.getInt("view_count");
				Timestamp write_date = rs.getTimestamp("write_date");
				double lat = rs.getDouble("lat");
				double lng = rs.getDouble("lng");
				String mapname = rs.getString("mapname");
				int guestcount = rs.getInt("guestcount");
				result.add(new StudyBoardDTO(seq, writer, title, contents, detailcontents, view_count, write_date, lat,
						lng, mapname, guestcount));
				System.out.println("AdminDAO 스터디리스트 출력");
			}
			return result;
		}
	}

	public List<SecondHandDTO> admin_Select_SecondHand() throws Exception {
		String sql = "select*from secondHand";
		List<SecondHandDTO> admin_SS = new ArrayList<>();
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			while (rs.next()) {
				int seq = rs.getInt(1);
				String title = rs.getString(2);
				String contents = rs.getString(3);
				String writer = rs.getString(4);
				Timestamp write_date = rs.getTimestamp(5);
				int view_count = rs.getInt(6);
				double lat = rs.getDouble(7);
				double lng = rs.getDouble(8);

				admin_SS.add(new SecondHandDTO(seq, title, contents, writer, write_date, view_count, lat, lng));

			}
			return admin_SS;
		}

	}

	// 자유게시판
	public List<FreeBoardDTO> selectFreeBoard(int start, int end) throws Exception {
		String sql = "select * from (select board_seq,board_title,board_contents,board_writer,board_view_count,board_write_date,rank() over(order by board_seq desc) rank from board) where rank between ? and ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			try (ResultSet rs = pstat.executeQuery();) {
				List<FreeBoardDTO> list = new ArrayList<>();
				while (rs.next()) {
					int seq = rs.getInt("board_seq");
					String title = rs.getString("board_title");
					String contents = rs.getString("board_contents");
					String writer = rs.getString("board_writer");
					int view_count = rs.getInt("board_view_count");
					Timestamp write_date = rs.getTimestamp("board_write_date");
					list.add(new FreeBoardDTO(seq, title, contents, writer, view_count, write_date));
				}
				return list;
			}
		}
	}

	public int getRecordCount() throws Exception {
		String sql = "select count(*) from board";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			return rs.getInt(1);

		}
	}

	public int getRecordCount_user() throws Exception {
		String sql = "select count(*) from members";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			return rs.getInt(1);

		}
	}

	public List<String> getPageNavi(int recordCount, int currentPage) throws Exception {
		int recordTotalCount = recordCount;
		int recordCountPerPage = Settings.BOARD_RECORD_COUNT_PER_PAGE;
		int naviCountPerPage = Settings.BOARD_NAVI_COUNT_PER_PAGE;

		int pageTotalCount = (int) Math.ceil(recordTotalCount / (double) recordCountPerPage);

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		int startNavi = ((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage - 1);
		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPagePrev = true;
		boolean needPageNext = true;
		boolean needPrev = true;
		boolean needNext = true;
		if (startNavi == 1) {
			needPagePrev = false;
		}
		if (endNavi == pageTotalCount) {
			needPageNext = false;
		}
		if (currentPage == pageTotalCount) {
			needNext = false;
		}
		if (currentPage == 1) {
			needPrev = false;
		}
		List<String> list = new ArrayList<>();
		if (needPagePrev) {
			list.add("<<");
		}
		if (needPrev) {
			list.add("<");
		}
		for (int i = startNavi; i <= endNavi; i++) {

			list.add(String.valueOf(i));

		}
		if (needNext) {
			list.add(">");
		}
		if (needPageNext) {
			list.add(">>");
		}

		return list;

	}

	public List<MembersDTO> user_list(int start, int end) throws Exception {
		String sql = "select * from (SELECT id,pw,name,birth_date,nickname,contact,email,zipcode,address1,address2,join_date,rank() over(order by join_date desc) rank from members) where rank between ? and ?";
//		SQL바꿔줘야함

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, start);
			pstat.setInt(2, end);

			try (ResultSet rs = pstat.executeQuery()) {
				ArrayList<MembersDTO> list = new ArrayList<>();
				while (rs.next()) {
					String myid = rs.getString("id");
					String name = rs.getString("name");
					String birth_date = rs.getString("birth_date");
					String nickname = rs.getString("nickname");
					String contact = rs.getString("contact");
					String email = rs.getString("email");
					String zipcode = rs.getString("zipcode");
					String address1 = rs.getString("address1");
					String address2 = rs.getString("address2");

					Timestamp join_date = rs.getTimestamp("join_date");
					MembersDTO mbdto = new MembersDTO(myid, null, name, birth_date, nickname, contact, email, zipcode,
							address1, address2, join_date);
					list.add(mbdto);
				}
				return list;
			}
		}
	}

//	회원목록 서치 

	public List<MembersDTO> user_Id_search(String select, String id) throws Exception {
		String sql = "select * from members where LOWER(id) like LOWER(?) order by join_date desc";
		System.out.println(sql);
			try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
				pstmt.setString(1, "%" + id + "%");
				try (ResultSet rs = pstmt.executeQuery()) {
					List<MembersDTO> result = new ArrayList<>();
					while (rs.next()) {
						String myid = rs.getString("id");
						String name = rs.getString("name");
						String birth_date = rs.getString("birth_date");
						String nickname = rs.getString("nickname");
						String contact = rs.getString("contact");
						String email = rs.getString("email");
						String zipcode = rs.getString("zipcode");
						String address1 = rs.getString("address1");
						String address2 = rs.getString("address2");
						Timestamp join_date = rs.getTimestamp("join_date");
						MembersDTO mbdto = new MembersDTO(myid, null, name, birth_date, nickname, contact, email,
								zipcode, address1, address2, join_date);
						result.add(mbdto);
					}
					return result;
				}
			}
		
	}
	
	
	
	

}

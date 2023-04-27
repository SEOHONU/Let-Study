package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CommentsDTO;
import dto.SecondHandDTO;
import dto.StudyBoardDTO;

public class MainDAO {

	SecondHandDTO sdto = new SecondHandDTO();
	CommentsDTO cdto = new CommentsDTO();
	StudyBoardDTO stdto = new StudyBoardDTO();
	private static MainDAO instance = null;

	public synchronized static MainDAO getInstance() {
		if (instance == null) {
			instance = new MainDAO();
		}
		return instance;
	}

	private MainDAO() {
	}

	private Connection getconnection() throws Exception {
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource) iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}

	public List<SecondHandDTO> joongosearch(String select, String secondhand) throws Exception {
		String joongosql = "";
		if (select.equals("제목")) {
			joongosql = "select * from secondHand where title like ?";
		} else if (select.equals("내용")) {
			joongosql = "select * from secondHand where contents like ?";
		} else if (select.equals("작성자")) {
			joongosql = "select * from secondHand where writer like ?";
		}
		try (Connection con = this.getconnection(); PreparedStatement pstmt = con.prepareStatement(joongosql);) {
			pstmt.setString(1, "%" + secondhand + "%");
			try (ResultSet rs = pstmt.executeQuery()) {
				List<SecondHandDTO> result = new ArrayList<>();
				while (rs.next()) {
					int seq = rs.getInt("seq");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					String writer = rs.getString("writer");
					Timestamp write_date = rs.getTimestamp("write_date");
					int view_count = rs.getInt("view_count");
					double lat = rs.getDouble("lat");
					double lng = rs.getDouble("lng");
					String selled = rs.getString("selled");
					SecondHandDTO dto = new SecondHandDTO(seq, title, contents, writer, write_date, view_count, lat,
							lng, selled);
					result.add(dto);
				}
				return result;
			}
		}
	}

	public List<StudyBoardDTO> studysearch(String select, String study) throws Exception {
		String studysql = "";
		if (select.equals("제목")) {
			studysql = "select * from studyboard where title like ?";
		} else if (select.equals("내용")) {
			studysql = "select * from studyboard where contents like ?";
		} else if (select.equals("작성자")) {
			studysql = "select * from studyboard where writer like ?";
		}
		try (Connection con = this.getconnection(); PreparedStatement pstmt = con.prepareStatement(studysql);) {
			pstmt.setString(1, "%" + study + "%");
			try (ResultSet rs = pstmt.executeQuery()) {
				List<StudyBoardDTO> result = new ArrayList<>();
				while (rs.next()) {
					int seq = rs.getInt("seq");
					String writer = rs.getString("writer");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					String detailcontents = rs.getString("detailcontents");
					int view_count = rs.getInt("view_count");
					Timestamp write_date = rs.getTimestamp("write_date");
					result.add(new StudyBoardDTO(seq, writer, title, contents, detailcontents, view_count, write_date));
				}
				return result;
			}
		}
	}
//	public void boardsearch(String select, String writer) throws Exception {
//		String boardsql = "";
//		if (select.equals("제목")) {
//			boardsql = "select * from board where title like %?%";
//		} else if (select.equals("내용")) {
//			boardsql = "select * from board where content like %?%";
//		} else if (select.equals("작성자")) {
//			boardsql = "select * from board where writer like %?%";
//		}
//		try (Connection con = this.getconnection(); PreparedStatement pstmt = con.prepareStatement(boardsql);) {
//			pstmt.setString(1, writer);
//			try (ResultSet rs = pstmt.executeQuery()) {
//				List<CommentsDTO>result = new ArrayList<>();
//				while(rs.next()) {
//					String title = rs.getString("title");
//					String content = rs.getString("content");
//					dto = new dto(title, content, writer);
//					result.add(dto);
//				}return result;
//			}
//		}
//	}
}

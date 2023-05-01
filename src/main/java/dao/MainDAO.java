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

import dto.FreeBoardDTO;
import dto.SecondHandDTO;
import dto.Sh_CommentsDTO;
import dto.StudyBoardDTO;

public class MainDAO {

	SecondHandDTO sdto = new SecondHandDTO();
	Sh_CommentsDTO cdto = new Sh_CommentsDTO();
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
			joongosql = "select * from secondHand where LOWER(title) like LOWER(?)";
		} else if (select.equals("내용")) {
			joongosql = "select * from secondHand where LOWER(contents) like LOWER(?)";
		} else if (select.equals("작성자")) {
			joongosql = "select * from secondHand where LOWER(writer) like LOWER(?)";
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
					SecondHandDTO dto = new SecondHandDTO(seq, title, contents, writer, write_date, view_count, lat,
							lng);
					result.add(dto);
				}
				return result;
			}
		}
	}

	public List<StudyBoardDTO> studysearch(String select, String study) throws Exception {
		String studysql = "";
		if (select.equals("제목")) {
			studysql = "select * from studyboard where LOWER(title) like LOWER(?)";
		} else if (select.equals("내용")) {
			studysql = "select * from studyboard where LOWER(contents) like LOWER(?)";
		} else if (select.equals("작성자")) {
			studysql = "select * from studyboard where LOWER(writer) like LOWER(?)";
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
					double lat = rs.getDouble("lat");
					double lng = rs.getDouble("lng");
					String mapname = rs.getString("mapname");
					result.add(new StudyBoardDTO(seq,writer,title,contents,detailcontents,view_count,write_date,lat,lng,mapname));
				}
				return result;
			}
		}
	}
	public List<FreeBoardDTO> boardsearch(String select, String free) throws Exception {
		String boardsql = "";
		if (select.equals("제목")) {
			boardsql = "select * from free_board where LOWER(board_title) like LOWER(?)";
		} else if (select.equals("내용")) {
			boardsql = "select * from free_board where LOWER(board_contents) like LOWER(?)";
		} else if (select.equals("작성자")) {
			boardsql = "select * from free_board where LOWER(board_writer) like LOWER(?)";
		}
		try (Connection con = this.getconnection(); PreparedStatement pstmt = con.prepareStatement(boardsql);) {
			pstmt.setString(1, "%" + free + "%");
			try (ResultSet rs = pstmt.executeQuery()) {
				List<FreeBoardDTO>result = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("board_seq");
					String title = rs.getString("board_title");
					String content = rs.getString("board_contents");
					String writer = rs.getString("board_writer");
					int view_count = rs.getInt("board_view_count");
					Timestamp write_date = rs.getTimestamp("board_write_date");
					
					FreeBoardDTO dto = new FreeBoardDTO(seq, title, content, writer, view_count, write_date);
					result.add(dto);
				}return result;
			}
		}
	}
	public List<SecondHandDTO> mainjoongo() throws Exception {
		String sql = "select * from secondHand";
		try(Connection con = this.getconnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();){
			List<SecondHandDTO>result = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt("seq");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String writer = rs.getString("writer");
				Timestamp write_date = rs.getTimestamp("write_date");
				int view_count = rs.getInt("view_count");
				double lat = rs.getDouble("lat");
				double lng = rs.getDouble("lng");
				SecondHandDTO dto = new SecondHandDTO(seq, title, contents, writer, write_date, view_count, lat,
						lng);
				result.add(dto);
			}
			return result;
		}
	}
}

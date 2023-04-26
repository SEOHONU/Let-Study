package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MainDAO {
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

	public void joongosearch(String select, String title) throws Exception {
		String joongosql = "";
		if (select.equals("제목")) {
			boardsql = "select * from board where title like %?%";
		} else if (select.equals("내용")) {
			boardsql = "select * from board where content like %?%";
		} else if (select.equals("작성자")) {
			boardsql = "select * from board where writer like %?%";
		}
		try (Connection con = this.getconnection(); PreparedStatement pstmt = con.prepareStatement(joongosql);) {
			pstmt.setString(1, title);
			try (ResultSet rs = pstmt.executeQuery()) {
				List<DTO>result = new ArrayList<>();
				while(rs.next()) {
					String content = rs.getString("content");
					String writer = rs.getString("writer");
					dto = new dto(title, content, writer);
					result.add(dto);
				}return result;
			}
		}
	}
	public void studysearch(String select, String content) throws Exception {
		String studysql = "";
		if (select.equals("제목")) {
			boardsql = "select * from board where title like %?%";
		} else if (select.equals("내용")) {
			boardsql = "select * from board where content like %?%";
		} else if (select.equals("작성자")) {
			boardsql = "select * from board where writer like %?%";
		}
		try (Connection con = this.getconnection(); PreparedStatement pstmt = con.prepareStatement(studysql);) {
			pstmt.setString(1, content);
			try (ResultSet rs = pstmt.executeQuery()) {
				List<DTO>result = new ArrayList<>();
				while(rs.next()) {
					String title = rs.getString("title");
					String writer = rs.getString("writer");
					dto = new dto(title, content, writer);
					result.add(dto);
				}return result;
		}
	}
	public void boardsearch(String select, String writer) throws Exception {
		String boardsql = "";
		if (select.equals("제목")) {
			boardsql = "select * from board where title like %?%";
		} else if (select.equals("내용")) {
			boardsql = "select * from board where content like %?%";
		} else if (select.equals("작성자")) {
			boardsql = "select * from board where writer like %?%";
		}
		try (Connection con = this.getconnection(); PreparedStatement pstmt = con.prepareStatement(boardsql);) {
			pstmt.setString(1, writer);
			try (ResultSet rs = pstmt.executeQuery()) {
				List<DTO>result = new ArrayList<>();
				while(rs.next()) {
					String title = rs.getString("title");
					String content = rs.getString("content");
					dto = new dto(title, content, writer);
					result.add(dto);
				}return result;
			}
		}
	}
}

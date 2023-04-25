package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
			joongosql = "select * from board where title=?";
		} else if (select.equals("내용")) {
			joongosql = "select * from board where content=?";
		} else if (select.equals("작성자")) {
			joongosql = "select * from board where writer=?";
		}
		try (Connection con = this.getconnection(); PreparedStatement pstmt = con.prepareStatement(joongosql);) {
			pstmt.setString(1, title);
			try (ResultSet rs = pstmt.executeQuery()) {
				while(rs.next()) {
				}
			}
		}
	}
	public void studysearch(String select, String title) throws Exception {
		String studysql = "";
		if (select.equals("제목")) {
			studysql = "select * from board where title=?";
		} else if (select.equals("내용")) {
			studysql = "select * from board where content=?";
		} else if (select.equals("작성자")) {
			studysql = "select * from board where writer=?";
		}
		try (Connection con = this.getconnection(); PreparedStatement pstmt = con.prepareStatement(studysql);) {
			pstmt.setString(1, title);
			try (ResultSet rs = pstmt.executeQuery()) {
				while(rs.next()) {
				}
			}
		}
	}
	public void boardsearch(String select, String title) throws Exception {
		String boardsql = "";
		if (select.equals("제목")) {
			boardsql = "select * from board where title=?";
		} else if (select.equals("내용")) {
			boardsql = "select * from board where content=?";
		} else if (select.equals("작성자")) {
			boardsql = "select * from board where writer=?";
		}
		try (Connection con = this.getconnection(); PreparedStatement pstmt = con.prepareStatement(boardsql);) {
			pstmt.setString(1, title);
			try (ResultSet rs = pstmt.executeQuery()) {
				while(rs.next()) {
				}
			}
		}
	}
}

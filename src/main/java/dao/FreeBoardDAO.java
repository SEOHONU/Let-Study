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


public class FreeBoardDAO {
	private static FreeBoardDAO instance = null;

	public synchronized static FreeBoardDAO getInstance() {
		if(instance==null) {
			instance = new FreeBoardDAO();
		}return instance;
	}

	private FreeBoardDAO() {};

	private Connection getConnection() throws Exception{
		Context iCxt = new InitialContext();
		DataSource ds = (DataSource)iCxt.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();

	}

	public int insert(String writer, String title, String content) throws Exception{
		String sql = "insert into board values(board_seq.nextval, ?,?,?,?,sysdate)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, title);
			pstat.setString(2, content);
			pstat.setString(3, writer);
			pstat.setInt(4, 1);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	public List<FreeBoardDTO> selectList() throws Exception{
		String sql = "select * from board order by board_seq desc";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			ArrayList<FreeBoardDTO> list = new ArrayList<>();
			try(ResultSet rs = pstat.executeQuery();){
				while(rs.next()) {
					int seq = rs.getInt("board_seq");
					String title = rs.getString("board_title");
					String contents = rs.getString("board_contents");
					String writer = rs.getString("board_writer");
					int view_count = rs.getInt("board_view_count");
					Timestamp write_date = rs.getTimestamp("board_write_date");
					FreeBoardDTO dto = new FreeBoardDTO(seq,title,contents,writer,view_count,write_date);
					list.add(dto);

				}
				return list;
			}
		}
	}

	public FreeBoardDTO selectDetail(int seq) throws Exception{
		String sql = "select * from board where board_seq=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)
		{pstat.setInt(1, seq);
		pstat.executeUpdate();
		try(ResultSet rs = pstat.executeQuery();
			){
			rs.next();
			int seq1 = rs.getInt("board_seq");
			String title = rs.getString("board_title");
			String content = rs.getString("board_contents");
			String writer = rs.getString("board_writer");
			int view_count = rs.getInt("board_view_count");
			Timestamp write_Date = rs.getTimestamp("board_write_date");
			FreeBoardDTO result = new FreeBoardDTO(seq1,title,content,writer,view_count,write_Date);

			return result;
			}
		}
	}
	
	


	}




















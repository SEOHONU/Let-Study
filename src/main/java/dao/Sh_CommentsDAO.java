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

import dto.Sh_CommentsDTO;

public class Sh_CommentsDAO {
	private Sh_CommentsDAO() {}
	private static Sh_CommentsDAO instance = null;
	public synchronized static Sh_CommentsDAO getInstance() {
		if(instance == null) {
			instance = new Sh_CommentsDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource)iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
	public int insertComments(Sh_CommentsDTO dto) throws Exception{
		String sql = "insert into sh_comments values(sh_com_seq.nextval, ?, ?, default, ?, null)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getCom_writer());
			pstat.setString(2, dto.getCom_contents());
			pstat.setInt(3, dto.getBoard_seq());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	public int updateComments(int com_seq, String contents) throws Exception{
		String sql = "update sh_comments set com_contents = ?, com_write_date = default "
				+ "where com_Seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, contents);
			pstat.setInt(2, com_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	public List<Sh_CommentsDTO> selectComments(int target_board_seq) throws Exception{
		String sql = "select * from sh_comments where board_seq = ? order by 1";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, target_board_seq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<Sh_CommentsDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt(1);
					String writer = rs.getString(2);
					String contents = rs.getString(3);
					Timestamp write_date = rs.getTimestamp(4);
					int board_seq = rs.getInt(5);
					int parent_seq = rs.getInt(6);
					list.add(new Sh_CommentsDTO(seq, writer, contents, write_date, board_seq, parent_seq));
				}
				return list;
			}
		}
	}
	public int deleteComments(int com_seq) throws Exception{
		String sql = "delete from sh_comments where sh_com_seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, com_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
}

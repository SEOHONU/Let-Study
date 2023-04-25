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

public class CommentsDAO {
	private CommentsDAO() {}
	private static CommentsDAO instance = null;
	public synchronized static CommentsDAO getInstance() {
		if(instance == null) {
			instance = new CommentsDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource)iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
	public int insertComments(CommentsDTO dto) throws Exception{
		String sql = "insert into comments values(com_seq.nextval, ?, ?, default, ?, null)";
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
	public List<CommentsDTO> selectComments(int target_board_seq) throws Exception{
		String sql = "select * from comments where board_seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, target_board_seq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<CommentsDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt(1);
					String writer = rs.getString(2);
					String contents = rs.getString(3);
					Timestamp write_date = rs.getTimestamp(4);
					int board_seq = rs.getInt(5);
					int parent_seq = rs.getInt(6);
					list.add(new CommentsDTO(seq, writer, contents, write_date, board_seq, parent_seq));
				}
				return list;
			}
		}
	}
}

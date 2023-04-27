package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.FreeReplyDTO;

public class FreeReplyDAO {
	private static FreeReplyDAO instance = null;

	public synchronized static FreeReplyDAO getInstance() {
		if(instance==null) {
			instance= new FreeReplyDAO();
		}
		return instance;

	}

	private FreeReplyDAO() {};
	

	private Connection getConnection() throws Exception{
		Context ICtx = new InitialContext();
		DataSource ds = (DataSource) ICtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();

	}
	
	public ArrayList<FreeReplyDTO> selectReply(int p_seq) throws Exception{

		String sql = "select * from board_reply where board_seq = ? order by reply_seq desc";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, p_seq);
			pstat.executeUpdate();

			try(ResultSet rs = pstat.executeQuery();){ // 수정!!!
				ArrayList<FreeReplyDTO> dto = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("reply_seq");
					String writer = rs.getString("reply_writer");
					String contents = rs.getString("reply_contents");
					Timestamp write_date = rs.getTimestamp("REPLY_WRITE_DATE");
					int board_seq = rs.getInt("board_seq");
					dto.add(new FreeReplyDTO(seq, writer, contents, write_date, board_seq));
				}
				return dto;
			}
		}
	}
	
	public int insertReply(String writer, String contents, int boardSeq) throws Exception{
		String sql ="insert into board_reply values(reply_seq.nextval, ?,?,sysdate, ? )";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, writer);
			pstat.setString(2, contents);
			pstat.setInt(3, boardSeq);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}

	}

	public void deleteBySeq(int replySeq) throws Exception{
		String sql = "delete from board_reply where reply_seq=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, replySeq);
			pstat.executeUpdate();
			con.commit();
		}
	}

	
	public void updateReply (String content, int seq) throws Exception{
	String sql = "update board_reply set contents=?, reply_write_date = sysdate where seq =?";
	try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
			){
		pstat.setString(1, content);
		pstat.setInt(2, seq);
		pstat.executeUpdate();
		con.commit();
		System.out.println("업데이트 완료");
	}
}
	
	
	
}

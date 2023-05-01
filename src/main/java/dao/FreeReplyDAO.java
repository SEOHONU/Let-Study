package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.ReplyAndMemberDTO;

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
	
//	public ArrayList<FreeReplyDTO> selectReply(int p_seq) throws Exception{
//
//		String sql = "select * from fr_reply where board_seq = ? order by reply_seq asc";
//		try(
//				Connection con = this.getConnection();
//				PreparedStatement pstat = con.prepareStatement(sql);
//				){
//			pstat.setInt(1, p_seq);
//			pstat.executeUpdate();
//
//			try(ResultSet rs = pstat.executeQuery();){ // 수정!!!
//				ArrayList<FreeReplyDTO> dto = new ArrayList<>();
//				while(rs.next()) {
//					int seq = rs.getInt("reply_seq");
//					String writer = rs.getString("reply_writer");
//					String contents = rs.getString("reply_contents");
//					Timestamp write_date = rs.getTimestamp("REPLY_WRITE_DATE");
//					int board_seq = rs.getInt("board_seq");
//					dto.add(new FreeReplyDTO(seq, writer, contents, write_date, board_seq));
//				}
//				return dto;
//			}
//		}
//	}
	
	public ArrayList<ReplyAndMemberDTO> selectReply(int board_seq)throws Exception{
		String sql = "select * from(select r.reply_seq, r.reply_writer, m.nickname, r.reply_contents, r.reply_write_date,r.board_seq from fr_reply r left join members m on r.reply_writer = m.id where board_seq=?)order by reply_seq asc";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, board_seq);
			pstat.executeUpdate();
			try(ResultSet rs = pstat.executeQuery();){ // 수정!!!
				ArrayList<ReplyAndMemberDTO> dto = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("reply_seq");
					String writer = rs.getString("reply_writer");
					String nickname = rs.getString("nickname");
					String contents = rs.getString("reply_contents");
					Timestamp write_date = rs.getTimestamp("REPLY_WRITE_DATE");
					int b_seq = rs.getInt("board_seq");
					dto.add(new ReplyAndMemberDTO(seq, writer, nickname, contents, write_date, board_seq));
				}
				return dto;
			}
		}
		
		
		
		
	}
	
	
	public int insertReply(String writer, String contents, int boardSeq) throws Exception{
		String sql ="insert into fr_reply values(fr_reply_seq.nextval, ?,?,sysdate, ? )";
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

	
	public void updateReply (String content, int reply_seq) throws Exception{
	String sql = "update fr_reply set reply_contents=?, reply_write_date = sysdate where reply_seq =?";
	try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
			){
		pstat.setString(1, content);
		pstat.setInt(2, reply_seq);
		pstat.executeUpdate();
		con.commit();
		System.out.println("댓글 업데이트 완료");
	}
}
	

	public int deleteBySeq(int replySeq) throws Exception{
		String sql = "delete from fr_reply where reply_seq=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, replySeq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	
	
	
}

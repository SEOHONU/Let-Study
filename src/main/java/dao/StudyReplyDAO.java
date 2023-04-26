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

import dto.StudyReplyDTO;

public class StudyReplyDAO {
	private static StudyReplyDAO instance = null;
	
	private StudyReplyDAO() {}
	public static StudyReplyDAO getInstance() {
		if(instance == null) {
			instance = new StudyReplyDAO();
		}
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Context ictx = new InitialContext();
		DataSource ds = (DataSource)ictx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
	public int insertreply(StudyReplyDTO dto) throws Exception{
		String sql = "insert into studyreply values (studyreply_seq.nextval,?,?,default,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getWriter());
			pstat.setString(2, dto.getContents());
			pstat.setInt(3, dto.getParent_seq());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public List<StudyReplyDTO> selectreply(int seq1) throws Exception{
		String sql = "select * from studyreply where parent_seq = ? order by seq asc";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq1);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<StudyReplyDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("seq");
					String writer = rs.getString("writer");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					int parent_seq = rs.getInt("parent_seq");
					list.add(new StudyReplyDTO(seq,writer,contents,write_date,parent_seq));
				}
				return list;
			}
		}
	}
	
	public int deletereply(int seq) throws Exception{
		String sql = "delete from studyreply where seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
}

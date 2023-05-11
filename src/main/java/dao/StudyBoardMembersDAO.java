package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.StudyBoardMembersDTO;

public class StudyBoardMembersDAO {
	private static StudyBoardMembersDAO instance = null;
	
	
	private StudyBoardMembersDAO() {}
	public static StudyBoardMembersDAO getInstance() {
		if(instance == null) {
			instance = new StudyBoardMembersDAO();
		}
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Context ictx = new InitialContext();
		DataSource ds = (DataSource)ictx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
	
	public int insertapply(StudyBoardMembersDTO dto) throws Exception{
		String sql = "insert into studyboardmembers values (?,?,default)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getId());
			pstat.setInt(2, dto.getBoard_seq());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public List<StudyBoardMembersDTO> selectapply(int seq) throws Exception{
		String sql = "select * from studyboardmembers join members on studyboardmembers.id = members.id where boardseq = ? and yorn = 'N'";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<StudyBoardMembersDTO> list = new ArrayList<>();
				while(rs.next()) {
					String nickname = rs.getString("nickname");
					int boardseq = rs.getInt("boardseq");
					String yorN = rs.getString("id");
					list.add(new StudyBoardMembersDTO(nickname,boardseq,yorN));
				}
				return list;
			}
		}
	}
	
	public List<StudyBoardMembersDTO> selectapplycheck(int seq) throws Exception{
		String sql = "select * from studyboardmembers join members on studyboardmembers.id = members.id where boardseq = ? and yorn = 'Y'";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<StudyBoardMembersDTO> list = new ArrayList<>();
				while(rs.next()) {
					String nickname = rs.getString("nickname");
					int boardseq = rs.getInt("boardseq");
					String yorN = rs.getString("id");
					list.add(new StudyBoardMembersDTO(nickname,boardseq,yorN));
				}
				return list;
			}
		}
	}
	
	public int deleteapply(StudyBoardMembersDTO dto) throws Exception{
		String sql = "delete from studyboardmembers where id = ? and boardseq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getId());
			pstat.setInt(2, dto.getBoard_seq());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int updateapply(StudyBoardMembersDTO dto) throws Exception{
		String sql = "update studyboardmembers set yorn = 'Y' where id = ? and boardseq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getId());
			pstat.setInt(2, dto.getBoard_seq());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int updateguestcount(StudyBoardMembersDTO dto) throws Exception{
		String sql = "select count(*) from studyboardmembers where boardseq = ? and yorn = 'Y'";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, dto.getBoard_seq());
			try(
					ResultSet rs = pstat.executeQuery();
					){
				int result = 0;
				if(rs.next()) {
					result = rs.getInt(1);
				}
				return result+1;
			}
		}
	}
	
	public boolean multiapply(StudyBoardMembersDTO dto) throws Exception{
		String sql = "select * from studyboardmembers where id=? and boardseq=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getId());
			pstat.setInt(2, dto.getBoard_seq());
			try(
					ResultSet rs = pstat.executeQuery();
					){
				return rs.next();
			}
		}
	}
	
}

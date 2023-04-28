package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.FreeFileDTO;

public class FreeFileDAO {
	private static FreeFileDAO instance=null;

	public synchronized static FreeFileDAO getInstance() {
		if(instance==null) {
			instance= new FreeFileDAO();
		}
		return instance;
	}

	private FreeFileDAO() {};

	private Connection getConnection() throws Exception{
		Context iCxt = new InitialContext();
		DataSource ds = (DataSource)iCxt.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
// 게시글 입력
	public int insert(FreeFileDTO dto) throws Exception{
		String sql = "insert into fr_files values(fr_file_seq.nextval,?,?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getOriName());
			pstat.setString(2, dto.getSysName());
			pstat.setInt(3, dto.getParent_seq());
			int result = pstat.executeUpdate();
			if(result==1) {
				System.out.println("파일 업로드 성공");
			}
			return result;
		}
	}
	// 파일 있는지 없는지
	public boolean findFile(int p_seq) throws Exception{
		String sql = "select * from fr_files where board_seq =?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, p_seq);
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next();
			}
		}
	}
	// 게시글 리스트 출력
	public FreeFileDTO selectByP_seq(int p_seq) throws Exception{
		String sql = "select * from fr_files where board_seq =?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, p_seq);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next(); 
				int seq = rs.getInt("file_seq");
				String oriName = rs.getString("oriName"); 
				String sysName = rs.getString("sysName");
				int parent_seq = rs.getInt("board_seq");
				FreeFileDTO result = new FreeFileDTO(seq, oriName, sysName, parent_seq);
				return result;
			}
		}
	}
	public int delete(int seq) throws Exception{
		String sql = "delete from fr_files where file_seq =? ";
		try(
		Connection con = this.getConnection();
		PreparedStatement pstat = con.prepareStatement(sql)
		){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			return result;
		}
	}

	
	
}

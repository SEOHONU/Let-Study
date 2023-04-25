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

import dto.StudyBoardDTO;
import statics.Settings;

public class StudyBoardDAO {
	private static StudyBoardDAO instance = null;
	
	
	private StudyBoardDAO() {}
	public static StudyBoardDAO getInstance() {
		if(instance == null) {
			instance = new StudyBoardDAO();
		}
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Context ictx = new InitialContext();
		DataSource ds = (DataSource)ictx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
	
	public List<StudyBoardDTO> selectStudyBoard(int start, int end) throws Exception{
		String sql = "select * from (select seq,writer,title,contents,detailcontents,view_count,write_date,rank() over(order by seq desc) rank from studyboard) where rank between ? and ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<StudyBoardDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("seq");
					String writer = rs.getString("writer");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					String detailcontents = rs.getString("detailcontents");
					int view_count = rs.getInt("view_count");
					Timestamp write_date = rs.getTimestamp("write_date");
					list.add(new StudyBoardDTO(seq,writer,title,contents,detailcontents,view_count,write_date));
				}
				return list;
			}
		}
	}
	
	public int getRecordCount() throws Exception{
		String sql = "select count(*) from studyboard";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			return rs.getInt(1);

		}
	}
	
	public List<String> getPageNavi(int recordCount, int currentPage) throws Exception{
		int recordTotalCount = recordCount;
		int recordCountPerPage = Settings.BOARD_RECORD_COUNT_PER_PAGE;
		int naviCountPerPage = Settings.BOARD_NAVI_COUNT_PER_PAGE;

		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);

		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi + (naviCountPerPage-1);
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPagePrev = true;
		boolean needPageNext = true;
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi == 1) {
			needPagePrev = false;
		}
		if(endNavi == pageTotalCount) {
			needPageNext = false;
		}
		if(currentPage == pageTotalCount) {
			needNext = false;
		}
		if(currentPage == 1) {
			needPrev = false;
		}
		List<String> list = new ArrayList<>();
		if(needPagePrev) {
			list.add("<<");
		}
		if(needPrev) {
			list.add("<");
		}
		for(int i = startNavi;i<=endNavi;i++) {

			list.add(String.valueOf(i));

		}
		if(needNext) {
			list.add(">");
		}
		if(needPageNext) {
			list.add(">>");
		}

		return list;

	}
	public StudyBoardDTO selectdetailstudyboard(int seq1) throws Exception{
		String sql = "select * from studyboard where seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq1);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				StudyBoardDTO dto = null;
				if(rs.next()) {
					int seq = rs.getInt("seq");
					String writer = rs.getString("writer");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					String detailcontents = rs.getString("detailcontents");
					int view_count = rs.getInt("view_count");
					Timestamp write_date = rs.getTimestamp("write_date");
					dto = new StudyBoardDTO(seq,writer,title,contents,detailcontents,view_count,write_date);
				}
				return dto;
			}
		}
	}
	
	public int deletestudyboard(int seq) throws Exception{
		String sql = "delete from studyboard where seq = ?";
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
	
	public int insertstudyboard(StudyBoardDTO dto) throws Exception{
		String sql = "insert into studyboard values (studyboard_seq.nextval,'213',?,?,?,default,default)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContents());
			pstat.setString(3, dto.getDetailcontents());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int updatestudyboard(StudyBoardDTO dto) throws Exception{
		String sql = "update studyboard set title = ?, contents = ?, detailcontents = ? where seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContents());
			pstat.setString(3, dto.getDetailcontents());
			pstat.setInt(4, dto.getSeq());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
}

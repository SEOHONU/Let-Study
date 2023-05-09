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
		String sql = "select * from (select seq,writer,title,contents,detailcontents,view_count,write_date,lat,lng,mapname,guestcount,rank() over(order by seq desc) rank from studyboard) where rank between ? and ?";
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
					double lat = rs.getDouble("lat");
					double lng = rs.getDouble("lng");
					String mapname = rs.getString("mapname");
					int guestcount = rs.getInt("guestcount");
					list.add(new StudyBoardDTO(seq,writer,title,contents,detailcontents,view_count,write_date,lat,lng,mapname,guestcount));
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
					double lat = rs.getDouble("lat");
					double lng = rs.getDouble("lng");
					String mapname = rs.getString("mapname");
					int guestcount = rs.getInt("guestcount");
					dto = new StudyBoardDTO(seq,writer,title,contents,detailcontents,view_count,write_date,lat,lng,mapname,guestcount);
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
		String sql = "insert into studyboard values (studyboard_seq.nextval,?,?,?,?,default,default,?,?,?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getWriter());
			pstat.setString(2, dto.getTitle());
			pstat.setString(3, dto.getContents());
			pstat.setString(4, dto.getDetailcontents());
			pstat.setDouble(5, dto.getLat());
			pstat.setDouble(6, dto.getLng());
			pstat.setString(7, dto.getMapname());
			pstat.setInt(8, dto.getGuestcount());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int updatestudyboard(StudyBoardDTO dto) throws Exception{
		String sql = "update studyboard set title = ?, contents = ?, detailcontents = ?, lat = ?, lng = ?, mapname = ?, guestcount = ? where seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContents());
			pstat.setString(3, dto.getDetailcontents());
			pstat.setDouble(4, dto.getLat());
			pstat.setDouble(5, dto.getLng());
			pstat.setString(6, dto.getMapname());
			pstat.setInt(7, dto.getGuestcount());
			pstat.setInt(8, dto.getSeq());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int updateViewCount(int view_count,int seq) throws Exception{
		String sql = "update studyboard set view_count = ? where seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, view_count);
			pstat.setInt(2, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	//마이페이지 내게시글만 뽑아오기
	public List<StudyBoardDTO> mystudyboard(String id) throws Exception{
		String sql = "select seq, title from studyboard where writer=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			try(ResultSet rs = pstat.executeQuery();){

				List<StudyBoardDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("seq");
					String title = rs.getString("title");
					list.add(new StudyBoardDTO(seq,id,title,null,null,0,null,0,0,null,0));
				}
				return list;
			}
		}
	}
	public void delete (String id) throws Exception{
		String sql ="delete from studyboard where writer=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
		pstat.executeUpdate();
		con.commit();
		
		}
	}
}

















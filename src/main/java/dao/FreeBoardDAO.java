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

import dto.FreeBoardAndMemberDTO;
import dto.FreeBoardDTO;
import statics.Settings;


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

	public int getRecordCount() throws Exception{
		String sql = "select count(*) from free_board";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			return rs.getInt(1);

		}
	}
	
	
//	FreeBoardDTO와 MembersDTO 조인 통해서 nickname 가져오기
	public List<FreeBoardAndMemberDTO> selectFreeBoardList(int start, int end) throws Exception{
		 String sql = "select * from(select b.board_seq, b.board_title, b.board_contents, b.board_writer, m.nickname, b.board_view_count, b.board_write_date, rank() over(order by b.board_seq desc) as rank from free_board b left join members m on b.board_writer = m.id) where rank between ? and ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<FreeBoardAndMemberDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("board_seq");
					String title = rs.getString("board_title");
					String contents = rs.getString("board_contents");
					String writer = rs.getString("board_writer");
					String nickname = rs.getString("nickname");
					int view_count = rs.getInt("board_view_count");
					Timestamp write_date = rs.getTimestamp("board_write_date");
					list.add(new FreeBoardAndMemberDTO(seq,title,contents,writer,nickname, view_count,write_date));
				}
				return list;
			}
		}
	}

	public String getNicknameBySeq(int seq) throws Exception{
		String sql = "SELECT m.nickname FROM free_board b INNER JOIN members m ON b.board_writer = m.id where b.board_seq =?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			pstat.executeUpdate();
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				String result = rs.getString("nickname");
				return result;
			}
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

	public int insert(String writer, String title, String content) throws Exception{
		String sql = "insert into free_board values(board_seq.nextval, ?,?,?,?,sysdate)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, title);
			pstat.setString(2, content);
			pstat.setString(3, writer);
			pstat.setInt(4, 0);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	public List<FreeBoardDTO> selectList() throws Exception{
		String sql = "select * from free_board order by board_seq desc";
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
		String sql = "select * from free_board where board_seq=?";
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

	public int update(int seq,String title, String content) throws Exception{
		String sql = "update free_board set board_title=?, board_contents=?, board_write_date =sysdate where board_seq=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, title);
			pstat.setString(2, content);
			pstat.setInt(3,seq);
			int result = pstat.executeUpdate();
			return result;
		}
	}

	public int deleteBySeq(int seq) throws Exception{
		String sql = "delete from free_board where board_seq =?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public int freeBoardViewUp (int seq) throws Exception{
		String sql = "update free_board set board_view_count = board_view_count + 1 where board_seq = ?";
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
	

	//마이페이지 내게시글만 뽑아오기
	public List<FreeBoardDTO> myfreeboard(String id) throws Exception{
		String sql = "select board_seq, board_title from free_board where board_writer=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			try(ResultSet rs = pstat.executeQuery();){

				List<FreeBoardDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("board_seq");
					String title = rs.getString("board_title");
					list.add(new FreeBoardDTO(seq,title,null,null,0,null));
				}
			return list;
			}
		}
	}

	
	public List<FreeBoardAndMemberDTO> freeBoardSearch(String option, String target,int start, int end) throws Exception{
		String sql = "";
		if (option.equals("제목")) {
			sql = "select * from(select b.board_seq, b.board_title, b.board_contents, b.board_writer, m.nickname, b.board_view_count, b.board_write_date, rank() over(order by b.board_seq desc) as rank from free_board b left join members m on b.board_writer = m.id) where rank between ? and ? and  LOWER(board_title) like LOWER(?)";
		} else if (option.equals("내용")) {
			sql = "select * from(select b.board_seq, b.board_title, b.board_contents, b.board_writer, m.nickname, b.board_view_count, b.board_write_date, rank() over(order by b.board_seq desc) as rank from free_board b left join members m on b.board_writer = m.id) where rank between ? and ? and  LOWER(board_contents) like LOWER(?)";
		} else if (option.equals("닉네임")) {
			sql = "select * from(select b.board_seq, b.board_title, b.board_contents, b.board_writer, m.nickname, b.board_view_count, b.board_write_date, rank() over(order by b.board_seq desc) as rank from free_board b left join members m on b.board_writer = m.id) where rank between ? and ? and  LOWER(nickname) like LOWER(?)";
		}
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql);) {
			System.out.println(start);
			System.out.println(end);
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			pstat.setString(3, "%" + target + "%");
			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<FreeBoardAndMemberDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("board_seq");
					String title = rs.getString("board_title");
					String contents = rs.getString("board_contents");
					String writer = rs.getString("board_writer");
					String nickname = rs.getString("nickname");
					int view_count = rs.getInt("board_view_count");
					Timestamp write_date = rs.getTimestamp("board_write_date");
					list.add(new FreeBoardAndMemberDTO(seq,title,contents,writer,nickname, view_count,write_date));

				}
				return list;
			}
		}
	}
}

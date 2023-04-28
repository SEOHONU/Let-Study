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

import dto.SecondHandDTO;
import statics.Settings;

public class SecondHandDAO {
	private SecondHandDAO() {}

	private static SecondHandDAO instance = null;

	public synchronized static SecondHandDAO getInstance() {
		if(instance == null) {
			instance = new SecondHandDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource)iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
	public int insertSecondHand(SecondHandDTO dto) throws Exception{
		String sql = "insert into secondHand values"
				+ "(sh_seq.nextval, ?, ?, ?, default, default, ?, ?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContents());
			pstat.setString(3, dto.getWriter());
			pstat.setDouble(4, dto.getLat());
			pstat.setDouble(5, dto.getLng());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	private int getRecordCount() throws Exception{
		String sql = "select count(*) from secondHand";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			return rs.getInt(1);
		}
	}
	private int getRecordCountSearch(String searchText, String option) throws Exception{
		String sql = "select count(*) from secondHand where "+option+" like ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, "%"+searchText+"%");
			try(
					ResultSet rs = pstat.executeQuery();
					){
				rs.next();
				return rs.getInt(1);
			}
		}
	}
	public List<String> getPageNaviSearch(int currentPage, String searchText, String option) throws Exception{
		int recordCount = this.getRecordCountSearch(searchText, option);
		int recordCountPerPage = Settings.SH_BOARD_RECORD_COUNT_PER_PAGE;
		int naviCountPerPage = Settings.SH_BOARD_NAVI_COUNT_PER_PAGE;
		int pageTotalCount = 0;
		if(recordCount % recordCountPerPage > 0) {
			pageTotalCount = recordCount / recordCountPerPage + 1;
		}else {
			pageTotalCount = recordCount / recordCountPerPage;
		}
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage - 1);

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		List<String> list = new ArrayList<>();

		if(needPrev) {
			list.add("◀");
		}
		for(int i = startNavi; i <= endNavi; i++) {
			String index = Integer.toString(i);
			list.add(index);
		}
		if(needNext) {
			list.add("▶");
		}
		return list;
	}
	public SecondHandDTO selectContents(int targetSeq) throws Exception{
		String sql = "select * from secondHand where seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, targetSeq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				rs.next();
				int seq = rs.getInt(1);
				String title = rs.getString(2);
				String contents = rs.getString(3);
				String writer = rs.getString(4);
				Timestamp write_date = rs.getTimestamp(5);
				int view_count = rs.getInt(6);
				double lat = rs.getDouble(7);
				double lng = rs.getDouble(8);
				return new SecondHandDTO(seq, title, contents, writer, write_date,
						view_count, lat, lng);
			}
		}
	}
	public List<SecondHandDTO> selectRecordByPage(int startRecord, int endRecord) 
			throws Exception{
		String sql = "select * from(select secondHand.*, row_number() over(order by seq desc) rn from secondHand)"
				+ "where rn between ? and ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, startRecord);
			pstat.setInt(2, endRecord);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<SecondHandDTO> recordList = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt(1);
					String title = rs.getString(2);
					String contents = rs.getString(3);
					String writer = rs.getString(4);
					Timestamp write_date = rs.getTimestamp("write_date");
					int view_count = rs.getInt("view_count");
					double lat = rs.getDouble("LAT");
					double lng = rs.getDouble("LNG");
					recordList.add(new SecondHandDTO(seq, title, contents, writer,
							write_date, view_count, lat, lng));
				}
				return recordList;
			}
		}
	}
	public List<SecondHandDTO> searchRecordByPage
	(int startRecord, int endRecord, String searchText, String option) 
			throws Exception{
		String sql = "select * from(select secondHand.*, row_number()"
				+ " over(order by seq desc) rn from secondHand where "+option+" like ?)"
				+ "where rn between ? and ? ";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, "%"+searchText+"%");
			pstat.setInt(2, startRecord);
			pstat.setInt(3, endRecord);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<SecondHandDTO> recordList = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt(1);
					String title = rs.getString(2);
					String contents = rs.getString(3);
					String writer = rs.getString(4);
					Timestamp write_date = rs.getTimestamp("write_date");
					int view_count = rs.getInt("view_count");
					double lat = rs.getDouble("LAT");
					double lng = rs.getDouble("LNG");
					recordList.add(new SecondHandDTO(seq, title, contents, writer,
							write_date, view_count, lat, lng));
				}
				return recordList;
			}
		}
	}
	public int secondHandBoardViewUp (int targetSeq) throws Exception{
		String sql = "update secondHand set view_count = view_count + 1 where seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, targetSeq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	public List<String> getPageNavi(int currentPage) throws Exception{
		int recordCount = this.getRecordCount();
		int recordCountPerPage = Settings.SH_BOARD_RECORD_COUNT_PER_PAGE;
		int naviCountPerPage = Settings.SH_BOARD_NAVI_COUNT_PER_PAGE;
		int pageTotalCount = 0;
		if(recordCount % recordCountPerPage > 0) {
			pageTotalCount = recordCount / recordCountPerPage + 1;
		}else {
			pageTotalCount = recordCount / recordCountPerPage;
		}
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage - 1);

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		List<String> list = new ArrayList<>();

		if(needPrev) {
			list.add("◀");
		}
		for(int i = startNavi; i <= endNavi; i++) {
			String index = Integer.toString(i);
			list.add(index);
		}
		if(needNext) {
			list.add("▶");
		}
		return list;
	}
	public int deleteContents(int seq) throws Exception{
		String sql = "delete from secondHand where seq = ?";
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
	public int modifyContents(SecondHandDTO dto) throws Exception {
		String sql = "update secondHand set title = ?, contents = ?, "
				+ "lat = ?, lng = ?, write_date = default where seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContents());
			pstat.setDouble(3, dto.getLat());
			pstat.setDouble(4, dto.getLng());
			pstat.setInt(5, dto.getSeq());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
}

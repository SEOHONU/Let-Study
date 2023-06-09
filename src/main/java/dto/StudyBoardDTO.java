package dto;

import java.sql.Timestamp;

public class StudyBoardDTO {
	private int seq;
	private String writer;
	private String title;
	private String contents;
	private String detailcontents;
	private int view_count;
	private Timestamp write_date;
	private double lat;
	private double lng;
	private String mapname;
	private int guestcount;
	
	public StudyBoardDTO() {}
	public StudyBoardDTO(int seq, String writer, String title, String contents, String detailcontents, int view_count,
			Timestamp write_date, double lat, double lng, String mapname, int guestcount) {
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.contents = contents;
		this.detailcontents = detailcontents;
		this.view_count = view_count;
		this.write_date = write_date;
		this.lat = lat;
		this.lng = lng;
		this.mapname = mapname;
		this.guestcount = guestcount;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getDetailcontents() {
		return detailcontents;
	}
	public void setDetailcontents(String detailcontents) {
		this.detailcontents = detailcontents;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public String getMapname() {
		return mapname;
	}
	public void setMapname(String mapname) {
		this.mapname = mapname;
	}
	public int getGuestcount() {
		return guestcount;
	}
	public void setGuestcount(int guestcount) {
		this.guestcount = guestcount;
	}
}

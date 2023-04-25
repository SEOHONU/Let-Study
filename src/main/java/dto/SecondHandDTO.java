package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class SecondHandDTO {
	private int seq;
	private String title;
	private String contents;
	private String writer;
	private Timestamp write_date;
	private int view_count;
	private double lat;
	private double lng;
	private String selled;
	public SecondHandDTO() {}
	
	public SecondHandDTO(int seq, String title, String contents, String writer, Timestamp write_date, int view_count,
			double lat, double lng, String selled) {
		super();
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.write_date = write_date;
		this.view_count = view_count;
		this.lat = lat;
		this.lng = lng;
		this.selled = selled;
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
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
	public String getSelled() {
		return selled;
	}
	public void setSelled(String selled) {
		this.selled = selled;
	}
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
		return sdf.format(this.write_date.getTime());
	}
	public String getDetailDate() {
		long current_time = System.currentTimeMillis();
		long write_time = this.getWrite_date().getTime();
		long time_gap = current_time - write_time;
		if(time_gap < 60000) {
			return "1분 이내";
		}else if(time_gap < 300000) {
			return "5분 이내";
		}else if(time_gap < 3600000) {
			return "1시간 이내";
		}else if(time_gap < 86400000) {
			return "하루 이내";
		}else {
			return this.getFormedDate();
		}
	}
}

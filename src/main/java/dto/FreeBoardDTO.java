package dto;

import java.sql.Timestamp;

public class FreeBoardDTO {
	private int seq;
	private String title;
	private String content;
	private String writer;
	private int view_count;
	private Timestamp write_date;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public FreeBoardDTO(int seq, String title, String content, String writer, int view_count, Timestamp write_date) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.view_count = view_count;
		this.write_date = write_date;
	}
	public FreeBoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getSeq() {
		return seq;
	}
	
}

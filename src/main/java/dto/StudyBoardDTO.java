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
	
	public StudyBoardDTO() {}
	public StudyBoardDTO(int seq, String writer, String title, String contents, String detailcontents, int view_count,
			Timestamp write_date) {
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.contents = contents;
		this.detailcontents = detailcontents;
		this.view_count = view_count;
		this.write_date = write_date;
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
	
}

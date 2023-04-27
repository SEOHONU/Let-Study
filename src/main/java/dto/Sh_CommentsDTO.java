package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Sh_CommentsDTO {
	private int com_seq;
	private String com_writer;
	private String com_contents;
	private Timestamp com_write_date;
	private int board_seq;
	private int parent_seq;
	public Sh_CommentsDTO() {}
	public Sh_CommentsDTO(int com_seq, String com_writer, String com_contents, Timestamp com_write_date, int board_seq,
			int parent_seq) {
		super();
		this.com_seq = com_seq;
		this.com_writer = com_writer;
		this.com_contents = com_contents;
		this.com_write_date = com_write_date;
		this.board_seq = board_seq;
		this.parent_seq = parent_seq;
	}
	public int getCom_seq() {
		return com_seq;
	}
	public void setCom_seq(int com_seq) {
		this.com_seq = com_seq;
	}
	public String getCom_writer() {
		return com_writer;
	}
	public void setCom_writer(String com_writer) {
		this.com_writer = com_writer;
	}
	public String getCom_contents() {
		return com_contents;
	}
	public void setCom_contents(String com_contents) {
		this.com_contents = com_contents;
	}
	public Timestamp getCom_write_date() {
		return com_write_date;
	}
	public void setCom_write_date(Timestamp com_write_date) {
		this.com_write_date = com_write_date;
	}
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public int getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
		return sdf.format(this.com_write_date.getTime());
	}
	public String getDetailDate() {
		long current_time = System.currentTimeMillis();
		long write_time = this.getCom_write_date().getTime();
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

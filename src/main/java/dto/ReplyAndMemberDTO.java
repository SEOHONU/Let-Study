package dto;

import java.sql.Timestamp;

public class ReplyAndMemberDTO {
private int seq;
private String writer;
private String nickname;
private String contents;
private Timestamp write_date;
private int board_seq;
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
public String getNickname() {
	return nickname;
}
public void setNickname(String nickname) {
	this.nickname = nickname;
}
public String getContents() {
	return contents;
}
public void setContents(String contents) {
	this.contents = contents;
}
public Timestamp getWrite_date() {
	return write_date;
}
public void setWrite_date(Timestamp write_date) {
	this.write_date = write_date;
}
public int getBoard_seq() {
	return board_seq;
}
public void setBoard_seq(int board_seq) {
	this.board_seq = board_seq;
}
public ReplyAndMemberDTO(int seq, String writer, String nickname, String contents, Timestamp write_date,
		int board_seq) {
	super();
	this.seq = seq;
	this.writer = writer;
	this.nickname = nickname;
	this.contents = contents;
	this.write_date = write_date;
	this.board_seq = board_seq;
}
public ReplyAndMemberDTO() {
	super();
	// TODO Auto-generated constructor stub
}
}

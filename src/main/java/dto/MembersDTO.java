package dto;

import java.sql.Timestamp;

public class MembersDTO {
	
	private String id;
	private String pw; 
	private String nickname;
	private String contact;
	private String email;
	private String zipcode;
	private String address1;
	private String address2;
	private Timestamp join_date;
	private String grade_code;
	
	public MembersDTO() {}; 
	
	public MembersDTO(String id, String pw, String nickname, String contact, String email, String zipcode,
			String address1, String address2, Timestamp join_date, String grade_code) {
		super();
		this.id = id;
		this.pw = pw;
		this.nickname = nickname;
		this.contact = contact;
		this.email = email;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.join_date = join_date;
		this.grade_code = grade_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public Timestamp getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}

	public String getGrade_code() {
		return grade_code;
	}

	public void setGrade_code(String grade_code) {
		this.grade_code = grade_code;
	} 
	
	
	

}

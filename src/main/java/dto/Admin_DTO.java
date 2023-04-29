package dto;

public class Admin_DTO {

	private String Admin_id;
	private String Admin_pw;
	public Admin_DTO(String admin_id, String admin_pw) {
		super();
		Admin_id = admin_id;
		Admin_pw = admin_pw;
	}
	public String getAdmin_id() {
		return Admin_id;
	}
	public void setAdmin_id(String admin_id) {
		Admin_id = admin_id;
	}
	public String getAdmin_pw() {
		return Admin_pw;
	}
	public void setAdmin_pw(String admin_pw) {
		Admin_pw = admin_pw;
	}

}

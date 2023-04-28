package dto;

public class Profile_settingDTO {

	private String profile_id;
	private String profile_nickname;
	private String profile_introduce; 
	private String profile_instargram;
	private String profile_facebook;
	private String profile_url;
	
	
	public Profile_settingDTO() {
		super();
	}
	public Profile_settingDTO(String profile_id, String profile_nickname, String profile_introduce,
			String profile_instargram, String profile_facebook, String profile_url) {
		super();
		this.profile_id = profile_id;
		this.profile_nickname = profile_nickname;
		this.profile_introduce = profile_introduce;
		this.profile_instargram = profile_instargram;
		this.profile_facebook = profile_facebook;
		this.profile_url = profile_url;
	}
	public String getProfile_id() {
		return profile_id;
	}
	public void setProfile_id(String profile_id) {
		this.profile_id = profile_id;
	}
	public String getProfile_nickname() {
		return profile_nickname;
	}
	public void setProfile_nickname(String profile_nickname) {
		this.profile_nickname = profile_nickname;
	}
	public String getProfile_introduce() {
		return profile_introduce;
	}
	public void setProfile_introduce(String profile_introduce) {
		this.profile_introduce = profile_introduce;
	}
	public String getProfile_instargram() {
		return profile_instargram;
	}
	public void setProfile_instargram(String profile_instargram) {
		this.profile_instargram = profile_instargram;
	}
	public String getProfile_facebook() {
		return profile_facebook;
	}
	public void setProfile_facebook(String profile_facebook) {
		this.profile_facebook = profile_facebook;
	}
	public String getProfile_url() {
		return profile_url;
	}
	public void setProfile_url(String profile_url) {
		this.profile_url = profile_url;
	}

	
	
	
	
}

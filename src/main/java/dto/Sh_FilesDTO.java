package dto;

public class Sh_FilesDTO {
	private int sh_files_seq;
	private String oriName;
	private String sysName;
	private int parent_seq;
	public Sh_FilesDTO() {}
	public Sh_FilesDTO(int sh_files_seq, String oriName, String sysName, int parent_seq) {
		super();
		this.sh_files_seq = sh_files_seq;
		this.oriName = oriName;
		this.sysName = sysName;
		this.parent_seq = parent_seq;
	}
	public int getSh_files_seq() {
		return sh_files_seq;
	}
	public void setSh_files_seq(int sh_files_seq) {
		this.sh_files_seq = sh_files_seq;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	public int getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}
}

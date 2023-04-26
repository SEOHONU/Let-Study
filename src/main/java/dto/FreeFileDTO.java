package dto;

public class FreeFileDTO {
	private int seq;
	private String oriName;
	private String sysName;
	private int parent_seq;
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
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
	public FreeFileDTO(int seq, String oriName, String sysName, int parent_seq) {
		super();
		this.seq = seq;
		this.oriName = oriName;
		this.sysName = sysName;
		this.parent_seq = parent_seq;
	}
	public FreeFileDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

}

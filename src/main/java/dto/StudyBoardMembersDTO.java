package dto;

public class StudyBoardMembersDTO {
	private String id;
	private int board_seq;
	private String yorN;
	
	public StudyBoardMembersDTO(String id, int board_seq, String yorN) {
		this.id = id;
		this.board_seq = board_seq;
		this.yorN = yorN;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public String getYorN() {
		return yorN;
	}

	public void setYorN(String yorN) {
		this.yorN = yorN;
	}
	
}

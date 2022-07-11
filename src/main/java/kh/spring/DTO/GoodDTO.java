package kh.spring.DTO;

public class GoodDTO {
	private int like_seq;
	private String email;
	private String parente_seq;
	
	public GoodDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GoodDTO(int like_seq, String email, String parente_seq) {
		super();
		this.like_seq = like_seq;
		this.email = email;
		this.parente_seq = parente_seq;
	}
	public int getLike_seq() {
		return like_seq;
	}
	public void setLike_seq(int like_seq) {
		this.like_seq = like_seq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getParente_seq() {
		return parente_seq;
	}
	public void setParente_seq(String parente_seq) {
		this.parente_seq = parente_seq;
	}
	
	
}

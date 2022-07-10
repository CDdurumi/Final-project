package kh.spring.DTO;

import java.sql.Timestamp;

public class RegStdsDTO {
	private int regstds_seq;
	private String std_id;
	private Timestamp reg_date;
	private String type;
	private String parent_seq;
	
	public RegStdsDTO(int regstds_seq, String std_id, Timestamp reg_date, String type, String parent_seq) {
		super();
		this.regstds_seq = regstds_seq;
		this.std_id = std_id;
		this.reg_date = reg_date;
		this.type = type;
		this.parent_seq = parent_seq;
	}

	public int getRegstds_seq() {
		return regstds_seq;
	}

	public void setRegstds_seq(int regstds_seq) {
		this.regstds_seq = regstds_seq;
	}

	public String getStd_id() {
		return std_id;
	}

	public void setStd_id(String std_id) {
		this.std_id = std_id;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getParent_seq() {
		return parent_seq;
	}

	public void setParent_seq(String parent_seq) {
		this.parent_seq = parent_seq;
	}
}

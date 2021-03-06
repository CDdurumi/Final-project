package kh.spring.DTO;

import java.sql.Timestamp;

public class ReviewDTO {
	private String review_seq;
	private String std_id;
	private Float stars;
	private String contents;
	private String sys_name;
	private Timestamp write_date;
	private int like_count;
	private int state;
	private String parent_seq;
	
	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public ReviewDTO(String review_seq, String std_id, Float stars, String contents, String sys_name,
			Timestamp write_date, int like_count, int state, String parent_seq) {
		super();
		this.review_seq = review_seq;
		this.std_id = std_id;
		this.stars = stars;
		this.contents = contents;
		this.sys_name = sys_name;
		this.write_date = write_date;
		this.like_count = like_count;
		this.state = state;
		this.parent_seq = parent_seq;
	}

	public String getReview_seq() {
		return review_seq;
	}

	public void setReview_seq(String review_seq) {
		this.review_seq = review_seq;
	}

	public String getStd_id() {
		return std_id;
	}

	public void setStd_id(String std_id) {
		this.std_id = std_id;
	}

	public Float getStars() {
		return stars;
	}

	public void setStars(Float stars) {
		this.stars = stars;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public String getSys_name() {
		return sys_name;
	}

	public void setSys_name(String sys_name) {
		this.sys_name = sys_name;
	}

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getParent_seq() {
		return parent_seq;
	}

	public void setParent_seq(String parent_seq) {
		this.parent_seq = parent_seq;
	}
}

package kh.spring.DTO;

import java.sql.Timestamp;

public class ClassReviewDTO {
	private String review_seq;
	private String std_id;
	private int stars;
	private String contents;
	private Timestamp write_date;
	private int like_count;
	private int state;
	private String parent_seq;
	
	public ClassReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public ClassReviewDTO(String review_seq, String std_id, int stars, String contents, Timestamp write_date,
			int like_count, int state, String parent_seq) {
		super();
		this.review_seq = review_seq;
		this.std_id = std_id;
		this.stars = stars;
		this.contents = contents;
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

	public int getStars() {
		return stars;
	}

	public void setStars(int stars) {
		this.stars = stars;
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

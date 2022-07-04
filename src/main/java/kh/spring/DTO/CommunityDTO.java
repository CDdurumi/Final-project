package kh.spring.DTO;

import java.sql.Timestamp;

public class CommunityDTO {
	private String board_seq;
	private String title;
	private String writer;
	private String contents;
	private Timestamp write_date;
	private int like_count;
	private int view_count;
	private String hash_tag;
	private String board_type;
	private String progress;
	private String state;
	public CommunityDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommunityDTO(String board_seq, String title, String writer, String contents, Timestamp write_date,
			int like_count, int view_count, String hash_tag, String board_type, String progress, String state) {
		super();
		this.board_seq = board_seq;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.write_date = write_date;
		this.like_count = like_count;
		this.view_count = view_count;
		this.hash_tag = hash_tag;
		this.board_type = board_type;
		this.progress = progress;
		this.state = state;
	}
	public String getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(String board_seq) {
		this.board_seq = board_seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public String getHash_tag() {
		return hash_tag;
	}
	public void setHash_tag(String hash_tag) {
		this.hash_tag = hash_tag;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}

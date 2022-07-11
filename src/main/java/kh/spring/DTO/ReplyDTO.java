package kh.spring.DTO;

import java.sql.Timestamp;

public class ReplyDTO {
	private String reply_seq;
	private String writer;
	private String contents;
	private Timestamp write_date;
	private int like_count;
	private String state;
	private String parent_seq;
	private String board_seq;
	
	public ReplyDTO() {}
	
	public ReplyDTO(String reply_seq, String writer, String contents, Timestamp write_date, int like_count,
			String state, String parent_seq, String board_seq) {
		super();
		this.reply_seq = reply_seq;
		this.writer = writer;
		this.contents = contents;
		this.write_date = write_date;
		this.like_count = like_count;
		this.state = state;
		this.parent_seq = parent_seq;
		this.board_seq = board_seq;
	}

	public String getReply_seq() {
		return reply_seq;
	}

	public void setReply_seq(String reply_seq) {
		this.reply_seq = reply_seq;
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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getParent_seq() {
		return parent_seq;
	}

	public void setParent_seq(String parent_seq) {
		this.parent_seq = parent_seq;
	}

	public String getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(String board_seq) {
		this.board_seq = board_seq;
	}
}

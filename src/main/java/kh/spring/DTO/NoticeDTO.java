package kh.spring.DTO;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class NoticeDTO {
	
	private int notice_seq;
	private String title;
	private String contents;
	private Timestamp write_date;
	private int view_count;
	
	public NoticeDTO() {
	}

	public NoticeDTO(int notice_seq, String title, String contents, Timestamp write_date, int view_count) {
		super();
		this.notice_seq = notice_seq;
		this.title = title;
		this.contents = contents;
		this.write_date = write_date;
		this.view_count = view_count;
	}


	public int getNotice_seq() {
		return notice_seq;
	}

	public void setNotice_seq(int notice_seq) {
		this.notice_seq = notice_seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yy.mm.dd");
		return sdf.format(this.write_date.getTime());
	}
	

}

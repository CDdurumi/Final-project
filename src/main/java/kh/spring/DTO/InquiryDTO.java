package kh.spring.DTO;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class InquiryDTO {
	
	private int inquiry_seq;
	private String writer;
	private String email;
	private String title;
	private String contents;
	private Timestamp write_date;
	private int sts;
	
	public InquiryDTO() {}

	public InquiryDTO(int inquiry_seq, String writer, String email, String title, String contents, Timestamp write_date,
			int sts) {
		super();
		this.inquiry_seq = inquiry_seq;
		this.writer = writer;
		this.email = email;
		this.title = title;
		this.contents = contents;
		this.write_date = write_date;
		this.sts = sts;
	}

	public int getInquiry_seq() {
		return inquiry_seq;
	}

	public void setInquiry_seq(int inquiry_seq) {
		this.inquiry_seq = inquiry_seq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public int getSts() {
		return sts;
	}

	public void setSts(int sts) {
		this.sts = sts;
	}

	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yy.mm.dd");
		return sdf.format(this.write_date.getTime());
	}
	
	
	

}

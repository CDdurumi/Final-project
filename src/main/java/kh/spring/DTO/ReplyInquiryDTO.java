package kh.spring.DTO;

import java.sql.Timestamp;

public class ReplyInquiryDTO {

		private int	reply_inquiry_seq; 
		private String	writer;
		private String	contents;
		private Timestamp write_date; 
		private int	parent_seq;
		
		public ReplyInquiryDTO() {}

		public ReplyInquiryDTO(int reply_inquiry_seq, String writer, String contents, Timestamp write_date,
				int parent_seq) {
			super();
			this.reply_inquiry_seq = reply_inquiry_seq;
			this.writer = writer;
			this.contents = contents;
			this.write_date = write_date;
			this.parent_seq = parent_seq;
		}

		public int getReply_inquiry_seq() {
			return reply_inquiry_seq;
		}

		public void setReply_inquiry_seq(int reply_inquiry_seq) {
			this.reply_inquiry_seq = reply_inquiry_seq;
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

		public int getParent_seq() {
			return parent_seq;
		}

		public void setParent_seq(int parent_seq) {
			this.parent_seq = parent_seq;
		} 
	
}

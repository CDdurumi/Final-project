package kh.spring.DTO;

import java.sql.Timestamp;

public class ReportDTO {
	private String report_seq;
	private String contents;
	private String reason;
	private String writer;
	private String reporter;
	private Timestamp report_date;
	private String parent_seq;
	public ReportDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReportDTO(String report_seq, String contents, String reason, String writer, String reporter,
			Timestamp report_date, String parent_seq) {
		super();
		this.report_seq = report_seq;
		this.contents = contents;
		this.reason = reason;
		this.writer = writer;
		this.reporter = reporter;
		this.report_date = report_date;
		this.parent_seq = parent_seq;
	}
	public String getReport_seq() {
		return report_seq;
	}
	public void setReport_seq(String report_seq) {
		this.report_seq = report_seq;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public Timestamp getReport_date() {
		return report_date;
	}
	public void setReport_date(Timestamp report_date) {
		this.report_date = report_date;
	}
	public String getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(String parent_seq) {
		this.parent_seq = parent_seq;
	}
}

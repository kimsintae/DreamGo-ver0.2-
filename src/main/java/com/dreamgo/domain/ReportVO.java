package com.dreamgo.domain;

import java.util.Date;

public class ReportVO {

	private int no;
	private String reporter;
	private int reportedBno;
	private String reportedWriter;
	private String reportedTitle;
	private String cause;
	private char state;
	private Date regdate;
	
	private String realState;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public int getReportedBno() {
		return reportedBno;
	}
	public void setReportedBno(int reportedBNo) {
		this.reportedBno = reportedBNo;
	}
	public String getReportedWriter() {
		return reportedWriter;
	}
	public void setReportedWriter(String reportedWriter) {
		this.reportedWriter = reportedWriter;
	}
	public String getReportedTitle() {
		return reportedTitle;
	}
	public void setReportedTitle(String reportedTitle) {
		this.reportedTitle = reportedTitle;
	}
	public String getCause() {
		return cause;
	}
	public void setCause(String cause) {
		this.cause = cause;
	}
	public char getState() {
		return state;
	}
	public void setState(char state) {
		this.state = state;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getRealState() {
		return state=='U'?"미처리":"처리";
	}
	
	
	
}

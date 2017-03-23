package com.dreamgo.domain;

import java.util.Date;

public class Report {

	private int no;
	private String repoter;
	private int reportedAno;
	private String cause;
	private char state;
	private Date regdate;
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getRepoter() {
		return repoter;
	}
	public void setRepoter(String repoter) {
		this.repoter = repoter;
	}
	public int getReportedAno() {
		return reportedAno;
	}
	public void setReportedAno(int reportedAno) {
		this.reportedAno = reportedAno;
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
	
	
}

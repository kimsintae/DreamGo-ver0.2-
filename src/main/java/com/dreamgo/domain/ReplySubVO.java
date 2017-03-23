package com.dreamgo.domain;

import java.util.Date;

public class ReplySubVO {

	private int sno;
	private String content;
	private int userNo;
	private int mainNo;
	private Date regdate;
	
	
	
	public int getNo() {
		return sno;
	}
	public void setNo(int sno) {
		this.sno = sno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getMainNo() {
		return mainNo;
	}
	public void setMainNo(int mainNo) {
		this.mainNo = mainNo;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}

package com.dreamgo.domain;

import java.util.Date;

public class ReplySubVO {

	private int sno;
	private String content;
	private int userNo;
	private int mainNo;
	private int articleNo;
	private Date regdate;
	
	
	//조인해서 얻어온 유저 컬럼
	private String nickname;
	private String profile;
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
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
	public int getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
}

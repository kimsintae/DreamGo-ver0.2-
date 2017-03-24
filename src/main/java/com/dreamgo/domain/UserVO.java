package com.dreamgo.domain;

public class UserVO {
	
	private int no;
	private String email;
	private String password;
	private String checkPwd;
	private String nickname;
	private char type;
	private String dream;
	private String profile;
	
	private boolean emailAuth;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public char getType() {
		return type;
	}
	public void setType(char type) {
		this.type = type;
	}
	public String getDream() {
		return dream;
	}
	public void setDream(String dream) {
		this.dream = dream;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getCheckPwd() {
		return checkPwd;
	}
	public void setCheckPwd(String checkPwd) {
		this.checkPwd = checkPwd;
	}
	
	public boolean isEmailAuth() {
		return emailAuth;
	}
	public void setEmailAuth(boolean emailAuth) {
		this.emailAuth = emailAuth;
	}
	
	

}
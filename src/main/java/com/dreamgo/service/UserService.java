package com.dreamgo.service;

import com.dreamgo.domain.UserVO;

public interface UserService {

	//회원가입
	public int insertUser(UserVO user)throws Exception;
	
	//로그인
	public UserVO login(UserVO user)throws Exception;
	
	//회원정보 수정
	public void modifyInfo(UserVO user)throws Exception;
}

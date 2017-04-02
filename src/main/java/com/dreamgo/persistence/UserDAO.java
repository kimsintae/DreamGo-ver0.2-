package com.dreamgo.persistence;

import com.dreamgo.domain.UserVO;

public interface UserDAO {

	public int insertUser(UserVO vo)throws Exception;
	public UserVO login(UserVO user)throws Exception;
	public void modifyInfo(UserVO user)throws Exception;
	public UserVO checkDupEmail(String email)throws Exception;
}

package com.dreamgo.service;

import com.dreamgo.domain.UserVO;

public interface UserService {

	public int insertUser(UserVO user)throws Exception;
	public UserVO login(UserVO user)throws Exception;
}

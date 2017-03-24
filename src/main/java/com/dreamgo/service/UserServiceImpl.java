package com.dreamgo.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dreamgo.domain.UserVO;
import com.dreamgo.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;
	
	
	//회원가입
	@Override
	public int insertUser(UserVO user)throws Exception {
		return dao.insertUser(user);
	}
	
	//로그인
	@Override
	public UserVO login(UserVO user) throws Exception {
		return dao.login(user);
	}
	
}

package com.dreamgo.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dreamgo.domain.UserVO;
import com.dreamgo.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;
	
	@Override
	public int insertUser(UserVO user) {
		return dao.insertUser(user);
	}
	
}

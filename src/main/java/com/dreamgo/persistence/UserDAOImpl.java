package com.dreamgo.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dreamgo.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace=
			"com.dreamgo.mapper.UserMapper";
	
	@Override
	public int insertUser(UserVO user)throws Exception {
		return sqlSession.insert(namespace+".insertUser",user);
	}
	
	@Override
	public UserVO login(UserVO user) throws Exception {
		return sqlSession.selectOne(namespace+".login",user);
	}
	
	@Override
	public void modifyInfo(UserVO user) throws Exception {
		sqlSession.update(namespace+".modifyInfo",user);
	}
	
	@Override
	public UserVO checkDupEmail(String email) throws Exception {
		return sqlSession.selectOne(namespace+".checkDupEmail",email);
	}
	
}

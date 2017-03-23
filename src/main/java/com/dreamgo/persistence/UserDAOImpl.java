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
	public int insertUser(UserVO vo) {
		return sqlSession.insert(namespace+".insertUser",vo);
	}
	
}

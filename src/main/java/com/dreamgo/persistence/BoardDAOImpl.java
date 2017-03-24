package com.dreamgo.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dreamgo.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace=
			"com.dreamgo.mapper.BoardMapper";
	
	@Override
	public List<BoardVO> list() throws Exception {
		return sqlSession.selectList(namespace+".list");
	}
}

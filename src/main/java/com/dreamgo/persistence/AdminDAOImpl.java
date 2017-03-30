package com.dreamgo.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
	
import com.dreamgo.domain.BoardVO;
import com.dreamgo.domain.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace=
			"com.dreamgo.mapper.AdminMapper";
	
	@Override
	public int admin_removeArticle(int bno) throws Exception {
		return sqlSession.delete(namespace+".admin_removeArticle",bno);
	}
	
	@Override
	public int admin_modifyArticle(BoardVO board) throws Exception {
		return sqlSession.update(namespace+".admin_modifyArticle",board);
	}
	
	@Override
	public int admin_removeCheck(List<Integer> bnoList) throws Exception {
		return sqlSession.delete(namespace+".admin_removeCheck",bnoList);
	}
	
	@Override
	public List<UserVO> userList() throws Exception {
		return sqlSession.selectList(namespace+".userList");
	}
	
	@Override
	public int modifyAuth(UserVO user) throws Exception {
		return sqlSession.update(namespace+".modifyAuth",user);
	}
}

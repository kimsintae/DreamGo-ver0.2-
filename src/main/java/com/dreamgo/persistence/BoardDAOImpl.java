package com.dreamgo.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dreamgo.domain.BoardVO;
import com.dreamgo.util.PageMaker;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace=
			"com.dreamgo.mapper.BoardMapper";
	
	@Override
	public int totalCount() throws Exception {
		return sqlSession.selectOne(namespace+".totalCount");
	}
	
	@Override
	public List<BoardVO> list(PageMaker pm) throws Exception {
		return sqlSession.selectList(namespace+".list",pm);
	}
	
	@Override
	public int insertBoard(BoardVO board) throws Exception {
		return sqlSession.insert(namespace+".insertBoard",board);
	}
	
	@Override
	public BoardVO read(int writer) throws Exception {
		return sqlSession.selectOne(namespace+".read",writer);
	}
	
	@Override
	public void increaseReadCnt(int bno) throws Exception {
		sqlSession.update(namespace+".increaseReadCnt",bno);
	}
	
	@Override
	public int modifyArticle(BoardVO board) throws Exception {
		return sqlSession.update(namespace+".modifyArticle",board);
	}
	
	@Override
	public void removeArticle(int bno) throws Exception {
		sqlSession.delete(namespace+".removeArticle",bno);
	}
}

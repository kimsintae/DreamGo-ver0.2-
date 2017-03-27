package com.dreamgo.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dreamgo.domain.ReplyMainVO;
import com.dreamgo.domain.ReplySubVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace=
			"com.dreamgo.mapper.ReplyMapper";
	
	@Override
	public int insertReplyMain(ReplyMainVO rm) throws Exception {
		return sqlSession.insert(namespace+".insertReplyMain",rm);
	}
	
	@Override
	public int insertReplySub(ReplySubVO rs) throws Exception {
		return sqlSession.insert(namespace+".insertReplySub",rs);
	}
	
	@Override
	public List<ReplyMainVO> listReplyMain(int articleNo) throws Exception {
		return sqlSession.selectList(namespace+".listReplyMain",articleNo);
	}
	
	@Override
	public int removeReply(int rno) throws Exception {
		return sqlSession.delete(namespace+".removeReply",rno);
	}
	
	@Override
	public List<ReplySubVO> listReplySub(int articleNo) throws Exception {
		return sqlSession.selectList(namespace+".listReplySub",articleNo);
	}
}

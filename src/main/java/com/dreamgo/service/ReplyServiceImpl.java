package com.dreamgo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dreamgo.domain.ReplyMainVO;
import com.dreamgo.domain.ReplySubVO;
import com.dreamgo.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	
	@Override
	public int insertReplyMain(ReplyMainVO rm) throws Exception {
		return dao.insertReplyMain(rm);
	}
	
	@Override
	public int insertReplySub(ReplySubVO rs) throws Exception {
		return dao.insertReplySub(rs);
	}
	
	@Override
	public List<ReplyMainVO> listReplyMain(int articleNo) throws Exception {
		return dao.listReplyMain(articleNo);
	}
	
	@Override
	public int removeReply(int rno) throws Exception {
		return dao.removeReply(rno);
	}
}

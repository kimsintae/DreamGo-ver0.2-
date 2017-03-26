package com.dreamgo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dreamgo.domain.BoardVO;
import com.dreamgo.persistence.BoardDAO;
import com.dreamgo.util.PageMaker;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	@Override
	public int totalCount() throws Exception {
		return dao.totalCount();
	}
	
	@Override
	public List<BoardVO> list(PageMaker pm) throws Exception {
		return dao.list(pm);
	}
	
	@Override
	public int insertBoard(BoardVO board) throws Exception {
		return dao.insertBoard(board);
	}
	
	@Override
	public BoardVO read(int writer) throws Exception {
		return dao.read(writer);
	}
	
	@Override
	public void increaseReadCnt(int bno) throws Exception {
		dao.increaseReadCnt(bno);
	}
	
	@Override
	public int modifyArticle(BoardVO board) throws Exception {
		return dao.modifyArticle(board);
	}
	
	@Override
	public void removeArticle(int bno) throws Exception {
		dao.removeArticle(bno);
	}
}

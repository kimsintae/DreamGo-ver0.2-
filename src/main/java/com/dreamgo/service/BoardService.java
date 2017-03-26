package com.dreamgo.service;

import java.util.List;

import com.dreamgo.domain.BoardVO;
import com.dreamgo.util.PageMaker;

public interface BoardService {

	//총 게시글 수
	public int totalCount()throws Exception;
	
	//글 리스트
	public List<BoardVO> list(PageMaker pm)throws Exception;
	
	//글 등록
	public int insertBoard(BoardVO board)throws Exception;
	
	//글 상세페이지
	public BoardVO read(int writer)throws Exception;
	
	//글조회 증가
	public void increaseReadCnt(int bno)throws Exception;
	
	//글 수정
	public int modifyArticle(BoardVO board)throws Exception;
	
	//글 삭제
	public void removeArticle(int bno)throws Exception;
}

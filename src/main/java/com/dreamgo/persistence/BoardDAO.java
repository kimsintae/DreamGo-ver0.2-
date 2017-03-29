package com.dreamgo.persistence;

import java.util.List;

import com.dreamgo.domain.BoardVO;
import com.dreamgo.util.PageMaker;

public interface BoardDAO {
	
	public int totalCount()throws Exception;
	public List<BoardVO> list(PageMaker pm)throws Exception;
	public int insertBoard(BoardVO board)throws Exception;
	public BoardVO read(int writer)throws Exception;
	public void increaseReadCnt(int bno)throws Exception;
	public int modifyArticle(BoardVO board)throws Exception;
	public void removeArticle(int bno)throws Exception;
}

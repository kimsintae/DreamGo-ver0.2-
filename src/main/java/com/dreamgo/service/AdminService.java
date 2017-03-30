package com.dreamgo.service;

import java.util.HashMap;
import java.util.List;

import com.dreamgo.domain.BoardVO;
import com.dreamgo.util.PageMaker;

public interface AdminService {
	//글 삭제
	public int admin_removeArticle(int bno)throws Exception;
	
	//게시글 타입 수정
	public int admin_modifyArticle(BoardVO board)throws Exception;
	
	//선택 글 삭제
	public int admin_removeCheck(List<Integer> bnoList)throws Exception;
}

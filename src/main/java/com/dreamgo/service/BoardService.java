package com.dreamgo.service;

import java.util.List;

import com.dreamgo.domain.BoardVO;

public interface BoardService {

	//게시글 리스트
	public List<BoardVO> list()throws Exception;
}

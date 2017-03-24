package com.dreamgo.persistence;

import java.util.List;

import com.dreamgo.domain.BoardVO;

public interface BoardDAO {

	public List<BoardVO> list()throws Exception;
}

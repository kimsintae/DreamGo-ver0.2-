package com.dreamgo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dreamgo.domain.BoardVO;
import com.dreamgo.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	@Override
	public List<BoardVO> list() throws Exception {
		return dao.list();
	}
}

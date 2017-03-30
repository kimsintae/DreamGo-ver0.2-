package com.dreamgo.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dreamgo.domain.BoardVO;
import com.dreamgo.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;
	
	@Override
	public int admin_removeArticle(int bno) throws Exception {
		return dao.admin_removeArticle(bno);
	}
	
	@Override
	public int admin_modifyArticle(BoardVO board) throws Exception {
		return dao.admin_modifyArticle(board);
	}
	
	@Override
	public int admin_removeCheck(List<Integer> bnoList) throws Exception {
		return dao.admin_removeCheck(bnoList);
	}
}

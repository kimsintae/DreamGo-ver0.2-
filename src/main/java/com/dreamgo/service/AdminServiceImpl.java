package com.dreamgo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dreamgo.domain.BoardVO;
import com.dreamgo.domain.ReportVO;
import com.dreamgo.domain.UserVO;
import com.dreamgo.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;

	@Override
	public UserVO adminLogin(UserVO user) throws Exception {
		return dao.adminLogin(user);
	}
	
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
	
	@Override
	public List<UserVO> userList() throws Exception {
		return dao.userList();
	}
	
	@Override
	public int modifyAuth(UserVO user) throws Exception {
		return dao.modifyAuth(user);
	}
	
	@Transactional
	@Override
	public void removeUser(int no,String email) throws Exception {
		
		 //유저삭제
		 dao.removeUser(no);
		 //삭제한 유저 블랙리스트 테이블에 등록
		 dao.addBlackList(email);
	}
	
	@Override
	public int insertReport(ReportVO report) throws Exception {
		return dao.insertReport(report);
	}
	
	@Override
	public List<ReportVO> reportList() throws Exception {
		return dao.reportList();
	}
	
	@Override
	public int CompleteReport(int no) throws Exception {
		return dao.CompleteReport(no);
	}

}

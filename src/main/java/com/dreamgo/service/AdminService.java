package com.dreamgo.service;

import java.util.List;

import com.dreamgo.domain.BoardVO;
import com.dreamgo.domain.ReportVO;
import com.dreamgo.domain.UserVO;

public interface AdminService {
	//글 삭제
	public int admin_removeArticle(int bno)throws Exception;
	
	//게시글 타입 수정
	public int admin_modifyArticle(BoardVO board)throws Exception;
	
	//선택 글 삭제
	public int admin_removeCheck(List<Integer> bnoList)throws Exception;
	
	//회원리스트
	public List<UserVO> userList()throws Exception;
	
	//회원 권한 수정
	public int modifyAuth(UserVO user)throws Exception;
	
	//회원 영구탈퇴
	public void removeUser(int no,String email)throws Exception;
	
	//신고하기
	public int insertReport(ReportVO report)throws Exception;
	
	//신고목록
	public List<ReportVO> reportList()throws Exception;
	
	//신고처리
	public int CompleteReport(int no)throws Exception;
	
	
}

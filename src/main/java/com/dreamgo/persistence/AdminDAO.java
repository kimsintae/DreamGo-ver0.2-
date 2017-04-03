package com.dreamgo.persistence;

import java.util.List;

import com.dreamgo.domain.BoardVO;
import com.dreamgo.domain.ReportVO;
import com.dreamgo.domain.UserVO;

public interface AdminDAO {

	public UserVO adminLogin(UserVO user)throws Exception;
	public int admin_removeArticle(int bno)throws Exception;
	public int admin_modifyArticle(BoardVO board)throws Exception;
	public int admin_removeCheck(List<Integer> bnoList)throws Exception;
	public List<UserVO> userList()throws Exception;
	public int modifyAuth(UserVO user)throws Exception;
	public void removeUser(int no)throws Exception;
	public void addBlackList(String email)throws Exception;
	public int insertReport(ReportVO report)throws Exception;
	public List<ReportVO> reportList()throws Exception;
	public int CompleteReport(int no)throws Exception;
}

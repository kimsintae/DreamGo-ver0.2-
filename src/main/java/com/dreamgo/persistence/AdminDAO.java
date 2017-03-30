package com.dreamgo.persistence;

import java.util.List;

import com.dreamgo.domain.BoardVO;

public interface AdminDAO {

	public int admin_removeArticle(int bno)throws Exception;
	public int admin_modifyArticle(BoardVO board)throws Exception;
	public int admin_removeCheck(List<Integer> bnoList)throws Exception;
}

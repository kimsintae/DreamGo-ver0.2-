package com.dreamgo.persistence;

import com.dreamgo.domain.BoardVO;

public interface AdminDAO {

	public int admin_removeArticle(int bno)throws Exception;
	public int admin_modifyArticle(BoardVO board)throws Exception;
}

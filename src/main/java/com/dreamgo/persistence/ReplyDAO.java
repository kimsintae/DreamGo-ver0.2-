package com.dreamgo.persistence;

import java.util.List;

import com.dreamgo.domain.ReplyMainVO;
import com.dreamgo.domain.ReplySubVO;

public interface ReplyDAO {

	//댓글 관련
	public int insertReplyMain(ReplyMainVO rm)throws Exception;
	public List<ReplyMainVO> listReplyMain(int articleNo)throws Exception;
	public int removeReply(int rno)throws Exception;
	public int modifyMainReply(ReplyMainVO rm)throws Exception;
	
	//답글 관련
	public int insertReplySub(ReplySubVO rs)throws Exception;
	public List<ReplySubVO> listReplySub(int articleNo)throws Exception;
	public int modifySubReply(ReplySubVO rs)throws Exception;
	public int removeSub(int sno)throws Exception;
}

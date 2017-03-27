package com.dreamgo.service;

import java.util.List;

import com.dreamgo.domain.ReplyMainVO;
import com.dreamgo.domain.ReplySubVO;

public interface ReplyService {
	
	//-----------------댓글관련 ----------------
	
	//댓글 작성
	public int insertReplyMain(ReplyMainVO rm)throws Exception;
	
	//댓글 목록
	public List<ReplyMainVO> listReplyMain(int articleNo)throws Exception;
	
	//댓글 삭제
	public int removeReply(int rno)throws Exception;
	
	
	
	
	
	//----------------답글 관련 --------------- 
	//답글 작성
	public int insertReplySub(ReplySubVO rs)throws Exception;
	
	//답글 목록
	public List<ReplySubVO> listReplySub(int articleNo)throws Exception;
}

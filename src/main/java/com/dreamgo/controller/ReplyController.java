package com.dreamgo.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dreamgo.domain.ReplyMainVO;
import com.dreamgo.domain.ReplySubVO;
import com.dreamgo.service.ReplyService;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {
	
	@Inject
	private ReplyService service;

	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);

	
	
	//댓글 등록
	@RequestMapping("/writeMainReply")
	public String writeMainReply(@ModelAttribute ReplyMainVO rm,
			@RequestHeader("referer") String referer){
		logger.info("write page called !!");
		
		logger.info("content : "+rm.getContent());
		logger.info("userNo : "+rm.getUserNo());
		logger.info("articleNo : "+rm.getArticleNo());
		
		try {
		int result =	service.insertReplyMain(rm);
		
		if(result==1){
			logger.info("댓글 작성 성공!");
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:"+referer;
		
	}
	
	//댓글수정
	@RequestMapping(value="/modifyMainReply", method = RequestMethod.POST)
	public String modifyMainReply(@RequestParam("rno") int rno,
			@RequestHeader("referer") String referer){
		logger.info("modifyMainReply page called !!");
		logger.info("rno : "+rno);
		
		return "redirect:"+referer;
	}
	
	
	//댓글 삭제
	@RequestMapping("/remove/{rno}")
	public String removeReply(@PathVariable(value="rno") int rno,
			@RequestHeader("referer") String referer){
		try {
			
			logger.info("rno : "+rno);
			int result = service.removeReply(rno);
			
			if(result==1){
				logger.info("댓글 삭제 성공!");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:"+referer;
	}
	
	
	
	//답글 등록
	@RequestMapping("/writeSubReply")
	public String writeSubReply(@ModelAttribute ReplySubVO rs,
			@RequestHeader("referer") String referer){
		logger.info("writeSubReply page called !!");

		logger.info("content : "+rs.getContent());
		logger.info("userNo : "+rs.getUserNo());
		logger.info("mainNo : "+rs.getMainNo());
		
		//textarea 개행문자 치환
		String realContent = rs.getContent().replaceAll("\r\n", "<br/>");
		rs.setContent(realContent);
		
		try {
		int result = service.insertReplySub(rs);
		if(result==1){
			logger.info("답글 작성 성공!");
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:"+referer;
	}

		
}

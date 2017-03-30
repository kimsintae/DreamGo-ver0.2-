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
		logger.info("writeMainReply page called !!");
		
		logger.info("content : "+rm.getContent());
		logger.info("userNo : "+rm.getUserNo());
		logger.info("articleNo : "+rm.getArticleNo());
		String realContent = rm.getContent().replaceAll("\r\n", "<br/>");
		rm.setContent(realContent);
		try {
			
		int result =service.insertReplyMain(rm);
		
		logger.info("=================");
		if(result==1)logger.info("댓글 작성 성공!");
		logger.info("=================");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:"+referer;
		
	}
	
	//댓글수정
	@RequestMapping(value="/modifyMainReply", method = RequestMethod.POST)
	public String modifyMainReply(@ModelAttribute ReplyMainVO rm,
			@RequestHeader("referer") String referer){
		logger.info("modifyMainReply page called !!");
		try {
			int result = service.modifyMainReply(rm);
			logger.info("=================");
			if(result==1)logger.info("댓글 수정 성공!");
			logger.info("=================");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:"+referer;
	}
	
	
	//댓글 삭제
	@RequestMapping("/remove/{rno}")
	public String removeReply(@PathVariable(value="rno") int rno,
			@RequestHeader("referer") String referer){
		try {
			
			logger.info("rno : "+rno);
			int result = service.removeReply(rno);
			logger.info("=================");
			if(result==1)logger.info("댓글 삭제 성공!");
			logger.info("=================");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:"+referer;
	}
	
	
	
	
	
	//답글 관련 
	
	//답글 등록
	@RequestMapping(value="/writeSubReply", method = RequestMethod.POST)
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
		logger.info("=================");
		if(result==1)logger.info("답글 작성 성공!");
		logger.info("=================");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:"+referer;
	}
	
	
	//답글 수정
	@RequestMapping(value="/modifySubReply", method = RequestMethod.POST)
	public String modifySubReply(@ModelAttribute ReplySubVO rs,
			@RequestHeader("referer") String referer){
		logger.info("modifySubReply page called !!");
		
		try {
			
			logger.info("content : "+rs.getContent());
			logger.info("sno : "+rs.getSno());
			int result = service.modifySubReply(rs);
			logger.info("=================");
			if(result==1)logger.info("****답글 수정 성공*****!");
			logger.info("=================");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:"+referer;
	}
	
	
	
		//답글 삭제
		@RequestMapping("/removeSub/{sno}")
		public String removeSub(@PathVariable(value="sno") int sno,
				@RequestHeader("referer") String referer){
			try {
				
				logger.info("rno : "+sno);
				int result = service.removeSub(sno);
				logger.info("=================");
				if(result==1)logger.info("답글 삭제 성공!");
				logger.info("=================");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return "redirect:"+referer;
		}
		
}

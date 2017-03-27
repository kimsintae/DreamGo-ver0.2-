package com.dreamgo.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dreamgo.domain.BoardVO;
import com.dreamgo.domain.ReplyMainVO;
import com.dreamgo.domain.ReplySubVO;
import com.dreamgo.service.BoardService;
import com.dreamgo.service.ReplyService;
import com.dreamgo.util.PageMaker;

import sun.security.krb5.internal.ReplayCache;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Inject
	private BoardService service;
	
	@Inject
	private ReplyService replyService;
	
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	
	//글 보기 페이지 !!
	@RequestMapping(value="/read/{bno}",method={RequestMethod.POST,RequestMethod.GET})
	public String read(HttpSession session,Model model,
			@PathVariable int bno,
			@RequestParam(value="thisPage", defaultValue="1") int thisPage,
			HttpServletRequest request){
		
		logger.info("접속자 IP 주소 : "+request.getRemoteAddr());

		logger.info("read page called!");
		logger.info("넘어온 글번호 : "+bno);
		logger.info("넘어온 현재페이지 번호 : "+thisPage);
		
		try {
			//조회수 증가
			service.increaseReadCnt(bno);
			
			//해당 글 가져오기
			BoardVO board = service.read(bno);
			
			model.addAttribute("board", board);
			model.addAttribute("thisPage", thisPage);
			
			//댓글 목록 가져오기
			List<ReplyMainVO> replyMainList = replyService.listReplyMain(bno);
			
			//답글 목록 가져오기
			List<ReplySubVO> replySubList = replyService.listReplySub(bno);
			logger.info("reply_main 수 : "+replyMainList.size());
			logger.info("reply_sub 수 : "+replySubList.size());
			
			for(ReplyMainVO rm : replyMainList){
			//	System.out.println("main : "+rm.getRno());
				System.out.println(rm.getRno()+"번 댓글");
				for(ReplySubVO rs : replySubList){
					//System.out.println("sub : "+rs.getMainNo());
					if(rm.getRno()==rs.getMainNo()){
						System.out.println("\t\t\t"+rm.getRno()+"번 댓글의 답글 내용"+rs.getContent());
					}
				}
			}
			
			
			
			model.addAttribute("replyMainList", replyMainList);
			model.addAttribute("replySubList", replySubList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/board/read";
	}
	
	
	//리스트 페이지 !!
	@RequestMapping("/list/{thisPage}")
	public String board(HttpServletRequest request,Model model,@PathVariable int thisPage){
		logger.info("board page called!");
		try {
			
			int totalCount = service.totalCount();
			logger.info("현재페이지 : "+thisPage);
			logger.info("총 게시글 수 : "+totalCount);
			
			PageMaker pm = new PageMaker();
			pm.setThisPage(thisPage);
			pm.setTotalCount(totalCount);
			
			List<BoardVO> list =  service.list(pm);

			model.addAttribute("list",list);
			model.addAttribute("pagination", pm.getBoardPagination(request));
			model.addAttribute("pageMaker", pm);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return "/board/list";
	}
	
	//글 작성 페이지 !!
	@RequestMapping("/writeForm")
	public String writeForm(){
		logger.info("writeForm page called!");
		return "/board/articleForm";
	}
	
	//글 작성 로직 !!
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(@ModelAttribute BoardVO board){
		logger.info("제목 : " + board.getTitle());
		logger.info("구분 : " + board.getType());
		logger.info("내용 : " + board.getContent());
		logger.info("프로필사진 :" + board.getProfile());
		logger.info("글쓴이 :" + board.getWriter());
		
		try {
			
			//글등록
			int result = service.insertBoard(board);
			
			if(result>0){
				System.out.println("================== 글이 등록 되었습니다 =================");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//read가 post방식이라 안넘어감
		return "redirect:/board/read/"+board.getBno();
	}
	
	//글 수정 페이지!!
	@RequestMapping("/modifyForm/{bno}")
	public String modifyForm(Model model,@PathVariable int bno){
		logger.info("modifyForm page called!");
		
		try {
			//수정할 글 가져오기
			BoardVO board =  service.read(bno);
			model.addAttribute("board", board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/board/articleForm";
	}
	
	
	//글 수정
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(BoardVO board){
		
		logger.info("modify called....!");
		logger.info("bno : "+board.getBno());
		try {
			
			//글수정 
			int result = service.modifyArticle(board);
			
			if(result==1){
				System.out.println("=============== 글 수정 성공 ================");
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/board/read/"+board.getBno();
	}
	
	
	//글 삭제
	@RequestMapping("/remove/{bno}")
	public String remove(@PathVariable int bno){
		
		try {
			//글삭제
			service.removeArticle(bno);
			System.out.println("=============== 글 삭제 성공 ================");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/board/list/1";
	}
	
	
}

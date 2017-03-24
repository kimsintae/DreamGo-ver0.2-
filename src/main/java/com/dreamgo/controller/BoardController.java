package com.dreamgo.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dreamgo.domain.BoardVO;
import com.dreamgo.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Inject
	private BoardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	
	//글 보기 페이지 !!
	@RequestMapping("/read")
	public String read(){
		logger.info("read page called!");
		return "/board/read";
	}
	
	
	//리스트 페이지 !!
	@RequestMapping("/list")
	public String board(Model model){
		logger.info("board page called!");
		
		try {
			List<BoardVO> list =  service.list();
			model.addAttribute("list",list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return "/board/list";
	}
	
	//글 작성 페이지 !!
	@RequestMapping("/write")
	public String writeForm(){
		logger.info("writeForm page called!");
		return "/board/articleForm";
	}
	
	//글 작성 로직 !!
	@RequestMapping("/writeLoc")
	public void write(@RequestParam("title") String title,
			@RequestParam("type") String type,
			@RequestParam("content") String content){
		logger.info("제목" + title);
		logger.info("구분" + type);
		logger.info("내용" + content);
	}
	
	//글 수정 페이지!!
	@RequestMapping("/modify")
	public String modifyForm(Model model){
		logger.info("modifyForm page called!");
		
		
		//DB연동 되면 이곳에서는
		//넘어온 글 번호를 가지고 SELECT문 실시
		
		//받아온 객체를 넘기게 된다.
		
		//TEST용 파라미터
		model.addAttribute("title","안녕");
		model.addAttribute("content","안녕하세요");
		
		return "/board/articleForm";
	}
	
	
	
}

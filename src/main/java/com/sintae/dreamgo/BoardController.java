package com.sintae.dreamgo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	
	//read !!
	@RequestMapping("/board/read")
	public String read(){
		logger.info("read page called!");
		return "/board/readForm";
	}
	
	
	//list !!
	@RequestMapping("/board/list")
	public String board(){
		logger.info("board page called!");
		return "/board/list";
	}
	
	//write !!
	@RequestMapping("/board/writeForm")
	public String writeForm(){
		logger.info("writeForm page called!");
		return "/board/writeForm";
	}
	
	//write_logic !!
	@RequestMapping("/board/write")
	public void write(@RequestParam("title") String title,
			@RequestParam("type") String type
			){
		logger.info("제목" + title);
		logger.info("구분" + type);
		//logger.info("내용" + content);
		
		
		
	}
	
}

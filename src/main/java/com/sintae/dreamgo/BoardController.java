package com.sintae.dreamgo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	
	//read !!
	@RequestMapping("/board/read")
	public String read(){
		logger.info("read page called!");
		return "/board/read";
	}
	
	
	//list !!
	@RequestMapping("/board/list")
	public String board(){
		logger.info("board page called!");
		return "/board/list";
	}
}

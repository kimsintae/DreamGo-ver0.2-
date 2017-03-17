package com.sintae.dreamgo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	
		//회원가입 페이지 !!
		@RequestMapping("/join")
		public String join(){
			logger.info("join page called!");
			return "/board/join";
		}
		
		//회원가입 페이지 !!
		@RequestMapping(value="/doJoin", method = RequestMethod.POST)
		public void doJoin(){
			
			
			
			
			
			
			logger.info("doJoin page called!");
			
		}
	
	
}

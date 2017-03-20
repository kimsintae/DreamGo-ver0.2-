package com.sintae.dreamgo;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sintae.util.MailSender;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	@Resource(name="mailService")
	private MailSender mailSender;
	
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
		
		@RequestMapping(value="/doSending", method = RequestMethod.GET)
		public void sending(){
			
			mailSender.sendMail("kimstcool01@naver.com", "인즈번호.", "인증번호 : 1123124");
			
			logger.info("mailSeding page called!");
			
		}
	
	
}

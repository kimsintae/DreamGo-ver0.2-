package com.sintae.dreamgo;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sintae.util.MailSender;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	
	//서비스객체 생성
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
		
		
		@RequestMapping(value="/doMailAuth", method = RequestMethod.POST)
		public @ResponseBody Map<String, String> sending(@RequestParam("email") String email){
			//boolean rex=true;
			Map<String, String> resultMap = new HashMap<String, String>();
			
			logger.info("mailSeding page called!");
			System.out.println("인증보낼 메일 주소:" + email);
			
			if (email==null){
				//email이 작성되있으면 유효성 검사 시작
			 //rex = Pattern.matches("[\\w\\~\\-\\.]+@[\\w\\~\\-]+(\\.[\\w\\~\\-]+)+",email.trim());
			}
			
			double randomVal = Math.random();			
			//6자리 인증번호 생성
			
			//메일함에서 인증번호를 입력하기 전
				int authNumber = (int)(randomVal*999999)+000000;
				//메일발송
				boolean result = mailSender.sendMail(email, "인증번호입니다.",authNumber);
				
				
				if(result){
					resultMap.put("result", "success");
				}else{
					resultMap.put("result", "failed");	
				}			
			return resultMap;
			
		}
	
	
}

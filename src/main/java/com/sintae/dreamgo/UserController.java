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
		
		//메일인증
		@RequestMapping(value="/doMailAuth", method = RequestMethod.POST)
		public @ResponseBody Map<String, String> sending(@RequestParam("preEmail") String preEmail,
				@RequestParam("sufEmail") String sufEmail,
				@RequestParam(value="authCheckNumber",defaultValue="0") int authCheckNumber){
			Map<String, String> resultMap = new HashMap<String, String>();
			
			logger.info("mailSeding page called!");
			
			String email = preEmail+"@"+sufEmail;
			logger.info("인증보낼 메일 주소:" + email);

			
			if(preEmail.isEmpty()){
				//비어있을경우
				resultMap.put("result", "isEmpty");	
				return resultMap;
			}
			
				
			//인증 확인 번호가 넘어오기 전이면 메일발송
			if(authCheckNumber<1){
				
				//email이 작성되있으면 유효성 검사 시작
				boolean rex = 
						Pattern.matches("[\\w\\~\\-\\.]+@[\\w\\~\\-]+(\\.[\\w\\~\\-]+)+",email.trim());
				
				//이메일형식이 올바를때 인증번호 발송
				if(rex){
					//메일발송
					mailSender.sendMail(email);
					resultMap.put("result", "success");
					return resultMap;
				}
				
				//이메일 형식이 올바르지 않으면 실패처리
				resultMap.put("result", "failed");
				return resultMap;
				
			}else{
				
				//인증 확인번호가 넘어왔으면 발송한 인증번호랑 매칭시킴
				
				if(mailSender.getAuthNumber()==authCheckNumber){
					resultMap.put("result", "authOk");
					return resultMap;
				};
					//재발송
					logger.info("재발송 합니다.");
					mailSender.sendMail(email);
					resultMap.put("result", "reSubmit");
					return resultMap;
			}
						
			
			
		}
	
	
}

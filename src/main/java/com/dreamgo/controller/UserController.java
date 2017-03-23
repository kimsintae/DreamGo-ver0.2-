package com.dreamgo.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dreamgo.domain.UserVO;
import com.dreamgo.service.UserService;
import com.dreamgo.util.MailSender;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	@Inject
	private UserService service;
	
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
		@RequestMapping(value="/doJoin", method=RequestMethod.POST)
		public void doJoin(@RequestParam("profile") MultipartFile profile,
				@RequestParam("preEmail") String preEmail,
				@RequestParam("sufEmail") String sufEmail,
				@ModelAttribute UserVO user,BindingResult bindResult){
//커맨드객체를 파라미터로 지정만 하면 400에러가 뜬다?
			
			
			logger.info("doJoin page called!");
			user.setEmail(preEmail.trim()+"@"+sufEmail.trim());//email
			user.setProfile(profile.getOriginalFilename());//파일이름
			
//			logger.info("이메일 : "+user.getEmail());
//			logger.info("비밀번호 : "+user.getPassword());
//			logger.info("닉네임 : "+user.getNickname());
//			logger.info("사진 : "+user.getProfile());
//			logger.info("타입 : "+user.getType());
//			logger.info("꿈 : "+user.getDream());
			
			//int result = service.insertUser(user);
			/*return "redirect:/intro";*/
		}
		
		//메일인증
		@RequestMapping(value="/doMailAuth", method = RequestMethod.POST)
		public @ResponseBody Map<String, String> sending(@RequestParam("email") String email,
				@RequestParam(value="authCheckNumber",defaultValue="0") int authCheckNumber){
			
			Map<String, String> resultMap = new HashMap<String, String>();
			
			logger.info("mailSeding page called!");
			logger.info("인증보낼 메일 주소:" + email);

			
			if(email.isEmpty()){
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
					resultMap.put("result", "reSubmit");
					mailSender.sendMail(email);
					return resultMap;
			}
						
			
			
		}
	
	
}

package com.dreamgo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dreamgo.domain.UserVO;
import com.dreamgo.service.UserService;
import com.dreamgo.util.MailSender;
import com.dreamgo.util.UploadUtil;
import com.dreamgo.util.ValidatorUtil;

@Controller
@RequestMapping("/admin/*")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	@Inject
	private UserService service;
	
	//서비스객체 생성
	@Resource(name="mailService")
	private MailSender mailSender;
	
		//로그인  !!
		@RequestMapping("/login")
		public void login(@ModelAttribute UserVO user,
							HttpSession session,
							Model model)throws Exception{
		
			
			logger.info("login page called!");
			logger.info("로그인 될 email : "+user.getEmail());
			logger.info("로그인 될 paw : "+user.getPassword());
			
			//로그인 한 유저 객체
			UserVO userVO = service.login(user);

			logger.info("로그인 된 유저? : "+userVO);
			//인터셉터가 받아서 처리할 모델객체
			model.addAttribute("userVO", userVO);
		}
		
		//로그아웃
		@RequestMapping("/logout")
		public String logout(HttpSession session,
				@RequestHeader(value="referer",required=false) final String referer){
			session.invalidate();
			
			return "redirect:"+referer;
		}
	
		//회원가입 페이지 !!
		@RequestMapping("/join")
		public String join(){
			logger.info("join page called!");
			return "/admin/join";
		}
		
		//회원가입 수행 !!
		@RequestMapping(value="/doJoin", method=RequestMethod.POST)
		public String doJoin(@RequestParam("file") MultipartFile profile,
				@RequestParam("preEmail") String preEmail,
				@RequestParam("sufEmail") String sufEmail,
				@RequestParam(value="emailAuthResult",defaultValue="false") boolean emailAuthResult,
				@ModelAttribute UserVO user,
				BindingResult joinResult,
				Model model){
			
			logger.info("doJoin page called!");
			user.setEmail(preEmail.trim()+"@"+sufEmail.trim());//email
			user.setEmailAuth(emailAuthResult);
			try {
			//파일 업로드 후 파일명 리턴
			//파일선택시에만 업로드
			if(!profile.isEmpty()){
				user.setProfile(UploadUtil.upload(profile));
			}
			} catch (Exception e) {
				logger.info("파일 업로드 에러");
				e.printStackTrace();
			}
			
//			logger.info("이메일 : "+user.getEmail());
//			logger.info("비밀번호 : "+user.getPassword());
//			logger.info("닉네임 : "+user.getNickname());
//			logger.info("사진 : "+user.getProfile());
//			logger.info("타입 : "+user.getType());
//			logger.info("꿈 : "+user.getDream());
			
			ValidatorUtil validatorUtil = new ValidatorUtil();
			validatorUtil.validate(user, joinResult);
			
			//만약에 회원가입폼 검증에서 에러가 발생 할 경우
			//다시 회원가입폼으로 돌려보냄
			
			Map<String, String> errors = new HashMap<String, String>();
			List<FieldError> errorList =  joinResult.getFieldErrors();

			if(joinResult.hasErrors()){
				for (int i = 0; i < errorList.size(); i++) {
					//각 에러의 필드(에러명)과 에러코드(메세지)를 errors에 담기
					errors.put(errorList.get(i).getField(), errorList.get(i).getCode());
				}
				
				System.out.println(errors);
				model.addAttribute("errors", errors);
				model.addAttribute("user",user);
				
				return "/admin/join";
			}
			
			//회원가입 로직 수행
			try {
				service.insertUser(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/intro";
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

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
import org.springframework.beans.factory.annotation.Required;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		public String login(@ModelAttribute UserVO user,
							HttpSession session,
							@RequestHeader(value="referer",required=false) final String referer,
							RedirectAttributes rtts)throws Exception{
		
			
			logger.info("login page called!");
			logger.info("로그인 될 email : "+user.getEmail());
			logger.info("로그인 될 paw : "+user.getPassword());
			
			//로그인 한 유저 객체
			UserVO userVO = service.login(user);

			
			
			if(userVO!=null){
				logger.info("로그인 된 유저 : "+userVO);
				//로그인
				session.setAttribute("loginUser", userVO);
				return "redirect:"+referer;
			}else{
				logger.info("로그인 실패 ");
				//로그인 실패시
				rtts.addFlashAttribute("msg", "failed");
				return "redirect:"+referer;
						
			}
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
		
		//회원정보 수정 페이지 !!
		@RequestMapping("/modifyForm")
		public String modifyForm(){
			logger.info("join page called!");
			return "/admin/join";
		}
		
		//회원가입 수행 !!
		@RequestMapping(value="/do_join_modify", method={RequestMethod.POST,RequestMethod.GET})
		public String doJoin(@RequestParam("file") MultipartFile profile,
				@RequestParam(value="preEmail") String preEmail,
				@RequestParam(value="sufEmail") String sufEmail,
				@RequestParam(value="emailAuthResult",defaultValue="false") boolean emailAuthResult,
				@ModelAttribute UserVO user,
				BindingResult joinResult,
				@RequestHeader(value="referer",required=false) String referer,
				@RequestParam(value="isJoin",defaultValue="true") boolean isJoin, //수정인지 가입인지를 판단하는 파라미터
				Model model,
				HttpSession session){
			
			logger.info("do_join_modify page called!");
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
			
			logger.info("이메일 : "+user.getEmail());
			logger.info("비밀번호 : "+user.getPassword());
			logger.info("닉네임 : "+user.getNickname());
			logger.info("사진 : "+user.getProfile());
			logger.info("타입 : "+user.getType());
			logger.info("꿈 : "+user.getDream());
			
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
			
			try {
				if(isJoin){
					//회원가입
					service.insertUser(user);
					logger.info("회원가입 성공 !");
				}else{
					//수정
					service.modifyInfo(user);
					logger.info("회원정보 수정 성공 !");
					session.invalidate();//수정 후 로그인객체 세션에서 제거
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/intro";
		}
		
		//이메일 중복 체크
		@RequestMapping(value="/checkDuplicatedEmail")
		public @ResponseBody boolean checkDuplicatedEmail(@RequestParam("email") String email){
			logger.info("checkDuplicatedEmail called! ");
			logger.info("email : "+ email);
			boolean result = true;
			try {
				UserVO user =  service.checkDupEmail(email.trim());
				if(user!=null){
					//중복될 경우
					result=true;
				}else{
					//중복되지 않을 경우
					result=false;
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return result;
		}
		
		//메일인증
		@RequestMapping(value="/doMailAuth", method = RequestMethod.POST)
		public @ResponseBody Map<String, String> sending(@RequestParam("email") String email,
				@RequestParam(value="authCheckNumber",defaultValue="0") int authCheckNumber,
				@RequestParam("isJoin") boolean isJoin){
			
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
					mailSender.sendMail(email,isJoin);
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
					mailSender.sendMail(email,isJoin);
					return resultMap;
			}
			
		}//sending
	
	
}

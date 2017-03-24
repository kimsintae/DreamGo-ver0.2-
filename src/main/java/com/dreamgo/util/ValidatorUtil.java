package com.dreamgo.util;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.dreamgo.domain.UserVO;

public class ValidatorUtil implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object obj, Errors errors) {
		
		UserVO user = (UserVO)obj;
		
		
		//email 인증 검증
		if(!user.isEmailAuth()){
			errors.rejectValue("emailAuth", "이메일 인증을 해주세요");
		}
	
		
		//email 검증
		String email = user.getEmail();
		if(email==null||
		   email.trim().isEmpty()||
		   !Pattern.matches("[\\w\\~\\-\\.]+@[\\w\\~\\-]+(\\.[\\w\\~\\-]+)+",email.trim())){
			errors.rejectValue("email", "이메일주소가 잘못 되었습니다.");
		}
		
		//password 검증
		String password= user.getPassword();
		if(password==null||
		   password.trim().isEmpty()||
		   !Pattern.matches("^[a-zA-Z0-9]*$",password.trim())){// 영문 숫자 조합
			errors.rejectValue("password", "비밀번호는 영문,숫자만 가능합니다.");
		}
		//password 확인 검증
		String checkPwd=user.getCheckPwd();
		if(checkPwd==null||
				checkPwd.trim().isEmpty()||
				!password.equals(checkPwd)){
			errors.rejectValue("checkPwd", "비밀번호가 틀립니다.");
			
		}
		
		//nickname 검증
		String nickname= user.getNickname();
		if(nickname==null||
		   nickname.trim().isEmpty()||
		 
		   //한글 영문 숫자만
		   !Pattern.matches("^[a-zA-Z0-9|가-힣]*$",password.trim())){
			errors.rejectValue("nickname", "닉네임은 한글, 영문, 숫자만 가능합니다.");
		}
		
	}

	
}

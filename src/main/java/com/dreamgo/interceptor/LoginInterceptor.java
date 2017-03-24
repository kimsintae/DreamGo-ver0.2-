package com.dreamgo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dreamgo.controller.InfoController;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		/* 로그인이 되지 않은 상태에서 로그인을 시도 할 경우  */
		logger.info("postHandle 호출");
		
		//새 로그인객체를 담을 세션 객체
		HttpSession session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		
		//모델객체로 통해 넘어온 유저객체를 가져옴
		Object user = modelMap.get("userVO");
		
		//로그인에 성공한 유저가 있으면 세션에 로그인유저 담아 페이지 이동
		if(user!=null){
			logger.info("user "+user);
			session.setAttribute("loginUser", user);
			
		}else{
			
		}
	}
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			
		/* 로그인이 된 상태에서 로그인을 시도 할 경우  */
		logger.info("preHandle 호출");
		
		//로그인 객체 가져올  세션 생성
		HttpSession session = request.getSession();
		
		//로그인 상태로 /login에 접근 할때 로그인객체를 제거
		if(session.getAttribute("userVO")!=null){
			session.removeAttribute("userVO");
			logger.info("로그인 객체가 세션에서 지워졌습니다.");
		}
		
		return true;
	}
	
}

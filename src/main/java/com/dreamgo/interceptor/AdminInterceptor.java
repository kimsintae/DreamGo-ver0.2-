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

public class AdminInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			
		/* 로그인이 된 상태에서 로그인을 시도 할 경우  */
		logger.info("preHandle 호출");
		
		//로그인 객체 가져올  세션 생성
		HttpSession session = request.getSession();
		
		
		if(session.getAttribute("loginAdmin")==null){
			logger.info("세션 비어있음");
			//관리자 로그인이 되지있지 않는다면 로그인페이지로
			response.sendRedirect(request.getContextPath()+"/admin/index");
		}
		
		return true;
	}
	
}

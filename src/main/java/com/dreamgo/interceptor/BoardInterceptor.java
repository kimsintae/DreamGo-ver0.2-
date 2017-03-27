package com.dreamgo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dreamgo.controller.InfoController;

public class BoardInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		logger.info("글쓰기 폼으로 가기전에 인터셉터 호출");
		
		if(session.getAttribute("loginUser")==null){
			//로그인 안되있을 경우
			response.sendRedirect(request.getContextPath()+"/board/list/1");
			return false;
		}
		
		return true;
	}
}

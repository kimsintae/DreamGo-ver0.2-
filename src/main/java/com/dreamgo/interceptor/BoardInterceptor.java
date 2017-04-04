package com.dreamgo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dreamgo.controller.InfoController;
import com.dreamgo.domain.UserVO;

public class BoardInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("board 인터셉터 preHandle 동작");
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("loginUser");
		String referer = request.getHeader("referer");
		
		if(user==null){
			//로그인 안되있을 경우
			response.sendRedirect(referer+"?auth=unlogin");
			return false;
		}
		if(user.getAuth().trim().equals("AR")||user.getAuth().trim().equals("UA")){
			//글쓰기 권한이 제한 되있을 경우
			response.sendRedirect(referer+"?auth=denied");
			return false;
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("postHandle 동작");
	}
}

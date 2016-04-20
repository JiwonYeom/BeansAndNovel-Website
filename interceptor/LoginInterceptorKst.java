package com.wiring.bnn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptorKst extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		System.out.println("================");
		System.out.println("전처리");
		
		HttpSession session = request.getSession();
		
		com.wiring.bnn.vo.User login = (com.wiring.bnn.vo.User)session.getAttribute("login");
		
		//System.out.println(loginUser);
		
		if(login ==null){
			
			response.sendRedirect("/index");
			
			return false;
		}
		return true;

	}
	
	
}

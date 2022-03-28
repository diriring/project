package com.cgv.s1.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cgv.s1.member.MemberDTO;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("LoginInterceptor");
		
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		boolean check = true;
		
		if(memberDTO==null) {
			check = false;
			//forward 형식 - servlet 문법사용
			request.setAttribute("message", "로그인 후에 이용가능합니다.");
			request.setAttribute("path", "/s1/member/login");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			view.forward(request, response);
			
		}
		
		return check;
	}
	
}

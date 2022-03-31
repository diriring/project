package com.cgv.s1.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cgv.s1.member.MemberDTO;


@Component
public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
		boolean check = true;
		
		if(memberDTO == null) {
			check = false;

			response.sendRedirect("../member/login");
			
		}
		
		return check;
	}
	
}










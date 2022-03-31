package com.cgv.s1.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cgv.s1.member.MemberDTO;



@Component
public class oCartInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
		boolean check = true;
		//System.out.println("inter come??");
		if(memberDTO == null) {
			check = false;
			//../ 추가해봄
			response.sendRedirect("../member/login");
		}
		
		return check;
		
	}

	
	
	
	
	
}

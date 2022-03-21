package com.cgv.s1.member;

import java.net.http.HttpResponse;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/member/**")
public class memberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public void login() throws Exception {
		
	}
	
	@PostMapping("login")
	public String login(MemberDTO memberDTO, String remember, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(remember != null && remember.equals("1")) {
			Cookie cookie = new Cookie("remember", memberDTO.getId());
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("remember", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		memberDTO = memberService.login(memberDTO);
		
		String path = "redirect:./login";
		if(memberDTO != null) {
			session.setAttribute("member", memberDTO);
			path = "redirect:../";
		}
		
		return path;

	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:../";
	}
	
	@GetMapping("join")
	public void join() throws Exception {
		
	}
	
	@PostMapping("join")
	public String join(MemberDTO memberDTO) throws Exception {
		int result = memberService.join(memberDTO);
		return "redirect:../";
	}
	
	@GetMapping("mypage")
	public ModelAndView mypage(HttpSession session) throws Exception {
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		memberDTO = memberService.mypage(memberDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto", memberDTO);
		mv.setViewName("member/mypage");
		
		return mv;
	}

}

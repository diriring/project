package com.cgv.s1.member;

import java.net.http.HttpResponse;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value="/member/**")
public class memberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login(HttpSession session) throws Exception {
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String path = "member/login";
		
		if(memberDTO != null) {
			path = "redirect:../";
		}
		
		return path;
	}
	
	@PostMapping("login")
	public String login(MemberDTO memberDTO, String remember, RedirectAttributes result,HttpServletResponse response, HttpSession session) throws Exception {
		
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
		result.addFlashAttribute("result", "0");
		if(memberDTO != null) {
			session.setAttribute("member", memberDTO);
			result.addFlashAttribute("result", "1");
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
	public ModelAndView join(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		if(request.getParameter("type").equals("member")) {
			mv.addObject("title", "회원가입");
			mv.addObject("name", "이름");
			mv.addObject("memberType", "0");
		}else {
			mv.addObject("title", "사업자 등록");
			mv.addObject("name", "사업체명");
			mv.addObject("memberType", "1");
		}
		
		mv.setViewName("member/join");
		
		return mv;
	}
	
	@PostMapping("join")
	public ModelAndView join(MemberDTO memberDTO) throws Exception {
		int result = memberService.join(memberDTO);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/result");
		if(result == 1) {
			mv.addObject("message", "회원가입을 축하드립니다!");
			mv.addObject("path", "./login");
		}else {
			mv.addObject("message", "회원가입 실패");
			mv.addObject("path", "./join");
		}
		return mv;
	}
	
	@GetMapping("mypage")
	public ModelAndView mypage(HttpSession session) throws Exception {
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();

		if(memberDTO == null) {
			mv.setViewName("common/result");
			mv.addObject("message", "로그인 후에 이용가능합니다.");
			mv.addObject("path", "./login");
		}else {
			memberDTO = memberService.mypage(memberDTO);
			mv.addObject("dto", memberDTO);
			mv.setViewName("member/mypage");			
		}
		
		return mv;
	}
	
	@PostMapping("delete")
	public String delete(MemberDTO memberDTO) throws Exception {
		int result = memberService.delete(memberDTO);
		String path = "redirect:./mypage";
		if(result == 1) {
			path = "redirect:../";
		}
		return path;
	}
	
	
}

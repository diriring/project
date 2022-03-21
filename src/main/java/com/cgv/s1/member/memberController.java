package com.cgv.s1.member;

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
	
	@GetMapping("join")
	public void join() throws Exception {
		
	}
	
	@PostMapping("join")
	public String join(MemberDTO memberDTO) throws Exception {
		int result = memberService.join(memberDTO);
		return "redirect:../";
	}

}

package com.cgv.s1.ocart;

import java.io.Console;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cgv.s1.member.MemberDTO;
import com.cgv.s1.util.Pager;

@Controller
@RequestMapping(value="/ocart/**")
public class OcartController {
	
	@Autowired
	private OcartService ocartService;
	
	//HttpSession session;

	//기존
	//getCart(member로 확인)
	//Mvc annotation driven?? 굳이 쓰지말자
	//@PathVariable("id") String id 굳이 쓰지말자
	@GetMapping("list")                                      
	public ModelAndView getCart(OcartDTO ocartDTO, HttpSession session) throws Exception{
		//System.out.println("contro come??");
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ocartDTO.setId(memberDTO.getId());
		ModelAndView mv = new ModelAndView();
		List<OcartDTO> ar = ocartService.getCart(ocartDTO);	
		mv.addObject("list", ar);
		mv.setViewName("ocart/list");
		return mv;
	}
	
	
	//addCart(member로 확인)
	@PostMapping("add")
	 											//, HttpSession session(전역변수로 해봄 null오류뜸)	
	public ModelAndView addCart(OcartDTO ocartDTO, HttpSession session) throws Exception{
		System.out.println("check!!!");
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		//System.out.println(memberDTO);
		//System.out.println(ocartDTO.getId());
		//System.out.println(ocartDTO.getProductNum());
		//System.out.println(ocartDTO.getProductAmount());
		if(memberDTO == null) {
			//ajax에서 출력
			mv.addObject("result", 5);
			mv.setViewName("common/ajaxResult");
			return mv;
		}
		int result = ocartService.addCart(ocartDTO);
		//result 문자값으로 반환 ajax에서 출력
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	


	//oCart totalList - 필요없을거같음(지우기)
	@GetMapping("totalList")
	public ModelAndView totalList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<OcartDTO> ar = ocartService.totalList(pager);
		mv.addObject("list", ar);
		mv.setViewName("ocart/totalList");
		return mv;
	}
	
}

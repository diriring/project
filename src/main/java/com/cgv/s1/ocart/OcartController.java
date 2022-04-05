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
	
	//장바구니 삭제
	@PostMapping("delete")
	public String deleteCart(OcartDTO ocartDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = ocartService.deleteCart(ocartDTO);
		return "redirect:./list";
	}
	
	
	//장바구니 갯수 수정
	@PostMapping("update")
	public String updateCart(OcartDTO ocartDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = ocartService.modifyAmount(ocartDTO);
		return "redirect:./list";
	}
	
	
	//getCart(member로 확인)
	@GetMapping("list")                                      
	public ModelAndView getCart(OcartDTO ocartDTO, HttpSession session) throws Exception{
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
	public ModelAndView addCart(OcartDTO ocartDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
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
	
}

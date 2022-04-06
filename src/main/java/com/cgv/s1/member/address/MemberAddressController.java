package com.cgv.s1.member.address;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cgv.s1.member.MemberDTO;
import com.cgv.s1.util.Pager;

@Controller
@RequestMapping(value="/member/address/**")
public class MemberAddressController {
	
	@Autowired
	private MemberAddressService memberAddressService;
	
	@GetMapping("list")
	public ModelAndView list(HttpSession session, Pager pager) throws Exception {
		pager.setPerPage(5L);
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		List<MemberAddressDTO> ar = memberAddressService.listPage(memberDTO, pager);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ar);
		mv.setViewName("member/address/list");
		
		return mv;
	}
	
	@GetMapping("add")
	public void add() throws Exception {
		
	}
	
	@PostMapping("add")
	public ModelAndView add(MemberAddressDTO memberAddressDTO) throws Exception {
		int result = memberAddressService.add(memberAddressDTO);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/result");
		if(result == 1) {
			mv.addObject("message", "배송지를 등록했습니다.");
			mv.addObject("path", "./list");
		}else {
			mv.addObject("message", "배송지 등록에 실패했습니다.");
			mv.addObject("path", "./list");
		}
		
		return mv;
	}
	
	@GetMapping("delete")
	public ModelAndView delete(MemberAddressDTO memberAddressDTO) throws Exception {
		int result = memberAddressService.delete(memberAddressDTO);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/result");
		if(result == 1) {
			mv.addObject("message", "배송지를 삭제했습니다.");
			mv.addObject("path", "./list");
		}else {
			mv.addObject("message", "삭제 실패했습니다.");
			mv.addObject("path", "./list");
		}
		
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView update(MemberAddressDTO memberAddressDTO, ModelAndView mv) throws Exception {
		memberAddressDTO = memberAddressService.addressDetail(memberAddressDTO);
		
		mv.addObject("dto", memberAddressDTO);
		mv.setViewName("member/address/update");
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView update(MemberAddressDTO memberAddressDTO) throws Exception {
		int result = memberAddressService.update(memberAddressDTO);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/result");
		if(result == 1) {
			mv.addObject("message", "배송지를 수정했습니다.");
			mv.addObject("path", "./list");
		}else {
			mv.addObject("message", "수정 실패했습니다.");
			mv.addObject("path", "./list");
		}
		
		return mv;
	}
	
	//pay 페이지에서 주소 고르면 바뀌는 ajax 요청 처리
	@GetMapping("addressChoice")
	public ModelAndView addressChoice(MemberAddressDTO memberAddressDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		if(memberAddressDTO.getMaNum() != 0) {
			memberAddressDTO = memberAddressService.addressDetail(memberAddressDTO);
			mv.addObject("dto", memberAddressDTO);
			mv.setViewName("common/addressResult");			
		}else {
			mv.setViewName("common/addressResult2");
		}
		return mv;
	}

}

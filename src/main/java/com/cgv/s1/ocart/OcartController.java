package com.cgv.s1.ocart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cgv.s1.util.Pager;

@Controller
@RequestMapping(value="/ocart/**")
public class OcartController {
	
	@Autowired
	private OcartService ocartService;
	
	//getCart(member로 확인)
	@GetMapping("list")
	public ModelAndView getCart(OcartDTO ocartDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		List<OcartDTO> ar = ocartService.getCart(ocartDTO);	
		mv.addObject("list", ar);
		mv.setViewName("ocart/list");

		return mv;
	}
	
	//oCart totalList - 필요없을거같음
	@GetMapping("totalList")
	public ModelAndView totalList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<OcartDTO> ar = ocartService.totalList(pager);
		mv.addObject("list", ar);
		mv.setViewName("ocart/totalList");
		return mv;
	}
	
}

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
	
	//oCart list
	@GetMapping("list")
	public ModelAndView list(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<OcartDTO> ar = ocartService.list(pager);
		mv.addObject("list", ar);
		mv.setViewName("ocart/list");
		return mv;
	}
	
}

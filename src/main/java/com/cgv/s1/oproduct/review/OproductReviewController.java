package com.cgv.s1.oproduct.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value="/oproductReview/**")
public class OproductReviewController {

	@Autowired
	private OproductReviewService oproductReviewService;
	
	
	@GetMapping("list")
	public ModelAndView list(OproductReviewDTO oproductReviewDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<OproductReviewDTO> ar = oproductReviewService.list(oproductReviewDTO);
		
		mv.addObject("productReview",ar);
		mv.setViewName("common/productReview");
		return mv;
	};
	
	@PostMapping("add")
	public ModelAndView add(OproductReviewDTO oproductReviewDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = oproductReviewService.add(oproductReviewDTO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView update(OproductReviewDTO oproductReviewDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(oproductReviewDTO.getContents());
		System.out.println(oproductReviewDTO.getReplyNum());
		
		int result = oproductReviewService.update(oproductReviewDTO);
		System.out.println(result);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	@PostMapping("delete")
	public ModelAndView delete(OproductReviewDTO oproductReviewDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = oproductReviewService.delete(oproductReviewDTO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
}

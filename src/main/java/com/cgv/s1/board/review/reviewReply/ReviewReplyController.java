package com.cgv.s1.board.review.reviewReply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/reviewReply/**")
public class ReviewReplyController {
	
	@Autowired
	private ReviewReplyService reviewReplyService;
	
	@GetMapping("list")
	public ModelAndView list(ReviewReplyDTO reviewReplyDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("list Controller 진입");
		List<ReviewReplyDTO> ar = reviewReplyService.list(reviewReplyDTO);
		System.out.println("컨트롤러에 서비스 정보 넘어옴");
		mv.addObject("reviewReply",ar);
		mv.setViewName("common/reviewReply");
		
		
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView add(ReviewReplyDTO reviewReplyDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = reviewReplyService.add(reviewReplyDTO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView update(ReviewReplyDTO reviewReplyDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(reviewReplyDTO.getContents());
		System.out.println(reviewReplyDTO.getReplyNum());
		int result = reviewReplyService.update(reviewReplyDTO);
		System.out.println(result);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	@PostMapping("delete")
	public ModelAndView delete(ReviewReplyDTO reviewReplyDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = reviewReplyService.delete(reviewReplyDTO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
		
	}
}

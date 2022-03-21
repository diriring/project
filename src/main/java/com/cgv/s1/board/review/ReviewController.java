package com.cgv.s1.board.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cgv.s1.board.BoardDAO;
import com.cgv.s1.board.BoardDTO;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	@ModelAttribute("board")
	public String board() {
		return "review";
	}
	
	@RequestMapping(value = "list",method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mv)throws Exception{
		List<BoardDTO> ar = reviewService.list();
		
		mv.addObject("list",ar);
		mv.setViewName("board/list");
	return mv;
	}
}

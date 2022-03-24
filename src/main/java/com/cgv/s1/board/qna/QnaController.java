package com.cgv.s1.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cgv.s1.board.BoardDTO;
import com.cgv.s1.board.BoardFileDTO;
import com.cgv.s1.board.review.ReviewFileDTO;
import com.cgv.s1.board.review.ReviewService;
import com.cgv.s1.util.Pager;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	@ModelAttribute("board")
	public String board() {
		return "qna";
	}
	
	@PostMapping("reply")
	public ModelAndView reply(BoardDTO boardDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = qnaService.reply(boardDTO);
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@GetMapping("reply")
	public ModelAndView reply(BoardDTO boardDTO, ModelAndView mv)throws Exception{
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/reply");
		
		
		return mv;
	}
	
	@GetMapping("fileDown")
	public ModelAndView fileDown(BoardFileDTO boardFileDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		QnaFileDTO qnaFileDTO = (QnaFileDTO)qnaService.detailFile(boardFileDTO);
		
		mv.setViewName("fileDown");
		mv.addObject("file", qnaFileDTO);
		return mv;
	}
	
	@RequestMapping(value = "list",method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mv, Pager pager)throws Exception{
		
		List<BoardDTO> ar = qnaService.list(pager);
		mv.addObject("list",ar);
		mv.addObject("pager", pager);
		
		mv.setViewName("board/list");
		
	return mv;
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public ModelAndView detail(BoardDTO boardDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		boardDTO = qnaService.detail(boardDTO);
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/detail");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView add(BoardDTO boardDTO, MultipartFile [] files)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = qnaService.add(boardDTO, files);
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView add()throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/add");
		
		return mv;
	}
	
	@PostMapping("update")
	public String update(BoardDTO boardDTO,Model model)throws Exception{
		int result = qnaService.update(boardDTO);
		
		return "redirect:./list";
	}
	
	@GetMapping("update")
	public ModelAndView update(BoardDTO boardDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		boardDTO = qnaService.detail(boardDTO);
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/update");
		return mv;
	}
	
	@GetMapping("delete")
	public ModelAndView delete(BoardDTO boardDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = qnaService.delete(boardDTO);
		
		mv.setViewName("redirect:./list");
		return mv;
	}
	
}

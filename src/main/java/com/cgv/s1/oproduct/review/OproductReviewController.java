package com.cgv.s1.oproduct.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value="/oproductReview/**")
public class OproductReviewController {

	@Autowired
	private OproductReviewService oproductReviewService;
	
	@RequestMapping(value ="fileDown", method = RequestMethod.GET)
	public ModelAndView fileDown(OproductReviewFileDTO oproductReviewFileDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		oproductReviewFileDTO = oproductReviewService.detailFile(oproductReviewFileDTO);
		mv.addObject("file", oproductReviewFileDTO);
		mv.setViewName("fileDown");
		return mv;
	}
	
	@GetMapping("list")
	public ModelAndView list(OproductReviewDTO oproductReviewDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<OproductReviewDTO> ar = oproductReviewService.list(oproductReviewDTO);
		
		System.out.println("컨트롤러에서 ar사이즈"+ar.size());
		
		mv.addObject("productReview",ar);
		mv.setViewName("common/productReview");
		return mv;
	};
	
	@PostMapping("add")
	public ModelAndView add(OproductReviewDTO oproductReviewDTO, MultipartFile [] files)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(oproductReviewDTO.getNum());
		int result = oproductReviewService.add(oproductReviewDTO,files);
		
		mv.addObject("result", result);
		mv.setViewName("redirect:../oproduct/detail?productNum="+oproductReviewDTO.getNum());
		
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

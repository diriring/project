package com.cgv.s1.oproduct;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cgv.s1.util.Pager;


@Controller
@RequestMapping(value="/oproduct/**")
public class OproductController {

	@Autowired
	private OproductService oproductService;
	
	//list
	@RequestMapping(value="list", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mv, Pager pager) throws Exception{
		List<OproductDTO> ar = oproductService.list(pager);
		mv.addObject("list", ar);
		mv.setViewName("oproduct/list");
		return mv;
	}
	
	//detail
	@RequestMapping(value="detail", method = RequestMethod.GET)
	public ModelAndView detail(OproductDTO oproductDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		oproductDTO = oproductService.detail(oproductDTO);
		mv.addObject("dto", oproductDTO);
		mv.setViewName("oproduct/detail");
		return mv;
	}
	
	//add form 이동
	@RequestMapping(value="add", method = RequestMethod.GET)
	public ModelAndView add() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("oproduct/add");
		return mv;
	}
	
	//add DB
	@RequestMapping(value="add", method = RequestMethod.POST)
	public ModelAndView add(ModelAndView mv, OproductDTO oproductDTO) throws Exception{// MultipartFile [] files) throws Exception{
		int result = oproductService.add(oproductDTO);//, files);
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	//delete
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String delete(OproductDTO oproductDTO) throws Exception{
		
		int result = oproductService.delete(oproductDTO);
		return "redirect:./list"; 
		
//		String message="Delete Fail";
//		if(result != 0) {
//			message="Delete Success";
//		}
//		model.addAttribute("path", "./list");
//		model.addAttribute("message", message);
//		String view="common/result";
//		return view;

	}
	
	//update form 이동
	@RequestMapping(value="update", method = RequestMethod.GET)
	public ModelAndView update(ModelAndView mv, OproductDTO oproductDTO) throws Exception{
		oproductDTO = oproductService.detail(oproductDTO);
		mv.addObject("dto", oproductDTO);
		mv.setViewName("oproduct/update");
		return mv;
	}
	
	//update DB
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String update(OproductDTO oproductDTO) throws Exception{
		int result = oproductService.update(oproductDTO);
		return "redirect:./list";
	}
	

	
	
	
}

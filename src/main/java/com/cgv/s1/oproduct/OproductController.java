package com.cgv.s1.oproduct;

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

import com.cgv.s1.util.Pager;


@Controller
@RequestMapping(value="/oproduct/**")
public class OproductController {

	@Autowired
	private OproductService oproductService;
	
	//수정해야할듯 합치게되면 filedown에 경로부분!
	@ModelAttribute("board")
	public String oproduct() {
		return "oproduct";
	}
	
	//fileDown
	@RequestMapping(value="fileDown", method = RequestMethod.GET)
	public ModelAndView fileDown(OproductFileDTO oproductFileDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		oproductFileDTO = oproductService.detailFile(oproductFileDTO);
		mv.addObject("file", oproductFileDTO);
		mv.setViewName("fileDown");
		return mv;
	}
	
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
	public ModelAndView add(ModelAndView mv, OproductDTO oproductDTO, MultipartFile [] files) throws Exception{
		int result = oproductService.add(oproductDTO, files);
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
	public String update(OproductDTO oproductDTO, MultipartFile [] files) throws Exception{
		int result = oproductService.update(oproductDTO, files);
		return "redirect:./detail?productNum="+oproductDTO.getProductNum();
		//return "redirect:./list";
	}
	
	
	//productFile DELETE
	@PostMapping("deleteFile")
	public ModelAndView fileDelete(OproductFileDTO oproductFileDTO, OproductDTO oproductDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		//System.out.println(oproductDTO.getProductNum());
		//System.out.println(oproductFileDTO.getFileNum());
		int result = oproductService.deleteFile(oproductFileDTO, oproductDTO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}

	
	
	
}

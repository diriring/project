package com.cgv.s1.oproduct;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cgv.s1.util.Pager;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping(value="/oproduct/**")
public class OproductController {
	
	@Autowired
	private OproductService oproductService;
	
	//fileDown할때 필요
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
	
	//listType
	@RequestMapping(value="listType", method = RequestMethod.GET)
	public ModelAndView listType(ModelAndView mv, OproductTypeDTO oproductTypeDTO) throws Exception{
		List<OproductDTO> ar = oproductService.listType(oproductTypeDTO);
		mv.addObject("list", ar);
		mv.setViewName("oproduct/listType");
		return mv;
	}

	
	//detail
	@RequestMapping(value="detail", method = RequestMethod.GET)
	public ModelAndView detail(OproductDTO oproductDTO, String type) throws Exception{
		ModelAndView mv = new ModelAndView();
		oproductDTO = oproductService.detail(oproductDTO);
		mv.addObject("dto", oproductDTO);
		//카테고리 탭으로 바로 가기위해 type변수 추가(04.07) 재석수정
		mv.addObject("type", type);
		//포인트 controller에서 뿌려주기 1원단위 잡기(04.08) 재석수정
		double point = (Math.floor(oproductDTO.getProductPrice() * (1 - (double)oproductDTO.getProductDC() / 100)*0.05));
		mv.addObject("point", point);
		mv.setViewName("oproduct/detail");
		return mv;
	}
	
	//add form 이동
	@GetMapping("add")
	public ModelAndView add() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<OproductTypeDTO> list = oproductService.typeList();
		ObjectMapper objm = new ObjectMapper();
		String typeList = objm.writeValueAsString(list);
		mv.addObject("typeList", typeList);
		mv.setViewName("oproduct/add");
		return mv;
	}
	
	//add DB
	@RequestMapping(value="add", method = RequestMethod.POST)
	public ModelAndView add(ModelAndView mv, OproductDTO oproductDTO, MultipartFile [] files, MultipartFile photo) throws Exception{
		int result = oproductService.add(oproductDTO, files, photo);
		String list = "redirect:./list";
		mv.setViewName(list);
		return mv;
	}
	
	//delete
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String delete(OproductDTO oproductDTO, String type) throws Exception{
		
		System.out.println(type);
		
		int result = oproductService.delete(oproductDTO);
		
		String list = "redirect:./list";
		
		//타입이 공백일경우는 위 list로 실행
		if(type != "") {
			list = "redirect:./listType?productType="+type;
		}
		
		return list; 
		
	}
	

	//update form 이동
	@RequestMapping(value="update", method = RequestMethod.GET)
	public ModelAndView update(ModelAndView mv, OproductDTO oproductDTO, String type) throws Exception{
		
		List<OproductTypeDTO> list = oproductService.typeList();
		ObjectMapper objm = new ObjectMapper();
		String typeList = objm.writeValueAsString(list);
		mv.addObject("typeList", typeList);
		
		oproductDTO = oproductService.detail(oproductDTO);
		//카테고리 탭으로 바로 가기위해 type변수 추가(04.07)
		mv.addObject("type", type);
		System.out.println(type);
		mv.addObject("dto", oproductDTO);
		mv.setViewName("oproduct/update");
		return mv;
	}
	
	//update DB
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String update(OproductDTO oproductDTO, MultipartFile [] files, MultipartFile photo, String type) throws Exception{
		int result = oproductService.update(oproductDTO, files, photo);
		System.out.println(type);
		return "redirect:./detail?productNum="+oproductDTO.getProductNum()+"&type="+type;
	}
	
	
	//productFile DELETE
	@PostMapping("deleteFile")
	public ModelAndView fileDelete(OproductFileDTO oproductFileDTO, OproductDTO oproductDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = oproductService.deleteFile(oproductFileDTO, oproductDTO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	//productFileThumb DELETE
	@PostMapping("deleteFileThumb")
	public ModelAndView fileThumbDelete(OproductFileThumbDTO oproductFileThumbDTO, OproductDTO oproductDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = oproductService.deleteFileThumb(oproductFileThumbDTO, oproductDTO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}


	
}

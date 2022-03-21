package com.cgv.s1.opay;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/opay/*")
public class OPayController {

	
	
	@RequestMapping(value = "oPayReady", method = RequestMethod.POST)
	public void opayReady() throws Exception{
		
		
	}
	
	@RequestMapping(value = "oPayReady", method = RequestMethod.GET)
	public void opay() throws Exception {
		 
	}
}

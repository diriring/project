package com.cgv.s1.ocart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/ocart/**")
public class OcartController {
	
	@Autowired
	private OcartService ocartService;
	
}

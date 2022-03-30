package com.cgv.s1.cartList;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cgv.s1.member.MemberDTO;
import com.cgv.s1.member.MemberService;
import com.cgv.s1.member.address.MemberAddressDTO;
import com.cgv.s1.member.address.MemberAddressService;
import com.cgv.s1.ocart.OcartDTO;
import com.cgv.s1.ocart.OcartService;
import com.cgv.s1.oproduct.OproductDTO;
import com.cgv.s1.oproduct.OproductService;

@Controller
@RequestMapping(value="/cartList/**")
public class CartListController {

	@Autowired
	private CartListService cartListService;
	
	
}

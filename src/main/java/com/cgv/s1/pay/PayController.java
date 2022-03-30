package com.cgv.s1.pay;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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
@RequestMapping(value="/pay/**")
public class PayController {
	
	@Autowired
	private OcartService ocartService;
	@Autowired
	private OproductService oproductService;
	@Autowired
	private MemberAddressService memberAddressService;
	@Autowired
	private MemberService memberService;
	
	@PostMapping("payForm")
	public ModelAndView payForm(@RequestParam List<String> idList, MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<OcartDTO> cartList = new ArrayList<OcartDTO>();
		List<OproductDTO> productList = new ArrayList<OproductDTO>();
		double totalPrice = 0;
		for(int i=0; i<idList.size(); i++) {
			Long cartId = Long.parseLong(idList.get(i));
			OcartDTO cartDTO = new OcartDTO();
			OproductDTO productDTO = new OproductDTO();
			//cartId로 cart 테이블 조회
			cartDTO.setCartId(cartId);
			cartDTO = ocartService.detailCart(cartDTO);
			cartList.add(cartDTO);
			//cart 조회한 거에서 productNum 정보로 product 조회
			productDTO.setProductNum(cartDTO.getProductNum());
			productDTO = oproductService.detail(productDTO);
			productList.add(productDTO);
			//가격
			double price = productDTO.getProductPrice() - productDTO.getProductDC();
			totalPrice = totalPrice + price;
		}
		
		mv.addObject("cartList", cartList);
		mv.addObject("productList", productList);
		mv.addObject("totalPrice", totalPrice);
		
		//결제 페이지에 보여줄 배송지 정보 조회
		List<MemberAddressDTO> addressList = memberAddressService.list(memberDTO);
		mv.addObject("addressList", addressList);
		
		//결제 페이지에 보여줄 포인트 정보 조회
		memberDTO = memberService.mypage(memberDTO);
		mv.addObject("memberDTO", memberDTO);
		
		mv.setViewName("pay/pay");
		
		return mv;
	}

}

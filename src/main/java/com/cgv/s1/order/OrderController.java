package com.cgv.s1.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cgv.s1.member.MemberDTO;
import com.cgv.s1.member.MemberService;
import com.cgv.s1.ocart.OcartDTO;
import com.cgv.s1.oproduct.OproductDTO;
import com.cgv.s1.oproduct.OproductService;

@Controller
@RequestMapping(value="/order/**")
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberService memberServcie;
	@Autowired
	private OproductService oproductService;
	
	@PostMapping("refund")
	public ModelAndView refund(OrderDTO orderDTO, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		//refund 컬럼 update
		int result = orderService.refund(orderDTO);
		
		mv.setViewName("common/result");
		if(result == 1) {
			//상품 재고 판매수 update
			orderDTO = orderService.detail(orderDTO);
			List<OproductDTO> ar = oproductService.productCart(orderDTO);
			for(int i=0; i<ar.size(); i++) {
				Long productNum = ar.get(i).getProductNum();
				Integer productAmount = ar.get(i).getCartDTO().getProductAmount();
				
				OcartDTO cartDTO = new OcartDTO();
				cartDTO.setProductNum(productNum);
				cartDTO.setProductAmount(productAmount);
				
				//재고 증가
				oproductService.stockAdd(cartDTO);
				//재고 감소
				oproductService.saleSubtract(cartDTO);
			}
			
			//point 회수
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			memberDTO = memberServcie.mypage(memberDTO);
			memberDTO.setPoint(memberDTO.getPoint()-orderDTO.getPointVar());
			memberServcie.pointUpdate(memberDTO);
			
			mv.addObject("message", "환불 되었습니다.");
			mv.addObject("path", "../member/orderList");
		}else {
			mv.addObject("message", "환불을 다시 시도해주세요.");
			mv.addObject("path", "../member/orderList");
		}
		
		return mv;

	}
	
}

package com.cgv.s1.pay;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cgv.s1.cartPay.CartPayDTO;
import com.cgv.s1.cartPay.CartPayService;
import com.cgv.s1.member.MemberDTO;
import com.cgv.s1.member.MemberService;
import com.cgv.s1.member.address.MemberAddressDTO;
import com.cgv.s1.member.address.MemberAddressService;
import com.cgv.s1.ocart.OcartDTO;
import com.cgv.s1.ocart.OcartService;
import com.cgv.s1.oproduct.OproductDTO;
import com.cgv.s1.oproduct.OproductService;
import com.cgv.s1.order.OrderDTO;
import com.cgv.s1.order.OrderService;

@Controller
@RequestMapping(value="/pay/**")
public class PayController {
	
	@Autowired
	private PayService payService;
	@Autowired
	private OcartService ocartService;
	@Autowired
	private OproductService oproductService;
	@Autowired
	private MemberAddressService memberAddressService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CartPayService cartPayService;
	@Autowired
	private OrderService orderService;
	
	
	//--------------------상품탭에서 구매탭 넘기는부분 시작----------------------------
	//04.08 재석추가 detail에서 바로구매 일단 생각점
	@PostMapping("payFormDetail")
	public ModelAndView payFormDetail(@RequestParam Long productNum, @RequestParam int productAmount, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		System.out.println(productNum);
		System.out.println(productAmount);
		
		double totalPrice = 0;
		//04.08 재석 포인트 추가(1원 단위 안넘어가기 때문)
		double totalPoint = 0;
		
		OproductDTO productDTO = new OproductDTO();
		productDTO.setProductNum(productNum);
		productDTO = oproductService.detail(productDTO);
		
		//가격 수정 cartDTO 양 추가(재석) -> 04.08 dto 다시 integer로하고 여기서 double
		double price = productDTO.getProductPrice() * (1 - (double)productDTO.getProductDC() / 100) * productAmount;
		totalPrice = totalPrice + price;
		//04.08 재석 추가(1원단위 해결, 각각 소숫점 뒷자리 내림으로)
		double point = (Math.floor(productDTO.getProductPrice() * (1 - (double)productDTO.getProductDC() / 100)*0.05)) * productAmount;
		totalPoint = totalPoint + point;
	
		mv.addObject("productAmount", productAmount);
		mv.addObject("productDTO", productDTO);
		mv.addObject("totalPrice", totalPrice);
		mv.addObject("totalPoint", totalPoint);
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		//결제 페이지에 보여줄 배송지 정보 조회
		List<MemberAddressDTO> addressList = memberAddressService.list(memberDTO);
		mv.addObject("addressList", addressList);
		
		//결제 페이지에 보여줄 포인트 정보 조회
		memberDTO = memberService.mypage(memberDTO);
		mv.addObject("memberDTO", memberDTO);
		
		mv.setViewName("pay/pay");
		
		return mv;
	}
	
	
//	@PostMapping("addDetail")
//	public ModelAndView add(@RequestParam List<String> idList, PayDTO payDTO, HttpSession session, HttpServletRequest request) throws Exception {
//		
//		ModelAndView mv = new ModelAndView();
//		
//		//pay 테이블 db insert
//		int result = payService.add(payDTO);
//		
//		mv.setViewName("common/result");
//		if(result == 1) {
//			//cartPay 테이블 db insert
//			//상품 재고 판매수 update
//			OcartDTO cartDTO = new OcartDTO();
//			for(int i=0; i<idList.size(); i++) {
//				Long cartId = Long.parseLong(idList.get(i));
//				CartPayDTO cartPayDTO = new CartPayDTO();
//				cartPayDTO.setCartId(cartId);
//				cartPayDTO.setPayNum(payDTO.getPayNum());
//				cartPayService.add(cartPayDTO);
//				
//				cartDTO.setCartId(cartId);
//				cartDTO = ocartService.detailCart(cartDTO);
//				//재고 감소
//				oproductService.stockSubtract(cartDTO);
//				//판매 증가
//				oproductService.saleAdd(cartDTO);
//				//장바구니 payCheck update
//				ocartService.payCheck(cartDTO);
//			}
//			
//			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
//			
//			//member point update
//			memberDTO = memberService.mypage(memberDTO);
//			Integer pointUse = Integer.parseInt(request.getParameter("pointUse"));
//			Integer pointSave = Integer.parseInt(request.getParameter("pointSave"));
//			memberDTO.setPoint(memberDTO.getPoint() + pointSave - pointUse);
//			memberService.pointUpdate(memberDTO);
//			
//			//order 테이블 db insert
//			OrderDTO orderDTO = new OrderDTO();
//			orderDTO.setPayNum(payDTO.getPayNum());
//			orderDTO.setOrderName(memberDTO.getName());
//			orderDTO.setId(memberDTO.getId());
//			orderDTO.setPointVar(pointSave-pointUse);
//			orderService.add(orderDTO);
//			
//			mv.addObject("message", "구매가 완료되었습니다.");
//			mv.addObject("path", "../member/orderList");
//		}else {
//			mv.addObject("message", "구매에 실패했습니다. 다시 시도해주세요.");
//			mv.addObject("path", "ocart/list");
//		}
//		
//		return mv;
//		
//	}
	
	//--------------------상품탭에서 구매탭 넘기는부분 끝----------------------------
	
	
	
	
	
	
	
	
	//--------------------장바구니에서 구매탭 넘기는부분 시작----------------------------
	@PostMapping("payForm")
	public ModelAndView payForm(@RequestParam List<String> idList, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<OcartDTO> cartList = new ArrayList<OcartDTO>();
		List<OproductDTO> productList = new ArrayList<OproductDTO>();
		double totalPrice = 0;
		//04.08 재석 포인트 추가(1원 단위 안넘어가기 때문)
		double totalPoint = 0;
		
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
			
			//가격 수정 cartDTO 양 추가(재석) -> 04.08 dto 다시 integer로하고 여기서 double
			double price = productDTO.getProductPrice() * (1 - (double)productDTO.getProductDC() / 100) * cartDTO.getProductAmount();
			totalPrice = totalPrice + price;
			//04.08 재석 추가(1원단위 해결, 각각 소숫점 뒷자리 올림으로)
			double point = (Math.floor(productDTO.getProductPrice() * (1 - (double)productDTO.getProductDC() / 100)*0.05)) * cartDTO.getProductAmount();
			totalPoint = totalPoint + point;
		}
		
		mv.addObject("cartList", cartList);
		mv.addObject("productList", productList);
		mv.addObject("totalPrice", totalPrice);
		mv.addObject("totalPoint", totalPoint);
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		//결제 페이지에 보여줄 배송지 정보 조회
		List<MemberAddressDTO> addressList = memberAddressService.list(memberDTO);
		mv.addObject("addressList", addressList);
		
		//결제 페이지에 보여줄 포인트 정보 조회
		memberDTO = memberService.mypage(memberDTO);
		mv.addObject("memberDTO", memberDTO);
		
		mv.setViewName("pay/pay");
		
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView add(@RequestParam List<String> idList, PayDTO payDTO, HttpSession session, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		//pay 테이블 db insert
		int result = payService.add(payDTO);
		
		mv.setViewName("common/result");
		if(result == 1) {
			//cartPay 테이블 db insert
			//상품 재고 판매수 update
			OcartDTO cartDTO = new OcartDTO();
			for(int i=0; i<idList.size(); i++) {
				Long cartId = Long.parseLong(idList.get(i));
				CartPayDTO cartPayDTO = new CartPayDTO();
				cartPayDTO.setCartId(cartId);
				cartPayDTO.setPayNum(payDTO.getPayNum());
				cartPayService.add(cartPayDTO);
				
				cartDTO.setCartId(cartId);
				cartDTO = ocartService.detailCart(cartDTO);
				//재고 감소
				oproductService.stockSubtract(cartDTO);
				//판매 증가
				oproductService.saleAdd(cartDTO);
				//장바구니 payCheck update
				ocartService.payCheck(cartDTO);
			}
			
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			
			//member point update
			memberDTO = memberService.mypage(memberDTO);
			Integer pointUse = Integer.parseInt(request.getParameter("pointUse"));
			Integer pointSave = Integer.parseInt(request.getParameter("pointSave"));
			memberDTO.setPoint(memberDTO.getPoint() + pointSave - pointUse);
			memberService.pointUpdate(memberDTO);
			
			//order 테이블 db insert
			OrderDTO orderDTO = new OrderDTO();
			orderDTO.setPayNum(payDTO.getPayNum());
			orderDTO.setOrderName(memberDTO.getName());
			orderDTO.setId(memberDTO.getId());
			orderDTO.setPointVar(pointSave-pointUse);
			orderService.add(orderDTO);
			
			mv.addObject("message", "구매가 완료되었습니다.");
			mv.addObject("path", "../member/orderList");
		}else {
			mv.addObject("message", "구매에 실패했습니다. 다시 시도해주세요.");
			mv.addObject("path", "ocart/list");
		}
		
		return mv;
		
	}
	//--------------------장바구니에서 구매탭 넘기는부분 끝----------------------------

}

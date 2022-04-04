package com.cgv.s1.member;

import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cgv.s1.cartPay.CartPayDTO;
import com.cgv.s1.cartPay.CartPayService;
import com.cgv.s1.ocart.OcartDTO;
import com.cgv.s1.ocart.OcartService;
import com.cgv.s1.oproduct.OproductDTO;
import com.cgv.s1.oproduct.OproductService;
import com.cgv.s1.order.OrderDTO;
import com.cgv.s1.order.OrderService;
import com.cgv.s1.util.Pager;

@Controller
@RequestMapping(value="/member/**")
public class memberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private CartPayService cartPayService;
	@Autowired
	private OcartService ocartService;
	@Autowired
	private OproductService oproductService;
	
	//로그인 페이지 이동
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() throws Exception {
		String path = "member/login";
		return path;
	}
	
	//로그인 요청
	@PostMapping("login")
	public String login(MemberDTO memberDTO, String remember, RedirectAttributes result,HttpServletResponse response, HttpSession session) throws Exception {
		
		if(remember != null && remember.equals("1")) {
			Cookie cookie = new Cookie("remember", memberDTO.getId());
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("remember", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		memberDTO = memberService.login(memberDTO);
		
		String path = "redirect:./login";
		result.addFlashAttribute("result", "0");
		if(memberDTO != null) {
			session.setAttribute("member", memberDTO);
			result.addFlashAttribute("result", "1");
			path = "redirect:../";
		}
		
		return path;

	}
	
	//로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:../";
	}
	
	//회원가입 페이지 이동
	@GetMapping("join")
	public ModelAndView join(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		if(request.getParameter("type").equals("member")) {
			mv.addObject("title", "회원가입");
			mv.addObject("name", "이름");
			mv.addObject("memberType", "0");
		}else {
			mv.addObject("title", "사업자 등록");
			mv.addObject("name", "사업체명");
			mv.addObject("memberType", "1");
		}
		
		mv.setViewName("member/join");
		
		return mv;
	}
	
	//회원가입 요청 DB 회원 insert
	@PostMapping("join")
	public ModelAndView join(MemberDTO memberDTO) throws Exception {
		int result = memberService.join(memberDTO);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/result");
		if(result == 1) {
			mv.addObject("message", "회원가입을 축하드립니다!");
			mv.addObject("path", "./login");
		}else {
			mv.addObject("message", "회원가입 실패");
			mv.addObject("path", "./join");
		}
		return mv;
	}
	
	//마이페이지 이동
	@GetMapping("mypage")
	public ModelAndView mypage(HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();

		memberDTO = memberService.mypage(memberDTO);
		mv.addObject("dto", memberDTO);
		mv.setViewName("member/mypage");			

		return mv;
	}
	
	//회원탈퇴 페이지 이동
	@GetMapping("beforeDelete")
	public void beforeDelete() throws Exception {
		
	}
	
	//회원탈퇴
	@PostMapping("delete")
	public ModelAndView delete(MemberDTO memberDTO, HttpSession session) throws Exception {
		MemberDTO mem = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/result");
		
		if(memberDTO.getPw().equals(mem.getPw())) {
			int result = memberService.delete(memberDTO);
			if(result == 1) {
				session.invalidate();
				mv.addObject("message", "탈퇴 되셨습니다.");
				mv.addObject("path", "../");
			}else {
				mv.addObject("message", "탈퇴 실패했습니다.");
				mv.addObject("path", "./beforeDelete");
			}
		}else {
			mv.addObject("message", "비밀번호가 일치하지 않습니다.");
			mv.addObject("path", "./beforeDelete");
		}
		
		return mv;
	}
	
	//중복 아이디 확인
	@PostMapping("idCheck")
	public ModelAndView idCheck(MemberDTO memberDTO) throws Exception {
//		System.out.println("중복 확인 아이디 : "+ memberDTO.getId());
		int result = memberService.idCheck(memberDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;	
	}
	
	//중복 이메일 확인
	@PostMapping("emailCheck")
	public ModelAndView emailCheck(MemberDTO memberDTO) throws Exception {
//		System.out.println(memberDTO.getEmail());
		int result = memberService.emailCheck(memberDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	//회원정보 수정하기 전 비밀번호 확인 페이지
	@GetMapping("beforeUpdate")
	public void beforeUpdate() throws Exception {
		
	}
	
	//update form 페이지로 이동
	@PostMapping("updateForm")
	public ModelAndView updateForm(MemberDTO memberDTO, HttpSession session) throws Exception {
		MemberDTO mem = (MemberDTO)session.getAttribute("member");
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPw());
		System.out.println(mem.getPw());
		ModelAndView mv = new ModelAndView();
		
		if(memberDTO.getPw().equals(mem.getPw())) {
			memberDTO = memberService.mypage(memberDTO);
			mv.addObject("dto", memberDTO);
			mv.setViewName("member/updateForm");
		}else {
			mv.setViewName("common/result");
			mv.addObject("message", "비밀번호가 일치하지 않습니다.");
			mv.addObject("path", "./beforeUpdate");
		}
		
		return mv;
	}
	
	//DB update
	@PostMapping("update")
	public ModelAndView update(MemberDTO memberDTO) throws Exception {
		System.out.println(memberDTO.getId());
		
		int result = memberService.update(memberDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/result");
		mv.addObject("path", "./mypage");
		
		if(result == 1) {
			mv.addObject("message", "회원정보를 수정했습니다.");
		}else {
			mv.addObject("message", "회원정보 수정에 실패했습니다");
		}
		return mv;
	}
	
	//비밀번호 변경 페이지 이동
	@GetMapping("pwUpdate")
	public void pwUpdate() throws Exception {

	}
	
	//비밀번호 변경 요청 DB update
	@PostMapping("pwUpdate")
	public ModelAndView pwUpdate(HttpSession session, HttpServletRequest request) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String pw = (String)request.getParameter("pw");
		String newPw = (String)request.getParameter("newPw");
		
		System.out.println(memberDTO.getId());
		System.out.println(pw);
		System.out.println(newPw);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/result");
		if(pw.equals(memberDTO.getPw())) {
			memberDTO.setPw(newPw);
			memberService.pwUpdate(memberDTO);
			session.invalidate();
			mv.addObject("message", "비밀번호를 변경했습니다. 다시 로그인 해주세요.");
			mv.addObject("path", "./login");
		}else {
			mv.addObject("message", "현재 비밀번호가 틀렸습니다.");
			mv.addObject("path", "./pwUpdate");
		}
		
		return mv;
	}
	
	//아이디 찾기 페이지
	@GetMapping("idFind")
	public void idFind() throws Exception {
		
	}
	
	//아이디 찾기 폼 전송
	@PostMapping("idFind")
	public ModelAndView idFind(MemberDTO memberDTO) throws Exception {
		memberDTO = memberService.idFind(memberDTO);
		ModelAndView mv = new ModelAndView();
		if(memberDTO != null) {
			mv.setViewName("member/idFindResult");
			mv.addObject("dto", memberDTO);
		}else {
			mv.setViewName("common/result");
			mv.addObject("message", "입력하신 정보와 일치하는 가입 정보가 없습니다.");
			mv.addObject("path", "../");
		}
		
		return mv;
	}
	
	//비밀번호 찾기 페이지
	@GetMapping("pwFind")
	public void pwFind() throws Exception {
		
	}
	
	//비밀번호 찾기 폼 전송
	@PostMapping("pwFind")
	public ModelAndView pwFind(MemberDTO memberDTO, HttpServletRequest request) throws Exception {
		int result = memberService.pwFind(memberDTO);
		ModelAndView mv = new ModelAndView();
		if(result == 1) {
			String newPw = request.getParameter("newPw");
			memberDTO.setPw(newPw);
			memberService.pwUpdate(memberDTO);
			
			mv.addObject("message", "새로운 비밀번호가 설정되었습니다.");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
		}else {
			mv.addObject("message", "입력하신 아이디, 이메일과 일치하는 가입정보가 없습니다.");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
		}
		return mv;
	}
	
	//주문/배송 조회 페이지
	@GetMapping("orderList")
	public ModelAndView orderList(HttpSession session, Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		pager.setPerPage(5L);
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		List<OrderDTO> ar = orderService.list(memberDTO, pager);
		mv.addObject("orderList", ar);
		mv.addObject("pager", pager);
		
		List<List<OproductDTO>> productList = new ArrayList<List<OproductDTO>>();
		for(int i=0;i<ar.size();i++) {
			List<OproductDTO> productInfo = oproductService.productCart(ar.get(i));
			productList.add(productInfo);
		}
		mv.addObject("productList", productList);
		
		mv.setViewName("member/orderList");
		
		return mv;

	}
	
}

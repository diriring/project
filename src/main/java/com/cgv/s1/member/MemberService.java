package com.cgv.s1.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public int join(MemberDTO memberDTO) throws Exception {
		return memberDAO.join(memberDTO);
	}
	
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return memberDAO.login(memberDTO);
	}
	
	public MemberDTO mypage(MemberDTO memberDTO) throws Exception {
		return memberDAO.mypage(memberDTO);
	}
	
	public int delete(MemberDTO memberDTO) throws Exception {
		return memberDAO.delete(memberDTO);
	}
	
	public int update(MemberDTO memberDTO) throws Exception {
		return memberDAO.update(memberDTO);
	}
	
	public int pwUpdate(MemberDTO memberDTO) throws Exception {
		return memberDAO.pwUpdate(memberDTO);
	}
	
	public int idCheck(MemberDTO memberDTO) throws Exception {
		return memberDAO.idCheck(memberDTO);
	}
	
	public int emailCheck(MemberDTO memberDTO) throws Exception {
		return memberDAO.emailCheck(memberDTO);
	}
	
	public MemberDTO idFind(MemberDTO memberDTO) throws Exception {
		return memberDAO.idFind(memberDTO);
	}
	
	public int pwFind(MemberDTO memberDTO) throws Exception {
		return memberDAO.pwFind(memberDTO);
	}
	
}

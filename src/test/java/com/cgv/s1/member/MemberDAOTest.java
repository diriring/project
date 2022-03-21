package com.cgv.s1.member;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.cgv.s1.MyJunitTest;
import com.cgv.s1.member.MemberDAO;
import com.cgv.s1.member.MemberDTO;

public class MemberDAOTest extends MyJunitTest{

	@Autowired
	private MemberDAO memberDAO;
	
	//@Test
	public void joinTest() throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setName("Tname");
		memberDTO.setId("idtest");
		memberDTO.setPw("1234");
		memberDTO.setBirth("19971103");
		memberDTO.setPhone("010-0000-0000");
		memberDTO.setEmail("idtest@naver.com");
		
		int result = memberDAO.join(memberDTO);
		
		assertEquals(1, result);
		
	}
	
	//@Test
	public void loginTest() throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId("idtest");
		memberDTO.setPw("1234");
		
		memberDTO = memberDAO.login(memberDTO);
		
		System.out.println(memberDTO.getName());
	}

}

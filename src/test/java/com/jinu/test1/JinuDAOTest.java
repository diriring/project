package com.jinu.test1;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.cgv.s1.MyJunitTest;


public class JinuDAOTest extends MyJunitTest{

	@Autowired
	private JinuDAO jinuDAO;
	
	@Test
	public void addTest() throws Exception {
		
		
		JinuDTO jinuDTO = new JinuDTO();
		jinuDTO.setName("id");
		jinuDTO.setNum(1);
		
		int result = jinuDAO.add(jinuDTO);
		
		assertEquals(1, result);
	}

}

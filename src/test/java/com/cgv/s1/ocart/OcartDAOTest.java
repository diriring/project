package com.cgv.s1.ocart;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.cgv.s1.MyJunitTest;
import com.cgv.s1.util.Pager;

public class OcartDAOTest extends MyJunitTest {

	@Autowired
	private OcartDAO ocartDAO;
	
	@Test
	public void list() throws Exception{
		Pager pager = new Pager();
		List<OcartDTO> ar = ocartDAO.list(pager);
		assertNotNull(ar);

	}
	
	
	
	
	
	
	
	//카트 목록
//	@Test
//	public void getCartTest() throws Exception {
//		OcartDTO ocartDTO = new OcartDTO();
//		ocartDTO.setId("admin");
//		List<OcartDTO> ar = ocartDAO.getCart(ocartDTO.getId());
//		assertNotNull(ar);
//	}

	//카트 확인
//	@Test
//	public void checkCartTest() throws Exception{
//		
//		OcartDTO ocartDTO = new OcartDTO();
//		ocartDTO.setId("admin");
//		ocartDTO.setProductNum(296L);
//
//		ocartDTO = ocartDAO.checkCart(ocartDTO);
//		assertNotNull(ocartDTO);
//
//	}
}







package com.cgv.s1.oproduct;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.cgv.s1.MyJunitTest;
import com.olive.s1.oproduct.OproductDAO;
import com.olive.s1.oproduct.OproductDTO;
import com.olive.s1.util.Pager;

public class OproductDAOTest extends MyJunitTest {

	@Autowired
	private OproductDAO oproductDAO;
	
	//list
	//@Test
	public void listTest() throws Exception{
		Pager pager = new Pager();
		List<OproductDTO> ar = oproductDAO.list(pager);
		assertNotNull(ar);
	}
	
	//detail
	//@Test
	public void detailTest() throws Exception{
		OproductDTO oproductDTO = new OproductDTO();
		oproductDTO.setProductNum(1L);
		oproductDTO = oproductDAO.detail(oproductDTO);
		assertNotNull(oproductDTO);
	}
	
	//add
	//@Test
	public void addTest() throws Exception{
		
		for(int i=0; i<100; i++) {
			OproductDTO oproductDTO = new OproductDTO();
			oproductDTO.setProductType(1);
			oproductDTO.setProductName("N"+i);
			oproductDTO.setPriductDetail("D"+i);
			oproductDTO.setProductPrice(1000);
			
			double rate = Math.random();
			rate = rate*1000; 
			int r = (int)rate; 
			rate = r/100.0; 
			oproductDTO.setProductDC(rate);
			oproductDTO.setProductStock(1);
			int result = oproductDAO.add(oproductDTO);
			
			if(i%10==0) {
				Thread.sleep(1000);
			}
		}

		//assertEquals(1, result);
	}

}

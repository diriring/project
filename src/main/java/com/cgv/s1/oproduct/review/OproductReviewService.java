package com.cgv.s1.oproduct.review;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cgv.s1.util.Pager;

@Service
public class OproductReviewService {

	private OproductReviewDAO oproductReviewDAO;
	
	public List<OproductReviewDTO> list(Pager pager)throws Exception{
		
		pager.makeRow();
		
		return oproductReviewDAO.list(pager);
	}
}

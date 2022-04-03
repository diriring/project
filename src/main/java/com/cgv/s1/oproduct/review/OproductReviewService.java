package com.cgv.s1.oproduct.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class OproductReviewService {
	@Autowired
	private OproductReviewDAO oproductReviewDAO;
	
	public List<OproductReviewDTO> list(OproductReviewDTO oproductReviewDTO)throws Exception{
		
		
		
		return oproductReviewDAO.list(oproductReviewDTO);
	}
	
	public int reviewAdd(OproductReviewDTO oproductReviewDTO)throws Exception{
		
		return oproductReviewDAO.reviewAdd(oproductReviewDTO);
	}
	
	public int update(OproductReviewDTO oproductReviewDTO)throws Exception{
		
		return oproductReviewDAO.update(oproductReviewDTO);
	}
	
	public int delete(OproductReviewDTO oproductReviewDTO)throws Exception{
		
		return oproductReviewDAO.delete(oproductReviewDTO);
	}
}

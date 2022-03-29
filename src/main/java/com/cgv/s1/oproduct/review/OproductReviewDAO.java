package com.cgv.s1.oproduct.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cgv.s1.util.Pager;

@Repository
public class OproductReviewDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String NAMESPACE = "com.cgv.s1.opoduct.review.OproductReviewDAO.";
	
	public List<OproductReviewDTO> list(Pager pager)throws Exception{
		
		
		return sqlSession.selectList(NAMESPACE+"list", pager);
	}
	
}

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
	
	private String NAMESPACE = "com.cgv.s1.oproduct.review.OproductReviewDAO.";
	
	public List<OproductReviewDTO> list(OproductReviewDTO oproductReviewDTO)throws Exception{
		
		
		return sqlSession.selectList(NAMESPACE+"list", oproductReviewDTO);
	}
	
	public int add(OproductReviewDTO oproductReviewDTO)throws Exception{
		
		return sqlSession.insert(NAMESPACE+"add", oproductReviewDTO);
	}
	
	public int update(OproductReviewDTO oproductReviewDTO)throws Exception{
		
		return sqlSession.update(NAMESPACE+"update", oproductReviewDTO);
	}
	
	public int delete(OproductReviewDTO oproductReviewDTO)throws Exception{
		
		return sqlSession.delete(NAMESPACE+"delete", oproductReviewDTO);
	}
	
}

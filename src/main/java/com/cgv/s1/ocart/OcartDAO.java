package com.cgv.s1.ocart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OcartDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE ="com.cgv.s1.ocart.OcartDAO.";
	
	
	
	
	
}

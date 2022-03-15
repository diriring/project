package com.jinu.test1;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JinuDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jinu.test1.JinuDAO.";
	
	public int add(JinuDTO jinuDTO)throws Exception{
		
		return sqlSession.insert(NAMESPACE+"add", jinuDTO);
	}
}

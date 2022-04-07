package com.cgv.s1.pay;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PayDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.cgv.s1.pay.PayDAO.";
	
	public int add(PayDTO payDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"add", payDTO);
	}

}

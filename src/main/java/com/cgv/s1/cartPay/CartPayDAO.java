package com.cgv.s1.cartPay;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartPayDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.cgv.s1.cartPay.CartPayDAO.";
	
	public int add(CartPayDTO cartPayDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"add", cartPayDTO);
	}

}

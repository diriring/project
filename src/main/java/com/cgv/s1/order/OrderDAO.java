package com.cgv.s1.order;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.cgv.s1.order.OrderDAO.";
	
	public int add(OrderDTO orderDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"add", orderDTO);
	}

}

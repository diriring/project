package com.cgv.s1.cartPay;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cgv.s1.order.OrderDTO;

@Repository
public class CartPayDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.cgv.s1.cartPay.CartPayDAO.";
	
	public int add(CartPayDTO cartPayDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"add", cartPayDTO);
	}
	
	public List<CartPayDTO> list(OrderDTO orderDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"list", orderDTO);
	}

}

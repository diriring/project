package com.cgv.s1.cartList;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartListDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.cgv.s1.cartList.CartListDAO.";
	
	public int add(CartListDTO cartListDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"add", cartListDTO);
	}
	
	public List<CartListDTO> getCartList(CartListDTO cartListDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getCartList", cartListDTO);
	}
	
}

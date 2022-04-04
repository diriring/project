package com.cgv.s1.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cgv.s1.member.MemberDTO;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.cgv.s1.order.OrderDAO.";
	
	public int add(OrderDTO orderDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"add", orderDTO);
	}
	
	public List<OrderDTO> list(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"list", memberDTO);
	}

}

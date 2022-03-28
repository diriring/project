package com.cgv.s1.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cgv.s1.member.MemberDTO;

@Service
public class OrderService {

	@Autowired
	private OrderDAO orderDAO;
	
	public List<OrderDTO> list(MemberDTO memberDTO) throws Exception {
		return orderDAO.list(memberDTO);
	}
	
}

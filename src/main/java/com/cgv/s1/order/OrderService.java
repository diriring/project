package com.cgv.s1.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cgv.s1.member.MemberDTO;
import com.cgv.s1.util.Pager;

@Service
public class OrderService {
	
	@Autowired
	private OrderDAO orderDAO;
	
	public int add(OrderDTO orderDTO) throws Exception {
		return orderDAO.add(orderDTO);
	}
	
	public List<OrderDTO> list(MemberDTO memberDTO, Pager pager) throws Exception {
		pager.makeRow();
		pager.makeNum(orderDAO.total(memberDTO));
		pager.setId(memberDTO.getId());
		return orderDAO.list(pager);
	}

}

package com.cgv.s1.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
	
	@Autowired
	private OrderDAO orderDAO;
	
	public int add(OrderDTO orderDTO) throws Exception {
		return orderDAO.add(orderDTO);
	}

}

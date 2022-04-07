package com.cgv.s1.cartPay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cgv.s1.order.OrderDTO;

@Service
public class CartPayService {
	
	@Autowired
	private CartPayDAO cartPayDAO;
	
	public int add(CartPayDTO cartPayDTO) throws Exception {
		return cartPayDAO.add(cartPayDTO);
	}
	
	public List<CartPayDTO> list(OrderDTO orderDTO) throws Exception {
		return cartPayDAO.list(orderDTO);
	}

}

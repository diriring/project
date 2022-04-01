package com.cgv.s1.cartPay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartPayService {
	
	@Autowired
	private CartPayDAO cartPayDAO;
	
	public int add(CartPayDTO cartPayDTO) throws Exception {
		return cartPayDAO.add(cartPayDTO);
	}

}

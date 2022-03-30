package com.cgv.s1.cartList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartListService {

	@Autowired
	private CartListDAO cartListDAO;
	
	public int add(CartListDTO cartListDTO) throws Exception {
		return cartListDAO.add(cartListDTO);
	}
	
	public List<CartListDTO> getCartList(CartListDTO cartListDTO) throws Exception {
		return cartListDAO.getCartList(cartListDTO);
	}
}

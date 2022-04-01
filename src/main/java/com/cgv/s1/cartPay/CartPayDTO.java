package com.cgv.s1.cartPay;

public class CartPayDTO {
	
	private Long cartPayNum;
	private Long payNum;
	private Long cartId;
	
	public Long getCartPayNum() {
		return cartPayNum;
	}
	public void setCartPayNum(Long cartPayNum) {
		this.cartPayNum = cartPayNum;
	}
	public Long getPayNum() {
		return payNum;
	}
	public void setPayNum(Long payNum) {
		this.payNum = payNum;
	}
	public Long getCartId() {
		return cartId;
	}
	public void setCartId(Long cartId) {
		this.cartId = cartId;
	}

}

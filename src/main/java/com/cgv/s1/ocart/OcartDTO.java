package com.cgv.s1.ocart;

public class OcartDTO {

	private Long cartID;
	private String id;
	private Long productNum;
	private Integer productAmount;
	private Integer payCheck;
	
	public Long getCartID() {
		return cartID;
	}
	public void setCartID(Long cartID) {
		this.cartID = cartID;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public Integer getProductAmount() {
		return productAmount;
	}
	public void setProductAmount(Integer productAmount) {
		this.productAmount = productAmount;
	}
	public Integer getPayCheck() {
		return payCheck;
	}
	public void setPayCheck(Integer payCheck) {
		this.payCheck = payCheck;
	}
	
	
}

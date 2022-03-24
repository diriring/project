package com.cgv.s1.ocart;

public class OcartDTO {

	//장바구니
	private Long cartId;
	private String id;
	private Long productNum;
	private Integer productAmount;
	private Integer payCheck;
	
	//상품
	private String productName;
	private	Integer productPrice;
	private Double productDC;
	
	//추가 - setter 미구현
    private Integer salePrice;
    private Integer totalPrice;
    
    //변수값 초기화 - product변화시 구현
	public void initSaleTotal() {
		this.salePrice = (int)(this.productPrice * (1-this.productDC));
		this.totalPrice = this.salePrice*this.productAmount;
	}

	public Long getCartId() {
		return cartId;
	}
	public void setCartId(Long cartId) {
		this.cartId = cartId;
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
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}
	public Double getProductDC() {
		return productDC;
	}
	public void setProductDC(Double productDC) {
		this.productDC = productDC;
	}
	public Integer getSalePrice() {
		return salePrice;
	}
	public Integer getTotalPrice() {
		return totalPrice;
	}

	//toString
	@Override
	public String toString() {
		return "OcartDTO [cartId=" + cartId + ", id=" + id + ", productNum=" + productNum + ", productAmount="
				+ productAmount + ", payCheck=" + payCheck + ", productName=" + productName + ", productPrice="
				+ productPrice + ", productDC=" + productDC + ", salePrice=" + salePrice + ", totalPrice=" + totalPrice
				+ "]";
	}
    
}

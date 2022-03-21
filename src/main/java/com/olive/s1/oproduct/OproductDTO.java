package com.olive.s1.oproduct;

import java.sql.Date;

public class OproductDTO {

	private Long productNum;
	private Integer productType;
	private String productName;
	private String priductDetail;
	private Integer productPrice;
	private Double productDC;
	private Integer productStock;
	private Integer productSale;
	private Date regDate;
	
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public Integer getProductType() {
		return productType;
	}
	public void setProductType(Integer productType) {
		this.productType = productType;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getPriductDetail() {
		return priductDetail;
	}
	public void setPriductDetail(String priductDetail) {
		this.priductDetail = priductDetail;
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
	public Integer getProductStock() {
		return productStock;
	}
	public void setProductStock(Integer productStock) {
		this.productStock = productStock;
	}
	public Integer getProductSale() {
		return productSale;
	}
	public void setProductSale(Integer productSale) {
		this.productSale = productSale;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}

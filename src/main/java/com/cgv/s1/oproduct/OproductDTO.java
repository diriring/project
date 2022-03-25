package com.cgv.s1.oproduct;

import java.sql.Date;
import java.util.List;


public class OproductDTO {

	private Long productNum;
	private String writer;
	private Integer productType;
	private String productName;
	private String productDetail;
	private Integer productPrice;
	private Double productDC;
	private Integer productStock;
	private Integer productSale;
	private Date regDate;
	private List<OproductDTO> fileDTOs;
	
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public String getProductDetail() {
		return productDetail;
	}
	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
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
	
	public List<OproductDTO> getFileDTOs() {
		return fileDTOs;
	}
	public void setFileDTOs(List<OproductDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	
	
}

package com.cgv.s1.oproduct;

import java.sql.Date;
import java.util.List;


public class OproductDTO {

	//상품내 변수
	private Long productNum;
	private String writer;
	private String productType;
	private String productName;
	private String productDetail;
	private Integer productPrice;
	//퍼센트 double에서 integer로 바꿈
	private Integer productDC;
	private Integer productStock;
	private Integer productSale;
	private Date regDate;
	
	//디테일 파일 담기 
	private List<OproductDTO> fileDTOs;
	
	public List<OproductDTO> getFileDTOs() {
		return fileDTOs;
	}
	public void setFileDTOs(List<OproductDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	
	//썸네일 파일 담기
	private OproductFileThumbDTO oproductFileThumbDTO;

	public OproductFileThumbDTO getOproductFileThumbDTO() {
		return oproductFileThumbDTO;
	}
	public void setOproductFileThumbDTO(OproductFileThumbDTO oproductFileThumbDTO) {
		this.oproductFileThumbDTO = oproductFileThumbDTO;
	}
	
	//타입
	private String typeName;
	
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	
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
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
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
	public Integer getProductDC() {
		return productDC;
	}
	public void setProductDC(Integer productDC) {
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

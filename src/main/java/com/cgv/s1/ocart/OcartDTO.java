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
	
	//페이지당 보여줄 row 갯수
	private Long perPage;

	//페이지번호
	private Long page;
	
	//시작번호
	private Long startRow;
	
	//끝번호
	private Long lastRow;

	//------------ 검색 사용 변수 ------------------
	private String search;
	private String kind;
	
	
	
	//------------ JSP 사용 변수 -------------------
	private Long startNum;
	private Long lastNum;
	
	private boolean pre;
	private boolean next;
	
	
	public void makeRow() {
		this.startRow = (this.getPage()-1)*this.getPerPage() +1;
		this.lastRow = this.getPage()*this.getPerPage();
	}
	
	public void makeNum(Long totalCount) {

		Long totalPage = totalCount/this.getPerPage();
		if(totalCount%getPerPage() != 0) {
			totalPage++;
		}
		
		Long perBlock = 10L;
		
		Long totalBlock = totalPage/perBlock;
		if(totalPage%perBlock != 0) {
			totalBlock++;
		}
		
		Long curBlock = this.getPage()/perBlock;
		if(this.getPage()%perBlock != 0) {
			curBlock++;
		}
		
		this.startNum = (curBlock-1)*perBlock +1;
		this.lastNum = curBlock*perBlock;
		

		this.pre = false;
		if(curBlock > 1) {
			this.pre = true;
		}
		
		this.next = false;
		if(totalBlock > curBlock) {
			this.next = true;
		}
		
		if(curBlock == totalBlock) {
			this.lastNum = totalPage;
		}
		
		
	}
	
	public Long getPerPage() {
		if(this.perPage == null || this.perPage < 1) {
			this.perPage = 10L;
		}
		return perPage;
	}

	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}

	public Long getPage() {
		if(this.page == null || this.page < 1) {
			this.page = 1L;
		}
		return page;
	}

	public void setPage(Long page) {
		this.page = page;
	}

	public Long getStartRow() {
		return startRow;
	}

	public void setStartRow(Long startRow) {
		this.startRow = startRow;
	}

	public Long getLastRow() {
		return lastRow;
	}

	public void setLastRow(Long lastRow) {
		this.lastRow = lastRow;
	}

	public Long getStartNum() {
		return startNum;
	}

	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}

	public Long getLastNum() {
		return lastNum;
	}

	public void setLastNum(Long lastNum) {
		this.lastNum = lastNum;
	}

	public boolean isPre() {
		return pre;
	}

	public void setPre(boolean pre) {
		this.pre = pre;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public String getSearch() {
		if(this.search == null) {
			this.search = "";
		}
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}
	

		
    
}

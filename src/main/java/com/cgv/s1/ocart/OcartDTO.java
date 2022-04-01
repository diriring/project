package com.cgv.s1.ocart;

import java.util.List;

import com.cgv.s1.oproduct.OproductFileThumbDTO;

//import com.cgv.s1.util.Pager;

public class OcartDTO {

	//장바구니내 변수
	private Long cartId;
	private String id;
	private Long productNum;
	private Integer productAmount;
	private Integer payCheck;
	
	//상품 담는 변수
	private String productName;
	private	Integer productPrice;
	private Double productDC;

	//썸네일 파일 담기(여러개라 리스트로)
	private List<OproductFileThumbDTO> thumbFilesDTOs;
	public List<OproductFileThumbDTO> getThumbFilesDTOs() {
		return thumbFilesDTOs;
	}
	public void setThumbFilesDTOs(List<OproductFileThumbDTO> thumbFilesDTOs) {
		this.thumbFilesDTOs = thumbFilesDTOs;
	}
	
	//썸네일 파일담기(하나씩해보자)ㄴㄴ
//	private OproductFileThumbDTO oproductFileThumbDTO;
//	public OproductFileThumbDTO getOproductFileThumbDTO() {
//		return oproductFileThumbDTO;
//	}
//	public void setOproductFileThumbDTO(OproductFileThumbDTO oproductFileThumbDTO) {
//		this.oproductFileThumbDTO = oproductFileThumbDTO;
//	}

	//일단 이거로 안담기면 위에꺼
//	private List<OcartDTO> thumbFilesDTOs;
//	public List<OcartDTO> getThumbFilesDTOs() {
//		return thumbFilesDTOs;
//	}
//	public void setThumbFilesDTOs(List<OcartDTO> thumbFilesDTOs) {
//		this.thumbFilesDTOs = thumbFilesDTOs;
//	}

	
	//=========계산식 변수========
	//추가 - setter 미구현
    private Integer salePrice;
    private Integer totalPrice;
    //포인트 담기
    private Integer point;
    private Integer totalPoint;
    
    //변수값 초기화 - product변화시 구현
	public void Cal() {
		
		//productDC % 0.01곱하는거로 처리
		if(this.productDC == 0) {
			this.salePrice = (int)(this.productPrice);
		}else {
			this.salePrice = (int)(this.productPrice * (1-this.productDC*0.01));
		}

		this.totalPrice = this.salePrice*this.productAmount;
		//각각 포인트 0.05 포인트 구현
		this.point = (int)(Math.floor(this.salePrice*0.05));
		//총 포인트
		this.totalPoint =this.point * this.productAmount;
	}
	//=========계산식 변수 끝=========

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

	public Integer getPoint() {
		return point;
	}

	public Integer getTotalPoint() {
		return totalPoint;
	}

	
	

	//toString(할지?) 미구현
	

	
	
	//-----------------해보는것 시작----------------------
	//Pager pager = new Pager();
//	
//	static class Pager extends com.cgv.s1.util.Pager {
//		
//		 private int value = 0;
//	        public int getValue(){
//	            return value;
//	        }
//
//	        public void setValue(int value){
//	            this.value = value;
//	        }
//	}
	
	//안해봤지만 생각해보면 private list<Pager> pager; 선언하면 가능할듯?
	//-----------------해보는것 끝----------------------
	
	//PAGER 추가(일단 때려박음 리스트 가져올때 ocartDTO로 가져오기 위해)
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

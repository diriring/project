package com.cgv.s1.oproduct;

import com.cgv.s1.file.FileDTO;

public class OproductFileDTO extends FileDTO{
	
	private Long productNum;
	
//	//썸네일 파일 추가
//	private String fileNameThumb;
//	private String oriNameThumb;
//	
	
	public Long getProductNum() {
		return productNum;
	}

	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}

	
	
}

package com.cgv.s1.oproduct.review;

import java.util.Date;
import java.util.List;



public class OproductReviewDTO {
	
	private Long replyNum;
	private Long num;
	private String writer;
	private String contents;
	private Date regdate;
	
	private List<OproductReviewFileDTO> fileDTOs;
	
	
	
	
	public List<OproductReviewFileDTO> getFileDTOs() {
		return fileDTOs;
	}
	public void setFileDTOs(List<OproductReviewFileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	public Long getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(Long replyNum) {
		this.replyNum = replyNum;
	}
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}

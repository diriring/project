package com.cgv.s1.board;

import java.util.Date;
import java.util.List;

public class BoardDTO {
	
	private long num;
	private String title;
	private String writer;
	private String contents;
	private Date regDate;
	private Long hit;
	private Long ref;
	private Long step;
	private Long depth;
	
	private List<BoardDTO> fileDTOs;
	
	
	
	public List<BoardDTO> getFileDTOs() {
		return fileDTOs;
	}
	public void setFileDTOs(List<BoardDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Long getHit() {
		return hit;
	}
	public void setHit(Long hit) {
		this.hit = hit;
	}
	public Long getRef() {
		return ref;
	}
	public void setRef(Long ref) {
		this.ref = ref;
	}
	public Long getStep() {
		return step;
	}
	public void setStep(Long step) {
		this.step = step;
	}
	public Long getDepth() {
		return depth;
	}
	public void setDepth(Long depth) {
		this.depth = depth;
	}
	
	
}

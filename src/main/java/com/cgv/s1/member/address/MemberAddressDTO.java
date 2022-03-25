package com.cgv.s1.member.address;

public class MemberAddressDTO {
	
	private Long maNum;
	private String id;
	private String mAddress1;
	private String mAddress2;
	private String addressName;
	
	public Long getMaNum() {
		return maNum;
	}
	public void setMaNum(Long maNum) {
		this.maNum = maNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getmAddress1() {
		return mAddress1;
	}
	public void setmAddress1(String mAddress1) {
		this.mAddress1 = mAddress1;
	}
	public String getmAddress2() {
		return mAddress2;
	}
	public void setmAddress2(String mAddress2) {
		this.mAddress2 = mAddress2;
	}
	public String getAddressName() {
		return addressName;
	}
	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}
	
}

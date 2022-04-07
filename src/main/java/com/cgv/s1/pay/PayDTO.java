package com.cgv.s1.pay;

import java.sql.Date;

public class PayDTO {
	
	private Long payNum;
	private Date payDate;
	private Integer payMoney;
	private Double totalPrice;
	private String arrive;
	private Integer payCheck;
	
	public Long getPayNum() {
		return payNum;
	}
	public void setPayNum(Long payNum) {
		this.payNum = payNum;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public Integer getPayMoney() {
		return payMoney;
	}
	public void setPayMoney(Integer payMoney) {
		this.payMoney = payMoney;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getArrive() {
		return arrive;
	}
	public void setArrive(String arrive) {
		this.arrive = arrive;
	}
	public Integer getPayCheck() {
		return payCheck;
	}
	public void setPayCheck(Integer payCheck) {
		this.payCheck = payCheck;
	}
	
}

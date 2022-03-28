package com.cgv.s1.order;

import java.sql.Date;

public class OrderDTO {
	
	private Long orderNum;
	private Long payNum;
	private String orderName;
	private Integer shipState;
	private Date orderDate;
	private Integer refund;
	
	public Long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}
	public Long getPayNum() {
		return payNum;
	}
	public void setPayNum(Long payNum) {
		this.payNum = payNum;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public Integer getShipState() {
		return shipState;
	}
	public void setShipState(Integer shipState) {
		this.shipState = shipState;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Integer getRefund() {
		return refund;
	}
	public void setRefund(Integer refund) {
		this.refund = refund;
	}

}

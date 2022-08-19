package com.whm.atelier.vo;

import java.util.List;

/**
 * 결제 VO
 * */
public class Payment {
	private int payment_no;
	private int payment_origin_price;
	private int payment_use_point;
	private int payment_use_coupon;
	private int payment_total_price;
	private int payment_savepoint;
	private List<Order> orderList;
	
	/**
	 * 
	 */
	public Payment() {
		super();
	}
	/**
	 * @param payment_no
	 * @param payment_origin_price
	 * @param payment_use_point
	 * @param payment_use_coupon
	 * @param payment_total_price
	 * @param payment_savepoint
	 * @param orderList
	 */
	public Payment(int payment_no, int payment_origin_price, int payment_use_point, int payment_use_coupon,
			int payment_total_price, int payment_savepoint, List<Order> orderList) {
		super();
		this.payment_no = payment_no;
		this.payment_origin_price = payment_origin_price;
		this.payment_use_point = payment_use_point;
		this.payment_use_coupon = payment_use_coupon;
		this.payment_total_price = payment_total_price;
		this.payment_savepoint = payment_savepoint;
		this.orderList = orderList;
	}
	public int getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}
	public int getPayment_origin_price() {
		return payment_origin_price;
	}
	public void setPayment_origin_price(int payment_origin_price) {
		this.payment_origin_price = payment_origin_price;
	}
	public int getPayment_use_point() {
		return payment_use_point;
	}
	public void setPayment_use_point(int payment_use_point) {
		this.payment_use_point = payment_use_point;
	}
	public int getPayment_use_coupon() {
		return payment_use_coupon;
	}
	public void setPayment_use_coupon(int payment_use_coupon) {
		this.payment_use_coupon = payment_use_coupon;
	}
	public int getPayment_total_price() {
		return payment_total_price;
	}
	public void setPayment_total_price(int payment_total_price) {
		this.payment_total_price = payment_total_price;
	}
	public int getPayment_savepoint() {
		return payment_savepoint;
	}
	public void setPayment_savepoint(int payment_savepoint) {
		this.payment_savepoint = payment_savepoint;
	}
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		 this.orderList = orderList;
	}
	
	@Override
	public String toString() {
		return "Payment : [payment_no=" + payment_no
				+ ", payment_origin_price=" + payment_origin_price
				+ ", payment_use_point=" + payment_use_point
				+ ", payment_use_point=" + payment_use_coupon
				+ ", payment_total_price=" + payment_total_price
				+ ", payment_savepoint=" + payment_savepoint
				+ ", orderList=" + orderList
				+ "]";
	}
}

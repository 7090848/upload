package com.whm.atelier.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OrderTb {
	private int order_no;
	private int product_no; 
	private int payment_no;
	private int consumer_no;
	private String order_complete_status; 
	private String order_delivery_status;
	private int order_product_count;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date order_date;
	private String order_number;
	public OrderTb() {
		super();
	}
	public OrderTb(int order_no, int product_no, int payment_no, int consumer_no, String order_complete_status,
			String order_delivery_status, int order_product_count, Date order_date, String order_number) {
		super();
		this.order_no = order_no;
		this.product_no = product_no;
		this.payment_no = payment_no;
		this.consumer_no = consumer_no;
		this.order_complete_status = order_complete_status;
		this.order_delivery_status = order_delivery_status;
		this.order_product_count = order_product_count;
		this.order_date = order_date;
		this.order_number = order_number;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}
	public int getConsumer_no() {
		return consumer_no;
	}
	public void setConsumer_no(int consumer_no) {
		this.consumer_no = consumer_no;
	}
	public String getOrder_complete_status() {
		return order_complete_status;
	}
	public void setOrder_complete_status(String order_complete_status) {
		this.order_complete_status = order_complete_status;
	}
	public String getOrder_delivery_status() {
		return order_delivery_status;
	}
	public void setOrder_delivery_status(String order_delivery_status) {
		this.order_delivery_status = order_delivery_status;
	}
	public int getOrder_product_count() {
		return order_product_count;
	}
	public void setOrder_product_count(int order_product_count) {
		this.order_product_count = order_product_count;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_number() {
		return order_number;
	}
	public void setOrder_number(String order_number) {
		this.order_number = order_number;
	}
	
	
		
}

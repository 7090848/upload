package com.whm.atelier.vo;

import java.util.Date;

public class Review {
	private int review_no;
	private int consumer_no;
	private int product_no;
	private int store_no;
	private int order_no;
	private String review_content;
	private int review_star;
	private Date review_writedate;
	private String review_img_path;
	public Review() {
		super();
	}
	public Review(int review_no, int consumer_no, int product_no, int store_no, int order_no, String review_content,
			int review_star, Date review_writedate, String review_img_path) {
		super();
		this.review_no = review_no;
		this.consumer_no = consumer_no;
		this.product_no = product_no;
		this.store_no = store_no;
		this.order_no = order_no;
		this.review_content = review_content;
		this.review_star = review_star;
		this.review_writedate = review_writedate;
		this.review_img_path = review_img_path;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getConsumer_no() {
		return consumer_no;
	}
	public void setConsumer_no(int consumer_no) {
		this.consumer_no = consumer_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getStore_no() {
		return store_no;
	}
	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	public Date getReview_writedate() {
		return review_writedate;
	}
	public void setReview_writedate(Date review_writedate) {
		this.review_writedate = review_writedate;
	}
	public String getReview_img_path() {
		return review_img_path;
	}
	public void setReview_img_path(String review_img_path) {
		this.review_img_path = review_img_path;
	}
	
	
	
	
	
}

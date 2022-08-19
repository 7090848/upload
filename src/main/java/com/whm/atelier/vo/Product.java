package com.whm.atelier.vo;

import java.util.Date;

public class Product {

	 private int product_no;
	 private int store_no;
	 private int product_category_no;
	 private int product_confirm_status_no;
	 private String product_name;
	 private int product_price;
	 private String product_description;
	 private int product_post_price;
	 private String product_status_yn;
	 private Date product_date;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
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
	public int getProduct_category_no() {
		return product_category_no;
	}
	public void setProduct_category_no(int product_category_no) {
		this.product_category_no = product_category_no;
	}
	public int getProduct_confirm_status_no() {
		return product_confirm_status_no;
	}
	public void setProduct_confirm_status_no(int product_confirm_status_no) {
		this.product_confirm_status_no = product_confirm_status_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public int getProduct_post_price() {
		return product_post_price;
	}
	public void setProduct_post_price(int product_post_price) {
		this.product_post_price = product_post_price;
	}
	public String getProduct_status_yn() {
		return product_status_yn;
	}
	public void setProduct_status_yn(String product_status_yn) {
		this.product_status_yn = product_status_yn;
	}
	public Date getProduct_date() {
		return product_date;
	}
	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}
	public Product(int product_no, int store_no, int product_category_no, int product_confirm_status_no,
			String product_name, int product_price, String product_description, int product_post_price,
			String product_status_yn, Date product_date) {
		super();
		this.product_no = product_no;
		this.store_no = store_no;
		this.product_category_no = product_category_no;
		this.product_confirm_status_no = product_confirm_status_no;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_description = product_description;
		this.product_post_price = product_post_price;
		this.product_status_yn = product_status_yn;
		this.product_date = product_date;
	}
	
}

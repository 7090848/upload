package com.whm.atelier.vo;

import java.util.Date;

public class Store {

	  private int store_no;
	  private int customer_no;
	  private int store_tier_no;
	  private String store_name;
	  private String store_profile;
	  private String store_img;
	  private String store_phone;
	  private int store_total_sales_amount;
	  private Date store_date;
	public Store() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Store(int store_no, int customer_no, int store_tier_no, String store_name, String store_profile,
			String store_img, String store_phone, int store_total_sales_amount, Date store_date) {
		super();
		this.store_no = store_no;
		this.customer_no = customer_no;
		this.store_tier_no = store_tier_no;
		this.store_name = store_name;
		this.store_profile = store_profile;
		this.store_img = store_img;
		this.store_phone = store_phone;
		this.store_total_sales_amount = store_total_sales_amount;
		this.store_date = store_date;
	}
	public int getStore_no() {
		return store_no;
	}
	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public int getStore_tier_no() {
		return store_tier_no;
	}
	public void setStore_tier_no(int store_tier_no) {
		this.store_tier_no = store_tier_no;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_profile() {
		return store_profile;
	}
	public void setStore_profile(String store_profile) {
		this.store_profile = store_profile;
	}
	public String getStore_img() {
		return store_img;
	}
	public void setStore_img(String store_img) {
		this.store_img = store_img;
	}
	public String getStore_phone() {
		return store_phone;
	}
	public void setStore_phone(String store_phone) {
		this.store_phone = store_phone;
	}
	public int getStore_total_sales_amount() {
		return store_total_sales_amount;
	}
	public void setStore_total_sales_amount(int store_total_sales_amount) {
		this.store_total_sales_amount = store_total_sales_amount;
	}
	public Date getStore_date() {
		return store_date;
	}
	public void setStore_date(Date store_date) {
		this.store_date = store_date;
	}
	  
	  
	}

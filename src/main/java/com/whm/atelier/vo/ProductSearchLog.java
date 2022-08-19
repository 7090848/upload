package com.whm.atelier.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ProductSearchLog {
	private int product_search_no;
	private int consumer_no;
	private String product_search_keyword;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date product_search_date;
	
	/**
	 * 
	 */
	public ProductSearchLog() {
		super();
	}

	/**
	 * @param consumer_no
	 * @param product_search_keyword
	 */
	public ProductSearchLog(int consumer_no, String product_search_keyword) {
		super();
		this.consumer_no = consumer_no;
		this.product_search_keyword = product_search_keyword;
	}
	
	/**
	 * @param product_search_no
	 * @param consumer_no
	 * @param product_search_keyword
	 * @param product_search_date
	 */
	public ProductSearchLog(int product_search_no, int consumer_no, String product_search_keyword,
			Date product_search_date) {
		super();
		this.product_search_no = product_search_no;
		this.consumer_no = consumer_no;
		this.product_search_keyword = product_search_keyword;
		this.product_search_date = product_search_date;
	}
	
	public int getProduct_search_no() {
		return product_search_no;
	}

	public void setProduct_search_no(int product_search_no) {
		this.product_search_no = product_search_no;
	}

	public int getConsumer_no() {
		return consumer_no;
	}

	public void setConsumer_no(int consumer_no) {
		this.consumer_no = consumer_no;
	}

	public String getProduct_search_keyword() {
		return product_search_keyword;
	}

	public void setProduct_search_keyword(String product_search_keyword) {
		this.product_search_keyword = product_search_keyword;
	}

	public Date getProduct_search_date() {
		return product_search_date;
	}

	public void setProduct_search_date(Date product_search_date) {
		this.product_search_date = product_search_date;
	}

	@Override
	public String toString() {
		return "ProductSearchLog [product_search_no=" + product_search_no 
				+ ", consumer_no=" + consumer_no 
				+ ", product_search_keyword=" + product_search_keyword
				+ ", product_search_date=" + product_search_date
				+ "]";
	}
	
}

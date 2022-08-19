package com.whm.atelier.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ProductAsk {
	private int product_ask_no;
	private int consumer_no;
	private int product_no;
	private int store_no;
	private String product_ask_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date product_ask_writedate;
	private String product_ask_comment_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date product_ask_comment_writedate;
	/**
	 * 
	 */
	public ProductAsk() {
		super();
	}
	/**
	 * @param product_ask_no
	 * @param consumer_no
	 * @param product_no
	 * @param store_no
	 * @param product_ask_content
	 * @param product_ask_writedate
	 * @param product_ask_comment_content
	 * @param product_ask_comment_writedate
	 */
	public ProductAsk(int product_ask_no, int consumer_no, int product_no, int store_no, String product_ask_content,
			Date product_ask_writedate, String product_ask_comment_content, Date product_ask_comment_writedate) {
		super();
		this.product_ask_no = product_ask_no;
		this.consumer_no = consumer_no;
		this.product_no = product_no;
		this.store_no = store_no;
		this.product_ask_content = product_ask_content;
		this.product_ask_writedate = product_ask_writedate;
		this.product_ask_comment_content = product_ask_comment_content;
		this.product_ask_comment_writedate = product_ask_comment_writedate;
	}
	public int getProduct_ask_no() {
		return product_ask_no;
	}
	public void setProduct_ask_no(int product_ask_no) {
		this.product_ask_no = product_ask_no;
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
	public String getProduct_ask_content() {
		return product_ask_content;
	}
	public void setProduct_ask_content(String product_ask_content) {
		this.product_ask_content = product_ask_content;
	}
	public Date getProduct_ask_writedate() {
		return product_ask_writedate;
	}
	public void setProduct_ask_writedate(Date product_ask_writedate) {
		this.product_ask_writedate = product_ask_writedate;
	}
	
	public String getProduct_ask_comment_content() {
		return product_ask_comment_content;
	}
	public void setProduct_ask_comment_content(String product_ask_comment_content) {
		this.product_ask_comment_content = product_ask_comment_content;
	}
	public Date getProduct_ask_comment_writedate() {
		return product_ask_comment_writedate;
	}
	public void setProduct_ask_comment_writedate(Date product_ask_comment_writedate) {
		this.product_ask_comment_writedate = product_ask_comment_writedate;
	}
	
	@Override
	public String toString() {
		return "ProductAsk [product_ask_no=" + product_ask_no
				+ ", consumer_no=" + consumer_no
				+ ", product_no=" + product_no
				+ ", store_no=" + store_no
				+ ", product_ask_content=" + product_ask_content
				+ ", product_ask_writedate=" + product_ask_writedate
				+ ", product_ask_comment_content=" + product_ask_comment_content
				+ ", product_ask_comment_writedate=" + product_ask_comment_writedate
				+ "]";
	}
}

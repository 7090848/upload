package com.whm.atelier.vo;

public class ConsumerWish {
	private Integer consumer_wish_no;
	private Integer consumer_no;
	private Integer product_no;
	/**
	 * 
	 */
	public ConsumerWish() {
		super();
	}
	/**
	 * @param consumer_no
	 * @param product_no
	 */
	public ConsumerWish(Integer consumer_no, Integer product_no) {
		super();
		this.consumer_no = consumer_no;
		this.product_no = product_no;
	}
	/**
	 * @param consumer_wish_no
	 * @param consumer_no
	 * @param product_no
	 */
	public ConsumerWish(Integer consumer_wish_no, Integer consumer_no, Integer product_no) {
		super();
		this.consumer_wish_no = consumer_wish_no;
		this.consumer_no = consumer_no;
		this.product_no = product_no;
	}
	public Integer getConsumer_wish_no() {
		return consumer_wish_no;
	}
	public void setConsumer_wish_no(Integer consumer_wish_no) {
		this.consumer_wish_no = consumer_wish_no;
	}
	public Integer getConsumer_no() {
		return consumer_no;
	}
	public void setConsumer_no(Integer consumer_no) {
		this.consumer_no = consumer_no;
	}
	public Integer getProduct_no() {
		return product_no;
	}
	public void setProduct_no(Integer product_no) {
		this.product_no = product_no;
	}
	
	@Override
	public String toString() {
		return "ConsumerWish [consumer_wish_no=" + consumer_wish_no 
				+ ", consumer_no=" + consumer_no
				+ ", product_no=" + product_no
				+ "]";
	}
	
}

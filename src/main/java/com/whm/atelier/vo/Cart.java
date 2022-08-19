package com.whm.atelier.vo;

/**
 * 장바구니 VO
 * */
public class Cart {
	private int cart_no;
	private int consumer_no;
	private int product_no;
	private int cart_product_count;
	
	private int store_no;
	private String store_name;
	private String product_name;
	private String product_image_path;
	private int product_price;
	private int product_post_price;
	
	
	/**
	 * 
	 */
	public Cart() {
		super();
	}
	/**
	 * @param consumer_no 
	 * @param product_no 
	 * @param cart_product_count 
	 */
	public Cart(int consumer_no, int product_no, int cart_product_count) {
		this.consumer_no = consumer_no;
		this.product_no = product_no;
		this.cart_product_count = cart_product_count;
	}
	/**
	 * @param cart_no
	 * @param consumer_no
	 * @param product_no
	 * @param cart_product_count
	 * @param store_no
	 * @param store_name
	 * @param product_name
	 * @param product_image_path
	 * @param product_price
	 * @param product_post_price
	 */
	public Cart(int cart_no, int consumer_no, int product_no, int cart_product_count, int store_no, String store_name, String product_name, String product_image_path, int product_price, int product_post_price) {
		super();
		this.cart_no = cart_no;
		this.consumer_no = consumer_no;
		this.product_no = product_no;
		this.cart_product_count = cart_product_count;
		this.store_no = store_no;
		this.store_name = store_name;
		this.product_name = product_name;
		this.product_image_path = product_image_path;
		this.product_price = product_price;
		this.product_post_price = product_post_price;
		
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
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
	public int getCart_product_count() {
		return cart_product_count;
	}
	public void setCart_product_count(int cart_product_count) {
		this.cart_product_count = cart_product_count;
	}
	public int getStore_no() {
		return store_no;
	}
	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name() {
		this.store_name = store_name;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_image_path() {
		return product_image_path;
	}
	public void setProduct_image_path(String product_image_path) {
		this.product_image_path = product_image_path;
	}
	public int getProduct_price() {
		return product_price * cart_product_count;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_post_price() {
		return product_post_price;
	}
	public void setProduct_post_price(int product_post_price) {
		this.product_post_price = product_post_price;
	}
	
	@Override
	public String toString() {
		return "Cart : [cart_no=" + cart_no
				+ ", consumer_no=" + consumer_no 
				+ ", product_no=" + product_no
				+ ", cart_product_count=" + cart_product_count
				+ ", store_no=" + store_no
				+ ", store_name=" + store_name
				+ ", product_name=" + product_name
				+ ", product_image_path=" + product_image_path
				+ ", product_price=" + product_price
				+ ", product_post_price=" + product_post_price
				+ "]";
	}
	
}
